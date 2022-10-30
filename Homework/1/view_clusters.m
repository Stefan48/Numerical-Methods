% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	% TODO graphical representation coded here 
    [no_points temp] = size(points);
    [NC temp] = size(centroids);
    belongs_to_centroid = zeros(1,no_points);
    for i = 1:no_points
        dist_min = norm(points(i,:) - centroids(1,:));
        closest_centroid = 1;
        for j = 2:NC
            dist = norm(points(i,:) - centroids(j,:));
            if(dist<dist_min)
                dist_min = dist;
                closest_centroid = j;
            endif
        endfor
        belongs_to_centroid(i) = closest_centroid;
    endfor
    scatter3(points(:,1),points(:,2),points(:,3),[],belongs_to_centroid);
end

