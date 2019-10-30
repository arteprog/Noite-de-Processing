// Camera settings. Place these before first rule call.
set translation [2.54669 -11.2432 -20]
set rotation [0.214857 -0.941421 0.259929 0.496147 0.334457 0.801236 -0.841233 -0.0431889 0.538941]
set pivot [0 0 0]
set scale 15.0946

{color white} r

//cria os quadrados
rule r md 4{
{ x -0.25 y 0.25 s 0.5 0.5 0.75 rz 180} r
{ x 0.25 y -0.25 s 0.5 0.5 1 rz 0} r
{ x -0.25 y -0.25 s 0.5 0.5 1 rz 90} r
tower}

rule r md 5 {
{ x -0.25 y 0.25 s 0.5 0.5 1 rz 0} r
{ x 0.25 y -0.25 s 0.5 0.5 0.75 rz 90} r
{ x -0.25 y -0.25 s 0.5 0.5 1 rz 90} r
tower}

//cria as torres
rule tower w 1{
{z 0.01 rz 3 s 0.8}tower
 base}
rule tower w 1{
{z 0.01 rz 3 s 1.01}tower
 base}
rule tower w 1{
{z 0.01 rz 3 s 1.02}tower
 base}
rule tower w 1{
{z 0.01 rz 3 s 0.95}tower
 base}
rule tower w 0.5{}

//base para as torres
rule base {
{x 0.25 y 0.25 s 0.45 0.45 0.01 sat 0.3}box}