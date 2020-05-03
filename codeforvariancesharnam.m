clear all
%%Code to calculate the Measurement variance for part 0 as the set 0 is
%%meant for calibration
experimentalRun = 0;
fprintf(['Loading the data file #' num2str(experimentalRun) ' \n']);
filename = ['data/run_' num2str(experimentalRun,'%03d') '.csv'];
experimentalData = csvread(filename);
numDataPoints = size(experimentalData,1);
count = 0;
N = 0;

for i = 1:numDataPoints
if ~isnan(experimentalData(i,4)) & ~isnan(experimentalData(i,5))
    % have a valid measurement
    N=N+1;
end
end

wx = zeros(N,1)
wy = zeros(N,1);
theta = 0;
ux = 0;
uy = 0;

for i = 1:numDataPoints
if ~isnan(experimentalData(i,4)) & ~isnan(experimentalData(i,5))
    ux = experimentalData(i,4)+ux;
    uy = experimentalData(i,5)+uy;
end
end
ux = ux/N;
uy = uy/N;

for i = 1:numDataPoints
if ~isnan(experimentalData(i,4)) & ~isnan(experimentalData(i,5))
    % have a valid measurement
    count=count+1;
    wx(count) = experimentalData(i,4)-ux;
    wy(count) = experimentalData(i,5)-uy;
end
end

fprintf('Mean of wx')
mean(wx)
fprintf('Mean of wy')
mean(wy)
fprintf('Variance of wxx')
var(wx)
fprintf('Variance of wyy')
var(wy)
fprintf('Covariance matrix')
cov(wx,wy)
