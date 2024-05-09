clear all
%%%import data%%%%

%% CONTROL cells
%   w-;tshGal80/+;R57C10-Gal4/UAS-Val20-GFP-RNAi
% filenames={'2017_3_6_16_42_48.643_SQWHorzVel_AA' '2017_3_6_18_15_14.675_SQWVertVel_AA' '2017_3_6_18_48_47.737_SQWHorzVel_AA'...
%     '2017_3_6_19_29_29.716_SQWVertVel_AA' '2017_3_16_17_9_21.671_SQWVertVel_AA' '2017_3_16_17_55_13.477_SQWVertVel_AA'...
%     '2017_3_16_18_44_27.612_SQWVertVel_AA' '2017_3_20_12_8_3.218_SQWVertVel_AA' '2017_3_20_12_49_25.312_SQWVertVel_AA'...
%     '2017_3_20_14_11_20.571_SQWVertVel_AA' '2017_3_20_15_12_17.906_SQWVertVel_AA' '2017_3_27_15_57_48.018_SQWHorzVel_AA'...
%     '2017_3_27_17_1_12.97_SQWVertVel_AA'};

%% shakB2 mutants
% filenames={'2016_3_15_16_58_32.574_SQWVertVel_AA' '2016_3_15_18_25_22.701_SQWVertVel_AA' '2016_3_17_16_35_38.717_SQWHorzVel_AA'...
%     '2016_3_23_14_48_1.616_SQWVertVel_AA' '2016_3_23_15_46_0.583_SQWVertVel_AA'};

%% CONTROL Canton S w/o CDM
% filenames={'2016_2_8_16_7_5.518_SQWVertVel_AA' '2016_2_9_16_30_22.935_SQWHorzVel_AA' '2016_2_10_15_46_51.472_SQWVertVel_AA'...
%     '2016_2_18_15_37_42.526_SQWHorzVel_AA' '2016_2_25_15_58_20.628_SQWVertVel_AA' '2016_2_26_15_31_51.381_SQWHorzVel_AA'};

%% w+;10xKir2.1/SS316;SS316,+ (Split_L4)
% filenames={'2016_4_8_16_41_21.144_SQWVertVel_AA' '2016_4_8_17_36_22.805_SQWVertVel_AA' '2016_4_25_14_44_17.444_SQWVertVel_AA'...
%     '2016_4_25_15_37_42.412_SQWVertVel_AA' '2016_4_25_16_39_0.557_SQWVertVel_AA' '2016_4_26_17_49_11.159_SQWHorzVel_AA'...
%     '2016_4_26_18_58_19.695_SQWHorzVel_AA' '2016_5_6_15_31_25.43_SQWVertVel_AA' '2016_5_6_16_30_9.522_SQWHorzVel_AA'...
%     '2016_5_19_14_36_29.593_SQWVertVel_AA'};

%% Mimic2168/shakB2;+/+;+/+ (N=2 ,n=4)
filenames={'2017_12_12_15_34_1.314_SQWHorzVel_AA' '2017_12_12_17_19_25.919_SQWVertVel_AA' '2017_12_13_16_38_7.946_SQWHorzVel_AA'...
    '2017_12_13_17_49_37.48_SQWHorzVel_AA'};

%% w-;tshGal80/+;R57C10-Gal4/UAS-Val20-shakB-RNAi (all)
filenames={'2017_2_15_15_20_49.462_SQWHorzVel_AA' ''};

%% TEST
% filenames={'2016_2_25_15_58_20.628_SQWVertVel_AA'};

%%
for i=1:length(filenames)
    data=daqread([filenames{i} '_record.daq']);
    [alldataPD(:,:,i) alldataND(:,:,i) meanPDND(i,:) meanPDNDsteady(i,:) var_vm(i) Rinput(i)]=DataAnalysis_SQWgrat_veltuning_AA_short_20160201(data);
end

meantracePD(:,:)=mean(alldataPD,3);
stdtracePD(:,:)=std(alldataPD,0,3);
meantraceND(:,:)=mean(alldataND,3);
stdtraceND(:,:)=std(alldataND,0,3);

