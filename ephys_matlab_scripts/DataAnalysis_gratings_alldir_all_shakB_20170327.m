clear all

%% CONTROL HS cells
%   w-;tshGal80/+;R57C10-Gal4/UAS-Val20-GFP-RNAi
% filenames={'2017_3_6_15_58_49.928_SINGalldir' '2017_3_6_16_26_50.254_SINGalldir' '2017_3_6_17_3_44.19_SINGalldir'...
%     '2017_3_6_18_44_30.985_SINGalldir' '2017_3_16_16_21_25.605_SINGalldir' '2017_3_27_15_43_17.262_SINGalldir'};

%% CONTROL VS cells
%   w-;tshGal80/+;R57C10-Gal4/UAS-Val20-GFP-RNAi
% filenames={'2017_3_6_18_10_57.367_SINGalldir' '2017_3_6_19_25_12.977_SINGalldir' '2017_3_16_16_52_30.333_SINGalldir'...
%     '2017_3_16_17_39_15.629_SINGalldir' '2017_3_16_18_30_33.406_SINGalldir' '2017_3_17_15_52_37.793_SINGalldir'...
%     '2017_3_20_11_51_0.658_SINGalldir' '2017_3_20_12_34_12.06_SINGalldir' '2017_3_20_13_42_11.702_SINGalldir'...
%     '2017_3_20_14_53_35.704_SINGalldir' '2017_3_27_16_46_43.329_SINGalldir'};

%% shakB2 mutant HS cells
% filenames={'2016_3_17_16_29_6.878_SINGalldir'};
% '2017_3_3_16_25_38.582_SINGalldir'

%% shakB2 mutant VS cells
% filenames={'2015_12_8_14_32_37.627_SINGalldir' '2016_3_15_16_47_15.379_SINGalldir'...
%     '2016_3_18_18_13_4.988_SINGalldir' '2016_3_23_14_27_18.155_SINGalldir'...
%     '2016_3_23_16_5_9.585_SINGalldir' '2016_4_27_16_51_58.042_SINGalldir' '2016_5_12_16_30_45.683_SINGalldir'...
%     '2016_10_26_14_14_23.532_SINGalldir' '2016_10_26_15_21_56.9_SINGalldir' '2017_3_3_16_59_52.082_SINGalldir'...
%     '2017_4_5_14_38_2.655_SINGalldir' '2017_4_5_16_30_13.199_SINGalldir' '2017_4_7_16_49_2.309_SINGalldir'};

%% w-;tshGal80/+;R57C10-Gal4/UAS-Val20-shakB-RNAi HS cells
% filenames={'2017_2_15_15_4_18_SINGalldir' '2017_2_22_12_50_47.718_SINGalldir'...
%     '2017_2_23_12_3_11.158_SINGalldir' '2017_2_23_14_12_6.556_SINGalldir'};

%  {'2017_2_22_14_16_3.992_SINGalldir'  '2017_2_23_13_51_29.852_SINGalldir'}

%% w-;tshGal80/+;R57C10-Gal4/UAS-Val20-shakB-RNAi VS cells
% filenames={'2017_2_9_17_12_30.079_SINGalldir' '2017_2_27_16_48_8.869_SINGalldir' '2017_2_27_17_16_14.09_SINGalldir'...
%     '2017_2_27_17_46_27.26_SINGalldir'};

%% Canton S (2015 VS old)
% filenames={'2016_7_27_14_54_41.149_SINGalldir' '2016_7_27_15_53_26.426_SINGalldir' '2016_7_27_16_20_19.353_SINGalldir'...
% '2017_9_29_15_18_11.27_SINGalldir' '2016_8_5_14_27_21.394_SINGalldir' '2016_8_5_15_47_32.545_SINGalldir'...
% '2016_10_19_16_6_35.498_SINGalldir' '2016_10_19_16_26_36.29_SINGalldir' '2016_10_20_15_50_16.24_SINGalldir'...
% '2016_10_20_16_44_51.851_SINGalldir' '2016_10_20_17_7_56.625_SINGalldir'};

%% Canton S (2015 HS old)
filenames={'2016_7_28_16_5_24.513_SINGalldir' '2016_8_5_15_22_43.339_SINGalldir' '2016_10_19_15_42_3.532_SINGalldir'...
'2016_10_20_16_17_47.881_SINGalldir'};

%%TEST
% filenames={};
     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
for i=1:length(filenames)
    data=daqread([filenames{i} '_record.daq']);
    [alldata(:,:,i) PDminND(i)]=DataAnalysis_gratings_alldir_20130110(data);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
meantrace(:,:)=mean(alldata,3);
stdtrace(:,:)=std(alldata,0,3);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculate mean and std values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:8
cellmeans(:,i)=(mean(alldata(10000:40000,i,:)));
end

allcellmeans=mean(cellmeans)
allcellstd=std(cellmeans)
allcellsem=allcellstd/(sqrt(length(filenames)))

allcellmeans(9)=allcellmeans(1);
allcellsem(9)=allcellsem(1);
for i=1:length(filenames)
cellmeans(i,9)=cellmeans(i,1);
end

PDminNDmean=mean(PDminND)
PDminNDstd=std(PDminND);
PDminNDsem=PDminNDstd/(sqrt(length(filenames)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=(0:0.0001:5); %time for x-axis in sec

%% Figure 1 - MeanTraces
figure('position',[1 1 1280 256]);
for i=1:size(alldata,2)
subplot(1,8,i)
hold on
rectangle('Position',[1,-15,3,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
for j=1:size(alldata,3)
plot(time(1:50000),alldata(1:50000,i,j),'color',[150 150 150]./255)
hold on
end
plot(time(1:50000),meantrace(1:50000,i),'b','LineWidth',2)
ylim([-15 15])
xlim([0 5])
xlabel ('Time [sec]')
if i==1
ylabel('Response [mV]')
end
end

%% Figure 2 - Directional Tuning
angle1=[0 45 90 135 180 225 270 315 360];
figure('position',[1 1 256 256]);
line([0 360],[0 0],'LineStyle','--','linewidth',1.5,'Color',[80 80 80]./255)
hold on
% plot(angle1,cellmeans','Color',[80 80 80]./255,'LineWidth',1)
hold on
errorbar(angle1,allcellmeans,allcellsem,'k','LineWidth',2.5)
plot(angle1,allcellmeans,'k','LineWidth',2.5)
ylim([-10 15])
xlim([0 360])
set(gca,'XTick',[0 90 180 270 360])
xlabel('Direction [deg]')
ylabel('Response [mV]')

%% Figure 3 - Polar Plot Directional Tuning
a=[-10 15]
angle=[0 45 90 135 180 225 270 315 360]*pi/180;
r(1)=-10;
phi(1)=0;
vectorx=sum(allcellmeans(1:8).*cos(angle(1:8)));
vectory=sum(allcellmeans(1:8).*sin(angle(1:8)));
r(2)=sqrt(vectorx^2+vectory^2)
phi(2)=atan2(vectory,vectorx)
figure('position',[1 1 256 256]);
for i=1:length(filenames)
pp(angle,cellmeans(i,:)',a,'LineColor',[80 80 80]./255,'LineWidth',1,'ThetaStartAngle',270,'AngleStep',45,'RingUnits','mV','NumRings',5)
hold on
end
pp(angle,allcellmeans,a,'LineColor','k','LineWidth',2.5,'ThetaStartAngle',270,'AngleStep',45,'RingUnits','mV','NumRings',5)
hold on
pp(phi,r,'LineWidth',2.5,'LineColor','r')


save('CantonS_SING_HS_alldata_10.mat','alldata')