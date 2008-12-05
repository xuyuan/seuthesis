\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zharticle}[2008/11/28 0.2 The LaTeX template for general chinese articles]
\typeout{Document Class `zharticle' v0.2 by Nobel Huang (2008/11/28)}

% 定义选项
\newif\ifwithdate\withdatefalse

\DeclareOption{withdate}{\withdatetrue \typeout{[zharticle]: With date.}}% 显示日期
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions

% 加载依赖包
\LoadClass[a4paper, DIV=16, 10.5pt]{scrartcl}% 双列排版
\let\todayeng\today

\RequirePackage{doc}
\RequirePackage{ifpdf}
\RequirePackage{CJKutf8}
\RequirePackage{CJKnumb}
\ifpdf
\RequirePackage{hyperref}
\else
\RequirePackage[dvipdfmx]{hyperref}
\fi
\hypersetup{%
	unicode=true,%
	colorlinks=true,%
	linkcolor=blue,%
	urlcolor=black,%
	citecolor=green,%
	bookmarksopen=true,%
	bookmarksnumbered,%
	pdfpagemode=UseOutlines,%
	pdfstartview=Fit,%
	pdfpagelayout=OneColumn}
\RequirePackage{caption} % 定义图的标题格式：居中. 使用caption3.0
\captionsetup{%
	format=plain,%
	labelformat=simple,%
	justification=centering,%
	singlelinecheck=off}
\RequirePackage[stable, flushmargin, perpage]{footmisc}
\RequirePackage{indentfirst}
\RequirePackage[numbers,sort&compress]{natbib} % 修改引用参考文献格式
\RequirePackage[rm, bf]{titlesec}
\RequirePackage{paralist}

% 正文预处理
\linespread{1.1}% 行距
\renewcommand{\rmdefault}{ptm}% 英文为time new roman
\setlength{\bibsep}{0ex}% 参考文献间距
\setlength{\textfloatsep}{1ex}% 浮动体间距
\setlength{\intextsep}{1ex}
\setlength{\floatsep}{1ex}
\titlespacing*{\section}{0pt}{0ex}{0ex}% 节标题间距
\titlespacing*{\subsection}{0pt}{0ex}{0ex}
\titlespacing*{\subsubsection}{0pt}{0ex}{0ex}
\setdefaultenum{1)}{a)}{i.}{A.}% 设置列表模式
\setdefaultleftmargin{4ex}{}{}{}{}{}

\AtBeginDocument{%
	\begin{CJK*}{UTF8}{song}\CJKtilde\CJKindent\CJKcaption{zh-Hans}%
	\fontsize{10.5pt}{\baselineskip}\selectfont%
	\InputIfFileExists{zharticle.cfg}% 加载配置文件
	{\typeout{[zharticle]: Load zharticle.cfg successfully!}}%
	{\typeout{[zharticle]: Load zharticle.cfg failed!}}%
}
\AtEndDocument{%
	\end{CJK*}
}

% 命令
\newcommand{\@authoreng}{}
\renewcommand{\author}[2]{
	\def\@author{#1}
	\renewcommand{\@authoreng}{#2}
}

\newcommand{\@address}{}
\newcommand{\@addresseng}{}
\newcommand{\address}[2]{
	\renewcommand{\@address}{#1}
	\renewcommand{\@addresseng}{#2}
}

\newcommand{\@titleeng}{}
\renewcommand{\title}[2]{
	\def\@title{#1}
	\renewcommand{\@titleeng}{#2}
}

\newcommand{\@categorynumber}{}% 中图分类号
\newcommand{\categorynumber}[1]{\renewcommand{\@categorynumber}{#1}}

\newcommand{\@refmark}{}% 文献标识码
\newcommand{\refmark}[1]{\renewcommand{\@refmark}{#1}}

\newcommand{\@articleid}{}% 文章编号
\newcommand{\articleid}[1]{\renewcommand{\@articleid}{#1}}

\renewcommand{\maketitle}{%
	\clearpage
	\let\footnote\thanks
	\ifx\@extratitle\@empty \else
		\noindent\@extratitle \next@tpage \if@twoside \null\next@tpage \fi
	\fi
	\setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
	\ifx\@titlehead\@empty \else
		\begin{minipage}[t]{\textwidth}
			\@titlehead
		\end{minipage}\par
	\fi
	\null
	\vskip 2em%
	\begin{center}%
		\ifx\@subject\@empty \else
			{\subject@font \@subject \par}
			\vskip 1em
		\fi
		{\textbf{\song\erhao \@title} \par}%
		\vskip .5em
		{\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}%
		\vskip .5em
		{\kai\xiaosihao	\@author \par}
		\vspace{-1mm}
		{\song\xiaowuhao (\@address) \par}
		\ifwithdate
		\vspace{-1mm}
		{\song\xiaowuhao \@date \par}%       % Set date in \large size.
		\else
		\fi
	\end{center}%
	\vspace{-2mm}
	
	\setcounter{footnote}{0}%
    \let\thanks\relax
    \let\maketitle\relax
    \let\@maketitle\relax
    \global\let\author\relax
    \global\let\title\relax
    \global\let\extratitle\relax
    \global\let\titlehead\relax
    \global\let\subject\relax
    \global\let\publishers\relax
    \global\let\uppertitleback\relax
    \global\let\lowertitleback\relax
    \global\let\dedication\relax
    \global\let\date\relax
    \global\let\and\relax
	
	% 设置文件属性
	\GetFileInfo{zharticle.cls}
	\hypersetup{
		pdfauthor={\@author},
		pdftitle={\@title}, %文件标题
		pdfsubject={\@title}, %文件主题
		pdfcreator={The zharticle class (v \fileversion)} % 应用程序
	}
}

\newcommand{\maketitleeng}{% 请在\maketitle后调用
	\vspace{2mm}
	\begin{center}%
		\ifx\@subject\@empty \else
			{\subject@font \@subject \par}
			\vskip 1em
		\fi
		{\textbf{\xiaoerhao \@titleeng} \par}%
		\vskip .5em
		{\ifx\@subtitle\@empty\else\usekomafont{subtitle}\@subtitle\par\fi}%
		\vskip .5em
		\vspace{-1mm}
		{\textit{\xiaosihao	\@authoreng} \par}
		\vspace{-1mm}
		{\xiaowuhao (\@addresseng)\par}
	\end{center}%
	\vspace{-2mm}%
}

\renewenvironment{abstract}[1]{% 中文摘要, 关键字作为参数
	\newcommand{\@keywords}{#1}
	\kai\wuhao\noindent
	\textbf{\song 摘要:~}\noindent
}{%
	\par\noindent
	\textbf{\song 关键词:} \@keywords
	\par\noindent
	\textbf{\song 中图分类号:} \makebox[3cm][l]{\@categorynumber}%
	\textbf{\song 文献标识码:} \makebox[1.5cm][l]{\@refmark}%
	\textbf{\song 文章编号:}   \makebox[5cm][l]{\@articleid}
	\hypersetup{pdfkeywords={\@keywords}}
}

\newenvironment{engabstract}[1]{% 英文摘要
	\newcommand{\@keywordseng}{#1}
	\wuhao\noindent
	\textbf{Abstract:}\noindent
}{%
	\par\noindent
	\textbf{Key words:} \@keywordseng
	\par
}

\newcommand{\onecoltitle}[1]{% 构成通栏的文本
	\newcommand{\@tempcontent}{#1}
	\twocolumn[%
	\@tempcontent
	\vspace{1em}
	]
}

% 其他
\let\orig@emph=\emph% 中文强调
\renewcommand{\emph}[1]{{\orig@emph{\kai#1}}}

% 参考文献
\let\originalcite=\cite
\renewcommand{\cite}[1]{\textsuperscript{\originalcite{#1}}}
\renewcommand{\citet}[1]{\originalcite{#1}}

\bibliographystyle{zharticle}