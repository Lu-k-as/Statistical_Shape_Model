clear all;
load("daten.mat");

% First perform PCA function on the 2D data
[eigenValues1,eigenVectors1,mean1]=pca(data1);
[eigenValues2,eigenVectors2,mean2]=pca(data2);
[eigenValues3,eigenVectors3,mean3]=pca(data3);
[eigenValues4,eigenVectors4,mean4]=pca(data4);

[d,n] = size(data2);

% Second task: project the data in data2 to the main vector(=vector with
% the highest eigenvalue)
bnew_main=eigenVectors2(:,1).'*(data2-mean2);

data2_reconstructed_main= eigenVectors2(:,1)*bnew_main+mean2;

data2= data2.';
data2_reconstructed_main=data2_reconstructed_main.';
plot2DPCA(data2,mean2,data2_reconstructed_main,eigenVectors2,eigenValues2,1,1);
title('Reconstruction of the projection on the main vector')

% mean error:
sum=0;
for i=1:n
    sum=abs(data2_reconstructed_main(i,:)-data2(i,:));
end
mean_error_main=sum/n
% standard deviation
standard_deviation_main=std(data2_reconstructed_main-data2)

% Third task: project the data in data2 to the side vector(=vector with
% the smallest eigenvalue)
bnew_side=eigenVectors2(:,2).'*(data2.'-mean2); % data2 already transposed for the first plot

data2_reconstructed_side= eigenVectors2(:,2)*bnew_side+mean2;

data2_reconstructed_side=data2_reconstructed_side.';
plot2DPCA(data2,mean2,data2_reconstructed_side,eigenVectors2,eigenValues2,1,1);
title('Reconstruction of the projection on the side vector')

sum_side=0;
for i=1:n
    sum_side=abs(data2_reconstructed_side(i,:)-data2(i,:));
end
mean_error_side=sum_side/n
standard_deviation_side=std(data2_reconstructed_side-data2)

