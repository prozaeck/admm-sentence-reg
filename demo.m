clear all; close all; clc; 
 
[M,X,docs,y]=getData();

sparsity= @(w) ( sum((w==0)) );
% counts # of zeroes


% bias
X = [X, ones(size(X,1),1)]; % one more col to X
y(y==0)=-1; % important!
M = [M, ones(size(M,1),1)]; % one more col to M

% wout=logreg_baseline(X,y);
% predict(X,y,wout);
% fprintf('sparsity %f out of %f\n',sparsity(wout),size(wout,1));
% return 

lambda_las = 0.1; 
% wout=logreg_regularized(X,y,lambda_las);
% predict(X,y,wout);
% fprintf('sparsity %f out of %f\n',sparsity(wout),size(wout,1));
% pause

lambda_sen = 0.1; 
rho = 1; 
[w,history]=admm(docs,y,M,X,lambda_sen,lambda_las,rho); 
predict(X,y,w);
fprintf('sparsity %f out of %f\n',sparsity(w),size(w,1));
plotHistory(history)