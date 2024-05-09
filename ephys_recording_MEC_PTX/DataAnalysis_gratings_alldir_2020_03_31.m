function [meandata PDminND] = DataAnalysis_gratings_alldir_2020_03_31 (data)

%%%%%%%% Define Pattern Sequence %%%%%%%%%
k = [1 5 3 7 4 8 2 6];
[valk indk]=sort(k);

%%%%%%%% Import Data %%%%%%%%%%%%
datamv = data(:,1)/100;

dig = zeros(length(data(:,1)),1);
for i = 1:length(data(:,1))
    if data(i,2)>2
        dig(i) = 1;
    else
    end
end

borders = find(diff(dig)~=0);
diffborders = diff(borders);
stimdiffborders = diffborders(1:2:end);
minborder = 30000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculate Input Resistance
digcurr = zeros(length(data(:,1)),1);
for i = 1:length(data(:,1))
    if data(i,3)>2
        digcurr(i) = 1;
    else
    end
end
borderscurr = find(diff(digcurr)~=0);

for i = 1:length(borderscurr)/2
    inputres(i) = mean(datamv(borderscurr(1+(i-1)*2):borderscurr(2+(i-1)*2)));
end

Rinput = inputres*-20  %in Megaohm
meanRinput = mean(Rinput)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

baseline = zeros(length(borders)/2,1);

for i = 1:length(borders)/2
    baseline(i) = mean(datamv(borders(1+(i-1)*2)-5000:borders(1+(i-1)*2)-1));
end

% for i=1:length(borders)/4
% baseline(i*2)=baseline(i*2-1);
% end

% first=zeros(minborder+1,length(borders)/14);

for j = 1:length(k)
    for i = 1:length(borders)/16
        alldata(:,i,j) = datamv(borders((indk(j)*2-1)+(i-1)*16,1)-10000:borders((indk(j)*2-1)+(i-1)*16)+minborder+10000,1)-baseline(indk(j)+(i-1)*8);
    end
end

for i = 1:length(k)
    meandata(:,i) = mean(alldata(:,:,i),2);
    mittel(i) = mean(meandata(10001:40001,i));
    maxresp(i) = max(meandata(10001:40001,i));
    minresp(i) = min(meandata(10001:40001,i));
end

PDminND = max(mittel)-min(mittel);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Plot Figure 1 %%
time = (0:0.0001:5); % Time for x-axis in sec

figure('position',[1 1 853 512]);
for i = 1:length(k)
subplot(2,4,i)
rectangle('Position',[1,-15,3,35],'FaceColor',[230 230 230]./255,'LineStyle','none')
hold on
plot(time,alldata(1:50001,:,i),'color',[150 150 150]./255)
line([0 5],[0 0],'linewidth',2,'Color',[80 80 80]./255)
plot(time,meandata(1:50001,i),'b')
ylim([-15 20])
xlim([0 5])
xlabel ('Time [sec]')
ylabel('Response [mV]')
end

%% Plot Figure 2 %%
figure('position',[512 512 256 256]);
plot(mittel,'r','LineWidth',2)
hold on
line([0 8],[0 0],'linewidth',2,'Color',[80 80 80]./255)
ylim([-10 15])
xlim([1 8])
ylabel('Response [mV]')

% a=[-10 15]
% mittel(9)=mittel(1);
% angle=[0 45 90 135 180 225 270 315 360]*pi/180;
% r(1)=-10;
% phi(1)=0;
% vectorx=sum(mittel(1:8).*cos(angle(1:8)));
% vectory=sum(mittel(1:8).*sin(angle(1:8)));
% r(2)=sqrt(vectorx^2+vectory^2)
% phi(2)=atan2(vectory,vectorx)
% figure
% pp(angle,mittel,a,'LineWidth',2,'ThetaStartAngle',270,'AngleStep',45,'RingUnits','mV','NumRings',5)
% hold on
% pp(phi,r,'LineWidth',2,'LineColor','k')
