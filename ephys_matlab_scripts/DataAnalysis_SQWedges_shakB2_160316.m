clear all
%% import data %%%

%% control w/o CDM (CantonS)
% filenames={'2015_12_16_15_47_22.205_SQWEdgesVERT' '2016_1_8_17_11_19.111_SQWEdgesVERT' '2016_1_19_16_39_45.02_SQWEdgesHORZ'...
%     '2016_1_20_15_49_57.651_SQWEdgesHORZ' '2016_1_21_15_25_53.726_SQWEdgesVERT' '2016_1_26_14_25_48.763_SQWEdgesVERT'...
%     '2016_1_27_14_44_14.186_SQWEdgesVERT'};

%% CONTROL
%   w-;tshGal80/+;R57C10-Gal4/UAS-Val20-GFP-RNAi (N=4 ,n=16)
% filenames={'2017_3_6_16_22_0.414_SQWEdgesHORZ' '2017_3_6_16_58_54.633_SQWEdgesHORZ' '2017_3_6_18_0_33.869_SQWEdgesVERT'...
%     '2017_3_6_18_31_46.694_SQWEdgesHORZ' '2017_3_6_19_17_0.349_SQWEdgesVERT' '2017_3_16_16_25_48.603_SQWEdgesHORZ'...
%     '2017_3_16_16_58_3.698_SQWEdgesVERT' '2017_3_16_17_43_32.662_SQWEdgesVERT' '2017_3_16_18_34_55.851_SQWEdgesVERT'...
%     '2017_3_17_15_56_54.969_SQWEdgesVERT' '2017_3_20_11_55_18.072_SQWEdgesVERT' '2017_3_20_12_39_12.93_SQWEdgesVERT'...
%     '2017_3_20_13_46_28.839_SQWEdgesVERT' '2017_3_20_15_1_16.638_SQWEdgesVERT' '2017_3_27_15_47_34.94_SQWEdgesHORZ'...
%     '2017_3_27_16_51_0.708_SQWEdgesVERT'};

%% w+;10xKir2.1,R20A03/R31C06;+ (Split_L4) (N=5,n=12)
% filenames={'2016_4_8_16_23_35.752_SQWEdgesVERT' '2016_4_8_17_19_14.217_SQWEdgesVERT' '2016_4_25_14_22_38.859_SQWEdgesVERT'...
%     '2016_4_25_15_20_33.513_SQWEdgesVERT' '2016_4_25_16_21_51.244_SQWEdgesVERT' '2016_4_26_17_13_39.539_SQWEdgesHORZ'...
%     '2016_4_26_17_31_41.431_SQWEdgesHORZ' '2016_4_26_18_39_55.641_SQWEdgesHORZ' '2016_5_6_15_12_1.893_SQWEdgesVERT'...
%     '2016_5_6_16_13_1.491_SQWEdgesHORZ' '2016_5_19_14_19_12.617_SQWEdgesVERT' '2016_5_19_15_37_28.32_SQWEdgesHORZ'};

%% shakB2 mutants (N=11,n=20)
% filenames={'2015_12_8_14_22_48.511_SQWEdgesVERT' '2016_3_15_16_53_12.596_SQWEdgesVERT' '2016_3_15_18_15_27.319_SQWEdgesVERT'...
%     '2016_3_17_16_22_52.748_SQWEdgesHORZ' '2016_3_18_15_47_47.748_SQWEdgesVERT' '2016_3_18_17_35_57.79_SQWEdgesVERT'...
%     '2016_3_23_14_43_12.455_SQWEdgesVERT' '2016_3_23_15_38_18.366_SQWEdgesVERT' '2016_4_27_16_4_13.252_SQWEdgesVERT'...
%     '2016_4_27_16_24_56.131_SQWEdgesVERT' '2016_5_12_15_47_38.572_SQWEdgesHORZ' '2016_10_26_14_18_40.961_SQWEdgesVERT'...
%     '2016_10_26_15_26_33.565_SQWEdgesVERT' '2017_3_3_16_29_55.43_SQWEdgesHORZ' '2017_3_3_17_4_8.696_SQWEdgesVERT'...
%     '2017_4_5_14_33_13.051_SQWEdgesVERT' '2017_4_5_15_35_56.998_SQWEdgesVERT' '2017_4_5_16_25_23.516_SQWEdgesVERT'...
%     '2017_4_7_16_44_13.362_SQWEdgesVERT' '2017_4_7_17_49_28.418_SQWEdgesHORZ'};

