import argparse

parser = argparse.ArgumentParser(description="Preprocess events.")
parser.add_argument("path", metavar="p", type=str,
                    help="Path to the ROOT files")
parser.add_argument("features", type=str, help="Comma-separated features to select")
parser.add_argument("-r", "--remove", type=str, 
                    nargs="+",
                    help="Features to remove from selections; \
                    remove string for selection but not training")
parser.add_argument("-n", "--n_events", type=int,
                    help="The number of entries to randomly select (-1 for all)",
                    default=-1)
parser.add_argument("-s","--selection", type=str, help="Event selection", default=None)
parser.add_argument("-o", "--output_path", type=str,
                    help="Output path together with the output ROOT file name.")

args = parser.parse_args()

import uproot

if uproot.__version__ < '4.3.3':
    print("uproot version >= 4.3.3 required! Exiting...")
    exit()

import glob
import pandas as pd
import numpy as np


def totalNumberOfEvents(path):
    nEvents = 0
    for file in glob.glob(path):
        with uproot.open(file) as f:
            nEvents += f["Nominal"].num_entries
    return nEvents

def loadFractionOfEvents(path, features, selection, fraction=1.0):
    allEvents = pd.DataFrame(columns=features, dtype=np.float64)
    for file in glob.glob(path):
        print(f"preprocessing input file: {file}")
        with uproot.open(file)["Nominal"] as tree:
            nEventsToLoad = int(fraction * tree.num_entries) + 1
            df = tree.arrays(features, library="pd", cut=selection)
            if nEventsToLoad > df.shape[0]:
                nEventsToLoad = df.shape[0]
            df = df.sample(n=nEventsToLoad, random_state=42)
            allEvents = pd.concat([allEvents, df], ignore_index=True)
    return allEvents


def main(args):
    print("Counting the total number of events")
    totalNevents = totalNumberOfEvents(args.path)
    print(f"Total number of events: {totalNevents}")
    print(f"selecting events = {args.n_events}")
    if args.n_events == -1:
        fraction = 1.0
    else:
        fraction = args.n_events / totalNevents
        if fraction > 1.0:
            fraction = -1.0
    print(f"fraction of events = {fraction}")
    features = args.features.split(",")
    print(f"features = {features}")
    print(f"selection = {args.selection}")

    # create wanted df 
    df = loadFractionOfEvents(args.path, features, args.selection, fraction=fraction)
    print(f"Total number of events selected: {df.shape[0]}")

    ####### hard-code checking description 
    # create numeric label for sr&cr if inclusive
    descri_list = df["Description"].unique()
    if len(descri_list)>0:
        print("Adding description labels for inclusive training...")
        df["DescriptionLabel"] = df.loc[:, "Description"]
        for num, desc in enumerate(descri_list):
            df.replace(desc, num, inplace=True)

    # clean up string vars for selection only 
    print("Removing variables only used for selection...")
    for remove_var in args.remove:
        df.drop(remove_var, inplace=True, axis=1)

    # shuffling and writing df 
    print(f"Total variables added: {df.shape[1]}")
    print("Shuffling the dataframe...")
    df = df.sample(frac=1.0, random_state=42)
    outputFile = uproot.recreate(args.output_path)
    outputFile["Nominal"] = df
    
    
if __name__ == "__main__":
    main(args)



