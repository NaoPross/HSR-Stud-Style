\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hsrzf}[2020/04/04 v0.1 HSRStud Summary class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Coding Packages (Dependencies)

\RequirePackage{iftex}
\RequirePackage{kvoptions}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options

\SetupKeyvalOptions{
    family=hsrzf,
    prefix=hsrzf,
    setkeys=\setkeys
}

%% Quicker compilation and little changes
\DeclareBoolOption[false]{draft}

%% Use header and footer
\DeclareBoolOption[]{header}

%% Use a sans-serif font
\DeclareBoolOption[false]{sans}

%% Configures the geometry package
%% 
%% Possible values:
%%  - large   (40mm)
%%  - normal  (25mm)
%%  - small   (20mm)
%%  - tiny    (10mm)
%%  - minimal ( 5mm)
\DeclareStringOption[]{margin}[small]

%% Configures the polyglossia package
% \DeclareStringOption[]{lang}[german]

\ProcessKeyvalOptions{hsrzf}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Styling Packages (Dependencies)

%% HSRStud macros
%\RequirePackage{hsrstud}

%% Style deps
%\RequirePackage{fancyhdr}
%\RequirePackage{geometry}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup Style

\PassOptionsToClass{a4paper}{article}
\LoadClassWithOptions{article}

