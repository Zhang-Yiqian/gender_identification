clear
close all
figure(1)
width = 5;
t = [4,8,16,32];
M1 = [89.66, 91.36,	93.36, 94.32]/100;
plot(t, M1,':','LineWidth',width); 
hold on; 
F1 = [89.24, 90.66, 94.78, 93.4]/100;
plot(t, F1,':','LineWidth',width); 
hold on; 
M2 = [88.94, 82.82, 89.02, 93.74]/100;
plot(t, M2,'--', 'LineWidth',width); 
hold on; 
F2 = [79.14, 89.82, 91.62, 90.58]/100;
plot(t, F2,'--','LineWidth',width); 
hold on; 
M3 = [95.52, 95.06, 97.74, 99.14]/100;
plot(t, M3,'-.','LineWidth',width); 
hold on; 
F3 = [92.74, 97.1, 92.72, 87.68]/100;
plot(t, F3,'-.','LineWidth',width); 
hold on; 
M4 = [95.16, 91.86, 94.64, 95.28]/100;
plot(t, M4,'LineWidth',width); 
hold on; 
F4 = [97.28, 98.96, 98.1, 98.42]/100;
plot(t, F4,'LineWidth',width); 
hold on; 

title('Line Plot of Average Accuracies from GMMs')
legend('Location','southeast')
legend("GMM with bandpass [100-300] - Male",...
  "GMM with bandpass [100-300] - Female",...
  "GMM with bandpass [100-350] - Male",...
  "GMM with bandpass [100-350] - Female",...
  "GMM with bandpass [300-3400] - Male",...
  "GMM with bandpass [300-3400] - Female",...
  "GMM with bandpass [300-3400] - balanced Male",...
  "GMM with bandpass [300-3400] - balanced Female");
xlabel("Number of components")
ylabel("Accuracy")
ylim([0.82 1])
xticks([4 8 16 32])
ax = gca;
ax.FontSize = 25;





