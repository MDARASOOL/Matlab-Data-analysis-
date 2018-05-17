% Data visualization using PCA
load('oil.mat')
%Normalising the training data and test data in the range of -1 to +1.
data=trndata
norm_of_traindata=(((2*(data-min(data)))./(max(data)-min(data)))-1)
labels_1=trnlabels
data_2=tstdata
norm_of_testdata= ((2*(data_2-min(data_2)))./(max(data_2)-min(data_2)))-1
labels_2=tstlabels
%normalized data=2[(data*min(data)./max(data)?min(data)]-1
% formula from https://stats.stackexchange.com/questions/178626/how-to-normalize-databetween-1-and-1
% pca for trained data
[pcvals,pcvecs]=pca(norm_of_traindata)
projdata_1= norm_of_traindata*pcvecs(:,1:2)
%pca for test data
[pcvals_1,pcvecs_1]=pca(norm_of_testdata)
projdata_2= norm_of_traindata*pcvecs_1(:,1:2)
% ploting the test data and training data in pca
figure(1)
hold on
h1=plot(projdata_1(labels_1==1,1),projdata_1(labels_1==1,2),'r.','markersize',10)
h2=plot(projdata_1(labels_1==2,1),projdata_1(labels_1==2,2),'b.','markersize',10)
h3=plot(projdata_1(labels_1==3,1),projdata_1(labels_1==3,2),'g.','markersize',10)
hold on
h4=plot(projdata_2(labels_2==1,1),projdata_2(labels_2==1,2),'k.','markersize',10)
h5=plot(projdata_2(labels_2==2,1),projdata_2(labels_2==2,2),'k.','markersize',10)
h6=plot(projdata_2(labels_2==3,1),projdata_2(labels_2==3,2),'k.','markersize',10 )
legend([h1 h2 h3 h4],{'homogenous','annular','laminar','test data'})
xlabel('pca1')
ylabel('pca2')