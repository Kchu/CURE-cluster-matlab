function Cluster_C = merge(Cluster_A, Cluster_B, c, alpha)
Cluster_C.point = [Cluster_A.point;Cluster_B.point];
Cluster_C.index = [Cluster_A.index;Cluster_B.index];
Cluster_C.mean = (size(Cluster_A.rep,1)*Cluster_A.mean + size(Cluster_B.rep,1)*Cluster_B.mean)/(size(Cluster_A.rep,1) + size(Cluster_B.rep,1));
tmpSet = [];
Cluster_C.rep = [];
for i=1:c
    maxDist = 0;
    for p=1:size(Cluster_C.point,1)
        if i==1
            minDist = dis2(Cluster_C.point(p,:), Cluster_C.mean);
        else
            tmpDist = dis2(Cluster_C.point(p,:), tmpSet);
            [minDist, ~]=min(tmpDist);
        end
        if minDist >= maxDist
           maxDist = minDist;
           maxPoint = Cluster_C.point(p,:);
        end
    end
    tmpSet = [tmpSet;maxPoint];
end
for j=1:size(tmpSet)
    Cluster_C.rep = [Cluster_C.rep;tmpSet(j,:)+alpha*(Cluster_C.mean-tmpSet(j,:))];
end          
end