%% w-;tshGal80/+;R57C10-Gal4/UAS-Val20-shakB-RNAi (N=5 ,n=12)
filenames={'2017_2_9_16_25_8.788_SQWEdgesVERT' '2017_2_15_15_8_34.772_SQWEdgesHORZ' '2017_2_22_12_55_4.337_SQWEdgesHORZ'...
    '2017_2_22_14_22_45.272_SQWEdgesHORZ' '2017_2_23_12_7_46.182_SQWEdgesHORZ' '2017_2_23_13_4_48.128_SQWEdgesVERT'...
    '2017_2_23_13_55_40.675_SQWEdgesHORZ' '2017_2_23_14_16_23.542_SQWEdgesHORZ' '2017_2_23_14_37_48.392_SQWEdgesVERT'...
    '2017_2_27_16_52_55.037_SQWEdgesVERT' '2017_2_27_17_20_30.8_SQWEdgesVERT' '2017_2_27_17_50_43.59_SQWEdgesVERT'};

%% Mimic2168/shakB2;+/+;+/+ (N=2 ,n=4)
% filenames={'2017_12_12_15_23_7.276_SQWEdgesHORZ' '2017_12_12_17_9_12.095_SQWEdgesVERT' '2017_12_13_16_27_53.807_SQWEdgesHORZ'...
%     '2017_12_13_17_39_23.442_SQWEdgesHORZ'};

%% TEST
% filenames={'2017_2_15_16_48_58.355_SQWEdgesVERT'};
 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(filenames)
    data=daqread([filenames{i} '_record.daq']);
    [alldata(:,:,i) Rinput(i) var_vm(i)]=DataAnalysis_SQWedges_20130827(data);
end

alldataON=alldata(:,1,:)-alldata(:,3,:);
alldataOFF=alldata(:,2,:)-alldata(:,4,:);

meantrace(:,:)=mean(alldata,3);
stdtrace(:,:)=std(alldata,0,3);

%Calculate mean and std values
for i=1:4
cellmeans(:,i)=(mean(alldata(5000:9250,i,:)));
end

allcellmeans=mean(cellmeans,1)
allcellstd=std(cellmeans,1);
allcellsem=allcellstd/(sqrt(length(filenames)));

%%
%Calculate PD-ND meantraces
meantraceON=meantrace(:,1)-meantrace(:,3);
meantraceOFF=meantrace(:,2)-meantrace(:,4);
stdtraceON=std(alldataON,0,3);
stdtraceOFF=std(alldataOFF,0,3);
semtraceON=stdtraceON/sqrt(length(filenames));
semtraceOFF=stdtraceOFF/sqrt(length(filenames));

%Calculate Input Resistance and Vm Variance
mean_Rinput=mean(Rinput);
sem_Rinput=std(Rinput)/sqrt(length(filenames));
mean_var_vm=mean(var_vm);
sem_var_vm=std(var_vm)/sqrt(length(filenames));

%%
%% find timepoint when response reaches 66% of maximum (=latency) in msec

    for k=1:length(filenames)
    for j=1:2
    latency(k,j)=(find(alldata(:,j,k)>max(alldata(:,j,k))*0.66,1,'first')-5000)/10;
    end
    for j=3:4
    latency(k,j)=(find((alldata(:,j,k))<min(alldata(:,j,k))*0.66,1,'first')-5000)/10;
    end
    end

    meanlatency=mean(latency);
    semlatency=std(latency,0,1)/sqrt(length(filenames));
    
%%
%create figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=(0:0.0001:1.5); %time for x-axis in sec

figure('position',[1 1 512 512]);
for i=1:size(alldata,2)
subplot(2,2,i)
hold on
rectangle('Position',[0.5,-25,0.425,50],'FaceColor',[230 230 230]./255,'LineStyle','none')
for j=1:size(alldata,3)
plot(time(1:15000),alldata(1:15000,i,j),'color',[150 150 150]./255)
hold on
end
plot(time(1:15000),meantrace(1:15000,i),'b','LineWidth',[2])
ylim([-15 20])
xlim([0 1.5])
xlabel ('Time [sec]')
if i==1
ylabel('Response [mV]')
end
if i==3
ylabel('Response [mV]')
end
end

%%
%create PD-NDfigures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=(0:0.0001:1.5); %time for x-axis in sec

figure('position',[1 1 512 256]);
subplot(1,2,1)
hold on
rectangle('Position',[0.5,-20,0.425,65],'FaceColor',[230 230 230]./255,'LineStyle','none')
plot(time(1:15000),meantraceON(1:15000),'Color',[255 0 0]./255,'LineWidth',[2.5])
ylim([-10 25])
xlim([0 1.5])
ylabel('PD-ND Response [mV]')
xlabel ('Time [sec]')
subplot(1,2,2)
hold on
rectangle('Position',[0.5,-20,0.425,65],'FaceColor',[230 230 230]./255,'LineStyle','none')
plot(time(1:15000),meantraceOFF(1:15000),'Color',[0 176 80]./255,'LineWidth',[2.5])
ylim([-10 25])
xlim([0 1.5])
xlabel ('Time [sec]')

%% SAVE Traces as MAT files
save('Vtrace_shakB2_SQWEdges.mat','meantrace')
%%%
