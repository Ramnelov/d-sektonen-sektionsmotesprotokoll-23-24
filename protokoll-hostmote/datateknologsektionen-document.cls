\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{datateknologsektionen-document}[2019/01/07]
\LoadClass[11pt]{article}

\usepackage[utf8]{inputenc}
\usepackage[swedish]{babel}
\usepackage{fancyhdr}
\usepackage{graphicx}
\usepackage{xcolor}
\usepackage[headheight=42pt, left=3cm, right=3cm, top=5cm, bottom=5cm]{geometry}
\usepackage[compact]{titlesec}
\usepackage{enumitem}
\usepackage{tabu}
\usepackage{longtable}

\usepackage{parskip}
\usepackage{lastpage}
\usepackage{scrextend}

\usepackage[hidelinks]{hyperref}

% Change font
\usepackage{caladea}
\usepackage[T1]{fontenc}

% Sets left aligned text instead of justified.
\usepackage[document]{ragged2e}


% Limit table of content to a depth of 2, ex: shows §3.1 but not §3.1.1
\setcounter{tocdepth}{2}

\setlist{nosep}

% Byt titel på innehållsförteckningen
\addto\captionsswedish{
  \renewcommand*\contentsname{Innehållsförteckning}
}
\renewcommand\tableofcontents{%
    \@starttoc{toc}%
}


% Disable hyphenation
% \tolerance=1
% \emergencystretch=\maxdimen
% \hyphenpenalty=10000
% \hbadness=10000

% Set table cell padding
\tabulinesep=3pt
\setlength\tabcolsep{3pt}


\setcounter{secnumdepth}{4}

% \titleformat{\section}
% {\normalfont\large\bfseries}
% {\thesection}
% {1em}
% {}

% \titleformat{\subsection}
% {\normalfont\normalsize\bfseries\color{black!80}}
% {\thesubsection}
% {1em}
% {}

% \titleformat{\subsubsection}
% {\normalfont\normalsize\bfseries\color{black!80}}
% {\thesubsubsection}
% {1em}
% {}

% \titleformat{\paragraph}
% {\normalfont\normalsize\bfseries\color{black!60}}
% {\S\theparagraph}
% {1em}
% {}



\graphicspath{ {./img/} }
 
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\rhead{
  Linköping \@date
  \\
  \@title
  \\
  Sida \thepage\ (\pageref{LastPage})}
\lhead{\includegraphics[height=1.3cm]{logo}}

