// Camera settings. Place these before first rule call.
set translation [1.29042 -7.95675 -20]
set rotation [0.112918 -0.969209 0.218826 0.530909 0.245013 0.811238 -0.839871 0.0245725 0.542225]
set pivot [0 0 0]
set scale 10.6284

 r

rule r md 4 {
{ x -0.25 y 0.25 s 0.5 0.5 0.5 rz 180} r
{ x 0.25 y -0.25 s 0.5 0.5 0.5 rz 0} r
{ x -0.25 y -0.25 s 0.5 0.5 1.2 rz 90} r
base}

rule r md 5 {
{ x -0.25 y 0.25 s 0.5 0.5 1.1 rz 0} r
{ x 0.25 y -0.25 s 0.5 0.5 0.5 rz 90} r
{ x -0.25 y -0.25 s 0.5 0.5 1.3 rz 90} r
base}

rule base {
{x 0.25 y 0.25 s 0.48 0.48 0.1}box}