%% Calculate mean and std values
for i=1:12
cellmeansPD(:,i)=(mean(alldataPD(10000:48000,i,:)));
cellmeansND(:,i)=(mean(alldataND(10000:48000,i,:)));
end
 
allcellmeansPD=mean(cellmeansPD);
allcellstdPD=std(cellmeansPD);
allcellsemPD=allcellstdPD/(sqrt(length(filenames)));

allcellmeansND=mean(cellmeansND);
allcellstdND=std(cellmeansND);
allcellsemND=allcellstdND/(sqrt(length(filenames)));

allcellmeansPDND=mean(meanPDND);
allcellsemPDND=std(meanPDND)/(sqrt(length(filenames)));

mean_Rinput=mean(Rinput);
sem_Rinput=std(Rinput)/sqrt(length(filenames));
mean_var_vm=mean(var_vm)

%% Calculate steady state mean and std values
for i=1:12
cellmeansPDsteady(:,i)=(mean(alldataPD(28000:48000,i,:)));
cellmeansNDsteady(:,i)=(mean(alldataND(28000:48000,i,:)));
end
 
allcellmeansPDsteady=mean(cellmeansPDsteady);
allcellstdPDsteady=std(cellmeansPDsteady);
allcellsemPDsteady=allcellstdPDsteady/(sqrt(length(filenames)));

allcellmeansNDsteady=mean(cellmeansNDsteady);
allcellstdNDsteady=std(cellmeansNDsteady);
allcellsemNDsteady=allcellstdNDsteady/(sqrt(length(filenames)));

