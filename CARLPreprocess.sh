#!/bin/bash

# enter the right folder for run 
cd /afs/cern.ch/user/j/jxiong/workdir/vhcc/carl/carl-torch # change this to your path !!!!

# preprocessing debug info 
echo "preprocessing sh2211 Vhcc z+jets zhf"
# activate the env 
source CarlEnv/bin/activate
# preprocess 
python ./carl-torch/preprocess.py \
"/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_hadded_all_tree_2L_zjets_sh2211_mva.root" \
"EventWeight,mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,nTags,Description,sample" \
-n -1 -s "(nTags==2) & (pTV>=75.0) & (pTV<150.0) & (Description==\"SR\") & ((sample==\"Zbb\") or (sample==\"Zcc\"))" \
-o /afs/cern.ch/user/j/jxiong/workdir/vhcc/carl/vhcc_hadded_all_tree_2L_zjets_sh2211_mva_zhf.root
# python preprocess.py "/eos/user/l/lvozdeck/CxAOD_output/carlTrainingTrees4_truthTagging_MGPy8/Reader_1L_33-05_*/haddedTree/tree-*.root" "EventWeight,MET,dPhiLBmin,dPhiVBB,dRBB,dYWH,mBB,mTW,Mtop,pTB1,pTB2,pTV,nJ,FlavourLabel" -n -1 -s "(nTags==2) & (nJ <= 3) & (FlavourLabel==$1)" -o /afs/cern.ch/user/l/lvozdeck/eos/CarlSeparateTrainingTrees/Wjets_MGPy8_$2.root
# deactivat env
deactivate
