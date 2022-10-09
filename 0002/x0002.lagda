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

\begin{document}
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

\section{la'oi .\texttt{bool}.}
ni'o gonai ge la'oi .\texttt{c}.\ jetnu gi ko'a goi la'o zoi.\ \texttt{bool a b c} .zoi.\ du la'oi .\texttt{b}.\ gi ko'a du la'oi .\texttt{a}.
\begin{code}
bool : ∀ {a} → {A : Set a} → A → A → Bool → A
bool a b false = a
bool a b true = b
\end{code}

\section{la'o zoi.\ ∅≡ .zoi.}
ni'o go la'o zoi.\ \texttt{∅≡ n} .zoi.\ gi la'oi .\texttt{n}.\ vasru no da

\begin{code}
∅≡ : {A : Set} → List A → Bool
∅≡ [] = true
∅≡ _ = false
\end{code}

\section{la'oi .\texttt{↓}.}
ni'o la'o zoi.\ \texttt{a ↓ b} .zoi.\ liste lo romoi pe'a selvau be la'oi .\texttt{b}.\ je cu se nilzilcmi li su'e ni'e vujnu be lo nilzilcmi be la'oi .\texttt{b}.\ be'o bei la'oi .\texttt{a}.  .i krasi cnici

\begin{code}
_↓_ : {A : Set} → ℕ → List A → List A
0 ↓ xs = xs
n ↓ [] = []
(suc n) ↓ (x ∷ xs) = n ↓ xs
\end{code}

\section{la'oi .\texttt{ϕ}.}

\begin{code}
ϕ : {A : Set} → List A → List A
ϕ χ = ϕ' χ []
  where
  ϕ' : {A : Set} → List A → List A → List A
  ϕ' [] yx = yx
  ϕ' (x ∷ xs) yx = ϕ' xs $ x ∷ yx
\end{code}

\section{la'oi .\texttt{filter'}.}

\begin{code}
filter' : {A : Set} → (A → Bool) → List A → List A
filter' p [] = []
filter' p (x ∷ xs) = bool (filter' p xs) (x ∷ filter' p xs) $ p x
\end{code}

\section{la'oi .\texttt{listOr}.}
ni'o go nai ge la'oi .\texttt{b}.\ vasru no da gi ko'a goi la'o zoi.\ \texttt{listOr a []} .zoi.\ du la'oi .\texttt{a}.\ gi ko'a remoi selvau la'oi .\texttt{b}.

\begin{code}
listOr : {A : Set} → A → List A → A
listOr x [] = x
listOr x (y ∷ yx) = y
\end{code}

\section{la'o zoi.\ \texttt{ℕ↑} .zoi.}
ni'o la'o zoi.\ \texttt{ℕ↓ n} .zoi.\ to'e zmaduse je cu liste lo mulna'u poi mleca ja dunli la'oi .\texttt{n}.\ je cu se nilzilcmi lo sumji be la'oi .\texttt{n}.\ bei li pa

\begin{code}
ℕ↓ : ℕ → List ℕ
ℕ↓ 0 = 0 ∷ []
ℕ↓ (suc n) = suc n ∷ ℕ↓ n
\end{code}

\section{la'o zoi.\ \texttt{ℕ↑} .zoi.}
ni'o la'o zoi.\ \texttt{ℕ↑ n} .zoi.\ zmaduse je cu liste lo mulna'u poi mleca ja dunli la'oi .\texttt{n}.\ je cu se nilzilcmi lo sumji be la'oi .\texttt{n}.\ bei li pa

\begin{code}
ℕ↑ : ℕ → List ℕ
ℕ↑ n = ϕ $ ℕ↓ n
\end{code}

\section{la'o zoi.\ \texttt{∣} .zoi.}
ni'o go nai la'o zoi.\ \texttt{a ∣ b} .zoi.\ jetnu gi dilcu la'oi .\texttt{b}.\ la'oi .\texttt{a}.\ li no

\begin{code}
_∣_ : ℕ → ℕ → Bool
n ∣ m = not $ ∅≡ $ filter' (λ x → x * n ≡ᵇ m) $ ℕ↓ m
\end{code}

\begin{code}
𝕗 : ℕ → List ℕ
𝕗 t = filter' (λ x → x ∣ t) $ 2 ↓ ℕ↑ (t ∸ 1)
\end{code}

\begin{code}
ℙ⁇ : ℕ → Bool
ℙ⁇ n = ∅≡ $ 𝕗 n
\end{code}

\section{la'oi .\texttt{p?ℙ}.}
ni'o gonai ge la'oi .\texttt{n}.\ mulna'usle gi ganai co'e zoi zoi.\ \texttt{p?ℙ n} .zoi.\ gi ciska la'oi .\texttt{n}.\ lo mu'oi glibau.\ standard output .glibau.

\begin{code}
p?ℙ : ∀ {a} → ℕ → IO {a} ⊤
p?ℙ x = bool (pure tt) (putStrLn $ show x) $ ℙ⁇ x
\end{code}

\section{la'oi .\texttt{f}.}
ni'o ganai co'e zoi zoi.\ \texttt{f n} .zoi.\ gi ciska lo'i ro mulna'usle poi zmadu ja dunli la'oi .\texttt{n}.\ lo mu'oi glibau.\ standard output .glibau.

.i na me'oi .terminate.  .i ku'i na sarcu\ldots je na se djica

\begin{code}
{-# TERMINATING #-}
f : ∀ {a} → ℕ → IO {a} ⊤
f x = p?ℙ x >> f (x + 1)
\end{code}

\section{la'oi .\texttt{main}.}

\begin{code}
main : Main
main = run $ f 2
\end{code}
\end{document}
