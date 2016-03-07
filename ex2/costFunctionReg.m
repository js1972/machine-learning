function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h = sigmoid(X * theta);

% Add the regularization term to the end of the cost function (for all but
% the first value of theta). theta(2:end) gets all the theta value but the
% first.
J = - 1 / m * ((log(h))' * y + (log(1 - h))' * (1 - y)) + (lambda / (2 * m) * sum(theta(2:end).^2));

% Calculate the gradiant with the regularization term added.
% The regularization term is element-wise lambda * theta * a vector of
% the same length as theta but with the first value 0 - this basically
% allows it to skip the first theta value!
grad = ((1 / m) * (X' * (h - y))) + lambda .* theta .* [0; ones(length(theta)-1, 1)] ./ m;

% =============================================================

end