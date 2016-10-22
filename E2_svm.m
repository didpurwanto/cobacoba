clc
clear
close all

% hog
% walking
movie1 = randn(100,96);
movie2 = randn(80,96);

% jumping
movie3 = randn(200,96);
movie4 = randn(150,96);

% running
movie5 = randn(30,96);
movie6 = randn(60,96);

% concanate each classes
walking = [movie1; movie2];
jumping = [movie3; movie4];
running = [movie5; movie6];

% creating label
[x1, y1] = size(walking);
[x2, y2] = size(jumping);
[x3, y3] = size(running);

for i = 1:x1
    label_data(i) = 1;
end

for j = i+1:x2+x1
    label_data(j) = 2;
end

for k = j+1:x3+x2+x1
    label_data(k) = 3;
end
label_data = label_data';

% concanate data
data = [walking; jumping; running];


% LIBSVM
% parameter
libsvm_options = '-s 0 -t 0';
% -s svm_type : set type of SVM (default 0)
% 	0 -- C-SVC		(multi-class classification)
% 	1 -- nu-SVC		(multi-class classification)
% 	2 -- one-class SVM	
% 	3 -- epsilon-SVR	(regression)
% 	4 -- nu-SVR		(regression)
% -t kernel_type : set type of kernel function (default 2)
% 	0 -- linear: u'*v
% 	1 -- polynomial: (gamma*u'*v + coef0)^degree
% 	2 -- radial basis function: exp(-gamma*|u-v|^2)
% 	3 -- sigmoid: tanh(gamma*u'*v + coef0)
% 	4 -- precomputed kernel (kernel values in training_set_file)
% -d degree : set degree in kernel function (default 3)
% -g gamma : set gamma in kernel function (default 1/num_features)
% -r coef0 : set coef0 in kernel function (default 0)
% -c cost : set the parameter C of C-SVC, epsilon-SVR, and nu-SVR (default 1)
% -n nu : set the parameter nu of nu-SVC, one-class SVM, and nu-SVR (default 0.5)
% -p epsilon : set the epsilon in loss function of epsilon-SVR (default 0.1)
% -m cachesize : set cache memory size in MB (default 100)
% -e epsilon : set tolerance of termination criterion (default 0.001)
% -h shrinking : whether to use the shrinking heuristics, 0 or 1 (default 1)
% -b probability_estimates : whether to train a SVC or SVR model for probability estimates, 0 or 1 (default 0)
% -wi weight : set the parameter C of class i to weight*C, for C-SVC (default 1)
% -v n: n-fold cross validation mode
% -q : quiet mode (no outputs)

%training to get model
model = svmtrain(label_data, data, libsvm_options);

% testing to get accuracy
[predicted_label, accuracy, decision_values_prob_estimates] = svmpredict(label_data, data_testing, model);
