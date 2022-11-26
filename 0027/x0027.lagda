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
\newunicodechar{≡}{\ensuremath{\equiv}}
\newunicodechar{ᵇ}{\ensuremath{^\mathrm{b}}}

\newcommand\Sym\AgdaSymbol
\newcommand\D\AgdaDatatype
\newcommand\F\AgdaFunction
\newcommand\B\AgdaBound

\title{le me'oi .Agda.\ me'oi .implementation.\ be la'oi .0027.}
\author{la .varik.\ .VALefor.}

\begin{document}

\maketitle

\section{le me'oi .prelude.}

\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Data.Nat
open import Function
open import Data.List
open import Data.Maybe
open import Data.String
open import Data.Nat.Show
open import System.Environment
open import Data.Unit.Polymorphic
\end{code}

\section{la'oi .\Sym!.}
ni'o la'o zoi.\ \B x \Sym! .zoi.\ fampi'i la'oi .\B x.

\begin{code}
_! : ℕ → ℕ
_! = product ∘ drop 1 ∘ upTo ∘ _+_ 1
\end{code}

\section{la'oi .\F{hm}.}
ni'o gonai ge la'oi .\B q.\ vasru lo su'o pa co'e gi ko'a goi la'o zoi.\ \B q .zoi.\ me'oi .\F{just}.\ lo meirmoi be li pa bei fo la'oi .\B q.\ gi ko'a me'oi .\F{nothing}.

\begin{code}
hm : ∀ {a} → {A : Set a} → List A → Maybe A
hm (a ∷ _) = just a
hm [] = nothing
\end{code}

\section{la'oi .M<=<.}
ni'o cadga fa lo nu le mu'oi glibau.\ type signature .glibau.\ cu xamgu velcki

\begin{code}
_<=<_ : ∀ {a} → {A B C : Set a}
      → (B → Maybe C) → (A → Maybe B) → A → Maybe C
g <=< f = λ a → f a Data.Maybe.>>= g
\end{code}

\section{la'oi .\F{main}.}

\begin{code}
main : Main
main = run $ getArgs IO.>>= pront ∘ reed <=< hm
  where
  splode : ∀ {a} → IO {a} ⊤
  splode = putStrLn "?"
  reed = readMaybe 10
  pront : ∀ {a} → Maybe ℕ → IO {a} ⊤
  pront = maybe (putStrLn ∘ Data.Nat.Show.show ∘ _!) splode
\end{code}
