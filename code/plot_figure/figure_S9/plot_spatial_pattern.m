get_mean_SWE_Obs
load('ELM_SWE_hist.mat');
mean_SWE_hist = flipud(mean_SWE_hist');

tmp = mean_SWE_Obs;
mean_SWE_Obs(:,1:360) = tmp(:,361:end);
mean_SWE_Obs(:,361:end) = tmp(:,1:360);

%% plot
figure;
subplot(221)
imagesc(mean_SWE_hist,[0 400])
subplot(222)
imagesc(mean_SWE_Obs,[0 400])
subplot(223)
imagesc(mean_SWE_hist - mean_SWE_Obs,[-200 200])

