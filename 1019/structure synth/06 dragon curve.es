#define sc 0.70710678118654752440
#define msc -0.70710678118654752440

r2

rule r1 md 8{
{x -0.75 y msc rz -45 s sc} r1
{x 0.75 y msc rz 45 s sc} r2
base }

rule r2 md 8{
{x -0.75 y sc rz 45 s sc} r1
{x 0.75 y sc rz -45 s sc} r2
base }

rule base {{ s 3 0.1 0.1}box}