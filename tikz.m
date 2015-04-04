function [outFile] = tikz(varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  function [outString] = tikz(varargin);
%  
%
%  Inputs: list each input argument variable name and 
%          comment with units (as appropriate):
%  1. DATA = matrix with 2 columns will be plotted 1st column vs 2nd column
%   ...
%
%  Outputs: list each output argument variable name and 
%           comment with units (as appropriate):
%  1. 
%  2.
%  ...
%
%  Function Description: (write a short description of what this function
%  does)
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = varargin{1};
g = sprintf('\\\\begin{tikzpicture}\n\\\\begin{axis}[\nxlabel=$x$,\nylabel=$y$]\n\\\\addplot[smooth,mark=*,blue] plot coordinates {\n');
outFile = [g];
data = sortrows(data);
[y,x] = size(data);

for a = 1:y
    g = sprintf('(%.2f,%.2f)\n', data(a,1), data(a,2));
    outFile = [outFile g];
end

g = sprintf('};\n\\\\addlegendentry{Case 1}\n\\\\end{axis}\n\\\\end{tikzpicture}');
outFile = [outFile g];


end



