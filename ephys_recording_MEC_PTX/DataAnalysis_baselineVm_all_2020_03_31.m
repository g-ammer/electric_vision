clear all

%% CONTROL VS+HS cells
%   w/o Pharmacology
filenames = {'2019_10_16_17_9_18.174_baseVm' '2019_10_23_14_21_19.143_baseVm'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PTX MEC VS+HS cells
%   with Pharmacology
% filenames = {'2019_10_16_18_11_24.021_baseVm' '2019_10_23_14_53_39.393_baseVm'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
for i=1:length(filenames)
    data=daqread([filenames{i} '_record.daq']);
    [Vtrace(:,i) meanRinput(i) var_vm(i) pspect(i,:) datamv_hist(i,:)]=DataAnalysis_baselineVm_2020_03_31(data);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
Rinput_all=mean(meanRinput);
var_vm_all=mean(var_vm);

%% calculate average power spectrum
sf = 10000; % Sampling frequency
n = round(1000000 / 2 + 1);
f_spectrum = (sf / 2) * linspace(0, 1, n);

mean_pspect = mean(pspect);

%% calculate average power between 12-25 Hz
betafreq = mean(pspect(1200:2200))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figure 1 - Plot Mean Power Spectrum
figure('position',[1 1 256 256]);
% loglog(f_spectrum, pspect,'color',[150 150 150]./255);
% hold on
loglog(f_spectrum, mean_pspect(1:n),'color',[188 20 26]./255);
hold on
% loglog(f_spectrum(1200:2200), mean_pspect(1200:2200),'b');
xlabel('Frequency [Hz]','FontName','Arial');
set(gca,'XTick',[0.001 0.1 10 1000])
ylabel('Energy of component [a.u.]','FontName','Arial');
set(gca,'YTick',[0.0001 1 10000 100000000])
box OFF
xlim([0 1000])
ylim([0.0001 100000000])
% title('Power spectrum');

%% Figure 2 - Plot Mean Histogram
% range=-60:0.25:60;
% figure('position',[1 1 384 384]);
% hist(datamv_hist(:),range)
% xlim([-50 20])
% % ylim([0 1500])

save('Vtrace_MEC_PTX_Ctrl.mat','Vtrace')