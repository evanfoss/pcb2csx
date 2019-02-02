function TstMatrixExport(inputmat)
% This function printf's the matrix content out in the same format 
% matlab accepts as input. It is for debugging, hence Tst as prefix.
% This is for 2D matrixes only, I may do a recursive version later 
% for n-dimensional matrixes.
%
% inputmat should be the name of the function being displayed.
% 
% Copyright (C) 2018 Evan Foss
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>
%

for counter=1:size(inputmat,2)

   disp(counter);

end


