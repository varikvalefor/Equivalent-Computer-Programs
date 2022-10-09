\documentclass{article}

\usepackage{ar}
\usepackage[bw]{agda}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{parskip}
\usepackage{unicode-math}
\usepackage{newunicodechar}


% \setmathfont{XITS Math}
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

\title{le me'oi .Agda.\ proga poi ciska lo me'oi .environment.\ snicne lo'i mu'oi glibau.\ standard output .glibau.}
\author{la .varik.\ .VALefor.}

\begin{document}
\maketitle

\section{le vrici}
\begin{code}
{-# OPTIONS --guardedness #-}
{-# FOREIGN GHC import qualified System.Environment as SE #-}
{-# FOREIGN GHC import qualified System.IO as IO #-}
{-# FOREIGN GHC import System.IO.Unsafe #-}
{-# FOREIGN GHC import Data.Text #-}

open import IO
open import Function
open import Data.List
open import Data.String
open import Agda.Builtin.Sigma
\end{code}

\section{la'oi .\texttt{Env}.}
ni'o ro da poi me'oi .\texttt{Env}.\ zo'u da sinxa lo me'oi .environment.\ snicne

\begin{code}
record Env : Set where
  field
    name : String
    value : String
\end{code}

\newcommand\envBoilerplate{
  .i le fancu cu na me'oi .unsafe.  .i pilno la'oi .\texttt{unsafePerformIO}\ldots je ku'i cu pilno la'oi .\texttt{pure}.

  .i pilno lo mu'oi glibau.\ line break .glibau.\ ki'u le nu ganai na pilno lo mu'oi glibau.\ line break .glibau.\ gi dukse lo ka ce'u clani kei kei je le nu na dukse lo ka ce'u clani
}

\section{la'oi .\texttt{envNames}.}
ni'o la'oi .\texttt{envNames}.\ liste lo'i cmene be lo'i me'oi .environment.\ snicne

\naMehoiUnsafe

\begin{code}
envNames : IO (List String)
envNames = pure envNames′
  where
  postulate envNames′ : List String
  {-#
    COMPILE GHC envNames′ =
      unsafePerformIO $
      map (pack . fst) <$> SE.getEnvironment
  #-}
\end{code}

\section{la'oi .\texttt{envValues}.}
ni'o la'oi .\texttt{envValues}.\ liste lo'i se me'oi .environment.\ snicne

\naMehoiUnsafe

\begin{code}
envValues : IO (List String)
envValues = pure envValues′
  where
  postulate envValues′ : List String
  {-#
    COMPILE GHC envValues′ =
    unsafePerformIO $
    map (pack . snd) <$> SE.getEnvironment
  #-}
\end{code}

\section{la'oi .\texttt{toEnv}.}
ni'o ge la'o zoi.\ \texttt{toEnv a b} .zoi.\ me'oi .Env.\ gi ge la'o zoi.\ \texttt{Env.name toEnv a b} .zoi.\ du la'oi .\texttt{a}.\ gi la'o zoi.\ \texttt{Env.value toEnv a b} .zoi.\ du la'oi .\texttt{b}.

\begin{code}
toEnv : String → String → Env
toEnv n v = record {name = n; value = v}
\end{code}

\section{la'oi .\texttt{liftIO2}.}
ni'o le mu'oi glibau.\ type signature .glibau.\ cu velcki

\begin{code}
liftIO2 : ∀ {a} → {A B C : Set a}
        → (A → B → C) → IO A → IO B → IO C
liftIO2 f a b = a >>= λ a′ → b >>= λ b′ → pure $ f a′ b′
\end{code}

\section{la'oi .\texttt{envs}.}
ni'o la'oi .\texttt{envs}.\ liste lo'i me'oi .environment. snicne pe lo skami poi co'e la'oi .\texttt{envs}.

\begin{code}
envs : IO (List Env)
envs = liftIO2 (zipWith toEnv) envNames envValues
\end{code}

\section{la'oi .\texttt{envs}.}
ni'o la'o zoi.\ \texttt{showEnv t} .zoi.\ konkatenata la'o zoi.\ \texttt{Env.name t} .zoi.\ zoi zoi.\ \texttt{=} .zoi.\ la'o zoi.\ \texttt{Env.value t} .zoi.

\begin{code}
showEnv : Env → String
showEnv t = Env.name t Data.String.++ "=" Data.String.++ Env.value t
\end{code}

\section{la'oi .\texttt{main}.}

\begin{code}
main : Main
main = run $ envs >>= IO.List.mapM′ (putStrLn ∘ showEnv)
\end{code}
\end{document}