allcellmeansPDNDsteady=mean(meanPDNDsteady);
allcellsemPDNDsteady=std(meanPDNDsteady)/(sqrt(length(filenames)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=(0:0.0001:5.8); %time for x-axis in sec

%% plot PD
figure('position',[1 1 1792 256]);
for i=1:12
subplot(1,12,i)
rectangle('Position',[1,-15,3.8,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
hold on
for j=1:length(filenames)
plot(time(1:500:end),alldataPD(1:500:58001,i,j),'color',[150 150 150]./255)
end
line([0 5],[0 0],'linewidth',2,'Color',[80 80 80]./255)
plot(time(1:500:end),meantracePD(1:500:58001,i),'linewidth',2.5,'color','r')
ylim([-10 20])
xlim([0 5.8])
xlabel ('Time [sec]')
ylabel('Response [mV]')
end

%% plot ND
figure('position',[1 1 1792 256]);
for i=1:12
subplot(1,12,i)
rectangle('Position',[1,-15,3.8,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
hold on
for j=1:length(filenames)
plot(time(1:500:end),alldataND(1:500:58001,i,j),'color',[150 150 150]./255)
end
line([0 5],[0 0],'linewidth',2,'Color',[80 80 80]./255)
plot(time(1:500:end),meantraceND(1:500:58001,i),'linewidth',2.5,'color','b')
ylim([-10 20])
xlim([0 5.8])
xlabel ('Time [sec]')
ylabel('Response [mV]')
end


%% %% PLOT Tuning Curve %%%%%
hz=[0.05 0.1 0.25 0.5 1 1.5 2.5 5 10 15 17.5 20];
figure('position',[1 1 512 256]);
subplot(1,2,1)
semilogx(hz,allcellmeansPD,'r','LineWidth',2)
hold on
errorbar(hz,allcellmeansPD,allcellsemPD,'r','LineWidth',2)
semilogx(hz,allcellmeansND,'b','LineWidth',2)
errorbar(hz,allcellmeansND,allcellsemPD,'b','LineWidth',2)
hold on
semilogx(hz,zeros(length(hz)),'linewidth',2,'Color',[80 80 80]./255)
ylim([-8 12])
xlim([0 20])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')
subplot(1,2,2)
semilogx(hz,allcellmeansPDND,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansPDND,allcellsemPDND,'k','LineWidth',2)
ylim([0 20])
xlim([0 20])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')

% %% %% PLOT Normalized Tuning Curve %%%%%
% allcellmeansPDND_norm=allcellmeansPDND/max(allcellmeansPDND);
% 
% for i=1:12
% gain(i)=allcellmeansPDND_norm(i)/allcellmeansPDND_norm1(i)
% end
% 
% hz=[0.05 0.1 0.25 0.5 1 1.5 2.5 5 10 15 17.5 20];
% 
% figure('position',[1 1 256 256]);
% plot(hz,allcellmeansPDND_norm,'r','LineWidth',2)
% hold on
% plot(hz,allcellmeansPDND_norm1,'k','LineWidth',2)
% ylim([0 1.2])
% xlim([0 20])
% ylabel('Norm Response')
% xlabel('Temp. Frequency [Hz]')

%% COMPARISON
% %%%
% %% plot PD
% figure('position',[1 1 896 256]);
% n=[2 4 5 7 9 10 12];
% for i=1:7
% subplot(1,7,i)
% rectangle('Position',[1,-15,3.8,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
% hold on
% line([0 5.8],[0 0],'linewidth',1.5,'Color',[80 80 80]./255)
% plot(time(1:500:end),meantracePD1(1:500:58001,n(i)),'linewidth',2,'color','k')
% plot(time(1:500:end),meantracePD(1:500:58001,n(i)),'linewidth',2,'color','r')
% ylim([-2 15])
% xlim([0 5.8])
% xlabel ('Time [sec]')
% ylabel('Response [mV]')
% end
% 
% %% plot ND
% figure('position',[1 1 1792 256]);
% n=[2 4 6 7 9 10 12];
% for i=1:7
% subplot(1,7,i)
% rectangle('Position',[1,-15,3.8,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
% hold on
% for j=1:length(filenames)
% % plot(time(1:500:end),alldataND(1:500:58001,i,j),'color',[150 150 150]./255)
% end
% line([0 5.8],[0 0],'linewidth',2,'Color',[80 80 80]./255)
% plot(time(1:500:end),meantraceND1(1:500:58001,n(i)),'linewidth',2,'color','k')
% plot(time(1:500:end),meantraceND(1:500:58001,n(i)),'linewidth',2,'color','r')
% ylim([-10 15])
% xlim([0 5.8])
% xlabel ('Time [sec]')
% ylabel('Response [mV]')
% end
% 
% % %% plot tuning curves
% 
% %% Tuning Curve PD-ND
% for i=1:12
% gain(i)=allcellmeansPDND_norm(i)/allcellmeansPDND_norm1(i)
% end

hz=[0.05 0.1 0.25 0.5 1 1.5 2.5 5 10 15 17.5 20];
figure('position',[1 1 256 256]);
semilogx(hz,allcellmeansPDND,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansPDND,allcellsemPDND,'k','LineWidth',2)
semilogx(hz,allcellmeansPDND1,'r','LineWidth',2)
errorbar(hz,allcellmeansPDND1,allcellsemPDND1,'r','LineWidth',2)
% semilogx(hz,allcellmeansPDND2,'Color',[100 100 100]./255,'LineWidth',2)
% errorbar(hz,allcellmeansPDND2,allcellsemPDND2,'Color',[100 100 100]./255,'LineWidth',2)
% semilogx(hz,allcellmeansPDND3,'Color',[150 150 150]./255,'LineWidth',2)
% errorbar(hz,allcellmeansPDND3,allcellsemPDND3,'Color',[150 150 150]./255,'LineWidth',2)
% hold on
ylim([0 20])
xlim([0 20])
set(gca,'XTick',[0.1 1 10])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')

%% Tuning Curves
figure('position',[1 1 512 256]);
subplot(1,2,1)
semilogx(hz,allcellmeansPD,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansPD,allcellsemPD,'k','LineWidth',2)
semilogx(hz,allcellmeansPD1,'r','LineWidth',2)
errorbar(hz,allcellmeansPD1,allcellsemPD1,'r','LineWidth',2)
% semilogx(hz,allcellmeansPD2,'Color',[100 100 100]./255,'LineWidth',2)
% errorbar(hz,allcellmeansPD2,allcellsemPD2,'Color',[100 100 100]./255,'LineWidth',2)
% semilogx(hz,allcellmeansPD3,'Color',[150 150 150]./255,'LineWidth',2)
% errorbar(hz,allcellmeansPD3,allcellsemPD3,'Color',[150 150 150]./255,'LineWidth',2)
hold on
% semilogx(hz,zeros(length(hz)),'linewidth',2,'Color',[80 80 80]./255)
ylim([0 13])
xlim([0 20])
set(gca,'XTick',[0.1 1 10])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')

subplot(1,2,2)
semilogx(hz,allcellmeansND,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansND,allcellsemND,'k','LineWidth',2)
semilogx(hz,allcellmeansND1,'b','LineWidth',2)
errorbar(hz,allcellmeansND1,allcellsemND1,'b','LineWidth',2)
% semilogx(hz,allcellmeansND2,'Color',[100 100 100]./255,'LineWidth',2)
% errorbar(hz,allcellmeansND2,allcellsemND2,'Color',[100 100 100]./255,'LineWidth',2)
% semilogx(hz,allcellmeansND3,'Color',[150 150 150]./255,'LineWidth',2)
% errorbar(hz,allcellmeansND3,allcellsemND3,'Color',[150 150 150]./255,'LineWidth',2)
hold on
semilogx(hz,zeros(length(hz)),'linewidth',1.5,'Color',[80 80 80]./255)
ylim([-8 3])
xlim([0 20])
set(gca,'XTick',[0.1 1 10])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')



%%%%%%%%%%%%%%%%%%%%%%%%%%
hz=[0.05 0.1 0.25 0.5 1 1.5 2.5 5 10 15 17.5 20];
figure('position',[1 1 512 256]);
subplot(1,2,1)
semilogx(hz,allcellmeansPD,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansPD,allcellsemPD,'k','LineWidth',2)
semilogx(hz,allcellmeansND,'k','LineWidth',2)
errorbar(hz,allcellmeansND,allcellsemPD,'k','LineWidth',2)
hold on
semilogx(hz,allcellmeansPDsteady,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansPDsteady,allcellsemPDsteady,'r','LineWidth',2)
semilogx(hz,allcellmeansNDsteady,'r','LineWidth',2)
errorbar(hz,allcellmeansNDsteady,allcellsemPDsteady,'r','LineWidth',2)
semilogx(hz,zeros(length(hz)),'linewidth',2,'Color',[80 80 80]./255)
ylim([-8 12])
xlim([0 20])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')
subplot(1,2,2)
semilogx(hz,allcellmeansPDND,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansPDND,allcellsemPDND,'k','LineWidth',2)
semilogx(hz,allcellmeansPDNDsteady,'r','LineWidth',2)
hold on
errorbar(hz,allcellmeansPDNDsteady,allcellsemPDNDsteady,'r','LineWidth',2)
ylim([0 20])
xlim([0 20])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')


hz=[0.05 0.1 0.25 0.5 1 1.5 2.5 5 10 15 17.5 20];
figure('position',[1 1 256 256]);
semilogx(hz,allcellmeansPD,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansPD,allcellsemPD,'k','LineWidth',2)
semilogx(hz,allcellmeansND,'k','LineWidth',2)
errorbar(hz,allcellmeansND,allcellsemPD,'k','LineWidth',2)
hold on
semilogx(hz,allcellmeansPDsteady,'k','LineWidth',2)
hold on
errorbar(hz,allcellmeansPDsteady,allcellsemPDsteady,'r','LineWidth',2)
semilogx(hz,allcellmeansNDsteady,'r','LineWidth',2)
errorbar(hz,allcellmeansNDsteady,allcellsemPDsteady,'r','LineWidth',2)
semilogx(hz,zeros(length(hz)),'linewidth',2,'Color',[80 80 80]./255)
ylim([-8 12])
xlim([0 20])
set(gca,'XTick',[0.1 1 10])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')


