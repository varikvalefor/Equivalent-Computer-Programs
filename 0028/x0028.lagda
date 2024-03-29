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

\title{le me'oi .Agda.\ me'oi .implementation.\ be la'oi .0028.}
\author{la .varik.\ .VALefor.}

\begin{document}

\maketitle

\section{le me'oi .prelude.}

\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Data.Nat
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

import Agda.Builtin.IO as BIO
\end{code}

\section{la'oi .\F{bool}.}
ni'o gonai ge la'oi .\B c.\ me'oi .\F{true}.\ gi ko'a goi la'o zoi.\ \F{bool} \B a \B b \B c .zoi.\ du la'oi .\B b.\ gi ko'a du la'oi .\B b.

\begin{code}
bool : ∀ {a} → {A : Set a} → A → A → Bool → A
bool a b = λ c → if c then b else a
\end{code}

\section{la'o zoi.\ \Sym{\_<=<\_} .zoi.}
ni'o cadga fa lo nu le mu'oi glibau.\ type signature .glibau.\ cu xamgu velcki

\begin{code}
_<=<_ : ∀ {a} → {A B C : Set a}
      → (B → IO C) → (A → IO B) → (A → IO C)
(a <=< b) c = b c >>= a
\end{code}

\section{la'o zoi.\ \Sym{[]≡ᵇ} .zoi.}
ni'o go la'o zoi.\ \B a \Sym{[]≡ᵇ} \B b .zoi.\ jetnu gi la'oi .\B a.\ du la'oi .\B b.

ni'o go la'o zoi.\ \B a \Sym{[]≡ᵇ} \B b .zoi.\ jetnu gi ge lo nilzilcmi be la'oi .\B a.\ cu nilzilcmi la'oi .\B b.\ gi ro da poi dubjavme'a lo nilzilcmi be la'oi .\B a.\ je poi zmadu li no zo'u lo meirmoi be da bei fo la'oi .\B a.\ cu du lo meirmoi be da bei fo la'oi .\B b.

\begin{code}
_[]≡ᵇ_ : List ℕ → List ℕ → Bool
[] []≡ᵇ [] = true
(a ∷ as) []≡ᵇ (b ∷ bs) = (a ≡ᵇ b) ∧ (as []≡ᵇ bs)
_ []≡ᵇ _ = false
\end{code}

\section{la'oi .\F{readFile}.}
ni'o ro da poi datnyvei je poi se cmene la'oi .\B K.\ zo'u la'o zoi.\ \F{readFile} \B K .zoi.\ me'oi .return. lo liste be lo'i ro me'oi .Unicode.\ lerfu pe'a ru'e poi selvau da

ni'o tu'a la'oi .\D ℕ.\ filri'a tu'a lo me'oi .binary.\ datnyvei  .i ga je la'oi .\D{String}.\ tolmapti lo su'o datnyvei gi ku'i la'o zoi.\ \D{List}\ \D ℕ .zoi.\ mapti lo ro datnyvei

\begin{code}
readFile : String → IO $ List ℕ
readFile = lift ∘ readFile'
  where
  postulate readFile' : String → BIO.IO $ List ℕ
  {-# FOREIGN GHC import qualified Data.ByteString as B #-}
  {-# FOREIGN GHC import qualified Data.Text as T #-}
  {-# FOREIGN GHC import System.IO.Unsafe #-}
  {-#
    COMPILE GHC readFile' = (\t _ -> toNList <$> readFile'' t)
    where {
      toNList = map (fromIntegral . fromEnum) . B.unpack;
      readFile'' = B.readFile . T.unpack;
    }
  #-}
\end{code}

\section{la'oi .\F{main}.}

\begin{code}
main : Main
main = run $ getArgs >>= (bool splode yay ∘ f) <=< mapM readFile
  where
  mapM = IO.List.mapM
  f : List $ List ℕ → Bool
  f (a ∷ b ∷ c) = (a []≡ᵇ b) ∧ f c
  f _ = true
\end{code}
\end{document}
