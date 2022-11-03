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

\newunicodechar{λ}{\ensuremath{\mathnormal\lambda}}
\newunicodechar{∷}{\ensuremath{\mathnormal\Colon}}
\newunicodechar{ℕ}{\ensuremath{\mathbb{N}}}
\newunicodechar{∧}{\ensuremath{\mathnormal{\wedge}}}
\newunicodechar{∘}{\ensuremath{\mathnormal{\circ}}}
\newunicodechar{∀}{\ensuremath{\forall}}

\newcommand\Sym\AgdaSymbol
\newcommand\D\AgdaDatatype
\newcommand\F\AgdaFunction
\newcommand\B\AgdaBound

\title{le me'oi .Agda.\ me'oi .implementation.\ be la'oi .0028.}
\author{la .varik.\ .VALefor.}

\begin{document}

\maketitle

\section{le me'oi .prelude.}

\begin{code}
{-# OPTIONS --guardedness #-}

open import Function
open import Data.Bool
open import Data.List
open import Data.String
open import System.Exit
  renaming (
    exitFailure to splode;
    exitSuccess to yay
  )
open import System.Environment
open import IO renaming (readFiniteFile to readFile)
\end{code}

\section{la'oi .\F{bool}.}
ni'o gonai ge la'oi .\B c.\ me'oi .\F{true}.\ gi ko'a goi la'o zoi.\ \F{bool} \B a \B b \B c .zoi.\ du la'oi .\B b.\ gi ko'a du la'oi .\B b.

\begin{code}
bool : ∀ {a} → {A : Set a} → A → A → (Bool → A)
bool a b = λ c → if c then b else a
\end{code}

\section{la'o zoi.\ \Sym{\_<=<\_} .zoi.}
ni'o cadga fa lo nu le mu'oi glibau.\ type signature .glibau.\ cu xamgu velcki

\begin{code}
_<=<_ : ∀ {a} → {A B C : Set a}
      → (B → IO C) → (A → IO B) → (A → IO C)
(a <=< b) c = b c >>= a
\end{code}

\section{la'oi .\F{main}.}

\begin{code}
main : Main
main = run $ getArgs >>= (bool splode yay ∘ f) <=< mapM readFile
  where
  mapM = IO.List.mapM
  f : List String → Bool
  f (a ∷ b ∷ c) = (a == b) ∧ f c
  f _ = true
\end{code}
\end{document}
