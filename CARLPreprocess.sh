#!/bin/bash

# enter the right folder for run 
cd /afs/cern.ch/user/j/jxiong/workdir/vhcc/carl/carl-torch # change this to your path !!!!

# preprocessing debug info 
echo "preprocessing fxfx Vhcc z+jets for 2L"
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

#################################### 11/24/2022 split 3pjet, merge flavors 
# python preprocess.py \
# "/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_hadded_all_tree_2L_zjets_sh2211_mva.root" \
# "EventWeight,mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,mBBJ,pTJ3,bin_bTagJ3,nTags,nJ,FlavB1,FlavB2" \
# -n -1 -s "(nTags==2) & (nJ>2) & (pTV>=75.0)" \
# -o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_2L_zjets_sh2211_mva_3pjet_2fl_preprocessed.root

#################################### 12/7/2022 0l 2jet preprocessing
# python preprocess.py \
# "/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_sh2211_hadded_all_tree_0L_13TeV.root" \
# "EventWeight,mBB,dRBB,dPhiBB,dPhiVBB,dEtaBB,MET,pTB1,pTB2,MEff,softMET,bin_bTagB1,bin_bTagB2,nTags,FlavB1,FlavB2,ntctags,nJ,pTV" \
# -n -1 -s "((nTags==2) | ((nTags==1) & (ntctags==1))) & (nJ==2) & (pTV>=150.0)" \
# -o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_0L_zjets_sh2211_2jet_1tag_preprocessed.root

#################################### 12/8/2022 2l 2+3pjet preprocessing sh2211 
# python preprocess.py \
# "/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_hadded_all_tree_2L_zjets_sh2211_mva.root" \
# "EventWeight,mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,mBBJ,pTJ3,nTags,ntctags,nJ,FlavB1,FlavB2" \
# -n -1 -s "((nTags==2) | ((nTags==1) & (ntctags==1))) & (nJ>=2) & (pTV>=75.0)" \
# -o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_2L_zjets_sh2211_mva_2pjet_preprocessed.root

#################################### 12/16/2022 2l 2+3pjet preprocessing fxfx
# python preprocess.py \
# "/eos/user/j/jxiong/workdir/hcc/carl/inputs/vhcc_hadded_all_tree_2L_zjets_fxfx_mva.root" \
# "EventWeight,mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,mBBJ,pTJ3,nTags,ntctags,nJ,FlavB1,FlavB2" \
# -n -1 -s "((nTags==2) | ((nTags==1) & (ntctags==1))) & (nJ>=2) & (pTV>=75.0)" \
# -o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_2L_zjets_fxfx_mva_2pjet_preprocessed.root

#################################### 3/28/2023 2l preprocess fxfx +2ll tag
# python preprocess.py \
# "/eos/user/j/jxiong/workdir/hcc/carl/inputs/hadded_all_tree_2L_13TeV_fxfx_update.root" \
# "EventWeight,mBB,dRBB,dYVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,sumPtAddJets,mBBJ,nTags,ntctags,nlctags,nbtags,nJ,FlavB1,FlavB2" \
# -n -1 -s "((nbtags==0) & ((ntctags>=1)|(nlctags==2))) & (nJ>=2) & (pTV>=75.0)" \
# -o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_2L_zjets_fxfx_preprocessed_update_2llcor.root

#################################### 3/28/2023 0l preprocess sh2211 +2ll tag
python preprocess.py \
"/eos/user/j/jxiong/workdir/hcc/carl/inputs/hadded_all_tree_0L_13TeV_sh2211_update.root" \
"EventWeight,MET,MEff,dPhiVBB,pTB1,pTB2,mBB,dRBB,dEtaBB,bin_bTagB1,bin_bTagB2,sumPtAddJets,mBBJ,minDRBjets,nTags,FlavB1,FlavB2,ntctags,nlctags,nbtags,nJ,pTV" \
-n -1 -s "((ntctags>=1) | ((nlctags>=1) & (nbtags==1)) | (nbtags==3) | ((nbtags==0)&(nlctags==2))) & (nJ<5) & (pTV>=150.0)" \
-o /eos/user/j/jxiong/workdir/hcc/carl/preprocessed/vhcc_hadded_all_tree_0L_zjets_sh2211_preprocessed_update.root

# deactivat env
deactivate
