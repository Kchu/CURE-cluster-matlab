clear all;
close all;
%load flame.mat
load('3clus.mat') % Parameter: c = 3; alpha = 0.3; k = 3;
%load('Aggregation.mat') % Parameter: c = 8; alpha = 0.62; k = 7;
%load('t4_8k.mat') % Parameter:c = 9; alpha = 0.51; k = 8; jianyi
%load('spiral.mat') % Parameter: c = 5; alpha = 0.1; k = 2;
%load('t8_8k.mat') % Parameter: 
%load('Sticks.mat'); X=sticks(:,1:2);  % Parameter: c = 3; alpha = 0.2; k = 4;
%load('Eyes.mat'); X=eyes(:,1:2);
%load('LineBlobs.mat');X=lineblobs(:,1:2);  % Parameter: c = 3; alpha = 0.1; k = 3;
%load('threecircles.mat'); X=threecircles(:,1:2);  % Parameter: c = 5; alpha = 0.1; k = 3;
%load('fourty.mat');   X=fourty(:,1:2); True = fourty(:,3);   % Parameter: c = 3; alpha = 0.2; k = 40;
%load('sizes5.mat');   X=sizes5(:,1:2); True = sizes5(:,3);  % Parameter: c = 8; alpha = 1; k = 4;
% index = 1+fix(8000*rand(1,1000));
% X=X(index,:);
%load('flame.txt');X=flame(:,1:2);
%load('compound.txt');X=compound(:,1:2);True=compound(:,3);
%load('pathbased.txt');X=pathbased(:,1:2);True=pathbased(:,3);    % Parameter: c = 5; alpha = 0; k = 3;
%load('d31.txt');X=d31(:,1:2);True=d31(:,3);   % Parameter: c = 5; alpha = 0.62; k = 31;
%load('sprial-1.txt');X=sprial_1(:,1:2);True = sprial_1(:,3);   % Parameter: c = 5; alpha = 0.1; k = 3;
%load('jain.txt');X=jain(:,1:2);True = jain(:,3);   % Parameter: c = 5; alpha = 0.1; k = 2;
%load('test.txt');X=test;   % Parameter: c = 3; alpha = 0.5; k = 2;
%load('R15.txt');X=R15(:,1:2);True = R15(:,3);   % Parameter: c = 10; alpha = 0.9; k = 15;
c = 3; 
alpha = 0.3;
k = 3;
[Label, Cluster] = CURE(X, alpha, c, k);

figure
subplot(1,2,1);
plot(X(:,1),X(:,2),'.');
subplot(1,2,2);
PlotClusterinResult(X, Label);
N = nmi(Y, Label);



        

