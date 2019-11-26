function model = GMMtrainer(data, num_components)

options = statset('MaxIter',1000);
model = fitgmdist(data, num_components,'RegularizationValue', 0.001, 'Options', options);
  % 'RegularizationValue', 0.001, 'Options', options, 'SharedCovariance', true);'CovarianceType','diagonal'

end


  