% Footer on every page
\lfoot{
  \textbf{Postadress:}
  Datateknologsektionen, Kårallen, Universitetet, 581 83 Linköping
  \\
  \textbf{Organisationsnr:}
  822002-1409
  \textbf{Bankgironr:}
  5644-8251
  \\
  \textbf{E-post:}
  \href{mailto://sekreterare@d-sektionen.se}{sekreterare@d-sektionen.se}
  \textbf{Hemsida:}
  \href{https://www.d-sektionen.se}{www.d-sektionen.se}
}


\makeatletter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configuration
\def\sectionindent{10mm}
\def\subsectionindent{12mm}
\def\subsubsectionindent{14mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Some derived quantities
% (you should manually update these)

\def\subsectiontotalindent{22mm} 
% = \sectionindent + \subsectionindent

\def\subsubsectiontotalindent{36mm}
% = \sectionindent + \subsectionindent + \subsubsectionindent

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following code is adapted from some sample code by 
% Vincent Zoonekynd, made available at the following website:
% http://zoonek.free.fr/LaTeX/LaTeX_samples_section/0.html 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefining \section and \section*

\def\section{\@ifstar\unnumberedsection\numberedsection}
\def\numberedsection{\@ifnextchar[%]
  \numberedsectionwithtwoarguments\numberedsectionwithoneargument}
\def\unnumberedsection{\@ifnextchar[%]
  \unnumberedsectionwithtwoarguments\unnumberedsectionwithoneargument}
\def\numberedsectionwithoneargument#1{\numberedsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsectionwithoneargument#1{\unnumberedsectionwithtwoarguments[#1]{#1}}
\def\numberedsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 4ex\goodbreak
  \refstepcounter{section}%
  \noindent
  \begingroup
  \leavevmode\Large\bfseries\raggedright
  \rlap{\thesection}%
  \hspace{\sectionindent}%
  #2
  \par
  \endgroup
  \vskip 0ex\nobreak
  \addcontentsline{toc}{section}{%
    \protect\numberline{\thesection}%
    #1}%
  \leftskip=\sectionindent\relax%
  }
\def\unnumberedsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 4ex\goodbreak
%  \refstepcounter{section}%
  \noindent
  \begingroup
  \leavevmode\Large\bfseries\raggedright
  %\rlap{\thesection}%
  \hspace{\sectionindent}%
  #2
  \par
  \endgroup
  \vskip 0ex\nobreak
  %\addcontentsline{toc}{section}{%
%    \protect\numberline{\thesection}%
   % #1}%
  \leftskip=\sectionindent\relax%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefining \subsection and \subsection*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\subsection{\@ifstar\unnumberedsubsection\numberedsubsection}
\def\numberedsubsection{\@ifnextchar[%]
  \numberedsubsectionwithtwoarguments\numberedsubsectionwithoneargument}
\def\unnumberedsubsection{\@ifnextchar[%]
  \unnumberedsubsectionwithtwoarguments\unnumberedsubsectionwithoneargument}
\def\numberedsubsectionwithoneargument#1{\numberedsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsectionwithoneargument#1{\unnumberedsubsectionwithtwoarguments[#1]{#1}}
\def\numberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 1ex\goodbreak
  \refstepcounter{subsection}%
  \noindent
  \begingroup
  \leavevmode\large\bfseries\color{black!80}\raggedright
  \hspace{\sectionindent}%
  \rlap{\thesubsection}%
  \hspace{\subsectionindent}%
  #2
  \par
  \endgroup
  \vskip -0.5ex\nobreak
  \addcontentsline{toc}{subsection}{%
    \protect\numberline{\thesubsection}%
    #1}%
  \leftskip=\subsectiontotalindent\relax%
  }
\def\unnumberedsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 1ex\goodbreak
  %  \refstepcounter{subsection}%
  \noindent
  \begingroup
  \leavevmode\large\bfseries\color{black!80}\raggedright
  \hspace{\sectionindent}%
  %\rlap{\thesubsection}%
  \hspace{\subsectionindent}%
  #2
  \par
  \endgroup
  \vskip -0.5ex\nobreak
  \addcontentsline{toc}{subsection}{%
%    \protect\numberline{\thesubsection}%
    #1}%
  \leftskip=\subsectiontotalindent\relax%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Redefining \subsubsection and \subsubsection*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\subsubsection{\@ifstar\unnumberedsubsubsection\numberedsubsubsection}
\def\numberedsubsubsection{\@ifnextchar[%]
  \numberedsubsubsectionwithtwoarguments\numberedsubsubsectionwithoneargument}
\def\unnumberedsubsubsection{\@ifnextchar[%]
  \unnumberedsubsubsectionwithtwoarguments\unnumberedsubsubsectionwithoneargument}
\def\numberedsubsubsectionwithoneargument#1{\numberedsubsubsectionwithtwoarguments[#1]{#1}}
\def\unnumberedsubsubsectionwithoneargument#1{\unnumberedsubsubsectionwithtwoarguments[#1]{#1}}
\def\numberedsubsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 0ex\goodbreak
  \refstepcounter{subsubsection}%
  \noindent
  \begingroup
  \leavevmode\normalsize\bfseries\color{black!80}\raggedright
  \hspace{\subsectiontotalindent}%
  \rlap{\thesubsubsection}%
  \hspace{\subsubsectionindent}%
  #2
  \par
  \endgroup
  \vskip 0ex\nobreak
  \addcontentsline{toc}{subsubsection}{%
    \protect\numberline{\thesubsubsection}%
    #1}%
  \leftskip=\subsubsectiontotalindent\relax%
  }
\def\unnumberedsubsubsectionwithtwoarguments[#1]#2{%
  \ifhmode\par\fi
  \removelastskip
  \vskip 0ex\goodbreak
%  \refstepcounter{subsubsection}%
  \noindent
  \begingroup
  \leavevmode\normalsize\bfseries\color{black!80}\raggedright
  \hspace{\subsectiontotalindent}%
  %\rlap{\thesubsubsection}%
  \hspace{\subsubsectionindent}%
  #2
  \par
  \endgroup
  \vskip 0ex\nobreak
  \addcontentsline{toc}{subsubsection}{%
%    \protect\numberline{\thesubsubsection}%
    #1}%
  \leftskip=\subsubsectiontotalindent\relax%
}


\makeatother

\parindent=0pt