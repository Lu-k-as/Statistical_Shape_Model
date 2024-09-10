clear all;
load shapes.mat;

nEigenvectors = 2;
b = zeros(nEigenvectors,1);
[reconstruction,mean,eigenVect,stddeviation] = generateShape(b);
stddeviation = stddeviation.';

%(b)

b(1,1) = stddeviation(1,1);
plotShape(mean,eigenVect,b);
title('Deviation of 1 times the standard deviation')
figure;

b(1,1) = stddeviation(1,1)*3;
plotShape(mean,eigenVect,b);
title('Deviation of 3 times the standard deviation')
figure;

b(1,1) = -stddeviation(1,1)*3;
plotShape(mean,eigenVect,b);
title('Deviation of -3 times the standard deviation')
figure;

%(c)

    % Helper Code for getting EigenVal and Indix
    % Get full stddeviation
    nEigenvectors = size(eigenVect,1);
    b = zeros(nEigenvectors,1);
    [reconstruction,mean,eigenVect,stddeviation] = generateShape(b);
    stddeviation = stddeviation.';

    % Get EigenValues
    D = reshape(aligned,size(aligned,1)*size(aligned,2), size(aligned,3));
    [eigenVal, eigenVect, meanPCA] = pca(D);

    % Get Index
    i = 0;summe = 0;m95= 1;m90=1;m80 = 1;
    totalVarianceSum = sum(abs(eigenVal));
    for i = 1:length(eigenVal)
        summe = summe + abs(eigenVal(i));
        if (summe > 0.95*totalVarianceSum) && (m95)
            m95 = 0;
            i95=i;
        end
        if (summe > 0.9*totalVarianceSum) && (m90)
            m90 = 0;
            i90=i;  
        end
        if (summe > 0.8*totalVarianceSum) && (m80)
            m80 = 0;
            i80=i;
        end
    end


% 100%
b=randn(1,nEigenvectors).*stddeviation;
plotShape(mean,eigenVect,b.');
title('Deviation within 100% of the total Standarddistirbution');
figure;

% 95%
b=randn(1,i95).*stddeviation(:,1:i95);
plotShape(mean,eigenVect,b.');
title('Deviation within 95% of the total Standarddistirbution');
figure;

% 90%
b=randn(1,i90).*stddeviation(:,1:i90);
plotShape(mean,eigenVect,b.');
title('Deviation within 90% of the total Standarddistirbution');
figure;

% 80%
b=randn(1,i80).*stddeviation(:,1:i80);
plotShape(mean,eigenVect,b.');
title('Deviation within 80% of the total Standarddistirbution');