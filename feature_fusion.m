function S = feature_fusion(prob_1, prob_2, pitch)

  lamda = mean(prob_1) - mean(prob_2);
  S1 = (lamda - prob_1) / 0.6 + (205 - pitch) * (100 * 0.4);
  S2 = (lamda - prob_2) / 0.6 + (205 - pitch) * (100 * 0.4);
  S = S1 - S2;
  
end