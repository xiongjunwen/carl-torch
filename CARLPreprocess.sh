#!/bin/bash

# enter the right folder for run 
cd /afs/cern.ch/user/j/jxiong/workdir/vhcc/carl/carl-torch # change this to your path !!!!

# preprocessing debug info 
echo "preprocessing sh2211 Vhcc z+jets"
# activate the env 
source CarlEnv/bin/activate

# preprocess 
#################################### 11/23/2022 merge 2jet, 3pjet 
# python preprocess.py \
# "/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_hadded_all_tree_2L_zjets_sh2211_mva.root" \
# "EventWeight,mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,nTags,nJ,FlavourLabel,Description,sample" \
# -r "Description" "sample" \
# -n -1 -s "(nTags==2) & (pTV>=75.0) & ((Description==\"SR\") | (Description==\"CRHigh\")) & ((sample==\"Zbb\") | (sample==\"Zcc\"))" \
# -o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_2L_zjets_sh2211_mva_srcr_ptv75_preprocessed.root
#################################### 11/24/2022 split 2jet, merge flavors 
# python preprocess.py \
# "/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_hadded_all_tree_2L_zjets_sh2211_mva.root" \
# "EventWeight,mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,nTags,nJ,FlavourLabel,Description" \
# -r "Description" \
# -n -1 -s "(nTags==2) & (nJ==2) & (pTV>=75.0) & ((Description==\"SR\") | (Description==\"CRHigh\"))" \
# -o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_2L_zjets_sh2211_mva_2jet_allflavors_preprocessed.root

python preprocess.py \
"/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_hadded_all_tree_2L_zjets_sh2211_mva.root" \
"EventWeight,mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,nTags,nJ,FlavourLabel" \
-n -1 -s "(nTags==2) & (nJ==2) & (pTV>=75.0)" \
-o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_2L_zjets_sh2211_mva_2jet_nodesc_preprocessed.root

# deactivat env
deactivate
