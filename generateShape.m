%(a) Perform PCA on the shape data stored in shape.mat – the matrix aligned is composed as follows nPoints x nDimensions x nShapes. Implement a function
%    generateShape.m, that takes a parameter vector b as input and computes new shapes, where the length of b indicates the number of Eigenvectors to be considered for
%    shape generation. (5 points


function [reconstruction,mean,eigenVect,stddeviation] = generateShape(b)
    load shapes.mat;
    D = reshape(aligned,size(aligned,1)*size(aligned,2), size(aligned,3));
    [eigenVal, eigenVect, meanPCA] = pca(D);

    sizeOfB = size(b,1);
    eigenVectorSet = eigenVect(:,1:sizeOfB);
    offsetPCA = eigenVectorSet*b;
    offset =reshape(offsetPCA,size(aligned,1),size(aligned,2));
    mean =reshape(meanPCA,size(aligned,1),size(aligned,2));
    reconstruction = mean + offset;
    stddeviation = sqrt(abs(eigenVal(1:sizeOfB)));
end