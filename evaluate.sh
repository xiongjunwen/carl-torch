#################################### 11/15/2022 evaluate the batch job using Lubos' samples
python evaluate.py -n Wjets_Sh221 -v Wjets_MGPy8 -e 10000000 \
-p /eos/user/${USER:0:1}/${USER}/workdir/hcc/carl/carl-inputs/ -g sh221-wjets-vhbb-lubos-batch-10M \
-t Nominal -f "MET,dPhiLBmin,dPhiVBB,dRBB,dYWH,mBB,mTW,Mtop,pTB1,pTB2,pTV,nTags,nJ,FlavourLabel" \
-w EventWeight --scale-method minmax 