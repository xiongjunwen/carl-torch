#!/bin/bash

# extract the files 
tar xvf carl-torch-lubos.tar.gz
# activate the env 
source CarlEnv/bin/activate

# run the training 
python train.py -n Wjets_Sh221 -v Wjets_MGPy8 -e 10000000 \
-p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/carl-inputs/ -g sh221-wjets-vhbb-lubos-batch-10M \
-t Nominal -f "MET,dPhiLBmin,dPhiVBB,dRBB,dYWH,mBB,mTW,Mtop,pTB1,pTB2,pTV,nTags,nJ,FlavourLabel" \
-w EventWeight --scale-method minmax --BoolFilter "nTags==2 & nJ <= 3"

# tar output files and deactivate env 
tar cvf models_out.tar.gz models/
deactivate
