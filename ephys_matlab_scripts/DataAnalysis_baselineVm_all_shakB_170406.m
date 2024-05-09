clear all

%% CONTROL T4T5 x Sox102F/Tm6b VS
% filenames={'2016_7_27_14_43_47.011_baseVm' '2016_7_27_15_37_59.297_baseVm' '2016_7_27_16_5_34.537_baseVm'...
%     '2016_7_27_16_31_25.074_baseVm' '2016_7_28_14_57_7.039_baseVm' '2016_7_28_15_18_0.942_baseVm'...
%     '2016_7_28_15_40_0.711_baseVm' '2016_7_28_16_41_43.015_baseVm' '2016_8_5_14_38_26.245_baseVm'...
%     '2016_8_5_15_58_37.987_baseVm'};

%% CONTROL
%   w-;tshGal80/+;R57C10-Gal4/UAS-Val20-GFP-RNAi
% filenames={'2017_3_6_16_33_6.651_baseVm' '2017_3_6_17_10_0.138_baseVm' '2017_3_6_18_7_34.924_baseVm'...
%     '2017_3_6_18_41_7.924_baseVm' '2017_3_6_19_21_50.505_baseVm' '2017_3_16_16_32_37.705_baseVm'...
%     '2017_3_16_17_4_52.815_baseVm' '2017_3_16_17_50_20.799_baseVm' '2017_3_16_18_41_44.602_baseVm'...
%     '2017_3_17_16_3_44.412_baseVm' '2017_3_20_12_2_6.793_baseVm' '2017_3_20_12_46_2.271_baseVm'...
%     '2017_3_20_13_53_17.632_baseVm' '2017_3_20_15_8_5.671_baseVm' '2017_3_27_15_54_25.042_baseVm'...
%     '2017_3_27_16_57_50.402_baseVm'};

%% shakB2 mutant cells (all)
% filenames={'2016_10_26_14_25_30.849_baseVm' '2016_10_26_15_33_22.207_baseVm'...
%     '2017_3_3_16_36_44.613_baseVm' '2017_3_3_17_8_57.985_baseVm' '2017_3_3_17_40_27.537_baseVm'...
%     '2017_4_5_14_27_48.237_baseVm' '2017_4_5_16_15_10.53_baseVm' '2017_4_5_17_37_5.123_baseVm'...
%     '2017_4_7_15_26_35.597_baseVm' '2017_4_7_16_39_59.938_baseVm' '2017_4_7_17_37_7.338_baseVm'};

%% shakB2 mutant cells ("oscillatory")
filenames={'2016_10_26_14_25_30.849_baseVm' '2016_10_26_15_33_22.207_baseVm'...
    '2017_4_5_14_27_48.237_baseVm' '2017_4_5_16_15_10.53_baseVm' '2017_4_5_17_37_5.123_baseVm'...
    '2017_4_7_15_26_35.597_baseVm' '2017_4_7_17_37_7.338_baseVm'};

%% w-;tshGal80/+;R57C10-Gal4/UAS-Val20-shakB-RNAi (all)
% filenames={'2017_2_9_16_31_57.831_baseVm' '2017_2_9_17_26_0.77_baseVm' '2017_2_15_15_15_23.77_baseVm'...
%     '2017_2_15_16_17_48.027_baseVm' '2017_2_22_12_32_26.722_baseVm' '2017_2_22_14_29_34.229_baseVm'...
%     '2017_2_23_12_14_35.191_baseVm' '2017_2_23_12_33_16.432_baseVm' '2017_2_23_13_11_37.22_baseVm'...
%     '2017_2_23_13_48_7.357_baseVm' '2017_2_23_14_8_43.495_baseVm' '2017_2_23_14_30_8.628_baseVm'...
%     '2017_2_27_16_59_44.057_baseVm' '2017_2_27_17_27_19.354_baseVm' '2017_2_27_17_57_32.29_baseVm'};

%% w-;tshGal80/+;R57C10-Gal4/UAS-Val20-shakB-RNAi ("oscillatory")
% filenames={'2017_2_9_16_31_57.831_baseVm' '2017_2_9_17_26_0.77_baseVm' '2017_2_15_15_15_23.77_baseVm'...
%     '2017_2_15_16_17_48.027_baseVm' '2017_2_22_12_32_26.722_baseVm' '2017_2_22_14_29_34.229_baseVm'...
%     '2017_2_23_12_33_16.432_baseVm' '2017_2_23_14_8_43.495_baseVm' '2017_2_23_14_30_8.628_baseVm'};

%% TEST
% filenames={'2017_12_12_15_29_57.395_baseVm'};

%%
for i=1:length(filenames)
    data=daqread([filenames{i} '_record.daq']);
    [meanRinput(i) var_vm(i) pspect(i,:) datamv_hist(i,:)]=DataAnalysis_baselineVm_160808(data);
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
range=-60:0.25:60;
figure('position',[1 1 384 384]);
hist(datamv_hist(:),range)
xlim([-50 20])
% % ylim([0 1500])

