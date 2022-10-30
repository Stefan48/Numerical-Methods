function task2()
   %TODO
   A = double(imread("./in/images/image2.gif"));
   m = rows(A);
   n = columns(A);
   k = min(m, n);
   [U S V] = svd(A);
   x = 1:k;
   
   figure(1);
   plot(x,diag(S));
   title('Figure 1');
   
   sum(1) = S(1,1);
   for i = 2:k
      sum(i) = sum(i-1) + S(i,i);
   endfor
   for i = 1:k
       sum(i) = sum(i) / sum(k);
   endfor
   figure(2);
   plot(x,sum);
   title('Figure 2');
     
   for l = 1:min(m,n)
     A_l = task1("./in/images/image2.gif",l);
     sum(l) = 0;
     for i = 1:m
         s = 0;
         for j = 1:n
            s = s + (A(i,j) - A_l(i,j))^2;
         endfor
         sum(l) = sum(l) + s;
     endfor
     sum(l) = sum(l) / (m*n);
   endfor
   figure(3);
   plot(x,sum);
   title('Figure 3');
   
   sum = (m+n+1)*x/(m*n);
   figure(4);
   plot(x,sum);
   title('Figure 4');
     
end