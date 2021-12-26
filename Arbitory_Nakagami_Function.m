close all;
clear all;
clc;

%% Nagagami random number generation
pd=makedist('Nakagami','mu',1,'omega',1);
h=random(pd,[4,4]);
h_vector= transpose(h);
covariance= cov(h_vector);
R=corrcov(covariance);
%% square of nakagami which follows gamma distribution See Reference [Generating 
% correlated nakagami fading signals with arbitory correlation and fading parameters]
pd1=makedist('Gamma','a',1,'b',1);
h1=random(pd1,[3,1000]);
h_vector1=transpose(h1);
covariance1=cov(h_vector1);
R1=corrcov(covariance1);
%% Cholesky decomposition of covariance metrics
arbitoryL= chol(covariance1,'lower');
C2= arbitoryL*arbitoryL';
R2=corrcov(C2);
h2=arbitoryL*h1
histogram(h2,100)