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

% \setmathfont{XITS Math}
\newunicodechar{λ}{\ensuremath{\mathnormal\lambda}}
\newunicodechar{∃}{\ensuremath{\mathnormal\exists}}
\newunicodechar{∄}{\ensuremath{\mathnormal\nexists}}
\newunicodechar{∷}{\ensuremath{\mathnormal\Colon}}
\newunicodechar{∨}{\ensuremath{\mathnormal\vee}}
\newunicodechar{ℕ}{\ensuremath{\mathbb{N}}}
\newunicodechar{∈}{\ensuremath{\mathnormal\in}}
\newunicodechar{≡}{\ensuremath{\mathnormal\equiv}}
\newunicodechar{⟩}{\ensuremath{\mathnormal\rangle}}
\newunicodechar{∶}{\ensuremath{\mathnormal\colon\!\!}}
\newunicodechar{⊹}{\ensuremath{\mathnormal\dag}}
\newunicodechar{𝕗}{\ensuremath{\mathbb{f}}}
\newunicodechar{ℙ}{\ensuremath{\mathbb{P}}}
\newunicodechar{∸}{\ensuremath{\mathnormal\dotdiv}}
\newunicodechar{ᵇ}{\ensuremath{^\mathrm{b}}}
\newunicodechar{≥}{\ensuremath{\mathnormal{\geq}}}
\newunicodechar{ϕ}{\ensuremath{\mathnormal{\phi}}}
\newunicodechar{χ}{\ensuremath{\mathnormal{\chi}}}
\newunicodechar{∧}{\ensuremath{\mathnormal{\wedge}}}
\newunicodechar{∅}{\ensuremath{\mathnormal{\emptyset}}}
\newunicodechar{∣}{\ensuremath{\mathnormal{|}}}
\newunicodechar{⁇}{\ensuremath{\mathrm{?\!?}}}
\newunicodechar{∘}{\ensuremath{\mathnormal{\circ}}}
\newunicodechar{∀}{\ensuremath{\mathnormal{\forall}}}
\newunicodechar{⊤}{\ensuremath{\mathnormal{\top}}}
\newunicodechar{′}{\ensuremath{\mathnormal{\prime}}}

\title{le me'oi .Agda.\ proga poi cusku le'i se du'u lo'i mencre pe'a grisu'i cu du lo'i tolmencre pe'a grisu'i}
\author{la .varik.\ .VALefor.}

\begin{document}
\section{le me'oi .preamble.}

\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Data.Nat
open import Function
open import Data.String
open import Data.Nat.Show
open import Data.Nat.DivMod
open import Data.Unit.Polymorphic
open import Data.List
  using (foldr; _∷_; downFrom; List)
  renaming (reverse to ϕ)
\end{code}

\section{la'o zoi.\ \texttt{ℕ↓} .zoi.}
ni'o la'o zoi.\ \texttt{ℕ↓ n} .zoi.\ to'e zmaduse je cu liste lo'i ro kacna'u poi dubjavme'a la'oi .\texttt{n}.

\begin{code}
ℕ↓ : ℕ → List ℕ
ℕ↓ n = n ∷ downFrom n
\end{code}

\section{la'oi .\texttt{clevSum}.}
ni'o la'o zoi.\ \texttt{clevSum n} .zoi.\ dilcu lo pilji be la'oi .\texttt{n}.\ bei lo sumji be la'oi .\texttt{n}.\ bei li pa li re

\begin{code}
clevSum : ℕ → ℕ
clevSum n = (n * (n + 1)) / 2
\end{code}

\section{la'oi .\texttt{dumbSum}.}
ni'o la'o zoi.\ \texttt{dumbSum n} .zoi.\ grisumji lo'i ro kacna'u poi dubjavme'a la'oi .\texttt{n}.

\begin{code}
dumbSum : ℕ → ℕ
dumbSum n = foldr _+_ 0 $ ℕ↓ n
\end{code}

\section{la'oi .\texttt{tp}.}
ni'o la'o zoi.\ \texttt{tp n} .zoi.\ se du'u lo grisumji be lo'i ro kacna'u poi dubjavme'a la'oi .\texttt{n}.\ cu du la'o zoi.\ \texttt{dumbSum n} .zoi.\ la'o zoi.\ \texttt{clevSum n} .zoi.

\begin{code}
tp : ℕ → String
tp k = sx ++ ds ++ " = " ++ cs ++ "."
  where
  ds : String
  ds = Data.Nat.Show.show $ dumbSum k
  cs : String
  cs = Data.Nat.Show.show $ clevSum k
  sx : String
  sx = "\\sum_{x=1}^{" ++ Data.Nat.Show.show k ++ "} x = "
\end{code}

\section{la'oi .\texttt{main}.}

\begin{code}
main : Main
main = run $ IO.List.mapM′ (putStrLn ∘ tp) $ ϕ $ ℕ↓ 6000
\end{code}
\end{document}
