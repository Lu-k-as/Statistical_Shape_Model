%(b) Show how changing one coefficient corresponding to an eigenvector changes the data
%    when it is projected back into the initial data space. For this, implement the function
%    plotShape.m, that plots shapes (in blue) taking the mean shape, the eigenvectors,
%    and a coefficient vector as input. Use it to visualize and interpret individual modes
%    (i.e., eigenvectors resulting from the PCA and what they mean for the variability of the
%    shapes) by setting b = 0 except of one entry, which you can vary so test what shapes are
%    generated. Create shapes with varying the coefficients in b corresponding to the mode
%    in the range of ±3λ, where λ denotes the standard deviation of a specific mode. The
%    function should also plot the mean shape in red. Describe and interpret that task in your
%    report. (5 points)


function plotShape(mean, eigenVect,b)
    load('shapes.mat')
    sizeOfB = size(b,1);
    eigenVectorSet = eigenVect(:,1:sizeOfB);
    offsetPCA = eigenVectorSet*b;
    offset =reshape(offsetPCA,size(aligned,1),size(aligned,2));
    reconstruction = mean + offset;

    scatter(mean(:, 1), mean(:, 2),'red','filled');
    hold on
    scatter(reconstruction(:,1),reconstruction(:,2),'blue','filled');
    legend('Mean', 'New Shape','Location','east');
    hold off
end
