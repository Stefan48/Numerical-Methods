function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
  filepattern = fullfile(database_path, '*.jpg');
  files = dir(filepattern);
  for i=1:length(files)
     F = fullfile(database_path, files(i).name);
     I(:,:,i) = double(rgb2gray(imread(F)));
     v = I(:,:,i)(:);
     if(i == 1)
        T(:,i) = v;
     elseif(i == 2)
        T(:,length(files)) = v;
     else
        T(:,i-1) = v;
     endif
  end
  
  for i = 1:rows(T)
      m(i,1) = mean(T(i,:));
  endfor
  A = T - m;
  [vect val] = eig(A' * A);
  cont = 0;
  for i = 1:rows(val)
      if(val(i,i) > 1)
          cont = cont + 1;
          V(:,cont) = vect(:,i);
      endif
  endfor
  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
end