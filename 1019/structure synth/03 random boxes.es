r

rule r md 7 {
{ x 0.25 y -0.25 s 0.5 0.5 1} r
{ x -0.25 y -0.25 s 0.5 0.5 1} r
base}

//base vermelha
rule base {
{x 0.25 y 0.25 s 0.45 0.45 0.1}box
{x -0.25 y 0.25 s 0.45 0.45 0.1}box}

//base branca
rule base {
{x 0.25 y 0.25 s 0.45 0.45 0.1}box
{x -0.25 y 0.25 s 0.45 0.45 0.1 color white}box}