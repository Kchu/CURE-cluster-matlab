function [dist] = distRep(clusterA_rep, clusterB_rep)
tmpDist = dis2(clusterA_rep, clusterB_rep);
[dist,~] = min(min(tmpDist));