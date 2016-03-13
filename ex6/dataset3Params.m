function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

Cvals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmavals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

% matrix for the results, the rows are cvals and the columns are sigmavals
results = zeros(size(Cvals, 2), size(sigmavals, 2));

for ci = 1:size(Cvals, 2)
	for si = 1:size(sigmavals, 2)
		C = Cvals(ci);
		sigma = sigmavals(si);

		% train the model using Xtrain
		model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));

		% get the predictions for the cross validation set
		predictions = svmPredict(model, Xval);

		% store the predictions in the results matrix
		results(ci, si) = mean(double(predictions ~= yval));
	end
end

results

% Print out the row/column of the minimum value in results!
% This works by first finding the minimum value in results and then forming
% a logical array with ==. Finally, get the row/col of the first of these
% 'hits'.
[r, c] = find(results == min(min(results)))

% The best parameters values found from running the model on all the C and
% sigma values are determined by the lowest error value in matrix 'results'
% which is row 5 and column 3.
%C = 1
%sigma = 0.1
C = Cvals(r)
sigma = sigmavals(c)

% =========================================================================

end
