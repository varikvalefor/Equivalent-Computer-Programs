isprime ← {~∨/0=⍵|⍨2↓⍳⍵}

main ← {⍞ ← {'
',⍨(isprime ⍵)/⍵}

main 1
