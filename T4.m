% Prepare dataset
clear all
load daten3d.mat

% Perform PCA on 3d data
[eigenVal, eigenVect, mean] = pca(data);
% Transpose data to fit for plotting
data = data.';
mean = mean.';
% Plot 3d data, and the reconstruction of the projected data.
% The predefined plot3DPCA function allready includes the possibility to
% project the 3d data in the subspace defined by the firts two eigenvectors
% and to plot the projected data's reconstruction by setting showReconstruction = 1.
plot3DPCA(data, mean, eigenVect, eigenVal, 1, 1);
title('3D data and reconstruction of projection');