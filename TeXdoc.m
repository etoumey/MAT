function [] = TeXdoc(varargin)


if nargin == 1
    file = varargin{1};
    author = 'No Name';
    maketitle = 'Untitled';
    storePath = '\Users\Eliot\Documents\School\LaTeX';
elseif nargin == 2
    author = varargin{2};
    file = varargin{1};
    maketitle = 'Untitled';
    storePath = '\Users\Eliot\Documents\School\LaTeX';
elseif nargin == 3
    author = varargin{2};
    file = varargin{1};
    maketitle = varargin{3};
    storePath = '\Users\Eliot\Documents\School\LaTeX';
elseif nargin == 4;
    body = varargin{4};
    author = varargin{2};
    file = varargin{1};
    maketitle = varargin{3};
    storePath = '\Users\Eliot\Documents\School\LaTeX';
elseif nargin == 5
    body = varargin{4};
    author = varargin{2};
    file = varargin{1};
    maketitle = varargin{3};
    storePath = varargin{5};
else
    maketitle = 'Untitled';
    author = 'No Name';
    file = 'default';
    storePath = '\Users\Eliot\Documents\School\LaTeX';
end

file_name  = strcat(file,'.tex');
TeXcode = fopen(file_name,'w');
%% PREAMBLE TO DOC
fprintf(TeXcode,'\\documentclass[letterpaper]{article}\n');
fprintf(TeXcode,'\\usepackage{amsmath}\n\\usepackage[margin=1in]{geometry}\n\n');
fprintf(TeXcode,'\\title{%s}\n\\author{%s}\n\\date{\\today}\n\\begin{document}\n\\maketitle{}\n', maketitle, author);


%% BODY OF DOC
fprintf(TeXcode, body);



%% CLOSE

fprintf(TeXcode, '\n\\end{document}');
fclose(TeXcode);
fclose('all');

movefile(file_name, storePath);

end

