% =================================================
%       Matlab code for DBSCAN algorithm
%       Written by Lab of GRC & AI
% =================================================
% Args:
%   Pts: a set of points.
%   minPts: a minimum number threshold parameter.
% Returns:
%   IDX: cluster result
%   Isnoise:
% =================================================
function PlotClusterinResult(Pts, ClusterResult)
    k=max(ClusterResult);  % ´ØµÄÊýÁ¿
    Colors=hsv(k);

    Legends = {};
    for i=0:k
        Xi = Pts(ClusterResult==i,:);
        if i~=0
            Style = '.';
            MarkerSize = 8;
            Color = Colors(i,:);
            Legends{end+1} = ['Cluster ' num2str(i)];
        else  % noise, use black 'x' to mark
            Style = 'x';
            MarkerSize = 6;
            Color = [0 0 0];
            if ~isempty(Xi)
                Legends{end+1} = 'Noise';
            end
        end
        if ~isempty(Xi)
            plot(Xi(:,1),Xi(:,2),Style,'MarkerSize',MarkerSize,'Color',Color,'LineWidth',2);
        end
        hold on;
    end
    hold off;
    axis equal;
    grid on;
    legend(Legends);
%     legend('Location', 'NorthEastOutside');

end