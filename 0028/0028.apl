⍝ ni'o tu'a zoi zoi. 2↓ .zoi. rinka lo nu vimcu zo'oi .apl. je zoi zoi. -- .zoi.
⍝
⍝ That (uses "2↓") causes that removes "apl" and "--".
⍝
⍝ apl -- d1 d2 < 0028.apl
⎕←∧/{⍵{⍺[⍵]≡⍺[⍵+1]}⍳1-⍨≢⍵}⎕FIO[26]¨2↓⎕ARG
