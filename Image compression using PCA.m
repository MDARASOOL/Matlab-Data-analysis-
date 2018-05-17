 %Image compression using PCA to the stream and bridge image.
addpath U:\
addpath U:\coursework\netlab3.3
data=imread('5.2.10.TIFF')% read the image
mu=repmat(mean(double(data)),1) %mean of data
var=repmat(std(double(data)),1)%Standard deviation of data
norm=(mu-double(data))./var %Normalization of data
% PCA ANALYSIS
[pcvals,pcvecs]=pca(norm)
projdata_1=norm*pcvecs(:,1:10)
projdata_2=norm*pcvecs(:,1:20)
projdata_3=norm*pcvecs(:,1:50)
% RECOVERING IMAGE
orignal_data_1=projdata_1*transpose(pcvecs(:,1:10))
orignal_data_2=projdata_2*transpose(pcvecs(:,1:20))
orignal_data_3=projdata_3*transpose(pcvecs(:,1:50))
% orignal Image
figure('name','orignal image')
imagesc(norm)
colormap(gray)
% Image with first 10 components
figure('name','FTRST 10 COMPONENTS')
colormap(gray)
imagesc(orignal_data_1)
% Image with first 20 components
figure('name','FTRST 20 COMPONENTS')
colormap(gray)
imagesc(orignal_data_2)
% Image with first 50 components
figure('name','FTRST 50 COMPONENTS')
colormap(gray)
imagesc(orignal_data_3)