PCA Analysis the Data set
addpath netlab3.3
load seeds_dataset.txt
data=seeds_dataset()
labels= data(:,8)%https://uk.mathworks.com/matlabcentral/answers/47632-how-to-extractcolumns-of-a-matrix-into-seperate-vectors
data(:,8)=[] % to remove the 8th colum of matrix from
%https://uk.mathworks.com/matlabcentral/answers/40705-how-to-delete-a-column-from-thematrix?s_tid=gn_loc_drop
norm=((data-mean(data))./std(data)) % normalizing the data
%pca
[pcvals,pcvecs]=pca(norm)
projdata=norm*pcvecs(:,1:2)
figure(1)
hold on
h1=plot(projdata(labels==1,1),projdata(labels==1,2),'ro')
h2=plot(projdata(labels==2,1),projdata(labels==2,2),'go')
h3=plot(projdata(labels==3,1),projdata(labels==3,2),'bo')
legend('labels=1','labels=2','labels=3')