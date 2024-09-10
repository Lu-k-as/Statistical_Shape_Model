clear all;
load("daten.mat");

[eigenValues1,eigenVectors1,mean1]=pca(data1);
[eigenValues2,eigenVectors2,mean2]=pca(data2);
[eigenValues3,eigenVectors3,mean3]=pca(data3);
[eigenValues4,eigenVectors4,mean4]=pca(data4);

% The print2DPCA function need the data point in Nx2 or Nx3 array.
% Therefore we have to transpose the matrix
data1 = data1.';
data2 = data2.';
data3 = data3.';
data4 = data4.';

%The print2DPCA functino need some reconstructed data. Because this is the
%the job in Tast 5 to calculate them I now put the original data in.
reconstructedData1 = data1;
reconstructedData2 = data2;
reconstructedData3 = data3;
reconstructedData4 = data4;

plot2DPCA(data1, mean1, reconstructedData1, eigenVectors1, eigenValues1, 1, 1)
plot2DPCA(data2, mean2, reconstructedData2, eigenVectors2, eigenValues2, 1, 1)
plot2DPCA(data3, mean3, reconstructedData3, eigenVectors3, eigenValues3, 1, 1)
plot2DPCA(data4, mean4, reconstructedData4, eigenVectors4, eigenValues4, 1, 1)
