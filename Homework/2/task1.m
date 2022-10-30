function A_k = task1(image, k)
  %TODO
  A = double(imread(image));
  [U S V] = svd(A);
  U_k = U(:, [1:k]);
  S_k = S([1:k], [1:k]);
  V = V';
  V_k = V([1:k], :);
  A_k = U_k * S_k * V_k;
end