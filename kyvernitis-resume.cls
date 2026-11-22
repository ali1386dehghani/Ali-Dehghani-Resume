% Class Identifier and Version
% Based on kyvernitis-resume [2023/06/06] from github.com/ar-pa/Arpa-Resume
% Extended with photo support and a fixed (3-argument) resume header.
\ProvidesClass{kyvernitis-resume}[2023/06/06 Kyvernitis class]
\NeedsTeXFormat{LaTeX2e}

% Set font size and paper type
\LoadClass[11pt,letterpaper]{article}

% Enable custom and named colors
\RequirePackage[usenames,dvipsnames]{color}

% Remove paragraph indentation
\RequirePackage[parfill]{parskip}

% Set margin width
\RequirePackage[hmargin=1.25cm,vmargin=0.75cm]{geometry}

% Use cool fonts
\RequirePackage{fontspec}

% Using IBM Plex Sans
\RequirePackage[sfdefault,light]{plex-sans}

% Use hyperref
\RequirePackage[xetex]{hyperref}

% Use extended columns definitions
\RequirePackage{array}

% Make custom tables
\RequirePackage{tabularx}

% Use FontAwesome icons
\RequirePackage{fontawesome5}

% Adjust page width in the middle of the page
\RequirePackage{changepage}

% Adjust bullet size
\RequirePackage{scalerel}

% Images (added for the photo box)
\RequirePackage{graphicx}

% Remove page numbers
\pagestyle{empty}

% Define navy-blue color for later use. Color code is taken from Canva
\definecolor{navyblue}{RGB}{0, 83, 137}
\definecolor{links}{RGB}{3, 43, 198}

