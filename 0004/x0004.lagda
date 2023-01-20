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

\newunicodechar{∘}{\ensuremath{\mathnormal\circ}}

\title{le me'oi .Agda.\ proga poi ke'a ciska lo fatne be lo lerpinsle pe lo mu'oi glibau.\ standard input .glibau.\ lo mu'oi glibau.\ standard output .glibau.}
\author{la .varik.\ .VALefor.}

\begin{document}
\maketitle

\section{le vrici}

\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Function
open import Data.List
open import Data.String
\end{code}

\section{la'oi .\texttt{main}.}
ni'o ganai co'e zo'oi .\texttt{main}.\ gi ciska lo fatne be lo lerpinsle poi se tcidu fi lo mu'oi glibau.\ standard input .glibau.\ ku'o lo mu'oi glibau.\ standard output .glibau.

\begin{code}
main : Main
main = run $ getLine >>= putStrLn ∘ (fromList ∘ reverse ∘ toList)
\end{code}
\end{document}
