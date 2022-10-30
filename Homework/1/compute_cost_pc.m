% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; 
	% TODO compute clustering solution cost
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
    for j = 1:NC
        for i = 1:no_points
            if(belongs_to_centroid(i)==j)
                cost += norm(centroids(j,:)-points(i,:));
            endif
        endfor
    endfor
end

