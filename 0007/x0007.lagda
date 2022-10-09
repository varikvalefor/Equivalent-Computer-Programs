\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Data.Nat 
open import Function
open import Data.Nat.Show
open import Data.Unit.Polymorphic
open import Data.List hiding (concat)
open import Data.String hiding (show)
\end{code}

\section{la'oi .\texttt{main}

\begin{code}
{-# TERMINATING #-}
main : Main
main = run $ runner 1
  where
  runner : ∀ {a} → ℕ → IO {a} ⊤
  runner n = putStrLn (concat $ map show $ upTo n) >> runner (n + 1)
\end{code}
