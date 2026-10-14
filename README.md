# Assembly Projects

Esercizi di assembly **RISC-V** svolti durante il corso di Calcolatori Elettronici
(Ingegneria Informatica, Università degli Studi del Sannio).

## Strumenti

- **Linguaggio**: assembly RISC-V (RV32I)
- **Simulatore**: [RARS 1.6](https://github.com/TheThirdOne/rars)

## Come eseguire i programmi

1. Scarica `rars1_6.jar` dal link qui sopra.
2. Avvia RARS con `java -jar rars1_6.jar` (serve Java installato).
3. Apri un file `.asm` con *File → Open*.
4. Premi *Assemble* (F3) e poi *Run* (F5).

## Contenuto

| File | Descrizione |
|---|---|
| `binario.asm` | Esercizio sulla rappresentazione binaria |
| `esadecimale.asm` | Esercizio sulla rappresentazione esadecimale |
| `stringheconcatenate.asm` | Concatenazione di stringhe |

## Note

Ogni programma termina con la syscall di uscita:

```asm
li a7, 10
ecall
```
