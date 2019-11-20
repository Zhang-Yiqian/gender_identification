function predictor(pdf_1, pdf_2)

res_1 = ones(length(pdf1));
res_2 = ones(length(pdf1));


for i = 1 : length(pdf1)
  m = mean(log(pdf_1(i) ./ pdf_2(i)) > 0);
  n = mean(log(pdf_2(i) ./ pdf_1(i)) > 0);
  
  
  
  
  
  





end