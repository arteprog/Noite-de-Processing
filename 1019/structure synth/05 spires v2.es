//seed 174
// Camera settings. Place these before first rule call.
set translation [-3.15008 -3.70773 -20]
set rotation [0.0510182 0.988816 -0.140104 -0.419832 0.148521 0.895356 0.906154 0.0131429 0.422712]
set pivot [0 0 0]
set scale 10.5958

set raytracer::light [50,5,15]
set raytracer::samples 15
set raytracer::reflection 0
set raytracer::size [1600x900]
set raytracer::dof [0.1,0.003] 


{color white} r1
{x 0 y 0 z -0.05 s 5 5 0.1 color grey}box

rule r1 md 4{
{ x -0.25 y 0.25 s 0.5 0.5 0.75 rz 0} r1
{ x 0.25 y -0.25 s 0.5 0.5 0.5 rz 0} r1
{ x -0.25 y -0.25 s 0.5 0.5 1.2 rz 90} r1
tower
}

rule r1 md 2 {
{ x -0.25 y 0.25 s 0.5 0.5 1 rz 0} r3
{ x 0.25 y -0.25 s 0.5 0.5 0.5 rz 90} r1
{ x -0.25 y -0.25 s 0.5 0.5 1.5 rz 90} r1
tower
}


rule r3 md 1{
{ x -0.25 y 0.25 s 0.5 0.5 0.75 rz 90} r3
{ x 0.25 y -0.25 s 0.5 0.5 1 rz 0} r3
{ x -0.25 y -0.25 s 0.5 0.5 1 rz 0} r3
tower2
}

rule r3 md 2{
{ x -0.25 y 0.25 s 0.5 0.5 1 rz 90} r3
{ x 0.25 y -0.25 s 0.5 0.5 0.75 rz 90} r3
{ x -0.25 y -0.25 s 0.5 0.5 1 rz 0} r3
tower2
}



rule tower {
{x 0.25 y 0.25 s 0.47 0.47 0.1}box}




rule tower2 w 1{
{z 0.01 rz 1 s 0.9 color white}tower2
base
}

rule tower2 w 1{
{z 0.01 rz 2 s 1.01 color red}tower2
base
}

rule tower2 w 1{
{z 0.01 rz 3 s 1.02 color white}tower2
base
}

rule tower2 w 1{
{z 0.01 rz 4 s 0.95 color white}tower2
base
}

rule tower2 w 0.05{
}

rule base {
{x 0.25 y 0.25 s 0.4 0.4 0.01}box
}







