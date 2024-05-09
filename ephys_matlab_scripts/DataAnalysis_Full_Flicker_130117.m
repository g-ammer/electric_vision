%%Script does take into account first flicker!!!

function [maxon maxoff meanlightoncorr meanlightoffcorr Max_ON_Flicker_norm Max_OFF_Flicker_norm mitteltraceplot mittellighton mittellightoff...
    MeanMax_ON_Flicker MeanMax_OFF_Flicker...
    Lat_ON_Flicker Lat_OFF_Flicker Max_meanON_Flicker Max_meanOFF_Flicker]=DataAnalysis_Flicker_130117 (data)

stimint=30000; %enter interstimulus interval here

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
minborder=stimint;

%%%%%%%%define parameters of gaussian filter%%%%%%%%%%
% sigma=30;
% size=sigma*6;
% x=linspace(-size/2,size/2,size);
% gaussfilter=exp(-x.^2/(2*sigma^2));
% gaussfilter=gaussfilter/sum(gaussfilter);
% datamv=filter(gaussfilter,1,datamv);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Calculate input resistance
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%% Calculate baseline %%%%%%%%%%%%
baseline=zeros(length(borders)/2,1);

for i=1:length(borders)/2
baselineon(i)=mean(datamv(borders(1+(i-1)*2)-6000:borders(1+(i-1)*2)-1000));
end

for i=1:length(borders)/2
baselineoff(i)=mean(datamv(borders(2+(i-1)*2)-6000:borders(2+(i-1)*2)-1000));
end


for i=1:length(borders)/2
       lighton(:,i)=datamv(borders(1+(i-1)*2,1)-2500:borders(1+(i-1)*2)+minborder,1)-baselineon(1+(i-1));
end

for i=1:length(borders)/2
       lightoff(:,i)=datamv(borders(2+(i-1)*2,1)-2500:borders(2+(i-1)*2)+minborder,1)-baselineoff(1+(i-1));
end


for i=1:length(borders)/2
       traceplot(:,i)=datamv(borders(1+(i-1)*2,1)-10000:borders(1+(i-1)*2)+minborder+10000,1)-baseline(1+(i-1));
end

mittellighton=mean(lighton(:,:),2);
mittellightoff=mean(lightoff(:,:),2);


mitteltraceplot=mean(traceplot(:,1:end),2);




%%
%%% corrected for lag %%%
for i=1:length(borders)/2
       lightoncorr(:,i)=datamv(borders(1+(i-1)*2,1)-20250:borders(1+(i-1)*2)+19750,1)-baselineon(1+(i-1));
end

for i=1:length(borders)/2
       lightoffcorr(:,i)=datamv(borders(2+(i-1)*2,1)-20000:borders(2+(i-1)*2)+20000,1)-baselineoff(1+(i-1));
end

meanlightoncorr=mean(lightoncorr,2);
meanlightoffcorr=mean(lightoffcorr,2);
maxon=max(meanlightoncorr(20000:30000));
maxoff=max(meanlightoffcorr(20000:30000));


meantracecorr(1:25000)=meanlightoncorr(1:25000);
meantracecorr(25001:50000)=meanlightoffcorr(1:25000);
meantracecorr=meantracecorr';
%%

%Calculate peak maximum and latency of flicker responses
[Max_ON_Flicker Latency_ON_Flicker]=max(lighton(2500:5000,2:end));
[Max_OFF_Flicker Latency_OFF_Flicker]=max(lightoff(2500:5000,2:end));


for i = 2:10
Max_ON_Flicker(i-1)=lighton(2499+Latency_ON_Flicker(i-1),i);
Max_OFF_Flicker(i-1)=lightoff(2499+Latency_OFF_Flicker(i-1),i);
end

Max_ON_Flicker_norm=Max_ON_Flicker(:)/Max_ON_Flicker(1);
Max_OFF_Flicker_norm=Max_OFF_Flicker(:)/Max_OFF_Flicker(1);
Lat_ON_Flicker=Latency_ON_Flicker/10; %in ms
Lat_OFF_Flicker=Latency_OFF_Flicker/10; %in ms
MeanMax_ON_Flicker=mean(Max_ON_Flicker);
MeanMax_OFF_Flicker=mean(Max_OFF_Flicker);
MeanLat_ON_Flicker=mean(Lat_ON_Flicker);
MeanLat_OFF_Flicker=mean(Lat_OFF_Flicker);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculate peak maximum and latency of flicker responses AFTER AVERAGING

[Max_meanON_Flicker Latency_meanON_Flicker]=max(mittellighton(2500:4500));
[Max_meanOFF_Flicker Latency_meanOFF_Flicker]=max(mittellightoff(2500:4500));

Max_meanON_Flicker = mittellighton(2499 + Latency_meanON_Flicker);
Max_meanOFF_Flicker = mittellightoff(2499 + Latency_meanOFF_Flicker);



%%%%%%%%%%%%%% Plot Figure %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% time=(0:0.0001:length(mitteltraceplot)/10000-0.0001); %time for x-axis in sec
% figure;
% rectangle('Position',[1,-5,1,20],'FaceColor',[240 240 240]./255,'LineStyle','none')
% plot(time,mitteltraceplot,'k')
% grid on
% xlabel ('Time [sec]')
% ylabel('Response [mV]')
% ylim([-5 15])

time2=(-0.25:0.0001:length(mittellighton)/10000-0.0001-0.25);
figure;
subplot(1,2,1)
line([0 0],[-5 15],'linewidth',1,'Color',[80 80 80]./255)
hold on
rectangle('Position',[-0.25,-5,0.25,20],'FaceColor',[230 230 230]./255)
plot(time2,mittellighton,'r')
legend('ON Flicker')
xlabel ('Time [sec]')
ylabel('Response [mV]')
ylim([-5 15])
xlim([-0.25 0.5])
%grid on
hold on

subplot(1,2,2)
line([0 0],[-5 15],'linewidth',1,'Color',[80 80 80]./255)
hold on
rectangle('Position',[0,-5,0.5,20],'FaceColor',[230 230 230]./255)
plot(time2,mittellightoff,'b')
legend('OFF Flicker')
xlabel ('Time [sec]')
ylabel('Response [mV]')
ylim([-5 15])
xlim([-0.25 0.5])
%grid on