clear all

%% IMPORT DATA

%% control (Canton S)
% filenames={'2015_12_14_15_28_28.132_FLCKRfull' '2015_12_16_15_45_23.061_FLCKRfull' '2016_1_5_17_0_48.406_FLCKRfull'...
%     '2016_1_8_17_9_19.509_FLCKRfull' '2016_1_19_16_37_45.384_FLCKRfull' '2016_1_26_14_23_49.135_FLCKRfull'...
%     '2016_1_27_14_42_14.539_FLCKRfull'};

%% CONTROL
%   w-;tshGal80/+;R57C10-Gal4/UAS-Val20-GFP-RNAi
% filenames={'2017_3_6_16_31_6.959_FLCKRfull' '2017_3_6_17_8_0.876_FLCKRfull' '2017_3_6_18_5_35.625_FLCKRfull'...
% '2017_3_6_18_39_8.037_FLCKRfull' '2017_3_6_19_12_24.355_FLCKRfull' '2017_3_16_17_2_53.119_FLCKRfull'...
% '2017_3_16_17_48_21.573_FLCKRfull' '2017_3_16_18_39_44.939_FLCKRfull' '2017_3_17_16_1_44.669_FLCKRfull'...
% '2017_3_20_12_0_7.538_FLCKRfull' '2017_3_20_12_44_2.539_FLCKRfull' '2017_3_20_13_51_17.876_FLCKRfull'...
% '2017_3_20_15_6_6.399_FLCKRfull' '2017_3_27_15_52_24.772_FLCKRfull' '2017_3_27_16_55_50.717_FLCKRfull'};

%% shakB2 Mutants
% filenames={'2016_3_7_16_46_21.054_FLCKRfull' '2016_3_15_17_7_7.404_FLCKRfull' '2016_3_15_18_34_10.388_FLCKRfull'...
%     '2016_3_17_16_54_5.399_FLCKRfull' '2016_3_18_16_1_6.841_FLCKRfull' '2016_3_18_18_0_45.069_FLCKRfull'...
%     '2016_3_23_14_41_12.633_FLCKRfull' '2016_3_23_15_44_1.303_FLCKRfull' '2016_4_27_16_29_45.536_FLCKRfull'...
%     '2016_5_12_16_50_6.451_FLCKRfull' '2017_3_3_16_41_42.815_FLCKRfull' '2017_3_3_16_58_11.444_FLCKRfull'...
%     '2017_3_3_17_29_22.137_FLCKRfull' '2017_4_5_14_31_7.808_FLCKRfull' '2017_4_5_16_34_29.867_FLCKRfull'...
%     '2017_4_7_16_53_18.435_FLCKRfull'};

%% w+;10xKir2.1,R20A03/R31C06;+ (Split_L4)
% filenames={'2016_4_8_16_29_1.472_FLCKRfull' '2016_4_8_17_24_2.833_FLCKRfull' '2016_4_25_14_31_57.691_FLCKRfull'...
% '2016_4_25_15_25_22.905_FLCKRfull' '2016_4_25_16_26_40.451_FLCKRfull' '2016_4_26_17_19_51.618_FLCKRfull'...
% '2016_4_26_17_36_52.319_FLCKRfull' '2016_4_26_18_46_0.91_FLCKRfull' '2016_5_6_15_19_5.78_FLCKRfull'...
% '2016_5_6_16_17_50.955_FLCKRfull' '2016_5_19_14_24_2.297_FLCKRfull'};

%% w-;tshGal80/+;R57C10-Gal4/UAS-Val20-shakB-RNAi
% filenames={'2017_2_22_12_59_53.529_FLCKRfull' '2017_2_22_14_27_34.975_FLCKRfull' '2017_2_23_12_17_36.42_FLCKRfull'...
%     '2017_2_23_13_9_37.512_FLCKRfull' '2017_2_23_14_0_29.909_FLCKRfull' '2017_2_23_14_42_37.824_FLCKRfull'... 
%     '2017_2_27_16_57_44.381_FLCKRfull' '2017_2_27_17_25_19.652_FLCKRfull' '2017_2_27_17_55_32.408_FLCKRfull'};

