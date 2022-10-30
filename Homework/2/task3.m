function [A_k S] = task3(image, k)
  %TODO
  A = double(imread(image));
  [m n] = size(A);
  for i = 1:m
      u(i) = mean(A(i,:));
      A(i,:) = A(i,:) - u(i);
  endfor
  Z = A' / sqrt(n-1);
  [U S V] = svd(Z);
  W = V(:,1:k);
  Y = W' * A;
  A_k = W * Y + u';
endfunction