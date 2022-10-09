\documentclass{article}

\usepackage{ar}
\usepackage[bw]{agda}
\usepackage{ifsym}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{parskip}
\usepackage{mathabx}
\usepackage{unicode-math}
\usepackage{newunicodechar}

\title{le me'oi .Agda.\ proga poi ciska zoi zoi.\ Hello, world.\ .zoi.\ lo mu'oi glibau.\ standard output .glibau.}
\author{la .varik.\ .VALefor.}

\begin{document}
\maketitle

\section{le vrici}

\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Function
\end{code}

\section{la'oi .\texttt{main}.}
ni'o ganai co'e zo'oi .\texttt{main}.\ gi ciska zoi zoi.\ Hello, world.\ .zoi.\ lo mu'oi glibau.\ standard output .glibau.

\begin{code}
main : Main
main = run $ putStrLn "Hello, world."
\end{code}
\end{document}
