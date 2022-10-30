% computes the NC centroids corresponding to the given points using K-Means
function centroids = clustering_pc(points, NC)
	centroids = [];
	% TODO K-Means code 
    [no_points temp] = size(points);
    centroid_id = sort(randperm(no_points, NC));
    %for i = 1:NC
    %    printf("%d\n",centroid_id(i));
    %endfor
    centroids = last_centroids = zeros(NC,3);
    for i = 1:NC
        centroids(i,:) = points(centroid_id(i),:);
    endfor
    belongs_to_centroid = zeros(1,no_points);
    change = 1;
    while(change==1)
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
        for i = 1:NC
            coord_sum = zeros(1,3);
            no_points_in_cluster = 0;
            for j = 1:no_points
                if(belongs_to_centroid(j)==i)
                    coord_sum += points(j,:);
                    no_points_in_cluster++;
                endif
            endfor
            centroids(i,:) = coord_sum/no_points_in_cluster;
        endfor
        change = 0;
        for i = 1:NC
            if(centroids(i,:)!=last_centroids(i,:))
                change = 1;
                last_centroids(i,:) = centroids(i,:);
            endif
        endfor
    endwhile
end
