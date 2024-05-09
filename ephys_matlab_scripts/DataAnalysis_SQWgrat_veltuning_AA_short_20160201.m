function [meandataPD meandataND meanPDND meanPDNDsteady var_vm meanRinput]=DataAnalysis_SQWgrat_veltuning_AA_short_20160201 (data)

%% %%%%%% define pattern sequence %%%%%%%%%

stimvelorder = [0.5 15 1.5 0.05 2.5 0.25 17.5 1 5 20 0.1 10;...
    10 1.5 20 0.1 5 1 17.5 0.25 2.5 0.05 15 0.5];

[val1 ind1]=sort(stimvelorder(1,:));
[val2 ind2]=sort(stimvelorder(2,:));

%% %%%%%% import data %%%%%%%%%%%%
datamv=data(:,1)/10;

dig=zeros(length(data(:,1)),1);
for i=1:length(data(:,1))
    if data(i,2)>2
        dig(i)=1;
    else
    end
end

borders=find(diff(dig)~=0);
diffborders=diff(borders);
stimdiffborders=diffborders(1:2:end);
minborder=38000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculate input resistance
digcurr=zeros(length(data(:,1)),1);
for i=1:length(data(:,1))
    if data(i,3)>2
        digcurr(i)=1;
    else
    end
end
borderscurr=find(diff(digcurr)~=0);

for i=1:length(borderscurr)/2
    inputres(i)=mean(datamv(borderscurr(1+(i-1)*2):borderscurr(2+(i-1)*2)));
end

Rinput=inputres*-20  %in Megaohm
meanRinput=mean(Rinput(2:3))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Calculate variance of Vm

var_vm=var(datamv(borderscurr(4)+30000:borders(1)-5000));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
baseline=zeros(length(borders)/2,1);

for i=1:length(borders)/2
    baseline(i)=mean(datamv(borders(1+(i-1)*2)-10000:borders(1+(i-1)*2)-1));
end

for i=1:length(borders)/4
baseline(i*2)=baseline(i*2-1);
end

%% cut trace into sweeps
for j=1:length(stimvelorder)
    alldataPD(:,1,j)=datamv(borders((ind1(j)*4-3),1)-10000:borders((ind1(j)*4-3))+minborder+10000,1)-baseline(ind1(j)*2);
end

for j=1:length(stimvelorder)
    alldataPD(:,2,j)=datamv(borders((ind2(j)*4-3+48),1)-10000:borders((ind2(j)*4-3+48))+minborder+10000,1)-baseline(ind2(j)*2+24);
end

% for j=1:length(stimvelorder)
%     alldataPD(:,3,j)=datamv(borders((ind3(j)*4-3+96),1)-10000:borders((ind3(j)*4-3+96))+minborder+10000,1)-baseline(ind3(j)*2+48);
% end

%%
for j=1:length(stimvelorder)
    alldataND(:,1,j)=datamv(borders((ind1(j)*4-1),1)-10000:borders((ind1(j)*4-1))+minborder+10000,1)-baseline(ind1(j)*2);
end

for j=1:length(stimvelorder)
    alldataND(:,2,j)=datamv(borders((ind2(j)*4-1+48),1)-10000:borders((ind2(j)*4-1+48))+minborder+10000,1)-baseline(ind2(j)*2+24);
end

% for j=1:length(stimvelorder)
%     alldataND(:,3,j)=datamv(borders((ind3(j)*4-1+96),1)-10000:borders((ind3(j)*4-1+96))+minborder+10000,1)-baseline(ind3(j)*2+48);
% end

%%
% for j=1:length(k)
%     for i=1:length(borders)/48
%       stdalldata(j,i)=var(alldata(5000:9000,i,j));
%     end
% end
% 
% stdalldata_4(1,:)=mean(stdalldata(1:2,:));
% stdalldata_4(2,:)=mean(stdalldata(3:4,:));
% stdalldata_4(3,:)=mean(stdalldata(5:6,:));
% stdalldata_4(4,:)=mean(stdalldata(7:8,:));
% meanstdalldata=mean(stdalldata_4,2);

%%

for i=1:length(stimvelorder)
    meandataPD(:,i)=mean(alldataPD(:,:,i),2);
end

for i=1:length(stimvelorder)
    meandataND(:,i)=mean(alldataND(:,:,i),2);
end

%% calculate mean PD-ND
for i=1:length(stimvelorder)
    mittelPD(i)=mean(meandataPD(10001:48001,i));
end

for i=1:length(stimvelorder)
    mittelND(i)=mean(meandataND(10001:48001,i));
end

meanPDND=mittelPD-mittelND;

%% calculate mean steady state PD-ND
for i=1:length(stimvelorder)
    mittelPDsteady(i)=mean(meandataPD(38001:48001,i));
end

for i=1:length(stimvelorder)
    mittelNDsteady(i)=mean(meandataND(38001:48001,i));
end

meanPDNDsteady=mittelPDsteady-mittelNDsteady;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=(0:0.0001:5.8); %time for x-axis in sec

%% plot PD
figure('position',[1 1 1792 256]);
for i=1:length(stimvelorder)
subplot(1,12,i)
rectangle('Position',[1,-15,3,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
hold on
plot(time(1:500:end),alldataPD(1:500:58001,:,i),'color',[150 150 150]./255)
line([0 5],[0 0],'linewidth',2,'Color',[80 80 80]./255)
plot(time(1:500:end),meandataPD(1:500:58001,i),'b')
ylim([-10 20])
xlim([0 5.8])
xlabel ('Time [sec]')
ylabel('Response [mV]')
end

%% plot ND
figure('position',[1 1 1792 256]);
for i=1:length(stimvelorder)
subplot(1,12,i)
rectangle('Position',[1,-15,3,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
hold on
plot(time(1:500:end),alldataND(1:500:58001,:,i),'color',[150 150 150]./255)
line([0 5],[0 0],'linewidth',2,'Color',[80 80 80]./255)
plot(time(1:500:end),meandataND(1:500:58001,i),'b')
ylim([-10 20])
xlim([0 5.8])
xlabel ('Time [sec]')
ylabel('Response [mV]')
end


%% Plot figure - PD and ND %%%%%
hz=[0.05 0.1 0.25 0.5 1 1.5 2.5 5 10 15 17.5 20];
figure('position',[1 1 256 256]);
semilogx(hz,mittelPD,'r','LineWidth',2)
hold on
semilogx(hz,mittelND,'b','LineWidth',2)
line([0 20],[0 0],'linewidth',2,'Color',[80 80 80]./255)
ylim([-8 15])
xlim([0 20])
ylabel('Response [mV]')


%% Plot Figure - PDminusND
hz=[0.05 0.1 0.25 0.5 1 1.5 2.5 5 10 15 17.5 20];
figure('position',[1 1 256 256]);
semilogx(hz,meanPDND,'k','LineWidth',2)
hold on
ylim([0 20])
xlim([0 20])
ylabel('Response [mV]')
xlabel('Temp. Frequency [Hz]')
