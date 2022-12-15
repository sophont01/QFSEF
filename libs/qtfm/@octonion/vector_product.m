function c = vector_product(a, b, c)
% Vector (cross) product of two pure or three full/pure octonions.

% Copyright (c) 2012, 2013 Stephen J. Sangwine and Nicolas Le Bihan.
% See the file : Copyright.m for further details.

narginchk(2, 3), nargoutchk(0, 1)

if ~isa(a, 'octonion') || ~isa(b, 'octonion') || (nargin == 3 && ~isa(c, 'octonion'))
    error('Vector/cross product is not defined for an octonion and a non-octonion.')
end

if nargin == 2 && (~ispure(a) || ~ispure(b))
    error('A two-fold vector product is defined only for pure octonions.')
end

% A three-fold cross product exists in eight dimensions (see the paper by
% Massey cited below), and hence for full octonions. If any of the three
% arguments is pure, the scalar part will be treated as zero, which does
% not invalidate the three-fold cross product.

% References:
%
% F. Reese Harvey, 'Spinors and Calibrations',
% (Perspectives In mathematics: vol. 9), Academic Press, 1990.
% [See Definition 6.46, p111, and Definition 6.54, p112]
%
% W. S. Massey,
% 'Cross Products of Vectors in Higher Dimensional Euclidean Spaces',
% The American Mathematical Monthly, 90(10) (December 1983), 697-701.
%
% Peter Zvengrowski, 'A 3-Fold Vector Product in R8',
% Commentarii Mathematici Helvetici, 40 (1965-1966), 149-152.
% DOI:10.5169/seals-30632
%
% Ronald Shaw (1987): Vector cross products in n dimensions,
% International Journal of Mathematical Education in Science and Technology,
% 18:6, 803-816, DOI:10.1080/0020739870180606

if nargin == 2
    % The product of two pure octonions is given by:
    % a .* b = -scalar_product(a, b) + cross(a, b), so we can compute the
    % vector product by just taking the vector part of the full octonion
    % product.
    % 
    % TODO One day, we could implement a detailed formula here like
    % that used in the quaternion vector product, to avoid the wasted time
    % computing the unused scalar part.
    
    c = vector(a .* b); 
else
    % For the three-fold product we use Zvengrowski's formula, Theorem 2.1,
    % but change the sign to match the result given by Harvey's formula in
    % Definition 6.54:  (a .* (conj(b) .* c) - c .* (conj(b) .* a))./2.
    
    c = a .* (conj(b) .* c) - a .* scalar_product(b, c) ...
                            + b .* scalar_product(c, a) ...
                            - c .* scalar_product(a, b);
end

% TODO Check this code, and understand the results, in particular, how to
% construct a 7-dimensional orthogonal basis, with 7 mutually perpendicular
% unit pure octonions.

% TODO See: Wikipedia: Seven-dimensional cross product where the discussion
% under Generalizations suggests that there should be a six-vector product.
% This does not seem consistent with Harvey. A critical issue is how to
% construct a 7-dimensional orthonormal basis. Surely this function is the
% key, but how should it work?

% $Id: vector_product.m,v 1.5 2016/06/15 13:19:43 sangwine Exp $