% Define new resizable bullet with default 0.7 size for later use
% Taken from https://tex.stackexchange.com/questions/534192/medium-sized-circle-as-a-bullet
\newcommand{\vbullet}[1][.7]{\mathbin{\ThisStyle{\vcenter{\hbox{%
  \scalebox{#1}{$\SavedStyle\bullet$}}}}}%
}

% Setup Hyperlink style
\hypersetup{
    colorlinks=true,
    urlcolor=links
}

% Define some social accounts and contact information formats
\newcommand{\linkedin}[1]{
    \href{https://linkedin.com/in/#1}{\textcolor{black}
    {\faLinkedinIn}\hspace{0.5em}#1}
}
\newcommand{\email}[1]{
    \href{mailto:#1}{\textcolor{black}
    {\faEnvelope[regular]}\hspace{0.5em}#1}
}
\newcommand{\github}[1]{
    \href{https://github.com/#1}{\textcolor{black}
    {\faGithub}\hspace{0.5em}#1}
}
\newcommand{\twitter}[1]{
    \href{https://twitter.com/#1}{\textcolor{black}
    {\faTwitter}\hspace{0.5em}#1}
}
\newcommand{\facebook}[1]{
    \href{https://www.facebook.com/#1}{\textcolor{black}
    {\faFacebookF}\hspace{0.5em}#1}
}
\newcommand{\website}[1]{
    \href{https://#1}{\textcolor{black}
    {\faGlobeAmericas}\hspace{0.5em}#1}
}
\newcommand{\phone}[1]{
    \textcolor{black}{\faPhone*}\hspace{0.5em}#1
}
\newcommand{\nationality}[1]{
    \textcolor{black}{\faFlagUsa}\hspace{0.5em}#1
}
\newcommand{\address}[1]{
    \textcolor{black}{\faMapMarker*}\hspace{0.5em}#1
}

% Define commands for fullname and job title
\def \fullname#1{\def\@name{#1}}
\def \@name {}
\def \jobtitle#1{\def\@title{#1}}
\def \@title {}

% Photo support (added).
% In resume.tex call:  \photofile{photo.jpg}
% If the file exists next to the .tex files it is shown in the header,
% otherwise a navy placeholder box is drawn instead.
\def \photofile#1{\def\@photo{#1}}
\def \@photo {photo.jpg}
\newcommand{\photobox}{%
  \IfFileExists{\@photo}{%
    {\setlength{\fboxrule}{0.9pt}%
     \fcolorbox{navyblue}{white}{\includegraphics[width=2.7cm]{\@photo}}}%
  }{%
    {\setlength{\fboxrule}{0.9pt}%
     \fcolorbox{navyblue}{white}{%
       \parbox[c][3.4cm][c]{2.8cm}{\centering
         \begin{tabular}{c}
         {\color{navyblue}\small\textbf{PHOTO}}\\[4pt]
         {\color[rgb]{0.45,0.45,0.45}\tiny Put your photo as}\\
         {\color[rgb]{0.45,0.45,0.45}\tiny \texttt{photo.jpg} next to}\\
         {\color[rgb]{0.45,0.45,0.45}\tiny the \texttt{.tex} files}
         \end{tabular}}}%
    }%
  }%
}

% Convenience commands
\newcommand{\italicitem}[1]{\item{\textit{#1}}}
\newcommand{\bolditem}[1]{\item{\textbf{#1}}}
\newcommand{\entry}[2]{#1 & #2 \tabularnewline}

% Internal: the big navy name block on the left of the header.
% The m-column caps the block width so a long job title and a long
% contact email together still fit inside the page width.
\newcommand{\@resumenameblock}{%
    \begin{tabular}[c]{@{}m{0.47\textwidth}@{}}
        {\fontsize{32}{38}\selectfont{\color{navyblue}{\textbf{\@name}}}}
        \ifx\empty\@title\empty\else
            \\ \textit{\small\@title}
        \fi
   \end{tabular}%
}

% Define the resume header:  \resumeheader{contact1}{contact2}{contact3}
% Each contact argument is one line of the right-hand column,
% e.g. \linkedin{...}, \email{...}, \github{...}, \phone{...}, \website{...}
% Built as a plain hbox (no tabularx) to avoid spurious paragraph warnings.
\newcommand{\resumeheader}[3]{%
    \hbox to \textwidth{%
        \@resumenameblock\hfill
        \begin{tabular}[c]{l}
            \small#1 \tabularnewline
            \small#2 \tabularnewline
            \small#3
        \end{tabular}%
    }%
}

% Header with photo on the far right: \resumeheaderphoto{contact1}{contact2}{contact3}
\newcommand{\resumeheaderphoto}[3]{%
    \hbox to \textwidth{%
        \@resumenameblock\hfill
        \begin{tabular}[c]{l}
            \small#1 \tabularnewline
            \small#2 \tabularnewline
            \small#3
        \end{tabular}%
        \hspace{1em}%
        \photobox
    }%
}

% Renew section command for resume section
\renewenvironment{section}[1]{
    \phantomsection
    \addcontentsline{toc}{section}{#1}
    \medskip
    {\color{navyblue}{\textbf{\textit{#1}}}}
    \medskip
    {\color{navyblue}\hrule}
    \begin{list}{}{
        \setlength{\leftmargin}{1.5em}
    }
    \item[]
}{
    \end{list}
}


% Renew subsection command for resume subsections
% All arguments are compulsory
% #1: Name, #2: Description, #3: Time Period, #4: Location
\renewenvironment{subsection}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill \textit{#3} \newline
    \textit{#2} \hfill \textit{#4}
    \smallskip
    \begin{list}{$\vbullet$}{
        \leftmargin=2em
    }
    \itemsep -0.5em \vspace{-0.5em}
}{
    \end{list}
    \vspace{0.5em}
}


% Define command for resume subsections with no bullets
% All arguments are compulsory
% #1: Name, #2: Description, #3: Time Period, #4: Location
\newenvironment{subsectionnobullet}[4]{
    \phantomsection
    \addcontentsline{toc}{subsection}{#1}
    \textbf{#1} \hfill \textit{#3} \newline
    \textit{#2} \hfill \textit{#4}
    \smallskip
    \begin{list}{}{
        \leftmargin=0em \itemindent=0em \labelwidth=0em \labelsep=0em
    }
    \itemsep -0.7em \vspace{-0.7em}
}{
    \end{list}
}




% Define new sectiontable command, which makes a section with a table
% All arguments are compulsory
% #1: Name of the section, #2: Body of the section
\newcommand{\sectiontable}[2]{
    \begin{section}{#1}
        \begin{adjustwidth}{0.0in}{0.1in}
            \begin{tabularx}{\linewidth}{@{} >{\bfseries}l @{\hspace{5ex}} X @{}}
                #2
            \end{tabularx}
        \end{adjustwidth}
    \end{section}
}


% Define new subsectiontable command, which makes a subsection with a table
% All arguments are compulsory
% #1: Name of the subsection, #2: Body of the subsection
\newcommand{\subsectiontable}[2]{
    \begin{subsectionnobullet}{#1}{}{}{}
        \begin{adjustwidth}{0.0in}{0.1in}
            \begin{tabularx}{\linewidth}{@{} >{\bfseries}l @{\hspace{5ex}} X @{}}
                #2
            \end{tabularx}
        \end{adjustwidth}
    \end{subsectionnobullet}
}
