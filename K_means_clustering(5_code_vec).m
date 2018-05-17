%K-Means clustering of 5 code vectors

addpath F:/coursework/netlab3.3
load seeds_dataset.txt
data=seeds_dataset
data(:,8)=[] % to remove the 8th colum of matrix
norm=(data-mean(data))./std(data) % normalizing the data
% part2 Kmeans
ndata=size(norm,1)
ncentres=5; %3 code vectors
perm = randperm(ndata)
perm = perm(1:ncentres)
centres = norm(perm, :)
[pcvals,pcvecs]=pca(norm)
projecteddata= norm*pcvecs(:,1:2)
% Set up vector of options for kmeans trainer
% This script is taken from demkmn1.m in NETLEB toolbox.
%  modified by Yi Sun (27/02/2007)
options = foptions;
options(1) = 1; % Prints out error values.
options(14) = 1; % Number of iterations.
numiters = 4;
for n = 1 : numiters
 % Train the centres from the data
 [centres, options, post] = kmeans(centres, norm, options);
 [one_value, membership] = max(post,[],2);
 fh2 = figure(100+n);
 hold on;
 plot(projecteddata(membership==1,1), projecteddata(membership==1,2), 'bo','markersize',15);
 plot(projecteddata(membership==2,1),projecteddata(membership==2,2), 'r*','markersize',15);
 plot(projecteddata(membership==3,1), projecteddata(membership==3,2), 'gv');
 plot(projecteddata(membership==4,1), projecteddata(membership==4,2), 'k.','markersize',15)
 plot(projecteddata(membership==5,1), projecteddata(membership==5,2), 'mv')

 set(gca, 'Box', 'on')
 %legend('Class 1', 'Class 2', 2)
 projectedcentres_1= centres*pcvecs(:,1:2)
 plot(projectedcentres_1(:, 1), projectedcentres_1(:,2), '+', 'LineWidth', 2, 'MarkerSize', 10)

 pause
end