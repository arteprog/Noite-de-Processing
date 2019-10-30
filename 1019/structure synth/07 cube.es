// Camera settings. Place these before first rule call.
set translation [-1.5081 -3.24183 -20]
set rotation [0.878032 -0.477773 0.0281963 0.15309 0.336184 0.929271 -0.453459 -0.811612 0.368322]
set pivot [0 0 0]
set scale 4.93366

set raytracer::phong [0.5,0.8,0.8]


{x 0 y 0 z 0.5 color white} r1
{x 0 y -0.5 z 0  rx 90 color white} r2
{x -0.5 y 0 z 0  ry 90 color white} r2
{x 0 y 0 z 0 s 1 1 1 color grey}box

rule r1 md 4 {
{ x -0.25 y 0.25 s 0.5 0.5 0.5 rz 180 h 10} r1
{ x 0.25 y -0.25 s 0.5 0.5 0.5 rz 90 h -20} r1
{ x -0.25 y -0.25 s 0.5 0.5 1.2 rz 90 h 10} r1
base
}

rule r1 md 5 {
{ x -0.25 y 0.25 s 0.5 0.5 1.1 rz 0 h -20} r1
{ x 0.25 y -0.25 s 0.5 0.5 0.5 rz 0 h -30} r1
{ x -0.25 y -0.25 s 0.5 0.5 1.3 rz 0 h 10} r1
base
}

rule base {
{x 0.25 y 0.25 s 0.48 0.48 0.1 sat 0.3}box
}



rule r2 md 4 {
{ x -0.25 y 0.25 s 0.5 0.5 1.2 rz 90 h 10} r2
{ x 0.25 y -0.25 s 0.5 0.5 0.5 rz 0 h -20} r2
{ x -0.25 y -0.25 s 0.5 0.5 0.5 rz 180 h 10} r2
base
}

rule r2 md 5 {
{ x -0.25 y 0.25 s 0.5 0.5 0.5 rz 90 h -20} r2
{ x 0.25 y -0.25 s 0.5 0.5 1.1 rz 0 h -30} r2
{ x -0.25 y -0.25 s 0.5 0.5 1.3 rz 180 h 10} r2
base
}


rule r3 md 4 {
{ x -0.25 y 0.25 s 0.5 0.5 0.5 rz -90 h 10} r3
{ x 0.25 y -0.25 s 0.5 0.5 1.2 rz 0 h -20} r3
{ x -0.25 y -0.25 s 0.5 0.5 0.5 rz 0 h 10} r3
base
}

rule r3 md 5 {
{ x -0.25 y 0.25 s 0.5 0.5 1.1 rz 0 h -20} r3
{ x 0.25 y -0.25 s 0.5 0.5 0.5 rz 90 h -30} r3
{ x -0.25 y -0.25 s 0.5 0.5 1.3 rz 0 h 10} r3
base
}





// Write EisenScript code here...






