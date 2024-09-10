clear all;
load("daten.mat");

[C1,mean1] = ourCov(data1)
[C2,mean2] = ourCov(data2)
[C3,mean3] = ourCov(data3)
[C4,mean4] = ourCov(data4)

axis equal
subplot(2,2,1)
plot(transpose(data1),'--o')
title('Data 1')

subplot(2,2,2)
plot(transpose(data2),'--o')
title('Data 2')

subplot(2,2,3)
plot(transpose(data3),'--o')
title('Data 3')

subplot(2,2,4)
plot(transpose(data4),'--o')
title('Data 4')