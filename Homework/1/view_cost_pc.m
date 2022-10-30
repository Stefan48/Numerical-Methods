% plot total cost graph based on numer of clusters
function view_cost_pc(file_points)
    points = load('-ascii',file_points);
    X = [1:10];
    Y = [];
    for i = 1:10
        centroids = clustering_pc(points,i);
        Y(i) = compute_cost_pc(points,centroids);
    endfor
    plot(X,Y);
end