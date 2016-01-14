%icsthesis.cls
%A document class for ics masters thesis (and phd thesis??)
%Author: JCEPlaras

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icsthesis}[8/18/2015 ICS Thesis Class Author: James Carlo Plaras]
\LoadClass[12pt,letterpaper,titlepage]{report}
\RequirePackage[none]{hyphenat}
\RequirePackage{multicol}
\RequirePackage{mathptmx}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{tocloft}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage[natbibapa]{apacite}
%Font Style


%Margin Settings

\geometry{
	letterpaper,
	left=1.5in,
	right=1in,
	top=1in,
	bottom=1in,
	headsep=1ex,
}

%Usable Functions
\newlength{\@headingTextWidth}
\newcommand{\invertpy}[1]%
{%
    \leavevmode\vbox{%
        \hsize=4.5in
        \parindent=0pt
        \parfillskip=0pt
        \emergencystretch=2em
        %
        \pretolerance=500
        \tolerance=1000
        \hyphenpenalty=100
        \linepenalty=0
        %
        \settowidth{\@headingTextWidth}{#1}%
        \ifdim\@headingTextWidth<4.5in%
            % True case - the heading will be only one line.
            % Add fils to the [left/right]skips to avoid distracting underful hbox complaints.
            \leftskip=0pt plus 0.5fil
            \rightskip=0pt plus 0.5fil
        \else%
            % False case - multiline heading.
            % Match the rubber in the [left/right]skips to the pyramid steps to ensure that each
            % successive line is shorter than the previous.
            \leftskip=0pt plus 0.25in
            \rightskip=0pt plus 0.25in
        \fi%
        %
        #1%
        %
        \parshape=6 % account for a maximum of six lines - thereafter all will have the final width
            0.00in 4.5in
            0.25in 4.0in
            0.50in 3.5in
            0.75in 3.0in
            1.00in 2.5in
            1.25in 2.0in

    }% \vbox
    \par
}% \centeredHeadingPar

\newcommand{\addsignature}[2]{
	\begin{center}
	\vspace*{5ex}
	#1\\
	#2
	\vspace*{4ex}
	\par\noindent\makebox[2.5in]{\hrulefill}\\
	Date Signed
	\end{center}
}

\newcommand{\addauthorsignaturefield}{
	\begin{flushright}
	\vspace{4ex}
	\AUTHOR
	\end{flushright}
}
%Figure and Table Settings

\setlength{\abovecaptionskip}{2ex}
\setlength{\belowcaptionskip}{2ex}


\usepackage[labelsep=period]{caption}

%Table of contents settings

\addtocontents{toc}{~\hfill\textbf{\underline{PAGE}}\par}
\renewcommand{\contentsname}{\hspace*{\fill}\bfseries\normalsize TABLE OF CONTENTS\hspace*{\fill}}
%\renewcommand{\cftaftertoctitle}{%
%\\[\baselineskip]\mbox{}\hfill{\normalfont PAGE}}
\setlength{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cftdot}{}
\setcounter{tocdepth}{3}
\renewcommand{\cftsecpresnum}{\begin{lrbox}{\@tempboxa}}
\renewcommand{\cftsecaftersnum}{\end{lrbox}}
\setlength{\cftbeforesecskip}{3ex}
\setlength{\cftsecindent}{0pt}
\setlength{\cftsecnumwidth}{0pt}
\renewcommand{\cftsecfont}{\bfseries}
\renewcommand{\cftsecpagefont}{\bfseries}
\renewcommand{\cftsubsecpresnum}{\begin{lrbox}{\@tempboxa}}
\renewcommand{\cftsubsecaftersnum}{\end{lrbox}}
\setlength{\cftsubsecindent}{5ex}
\setlength{\cftsubsecnumwidth}{0pt}
\renewcommand{\cftsubsubsecpresnum}{\begin{lrbox}{\@tempboxa}}
\renewcommand{\cftsubsubsecaftersnum}{\end{lrbox}}
\setlength{\cftsubsubsecindent}{10ex}
\setlength{\cftsubsubsecnumwidth}{0pt}

%Section header setting

\titleformat{\section}
  {\filcenter\bfseries} % format
  {}                % label
  {0pt}             % sep
  {\thispagestyle{empty}}           % before-code
\titlespacing{\section}{0pt}{4ex}{4ex}
\newcommand{\sectionbreak}{\clearpage}

%Subsection header setting
\titleformat{\subsection}
  {\singlespacing\filcenter\bfseries} % format
  {}                % label
  {0pt}             % sep
  {}           % before-code
\titlespacing{\subsection}{0pt}{3ex}{3ex}

%Subsubsection header setting
\titlespacing{\subsubsection}{0pt}{3ex}{3ex}

%NEW ENVIRONMENTS


%page counter hack
\newcounter{pagecounter}
\setcounter{pagecounter}{1}

%Title Settings
\newcommand{\TITLE}{AN ATTEMPT TO SOLVE THE P=NP PROBLEM USING MATCHES STONES AND STICKS TO REPRESENT TURING MACHINES}
\newcommand{\AUTHOR}{JEJOMAR B. ARROYO}
\newcommand{\DEGREE}{MASTER OF SCIENCE}
\newcommand{\MAJOR}{Computer Science}
\newcommand{\MONTH}{JANUARY}
\newcommand{\YEAR}{2060}
\renewcommand{\maketitle}{
	\singlespacing
	\begin{titlepage}
	\addcontentsline{toc}{section}{TITLE PAGE}
	\begin{center}
	\vspace*{8ex}
	\invertpy{\TITLE}
	\vspace*{2in}
	\AUTHOR
	\\[2in]
	SUBMITTED TO THE FACULTY OF THE GRADUATE SCHOOL\\
	UNIVERSITY OF THE PHILIPPINES LOS BA\~{N}OS\\
	IN PARTIAL FULFILLMENT OF THE\\
	REQUIREMENTS FOR THE\\
	DEGREE OF\\
	\vspace*{.65in}
	\DEGREE\\
	(\MAJOR)\\
	\vspace*{.65in}
	\MONTH\ \YEAR
	\end{center}
	\end{titlepage}
	\doublespacing
}

%approval page environment
\newenvironment{approvalpage}{
	\patchcmd{\abstract}{\null\vfil}{}{}{}
	\addcontentsline{toc}{chapter}{APPROVAL PAGE}
	\renewcommand{\abstractname}{\vspace{-\baselineskip}}
	\begin{abstract}
	\vspace*{-0.5in}
	\thispagestyle{plain}\addtocounter{pagecounter}{1}
	\setcounter{page}{\value{pagecounter}}
	\singlespacing

}
{
	\end{abstract}
	\doublespacing
	\renewcommand{\abstractname}{Abstract}
}

%table of contents creator
\newcommand{\maketableofcontents}{
	\addtocounter{pagecounter}{1}
	\setcounter{page}{\value{pagecounter}}
	\addcontentsline{toc}{chapter}{TABLE OF CONTENTS}

	\singlespacing
	\tableofcontents
	\doublespacing
	\clearpage
}

%biosketch creator
\newenvironment{biosketch}
{
	\patchcmd{\abstract}{\null\vfil}{}{}{}
	\addcontentsline{toc}{chapter}{BIOGRAPHICAL SKETCH}
	\renewcommand{\abstractname}{BIOGRAPHICAL SKETCH}
	\begin{abstract}
	\thispagestyle{plain}\addtocounter{pagecounter}{1}
	\setcounter{page}{\value{pagecounter}}
	\setlength{\parindent}{5ex}
	\hspace*{\parindent}
}
{
	\end{abstract}
	\renewcommand{\abstractname}{Abstract}
}

%acknowledgement creator
\newenvironment{acknowledgement}
{
	\patchcmd{\abstract}{\null\vfil}{}{}{}
	\addcontentsline{toc}{chapter}{ACKNOWLEDGEMENT}
	\renewcommand{\abstractname}{ACKNOWLEDGEMENT}
	\begin{abstract}
	\thispagestyle{plain}\addtocounter{pagecounter}{1}
	\setcounter{page}{\value{pagecounter}}
	\setlength{\parindent}{5ex}
	\hspace*{\parindent}
}
{
	\end{abstract}
	\renewcommand{\abstractname}{Abstract}
}

%abstract with page number
\newenvironment{abstractwithpageno}
{
	\patchcmd{\abstract}{\null\vfil}{}{}{}
	\addcontentsline{toc}{chapter}{ABSTRACT}
	\renewcommand{\abstractname}{ABSTRACT}
	\begin{abstract}
		
	\thispagestyle{plain}\addtocounter{pagecounter}{1}
	\setcounter{page}{\value{pagecounter}}
	\setlength{\parindent}{5ex}
	\hspace*{\parindent}
}
{
	\end{abstract}
	\renewcommand{\abstractname}{Abstract}
}

%list of tables
\newcommand{\makelistoftables}{
	\addtocontents{lot}{\textbf{\underline{TABLE}}~\hfill\textbf{\underline{PAGE}}\par}
	\renewcommand{\listtablename}{\hspace*{\fill}\bfseries\normalsize LIST OF TABLES\hspace*{\fill}}
	%\renewcommand{\cftaftertoctitle}{%
	%\\[\baselineskip]\mbox{}\hfill{\normalfont PAGE}}
	\setlength{\cftbeforelottitleskip}{0pt}
	\renewcommand{\cftdot}{}
	\addcontentsline{toc}{chapter}{LIST OF TABLES}
	\thispagestyle{plain}\addtocounter{pagecounter}{1}
	\setcounter{page}{\value{pagecounter}}
	\listoftables
	\clearpage
}

%list of figures
\newcommand{\makelistoffigures}{
	\addtocontents{lof}{\textbf{\underline{FIGURE}}~\hfill\textbf{\underline{PAGE}}\par}
	\renewcommand{\listfigurename}{\hspace*{\fill}\bfseries\normalsize LIST OF FIGURES\hspace*{\fill}}
	%\renewcommand{\cftaftertoctitle}{%
	%\\[\baselineskip]\mbox{}\hfill{\normalfont PAGE}}
	\setlength{\cftbeforeloftitleskip}{0pt}
	\renewcommand{\cftdot}{}
	\addcontentsline{toc}{chapter}{LIST OF FIGURES}
	\thispagestyle{plain}\addtocounter{pagecounter}{1}
	\setcounter{page}{\value{pagecounter}}
	\listoffigures
	\clearpage
}

%front matter environment
\newenvironment{frontmatter}{
	\doublespacing
	\renewcommand{\thepage}{\roman{page}}\pagestyle{plain}}
{}

%main matter environment
\newenvironment{mainmatter}
{
	\setcounter{page}{1}
	\renewcommand{\thepage}{\arabic{page}}\pagestyle{plain}
	\pagestyle{myheadings}
	\doublespacing
	\setlength{\parindent}{5ex}
}
{}

%document settings
\AtBeginDocument{}
\AtEndDocument{\thispagestyle{myheadings}}

%makebibliography command

\newcommand{\makereferences}[1]{
	\clearpage
	\singlespacing

	\renewcommand{\APACrefauthstyle}{\scshape}
	\renewcommand{\refname}{LITERATURE CITED}
	\makeatletter
	\renewcommand\bibsection{%
	\section{\refname}\@mkboth{\MakeUppercase{\refname}}{\MakeUppercase{\refname}}}
	\makeatother

	\bibliographystyle{apacite}
	\setlength{\bibsep}{3ex}
	\bibliography{#1}
}
%\AtBeginBibliography{\renewcommand*{\mkbibnamelast}[1]{\MakeUppercase{#1}}}