%% Mimic2168/shakB2;+/+;+/+ (N=2 ,n=4)
% filenames={'2017_12_12_15_27_57.153_FLCKRfull' '2017_12_12_17_14_1.873_FLCKRfull' '2017_12_13_16_32_43.57_FLCKRfull'...
%     '2017_12_13_17_44_13.233_FLCKRfull'};

%% Canton S Control (10)
% filenames={'2016_10_19_15_30_25.452_FLCKRfull' '2016_10_19_16_15_41.296_FLCKRfull' '2016_10_19_16_35_42.492_FLCKRfull'...
%     '2016_10_20_16_53_57.863_FLCKRfull' '2016_10_20_17_24_6.646_FLCKRfull' '2016_8_5_15_27_0.341_FLCKRfull'};

%% Canton S Control (100)
filenames={'2022_1_25_11_10_51.629_FLCKRfull' '2022_1_25_11_47_13.663_FLCKRfull' '2022_1_25_12_54_0.425_FLCKRfull'...
    '2022_1_25_13_20_4.084_FLCKRfull' '2022_1_25_14_5_14.221_FLCKRfull' '2022_1_26_11_50_7.864_FLCKRfull'...
    '2022_1_26_12_59_24.022_FLCKRfull' '2022_1_26_14_2_56.614_FLCKRfull' '2022_1_26_14_29_43.642_FLCKRfull'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% START ANALYSIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(filenames)
    data=daqread([filenames{i} '_record.daq']);
    [maxon(:,i) maxoff(:,i) meanlightoncorr(:,i) meanlightoffcorr(:,i) Max_ON_Flicker(:,i) Max_OFF_Flicker(:,i) mitteltraceplot(:,i) mittellighton(:,i)...
        mittellightoff(:,i) MeanMax_ON_Flicker(i) MeanMax_OFF_Flicker(i)...
        Lat_ON_Flicker(:,i) Lat_OFF_Flicker(:,i) Max_meanON_Flicker(:,i) Max_meanOFF_Flicker(:,i)]=DataAnalysis_Full_Flicker_130117(data);
end
%%%%%%%%%%%%%%%%%%%%% Calculation of mean traces and values %%%%%%%%%%%%%%%%%%%%%%%%%

meanontrace=mean(meanlightoncorr,2);
stdontrace=std(meanlightoncorr,0,2);
meanofftrace=mean(meanlightoffcorr,2);
stdofftrace=std(meanlightoffcorr,0,2);

meantrace=mean(mitteltraceplot,2);
meanlighton=mean(mittellighton,2);
meanlightoff=mean(mittellightoff,2);

OnFlickerAmp=mean(MeanMax_ON_Flicker);
OffFlickerAmp=mean(MeanMax_OFF_Flicker);
OnFlickerLat=mean(mean(Lat_ON_Flicker));
OffFlickerLat=mean(mean(Lat_OFF_Flicker));

stdOnFlickerAmp=std(MeanMax_ON_Flicker);
stdOffFlickerAmp=std(MeanMax_OFF_Flicker);
stdOnFlickerLat=std(mean(Lat_ON_Flicker));
stdOffFlickerLat=std(mean(Lat_OFF_Flicker));

Lat_ON_Flicker_vector=Lat_ON_Flicker(:);
Lat_OFF_Flicker_vector=Lat_OFF_Flicker(:);

Mean_Max_On_Flicker_norm=mean(Max_ON_Flicker,2);
Mean_Max_Off_Flicker_norm=mean(Max_OFF_Flicker,2);

%% Calculate Mean Flicker Amp after averaging for every sweep!!
Avg_ON_Flicker=mean(Max_meanON_Flicker)
Avg_OFF_Flicker=mean(Max_meanOFF_Flicker)

% meanDCcomp=mean(DCcomponent)

%%%% find peak of every flicker stimulus and align traces to peak  %%%%%%%%%%%
for i=1:length(filenames)
[maxonfl(i) latonfl(i)]=max(meanlightoncorr(20000:22500,i));
[maxofffl(i) latofffl(i)]=max(meanlightoffcorr(20000:22500,i));
onshape(:,i)=meanlightoncorr(latonfl(i)+19000:latonfl(i)+25000,i);
offshape(:,i)=meanlightoffcorr(latofffl(i)+19000:latofffl(i)+25000,i);
end


%%%%%%%%%%%%%%%%%%% Plot Figures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PLOT FIGURE 1
time=(0:0.0001:length(mitteltraceplot)/10000-0.0001); %time for x-axis in sec

figure
rectangle('Position',[0,-5,1,20],'FaceColor',[230 230 230]./255,'LineStyle','none')
hold on
rectangle('Position',[4,-5,1,20],'FaceColor',[230 230 230]./255,'LineStyle','none')
for i=1:length(filenames)
plot(time,mitteltraceplot(:,i),'linewidth',0.1,'color',[200 200 200]./255)
hold on
end
plot(time,meantrace,'k','linewidth',1.5)
ylim([-5 15])
xlim([0 5])
xlabel ('Time [sec]')
ylabel('Response [mV]')

%% PLOT FIGURE 2
time2=(-0.25:0.0001:length(mittellighton)/10000-0.25-0.0001); %time for x-axis in sec
scrsz = get(0,'ScreenSize');
figure('Position',[1 scrsz(4)/4 scrsz(3)/3*2 scrsz(4)/4])

subplot(1,4,1)
rectangle('Position',[-0.25,-5,0.25,20],'FaceColor',[200 200 200]./255)
hold on
line([-0.25 0.5],[0 0],'linewidth',1.5,'Color',[100 100 100]./255,'LineStyle','--')
line([0 0],[-5 15],'linewidth',1.5,'Color',[80 80 80]./255)
for i=1:length(filenames)
plot(time2,mittellighton(:,i),'Color',[255 160 160]./255)
hold on
end
plot(time2,meanlighton,'r','linewidth',2)
ylim([-5 15])
xlim([-0.25 0.5])
xlabel ('Time [sec]')
ylabel('Response [mV]')
set(gca,'XTick',-0.25:0.25:0.5)

subplot(1,4,2)
rectangle('Position',[0,-5,0.5,20],'FaceColor',[200 200 200]./255)
hold on
line([-0.25 0.5],[0 0],'linewidth',1.5,'Color',[100 100 100]./255,'LineStyle','--')
line([0 0],[-5 15],'linewidth',1.5,'Color',[80 80 80]./255)
for i=1:length(filenames)
plot(time2,mittellightoff(:,i),'color',[160 160 255]./255)
hold on
end
plot(time2,meanlightoff,'b','linewidth',2)
ylim([-5 15])
xlim([-0.25 0.5])
xlabel ('Time [sec]')
ylabel('Response [mV]')
set(gca,'XTick',-0.25:0.25:0.5)

edges=0:20:250;

subplot(1,4,3)
hist(Lat_ON_Flicker_vector,edges)
set(gca,'XTick',0:50:250)
h = findobj(gca,'Type','patch');
set(h,'FaceColor','r')
line([OnFlickerLat OnFlickerLat],[0 70],'linewidth',1.5,'Color','k')
xlabel ('Latency [ms]')
ylabel ('Number of events')
ylim([0 60])
xlim([0 250])

subplot(1,4,4)
hist(Lat_OFF_Flicker_vector,edges,'FaceColor','b')
set(gca,'XTick',0:50:250)
h = findobj(gca,'Type','patch');
set(h,'FaceColor','b')
line([OffFlickerLat OffFlickerLat],[0 70],'linewidth',1.5,'Color','k')
xlabel ('Latency [ms]')
ylabel ('Number of events')
ylim([0 60])
xlim([0 250])

%% PLOT FIGURE 3

figure
plot(Mean_Max_On_Flicker_norm,'linewidth',1.5,'Color','r')
hold on
plot(Mean_Max_Off_Flicker_norm,'linewidth',1.5,'Color','b')
ylim([0 1.5])

figure('Position',[1 1 256 256])
x=[Avg_ON_Flicker Avg_OFF_Flicker];
% y=[stdOnFlickerAmp stdOffFlickerAmp];
bar(x,0.5)
hold on
% errorbar(x,y)
hold on
ylim([0 12])

save('CantonS_Ctrl_Flicker_traces_ON_100.mat','mittellighton')
save('CantonS_Ctrl_Flicker_traces_OFF_100.mat','mittellightoff')
% 
save('CantonS_Ctrl_Flicker_max_ON_100.mat','Max_meanON_Flicker')
save('CantonS_Ctrl_Flicker_max_OFF_100.mat','Max_meanOFF_Flicker')