\begin{code}
{-# OPTIONS --guardedness #-}

open import IO
open import Function
open import Data.List
open import Data.String
\end{code}

\begin{code}
main : Main
main = run $ getLine >>= putStrLn ∘ (fromList ∘ reverse ∘ toList)
\end{code}
