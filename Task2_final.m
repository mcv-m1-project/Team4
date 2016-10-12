train_split_A = round(0.7*length(sA));
train_split_B = round(0.7*length(sB));
train_split_C = round(0.7*length(sC));
train_split_D = round(0.7*length(sD));
train_split_E = round(0.7*length(sE));
train_split_F = round(0.7*length(sF));
total_train_split = train_split_A + train_split_B + train_split_C + train_split_D + train_split_E + train_split_F;

cert = total_train_split/total_signal;

copySplitFile(sA,train_split_A,dirname,'A');
copySplitFile(sB,train_split_B,dirname,'B');
copySplitFile(sC,train_split_C,dirname,'C');
copySplitFile(sD,train_split_D,dirname,'D');
copySplitFile(sE,train_split_E,dirname,'E');
copySplitFile(sF,train_split_F,dirname,'F');