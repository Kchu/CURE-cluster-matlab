function [Label, Cluster] = CURE(X, alpha, c, k)
%% Matlab code for CURE cluster algorithm.
% Inputs:
%	- X: the dataset
%   - alpha: shrink factor 
%   - c: number of representative points 
%   - k: the desired number of clusters
% Outputs:
%   - Label: the label of samples
%   - Cluster: the struct of every subCludters
% by Kun Chu <kun_chu@outlook.com>

%% Initialization
numPts = size(X,1);
numCluster = numPts;
for i=1:numPts
    Cluster{i}.point = X(i,:);
    Cluster{i}.rep = X(i,:);
    Cluster{i}.mean = X(i,:);
    Cluster{i}.index = i;
end
%% Compute initial distance array.
Dist = Inf(numPts);
for i=2:numPts
    for j=1:i-1
        Dist(i,j) =  distRep(Cluster{i}.rep, Cluster{j}.rep);
    end
end

%% Merge the clusters.
while numCluster > k
    if mod( numCluster, 20 ) == 0 
        disp(['   Group count: ' num2str(size(Cluster,2))]);
    end
    
    % Find a pair of closest clusters .
    [MinDis, MinIndex1] = min(Dist, [], 1);
    [~, MinIndex2] = min(MinDis);
    MinIndex1 = MinIndex1(MinIndex2);
    
    % Merge the two clusters as the new cluster.
    Cluster{MinIndex1} = merge(Cluster{MinIndex1}, Cluster{MinIndex2}, c, alpha);
    for i=1:MinIndex1-1
        Dist(MinIndex1, i) =  distRep(Cluster{MinIndex1}.rep, Cluster{i}.rep);
    end
    for i=MinIndex1+1:numCluster
        Dist(i, MinIndex1) =  distRep(Cluster{MinIndex1}.rep, Cluster{i}.rep);
    end
    Cluster(MinIndex2) = [];
    Dist(MinIndex2,:) = [];
    Dist(:,MinIndex2) = [];
    numCluster = numCluster-1;
end

%% Generate sample labels
Label = zeros(numPts, 1);
for i = 1:size(Cluster,2)
    for j = 1:size(Cluster{i}.point,1)
        Label(Cluster{i}.index(j)) = i;
    end
end

end