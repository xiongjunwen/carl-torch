#################################### 11/11/2022 evaluate test results from lubos 
# python carl-torch/evaluate.py -n Wjets_Sh221 -v Wjets_MGPy8 -e 1000 \
# -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/carl-inputs/ -g sh221-wjets-vhbb-lubos-testsize \
# -t Nominal -f "MET,dPhiLBmin,dPhiVBB,dRBB,dYWH,mBB,mTW,Mtop,pTB1,pTB2,pTV,nTags,nJ,FlavourLabel" \
# -w EventWeight --scale-method minmax

#################################### 11/18/2022 evaluate results for 10M nonorm! 
# python evaluate.py -n Wjets_Sh221 -v Wjets_MGPy8 -e 10000000 \
# -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/inputs/ -g sh221-wjets-vhbb-lubos-batch-10M-nonorm \
# -t Nominal -f "MET,dPhiLBmin,dPhiVBB,dRBB,dYWH,mBB,mTW,Mtop,pTB1,pTB2,pTV,nTags,nJ,FlavourLabel" \
# -w EventWeight --scale-method minmax

#################################### 11/28/2022 evaluate results for vhcc 3pjets 
# python evaluate.py -n vhcc_hadded_all_tree_2L_zjets_sh2211_mva_3pjet_2fl_preprocessed \
# -v vhcc_hadded_all_tree_2L_zjets_fxfx_mva_3pjet_2fl_preprocessed \
# -e -1 -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/preprocessed/ -g zjets-2L-3pjets -t Nominal \
# -f "mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,mBBJ,pTJ3,bin_bTagJ3,nTags,nJ,FlavB1,FlavB2" \
# -w EventWeight --scale-method minmax

#################################### 12/7/2022 evaluate results for vhcc 2jets 
python evaluate.py -n vhcc_hadded_all_tree_2L_zjets_sh2211_mva_2jet_1tag_preprocessed \
-v vhcc_hadded_all_tree_2L_zjets_fxfx_mva_2jet_1tag_preprocessed \
-e -1 -p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/preprocessed/ -g zjets-2L-2jets -t Nominal \
-f "mBB,dRBB,dEtaVBB,dPhiVBB,pTV,pTB1,pTB2,METSig,mLL,cosThetaLep,bin_bTagB1,bin_bTagB2,nTags,FlavB1,FlavB2" \
-w EventWeight --scale-method minmax