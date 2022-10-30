function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
  I = double(rgb2gray(imread(image_path)));
  v = I(:) - m;
  pr_test_img = eigenfaces' * v;
  min_dist = realmax;
  for i = 1:columns(pr_img)
      d = norm(pr_test_img - pr_img(:,i));
      if(d < min_dist)
          min_dist = d;
          output_img_index = i;
      endif
  endfor
end