figure;

for month_i = 1:12
filters = [month_i + (0:19)*12];
   Hist_data = nanmean(SNOBCMSLs(:,:,filters),3)*1e6;

filters = [month_i + (66:85)*12];
   future_data = nanmean(SNOBCMSLs(:,:,filters),3)*1e6;

   subplot(3,4,month_i)
   imagesc(flipud(future_data' - Hist_data'), [-2 2])
end

%% a 
figure;

for month_i = 1:12
filters = [month_i + (0:19)*12];
   Hist_data = nanmean(SNOAERFRC2Ls(:,:,filters),3);

filters = [month_i + (66:85)*12];
   future_data = nanmean(SNOAERFRC2Ls(:,:,filters),3);

   subplot(3,4,month_i)
   imagesc(flipud(Hist_data'), [0 5])
end

figure;

for month_i = 1:12
filters = [month_i + (0:19)*12];
   Hist_data = nanmean(SNOAERFRC2Ls(:,:,filters),3);

filters = [month_i + (66:85)*12];
   future_data = nanmean(SNOAERFRC2Ls(:,:,filters),3);

   subplot(3,4,month_i)
   imagesc(flipud(future_data'), [0 5])
end