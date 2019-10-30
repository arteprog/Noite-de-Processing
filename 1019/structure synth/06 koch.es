#define sc 0.33333333

r
rule r md 10{
{x -1 y 0 s sc} r
{x -0.5 y 0.5 rz 90 s sc} r
{x 0 y 1 s  sc} r
{x 0.5 y 0.5 rz -90 s  sc } r
{x 1 y 0 s  sc} r
base }

rule base {{ s 3 0.1 0.3}box}
