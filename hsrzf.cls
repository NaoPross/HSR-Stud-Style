\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hsrzf}[2020/04/04 v0.1 HSRStud Summary class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coding Packages (Dependencies)

\RequirePackage{iftex}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options

\SetupKeyvalOptions{
    family=hsrzf,
    prefix=hsrzf@
}

%% Quicker compilation and little changes
% \DeclareBoolOption[false]{draft}

%% Use header and footer
\DeclareBoolOption[false]{header}
\DeclareComplementaryOption{noheader}{header}

%% Use a sans-serif font
\DeclareBoolOption[false]{sans}
\DeclareBoolOption[false]{concrete}

%% Configures the geometry package
%% 
%% Possible values:
%%  - huge    (50mm, 40mm)
%%  - large   (40mm, 30mm)
%%  - big     (30mm, 30mm)
%%  - normal  (25mm, 30mm)
%%  - small   (20mm, 30mm)
%%  - tiny    (10mm, 20mm)
%%  - minimal ( 5mm, 20mm)
\DeclareStringOption{margin}[huge]

%% Configures the polyglossia package
% \DeclareStringOption[]{lang}[german]

\ProcessKeyvalOptions{hsrzf}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup Class
\PassOptionsToClass{a4paper}{article}
\LoadClassWithOptions{article}

%% Style deps
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titling}



\PassOptionsToPackage{plainpages=false, pdfpagelabels, pdfusetitle}{hyperref}
\RequirePackage{hyperref}

%% Create new fields
\newcommand{\hsr@semester}{FS00}
\newcommand{\hsr@subject}{Magic}
\newcommand{\hsr@authoremail}{noname@hsr.ch}

% \newcommand[1]{\subject}{\renewcommand{\hsr@subject}{#1}}
% \newcommand[1]{\semester}{\renewcommand{\hsr@semester}{#1}} %% TODO: add season option
% \newcommand[1]{\email}{\expandafter\renewcommand\hsr@authoremail{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup Style Packages

%% Configure Sans-Serif font
\ifhsrzf@sans
\renewcommand{\familydefault}{\sfdefault}
\fi

%% Configure concrete font
\ifhsrzf@concrete
\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}
\PassOptionsToPackage{boldsans,amssymb}{concmath}
\RequirePackage{concmath}
\fi

%% configure geometry
%% defaults to big
\newlength{\hsr@hmarginswidth}
\newlength{\hsr@vmarginsheight}

\ifx\hsrzf@margin\@empty
    \setlength\hsr@hmarginswidth{30mm}
\else
    \expandafter\ifstrequal\expandafter{\hsrzf@margin}{huge}{
        \setlength\hsr@hmarginswidth{50mm}
        \setlength\hsr@vmarginsheight{40mm}}{}
    \expandafter\ifstrequal\expandafter{\hsrzf@margin}{large}{
        \setlength\hsr@hmarginswidth{40mm}
        \setlength\hsr@vmarginsheight{30mm}}{}
    \expandafter\ifstrequal\expandafter{\hsrzf@margin}{big}{
        \setlength\hsr@hmarginswidth{30mm}
        \setlength\hsr@vmarginsheight{30mm}}{}
    \expandafter\ifstrequal\expandafter{\hsrzf@margin}{normal}{
        \setlength\hsr@hmarginswidth{25mm}
        \setlength\hsr@vmarginsheight{30mm}}{}
    \expandafter\ifstrequal\expandafter{\hsrzf@margin}{small}{
        \setlength\hsr@hmarginswidth{20mm}
        \setlength\hsr@vmarginsheight{30mm}}{}
    \expandafter\ifstrequal\expandafter{\hsrzf@margin}{tiny}{
        \setlength\hsr@hmarginswidth{10mm}
        \setlength\hsr@vmarginsheight{20mm}}{}
    \expandafter\ifstrequal\expandafter{\hsrzf@margin}{minimal}{
        \setlength\hsr@hmarginswidth{ 5mm}
        \setlength\hsr@vmarginsheight{20mm}}{}
\fi

\newgeometry{
    left=\hsr@hmarginswidth, right=\hsr@hmarginswidth,
    top=\hsr@vmarginsheight, bottom=\hsr@vmarginsheight
}


%% Configure headers
\fancypagestyle{hsrzf}{%
    \fancyhf{} % clear
    \fancyhead[C]{\thetitle}
    \fancyhead[R]{\rightmark}
    \fancyhead[L]{\leftmark}
    \fancyfoot[R]{\thedate}
    \fancyfoot[L]{\theauthor}
    \renewcommand{\headrulewidth}{.5pt}
    \renewcommand{\footrulewidth}{.5pt}
}

\fancypagestyle{hsrzf-norulers}{%
    \fancyhf{} % clear
    \fancyhead[C]{\thetitle}
    \fancyhead[R]{\rightmark}
    \fancyhead[L]{\leftmark}
    \fancyfoot[R]{\thedate}
    \fancyfoot[L]{\theauthor}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\ifhsrzf@header
\pagestyle{hsrzf}
\fi
