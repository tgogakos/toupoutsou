	% Rockefeller.cls
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% adapted/ripped off from yalephd.cls
%
% 12pt type is easiest to read.  Please be kind to your readers.
%
% Here's an outline of how to use this class in the file example.tex:
%
% The preamble should use the \author command to set the author's
% name, the \date command to set the month and year the degree will be
% awarded, and the \advisor command to set the name of the dissertation
% advisor.
%
% The front matter should have (in this order):
%   abstract
%   title page
%   copyright notice page
%   table of contents
%   list of figures, if any (order of lists is optional)
%       list of tables, if any
%       acknowledgments (optional)
%       glossary (optional)
%
% A dedication may also be included in the front matter, presumably
% after the copyright notice page and before the table of contents.
%
% The abstract environment and the \maketitle command of the standard
% LaTeX book class are redefined to meet Graduate School requirements.
% A \makecopyright command is provide to create the copright notice.
%
% The body is standard LaTeX stuff.
%
% The appendices (if any) and bibliography are the end matter.  The
% style of the bibliography is left to you.
%
% Summary:
%
% Just like the report document class but
%
% class options: draft adds `draft of \today' to page heading
%                      and title page
%                twopage, twocolumn, landscape and papersize
%                      options are ignored
%
% abstract environment redefined to have Rockefeller heading.
%
% \maketitle produces Rockefeller title page
%
% \mainmatter resets paging for the body.
%
% \advisor command to set the name of the dissertation advisor
%
% \makecopyright command to produce the copyright page.
%
% The standard \date command should be used to set the month and year
% the degree is to be awarded.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{rockefeller}[2000/03/15 Rockefeller doctoral dissertation
class]

% Warn user that the following options are ignored because they
% are disallowed by the Rockefeller Graduate School:
%
\DeclareOption{legalpaper}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `letterpaper'.}}
\DeclareOption{executivepaper}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `letterpaper'.}}
\DeclareOption{a4paper}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `letterpaper'.}}
\DeclareOption{a5paper}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `letterpaper'.}}
\DeclareOption{b5paper}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `letterpaper'.}}
\DeclareOption{twoside}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `oneside'.}}
\DeclareOption{twocolumn}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `onecolumn'.}}
\DeclareOption{landscape}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `portrait'.}}
\DeclareOption{notitlepage}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `titlepage'.}}
\DeclareOption{openright}{\PackageWarning{rockefeller}%
{Option `\CurrentOption' ignored.  Must use `openany'.}}

% Class option for draft mode -- Puts Date on page headings.
\newif\ifdraft\draftfalse
\DeclareOption{draft}{\drafttrue}

% What to do with other options?  Pass them on to book.cls.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\PassOptionsToClass{onecolumn}{book}
\PassOptionsToClass{oneside}{book}
\PassOptionsToClass{letterpaper}{book}
\PassOptionsToClass{openany}{book}

\ProcessOptions\relax

\LoadClass{book} \RequirePackage{setspace}

%--------------------------------------------------------------------
% Physical layout of the page.
%--------------------------------------------------------------------

\setlength{\topmargin}{-0.5in}      % header .5" from top of sheet
\setlength{\headsep}{-\topmargin}   % body is 1" from top of sheet
\addtolength{\headsep}{-\headheight}
\setlength{\textheight}{8.8in}      % 9" less a smidge to get 1"
                                        % bottom margin
\setlength{\footskip}{.5in}     % footer .5" from bottom
\setlength{\oddsidemargin}{0.5in}   % 1.5" left margin
\setlength{\evensidemargin}{0.5in}  % all pages
\setlength{\textwidth}{5.95in}      % 1" right margin, 6" textwidth

\setstretch{1.7}            % Produces double spacing

\catcode`\@=11\relax

%--------------------------------------------------------------------
% Slightly redefine pagestyle headings from standard book class.
%--------------------------------------------------------------------

%\ifdraft
%  \markboth{Draft of \today}{Draft of \today}
%\else
%  \def\ps@headings{%
%    \let\@oddfoot\@empty
%    \def\@oddhead{\MakeUppercase{\rightmark}\hfil\thepage}%
%    \let\@mkboth\markboth
%    \def\chaptermark##1{%
%      \markright {%
%        \ifnum \c@secnumdepth >\m@ne
%            \@chapapp\ \thechapter. \ %
%        \fi
%        ##1}}}
%\fi

%--------------------------------------------------------------------
% Define abstract environment, because book class doesn't have one.
%--------------------------------------------------------------------

\newenvironment{abstract}{%
  \begin{titlepage}
    %\pagestyle{empty}
    \begin{center}
      {\bf Abstract}\par\bigskip
      {\Large \bf \@title}\par\bigskip
      \@author \\
%       Rockefeller University \\
      \the\year
      \end{center}%
  }{\end{titlepage}}%


%--------------------------------------------------------------------
% \advisor{}
%--------------------------------------------------------------------

%\def\advisor#1{\gdef\@dvisor{#1}}
%\def\@dvisor{\@latex@warning@no@line{No \noexpand\advisor given}}


%--------------------------------------------------------------------
% Customize \maketitle
%--------------------------------------------------------------------

\renewcommand\maketitle{\begin{titlepage}%
  \null \vskip 3in
  \begin{center}%
    {\bf \@title \par}%
    \vfil
    \begin{doublespace}
    {
               A Thesis Presented to the Faculty of\\
      The Rockefeller Uniersity\\
                 in Partial Fullfillment of the Requirements for\\
                 the degree of Doctor of Philosophy\par\vfil\vskip 6ex%
                 by\\
              \@author\par\vskip 1.5em%
        % Advisor: \@dvisor\par
    }\vskip 1.5em%
    { \@date \par
    \ifdraft Draft of \today\par\fi
    }%
  \end{doublespace}
  \end{center}
  \end{titlepage}%
  \global\let\maketitle\relax
  \global\let\title\relax
  \global\let\author\relax
%  \global\let\advisor\relax
  \global\let\date\relax
  \global\let\and\relax
\pagestyle{plain}      % Page numbers at bottom center.
\pagenumbering{roman}  % roman numerals.
\addtocounter{page}{1} %This is page i, but not shown -- Next page is ii.
}


%--------------------------------------------------------------------
% \makecopyright
%--------------------------------------------------------------------

\newcommand{\makecopyright}{%
  \hbox{\hfil}\vspace{4in}\begin{center}
  Copyright \copyright\ \the\year\ by \@author \\
  All rights reserved.
  \end{center}
  \clearpage
}%

\catcode`\@=12\relax

% EOF
