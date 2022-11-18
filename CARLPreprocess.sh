#!/bin/bash

# enter the right folder for run 
cd /afs/cern.ch/user/j/jxiong/workdir/vhcc/carl/carl-torch # change this to your path !!!!

# preprocessing debug info 
echo "preprocessing sh2211 Vhcc z+jets zhf"
# activate the env 
source CarlEnv/bin/activate
# preprocess 
python preprocess.py \
"/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_hadded_all_tree_2L_zjets_sh2211_mva.root" \
"EventWeight,mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,nTags,nJ,FlavourLabel,Description,sample" \
-r "Description" "sample" \
-n -1 -s "(nTags==2) & (pTV>=75.0) & ((Description==\"SR\") | (Description==\"CRHigh\")) & ((sample==\"Zbb\") | (sample==\"Zcc\"))" \
-o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_2L_zjets_sh2211_mva_srcr_ptv75_preprocessed.root

# deactivat env
deactivate
