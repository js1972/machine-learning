function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% You need to return the following variables correctly.
sim = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the similarity between x1
%               and x2 computed using a Gaussian kernel with bandwidth
%               sigma
%
%

%origFormat = get(0, 'format');
%format('long');

% When I use the norm function here - for some reason Matlab rounds the
% result to 4 decimal places. Whereas is the alternative method using a sum
% (below) is used it results in a value with 6 decimal place!!?? Why?

%sim = exp( -(norm(x1 - x2))^2 / (2 * sigma^2) );

%set(0,'format', origFormat);

% Alternative method using sum - see the exercise PDF where the norm can be
% described as a sum.

sim = exp(-(sum((x1 - x2) .^2)) / (2 * sigma^2));


% =============================================================
    
end
