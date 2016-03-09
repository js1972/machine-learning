function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


% !!! Follow the dimensions to get the vectorised form of equtions !!!

% hypothesis h\theta(x) = \theta' * X
% J_theta = 1 / 2m (sum ((h_theta_x - y)^2) + regularizaion term
% To do the sum of squares in vector form we transpose the first term and
% matrix multiply by itself (we can't use ^2 as that expects a square
% matrix).

% Add the regularization term to the end of the cost function (for all but
% the first value of theta). theta(2:end) gets all the theta value but the
% first.
J = 1 / (2 * m) * (X * theta - y)' * (X * theta - y) + (lambda / (2 * m) * sum(theta(2:end).^2));

% Calculate the gradiant with the regularization term added.
% The regularization term is element-wise lambda * theta * a vector of
% the same length as theta but with the first value 0 - this basically
% allows it to skip the first theta value!
grad = (1 / m) * (X * theta - y)' * X + (lambda / m) * [0; theta(2:end)]';

% =========================================================================

grad = grad(:);

end
