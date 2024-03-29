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

\newcommand\Sym\AgdaSymbol
\newcommand\D\AgdaDatatype
\newcommand\F\AgdaFunction
\newcommand\B\AgdaBound

\title{le me'oi .Agda.\ versiio be le proga poi ciska le ro mulna'usle lo mu'oi glibau.\ standard output .glibau.}
\author{la .varik.\ .VALefor.}

\begin{document}

\maketitle

\section{le me'oi .preamble.}
\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Data.Nat
open import Function
open import Data.Bool
open import Data.List
open import Data.Nat.Show
open import Data.Nat.DivMod
open import Data.Unit.Polymorphic
\end{code}

\section{la'oi .\F{bool}.}
ni'o gonai ge la'oi .\B c.\ jetnu gi ko'a goi la'o zoi.\ \F{bool} \B a \B b \B c .zoi.\ du la'oi .\B b.\ gi ko'a du la'oi .\B a.
\begin{code}
bool : ∀ {a} → {A : Set a} → A → A → Bool → A
bool a b false = a
bool a b true = b
\end{code}

\section{la'o zoi.\ \F{∅≡} .zoi.}
ni'o go la'o zoi.\ \F{∅≡} \B n .zoi.\ gi la'oi .\B n.\ vasru no da

\begin{code}
∅≡ : ∀ {a} → {A : Set a} → List A → Bool
∅≡ [] = true
∅≡ _ = false
\end{code}

\section{la'oi .\Sym{↓}.}
ni'o la'o zoi.\ \B a \Sym ↓ \B b} .zoi.\ liste lo romoi pe'a selvau be la'oi .\B b.\ je cu se nilzilcmi li su'e ni'e vujnu be lo nilzilcmi be la'oi .\B b.\ be'o bei la'oi .\B a.  .i krasi cnici

\begin{code}
_↓_ : ∀ {a} → {A : Set a} → ℕ → List A → List A
0 ↓ xs = xs
n ↓ [] = []
(suc n) ↓ (x ∷ xs) = n ↓ xs
\end{code}

\section{la'oi .\F ϕ.}
ni'o la'o zoi.\ \F ϕ \B d .zoi.\ fatne la'oi .\B d.

\begin{code}
ϕ : ∀ {a} → {A : Set a} → List A → List A
ϕ χ = ϕ' χ []
  where
  ϕ' : ∀ {a} → {A : Set a} → List A → List A → List A
  ϕ' [] yx = yx
  ϕ' (x ∷ xs) yx = ϕ' xs $ x ∷ yx
\end{code}

\section{la'oi .\F{filter'}.}

\begin{code}
filter' : ∀ {a} → {A : Set a} → (A → Bool) → List A → List A
filter' p [] = []
filter' p (x ∷ xs) = bool (filter' p xs) (x ∷ filter' p xs) $ p x
\end{code}

\section{la'oi .\F{listOr}.}
ni'o go nai ge la'oi .\B b.\ vasru no da gi ko'a goi la'o zoi.\ \F{listOr} \B a \Sym{[]} .zoi.\ du la'oi .\B a.\ gi ko'a remoi selvau la'oi .\B b.

\begin{code}
listOr : ∀ {a} → {A : Set a} → A → List A → A
listOr x [] = x
listOr x (y ∷ yx) = y
\end{code}

\section{la'o zoi.\ \F{ℕ↑} .zoi.}
ni'o la'o zoi.\ \F{ℕ↓} \B n .zoi.\ to'e zmaduse je cu liste lo mulna'u poi mleca ja dunli la'oi .\B n.\ je cu se nilzilcmi lo sumji be la'oi .\B n.\ bei li pa

\begin{code}
ℕ↓ : ℕ → List ℕ
ℕ↓ 0 = 0 ∷ []
ℕ↓ (suc n) = suc n ∷ ℕ↓ n
\end{code}

\section{la'o zoi.\ \F{ℕ↑} .zoi.}
ni'o la'o zoi.\ \F{ℕ↑} \B n .zoi.\ zmaduse je cu liste lo mulna'u poi mleca ja dunli la'oi .\B n.\ je cu se nilzilcmi lo sumji be la'oi .\B n.\ bei li pa

\begin{code}
ℕ↑ : ℕ → List ℕ
ℕ↑ = ϕ ∘ ℕ↓
\end{code}

\section{la'o zoi.\ \Sym{∣} .zoi.}
ni'o go nai la'o zoi.\ \B a \Sym{∣} \B b .zoi.\ jetnu gi dilcu la'oi .\B b.\ la'oi .\B a.\ li no

\begin{code}
_∣_ : ℕ → ℕ → Bool
n ∣ m = not $ ∅≡ $ filter' (λ x → x * n ≡ᵇ m) $ ℕ↓ m
\end{code}

\section{la'oi .\F 𝕗.}
ni'o la'o zoi.\ \F 𝕗 \B n .zoi.\ liste lo'i ro se dilcymu'o be la'oi .\B{n}.\ be'o poi mleca la'oi .\B{n}.\ je poi zmadu li re

\begin{code}
𝕗 : ℕ → List ℕ
𝕗 t = filter' (λ x → x ∣ t) $ 2 ↓ ℕ↑ (t ∸ 1)
\end{code}

\section{la'oi .\F{ℙ⁇}.}
ni'o go la'o zoi.\ \F{ℙ⁇} \B n .zoi.\ jetnu gi la'oi .\B{n}.\ mulna'usle

\begin{code}
ℙ⁇ : ℕ → Bool
ℙ⁇ = ∅≡ ∘ 𝕗
\end{code}

\section{la'oi .\F{p?ℙ}.}
ni'o gonai ge la'oi .\B{n}.\ mulna'usle gi ganai co'e zoi zoi.\ \F{p?ℙ} \B n .zoi.\ gi ciska la'oi .\B{n}.\ lo mu'oi glibau.\ standard output .glibau.

\begin{code}
p?ℙ : ∀ {a} → ℕ → IO {a} ⊤
p?ℙ x = bool (pure tt) (putStrLn $ show x) $ ℙ⁇ x
\end{code}

\section{la'oi .\F f.}
ni'o ganai co'e zoi zoi.\ \F f \B n .zoi.\ gi ciska lo'i ro mulna'usle poi zmadu ja dunli la'oi .\B n.\ lo mu'oi glibau.\ standard output .glibau.

.i na me'oi .terminate.  .i ku'i na sarcu\ldots je na se djica

\begin{code}
{-# NON_TERMINATING #-}
f : ∀ {a} → ℕ → IO {a} ⊤
f x = p?ℙ x >> f (x + 1)
\end{code}

\section{la'oi .\F{main}.}

\begin{code}
main : Main
main = run $ f 2
\end{code}
\end{document}
