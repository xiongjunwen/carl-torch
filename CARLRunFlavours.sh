#!/bin/bash

# enter the right folder for run 
cd /afs/cern.ch/user/j/jxiong/workdir/vhcc/carl/carl-torch # change this to your path !!!!

# training info 
echo "training on vhcc z+jets"
# activate the env 
source CarlEnv/bin/activate

#################################### 11/25/2022 first train on 3pjet all flavors 
# python train.py -n vhcc_hadded_all_tree_2L_zjets_sh2211_mva_3pjet_2fl_preprocessed \
# -v vhcc_hadded_all_tree_2L_zjets_fxfx_mva_3pjet_2fl_preprocessed \
# -e -1 -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/preprocessed/ -g zjets-2L-3pjets -t Nominal \
# -f "mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,mBBJ,pTJ3,bin_bTagJ3,nTags,nJ,FlavB1,FlavB2" \
# -w EventWeight --scale-method minmax

# #################################### 12/7/2022 first train on 2jet 2L all flavors
# python train.py -n vhcc_hadded_all_tree_2L_zjets_sh2211_mva_2jet_1tag_preprocessed \
# -v vhcc_hadded_all_tree_2L_zjets_fxfx_mva_2jet_1tag_preprocessed \
# -e -1 -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/preprocessed/ -g zjets-2L-2jets -t Nominal \
# -f "mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,nTags,FlavB1,FlavB2" \
# -w EventWeight --scale-method minmax

#################################### 12/16/2022 first train on 2jet 0L all flavors
# python train.py -n vhcc_hadded_all_tree_0L_zjets_sh2211_2jet_1tag_preprocessed \
# -v vhcc_hadded_all_tree_0L_zjets_fxfx_2jet_1tag_preprocessed \
# -e -1 -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/preprocessed/ -g zjets-0L-2jets -t Nominal \
# -f "mBB,dRBB,dPhiVBB,dEtaBB,MET,pTB1,pTB2,MEff,softMET,bin_bTagB1,bin_bTagB2,nTags,FlavB1,FlavB2" \
# -w EventWeight --scale-method minmax

#################################### 1/13/2023 train on 2l 2pjet all flavors 
# python train.py -n vhcc_hadded_all_tree_2L_zjets_sh2211_mva_2pjet_preprocessed \
# -v vhcc_hadded_all_tree_2L_zjets_fxfx_mva_2pjet_preprocessed \
# -e -1 -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/preprocessed/ -g zjets-2L-2pjet -t Nominal \
# -f "mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,mBBJ,pTJ3,nTags,nJ,FlavB1,FlavB2,ntctags" \
# -w EventWeight --scale-method minmax

#################################### 4/3/2023 train on 2l all flavors update
python train.py -n vhcc_hadded_all_tree_2L_zjets_sh2211_preprocessed_update \
-v vhcc_hadded_all_tree_2L_zjets_fxfx_preprocessed_update_2llcor \
-e -1 -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/preprocessed/ -g zjets-2L-update -t Nominal \
-f "mBB,dRBB,dYVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,sumPtAddJets,mBBJ,nJ,FlavB1,FlavB2,ntctags,nlctags" \
-w EventWeight --scale-method minmax

# deactivate env 
deactivate
