function [A_k S] = task4(image, k)
   %TODO
   A = double(imread(image));
   [m n] = size(A);
   for i = 1:m
       u(i) = mean(A(i,:));
       A(i,:) = A(i,:) - u(i);
   endfor
   Z = (A * A') / (n-1);
   [V S] = eig(Z);
   %W = V(:,1:k);
   W = V(:, (end-k+1):end);
   Y = W' * A;
   A_k = W * Y + u';
endfunction