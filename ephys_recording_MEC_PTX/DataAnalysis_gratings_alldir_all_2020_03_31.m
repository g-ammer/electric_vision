clear all

%% CONTROL HS cells
%   w/o Pharmacology
% filenames = {'2019_10_16_17_17_27.949_SINGalldir' '2019_10_23_14_27_5.002_SINGalldir'};

%% CONTROL VS cells
%   w/o Pharmacology
% filenames = {''};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PTX MEC HS cells
%   with Pharmacology
filenames = {'2019_10_16_18_18_15.269_SINGalldir' '2019_10_23_14_59_24.679_SINGalldir'};

%% PTX MEC VS cells
%   with Pharmacology
% filenames = {''};

%% TEST
% filenames = {'2019_10_16_18_18_15.269_SINGalldir'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import Single Cell Data
for i = 1:length(filenames)
    data = daqread([filenames{i} '_record.daq']);
    [alldata(:,:,i) PDminND(i)] = DataAnalysis_gratings_alldir_2020_03_31(data);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculate mean and std values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

meantrace(:,:) = mean(alldata,3);
stdtrace(:,:) = std(alldata,0,3);

for i=1:8
cellmeans(:,i) = (mean(alldata(10000:40000,i,:)));
end

allcellmeans = mean(cellmeans)
allcellstd = std(cellmeans)
allcellsem = allcellstd / (sqrt(length(filenames)))

allcellmeans(9) = allcellmeans(1);
allcellsem(9) = allcellsem(1);

for i = 1:length(filenames)
cellmeans(i,9) = cellmeans(i,1);
end

PDminNDmean = mean(PDminND)
PDminNDstd = std(PDminND);
PDminNDsem = PDminNDstd / (sqrt(length(filenames)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=(0:0.0001:5); % Time for X-axis in sec

%% Figure 1 - MeanTraces
figure('position',[1 256 1600 256]);
for i=1:size(alldata,2)
subplot(1,8,i)
hold on
rectangle('Position',[1,-15,3,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
for j=1:size(alldata,3)
plot(time(1:50000),alldata(1:50000,i,j),'color',[170 170 170]./255)
hold on
end
plot(time(1:50000),meantrace(1:50000,i),'b','LineWidth',1)
ylim([-10 15])
xlim([0 5])
set(gca,'XTick',[0 1 2 3 4 5])
xlabel ('Time [s]')
if i==1
ylabel('Response [mV]')
end
end

%% Figure 2 - Directional Tuning
angle1=[0 45 90 135 180 225 270 315 360];
figure('position',[1 1 256 256]);
line([0 360],[0 0],'LineStyle','--','linewidth',1.5,'Color',[80 80 80]./255)
hold on
plot(angle1,cellmeans','Color',[200 200 200]./255,'LineWidth',1.5)
hold on
% for j=1:size(alldata,3)
% plot(time(1:40000),alldata(1:40000,i,j),'color',[170 170 170]./255)
% end
errorbar(angle1,allcellmeans,allcellsem,'b','LineWidth',2.5)
plot(angle1,allcellmeans,'b','LineWidth',2.5)
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

%% SAVE Data as MAT-files
save('R24E09_MEC_PTX_SING.mat','alldata')


