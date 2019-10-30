//executa regra
r
//definimos regra 1, com 7 iterações
rule r md 7 {
{ x 0.25 y -0.25 s 0.5 0.5 1} r
{ x -0.25 y -0.25 s 0.5 0.5 1} r
base
}
//criamos uma base
rule base {
{x 0.25 y 0.25 s 0.45 0.45 0.1}box
{x -0.25 y 0.25 s 0.45 0.45 0.1}box
}

