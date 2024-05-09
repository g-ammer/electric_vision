function [meanRinput var_vm pspect datamv_hist]=DataAnalysis_baselineVm_160808 (data)

%%%%%%%%import data%%%%%%%%%%%%
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
minborder=4250;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Calculate input resistance
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

Rinput=inputres*-20 %in Megaohm
meanRinput=mean(Rinput)
var_vm=var(datamv(borderscurr(10)+100001:borderscurr(10)+1100000));

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Calculate Power Spectrum
baseline=mean(datamv(borderscurr(10)+100001:borderscurr(10)+1100000));
signal=datamv(borderscurr(10)+100001:borderscurr(10)+1100000)-baseline;
%%Do DFT (Discrete Fourier Transform)
ft = fft(signal);
sf = 10000; % Sampling frequency
% We need everything up to "the middle" (due to FT symmetry properties)
n = round(length(signal) / 2 + 1);
f_spectrum = (sf / 2) * linspace(0, 1, n);

% Calculate power spectrum
ps = (ft .* conj(ft)) / length(signal);
pspect = ps(1:n);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make Figures

%% Figure 1 - Plot Power Spectrum
figure('position',[1 1 384 384]);
loglog(f_spectrum, ps(1:n));
xlabel('Frequency (Hz)');
ylabel('Energy of component (a.u.)');
xlim([0 1000])
title('Power spectrum');

%% Figure 2 - Plot Voltage Trace
time=(0:0.0001:100);
time=time(1:1000000);
figure('position',[1 1 1536 512]);
subplot(2,1,1)
plot(time,signal,'k')
ylim([-50 50])
xlabel('Time [s]');
ylabel('Voltage [mV]');

%% Figure 3 - Plot Voltage Trace Zoom
time=(0:0.0001:100);
time=time(1:1000000);
subplot(2,1,2)
plot(time(1:50001),signal(200000:250000),'k')
ylim([-30 30])
xlabel('Time [s]');
ylabel('Voltage [mV]');

%% Figure 4 - Plot Vm histogram
datamv_hist=datamv(borderscurr(10)+100001:borderscurr(10)+1100000);
range=-60:0.25:60;
figure('position',[1 1 384 384]);
hist(datamv_hist,range)
xlim([-50 20])
% ylim([0 1500])
