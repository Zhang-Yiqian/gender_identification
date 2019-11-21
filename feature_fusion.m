function S = feature_fusion(prob_1, prob_2, pitch)

  lamda = mean(prob_1) - mean(prob_2);
  S1 = (prob_1 - lamda) / 0.6 + (205 - pitch) * (100 * 0.4);
  S2 = (prob_2 - lamda) / 0.6 + (205 - pitch) * (100 * 0.4);
  S = S1 - S2;
  
end