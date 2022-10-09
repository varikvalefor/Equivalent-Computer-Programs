\documentclass{article}

\usepackage{ar}
\usepackage[bw]{agda}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{parskip}
\usepackage{unicode-math}
\usepackage{newunicodechar}

\newunicodechar{λ}{\ensuremath{\mathnormal\lambda}}
\newunicodechar{∷}{\ensuremath{\mathnormal\Colon}}
\newunicodechar{∨}{\ensuremath{\mathnormal\vee}}
\newunicodechar{ℕ}{\ensuremath{\mathbb{N}}}
\newunicodechar{∈}{\ensuremath{\mathnormal\in}}
\newunicodechar{≡}{\ensuremath{\mathnormal\equiv}}
\newunicodechar{⟩}{\ensuremath{\mathnormal\rangle}}
\newunicodechar{∶}{\ensuremath{\mathnormal\colon\!\!}}
\newunicodechar{∀}{\ensuremath{\mathnormal\forall}}
\newunicodechar{′}{\ensuremath{\mathnormal\prime}}
\newunicodechar{⊤}{\ensuremath{\mathnormal\top}}
\newunicodechar{∘}{\ensuremath{\mathnormal\circ}}
\newunicodechar{ᵇ}{\ensuremath{^\textrm{b}}}
\newunicodechar{⋆}{\ensuremath{\mathnormal\star}}

\title{le me'oi .Agda.\ proga poi ciska lo'i ro fampi'i be lo'i ro kacna'u lo mu'oi gy.\ standard output .gy.}
\author{la .varik.\ .VALefor.}

\begin{document}
\maketitle

\section{le vrici}
\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Data.Nat
open import Function
open import Data.List
open import Data.Nat.Show
open import Data.Unit.Polymorphic
\end{code}

\section{la'oi .\texttt{!}.}
ni'o la'o zoi.\ \texttt{n !} .zoi.\ fampi'i la'oi .\texttt{n}.

\begin{code}
_! : ℕ → ℕ
_! = product ∘ drop 1 ∘ upTo ∘ _+_ 1
\end{code}

\section{la'oi .\texttt{print!+}.}
ni'o ganai co'e zoi zoi.\ \texttt{print!+ n} .zoi.\ gi ciska lo'i ro fampi'i be lo'i ro kacna'u poi zmadu la'oi .\texttt{n}.\ be'o lo mu'oi glibau.\ standard output .glibau

\begin{code}
{-# TERMINATING #-}
print!+ : ∀ {a} → ℕ → IO {a} ⊤
print!+ n = putStrLn (show $ n !) >> print!+ (n + 1)
\end{code}

\section{la'oi .main.}
ni'o ganai co'e zo'oi .\texttt{main}.\ gi ciska lo'i ro fampi'i be lo'i ro kacna'u lo mu'oi glibau.\ standard output .glibau.

\begin{code}
main : Main
main = run $ print!+ 0
\end{code}
\end{document}
