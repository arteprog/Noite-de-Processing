// Write EisenScript code here...
{s 200 200 0.1 z -0.07 color white}box
set maxobjects 100000

// Camera settings. Place these before first rule call.
set translation [0.590951 -0.305732 -20]
set rotation [0.443026 0.896326 0.0181054 -0.543975 0.252708 0.800142 0.712612 -0.364332 0.599534]
set pivot [0 0 0]
set scale 0.653822

// steam1

 growroot1



rule growroot1 md 30 > sss1{
{x 0.5 s 0.995}growroot1z
rootbase}
rule growroot1 w 0.07{
{x 0.5 s 0.995 rz 27}growroot1z
{x 0.5 s 0.995 rz -43}growroot1z
rootbase}
rule growroot1 w 0.07{
{x 0.5 s 0.995 rz -27}growroot1z
{x 0.5 s 0.995 rz 43}growroot1z
rootbase}


rule growroot1z{{rz 15}growroot1}
rule growroot1z{{rz 10}growroot1}
rule growroot1z{{rz 0}growroot1}
rule growroot1z{{rz -10}growroot1}
rule growroot1z{{rz -15}growroot1}

rule rootbase{
{x 0.25 s 0.5 0.05 0.05 z 1 color #4A5D23} box
sss1}
rule rootbase w 5{
{x 0.25 s 0.5 0.05 0.05 z 1 color #4A5D23} box}

rule sss1{
{s 0.1 z 0.1} steam1}

rule steam1 md 11 > select1{
{z 1 s 0.98}steam1z
basestem}
rule steam1 md 12 > select1{
{z 1 s 0.98}steam1z
basestem}
rule steam1 md 13 > select1{
{z 1 s 0.98}steam1z
basestem}


rule growbloom {
{z 1 s 0.99}steam2z
leaflessseam}
rule growbloom w 0.05{
{z 1 s 0.99 rz 15}steam2z
{z 1 s 0.99 rz -15}steam2z
leaflessseam}
rule growbloom w 0.1{
bloom}

rule select1 {
growbloom}

rule steam1x{{rx 5}steam1}
rule steam1x{{rx 2}steam1}
rule steam1x{{rx 0}steam1}
rule steam1x{{rx -2}steam1}
rule steam1x{{rx -5}steam1}

rule steam1y{{ry 5}steam1x}
rule steam1y{{ry 2}steam1x}
rule steam1y{{ry 0}steam1x}
rule steam1y{{ry -2}steam1x}
rule steam1y{{ry -5}steam1x}

rule steam1z{{rz 2}steam1y}
rule steam1z{{rz 5}steam1y}
rule steam1z{{rz 0}steam1y}
rule steam1z{{rz -5}steam1y}
rule steam1z{{rz -2}steam1y}

rule steam2x{{rx 2}growbloom}
rule steam2x{{rx 5}growbloom}
rule steam2x{{rx 0}growbloom}
rule steam2x{{rx -5}growbloom}
rule steam2x{{rx -2}growbloom}

rule steam2y{{ry 2}steam2x}
rule steam2y{{ry 5}steam2x}
rule steam2y{{ry 0}steam2x}
rule steam2y{{ry -5}steam2x}
rule steam2y{{ry -2}steam2x}

rule steam2z{{rz 2}steam2y}
rule steam2z{{rz 5}steam2y}
rule steam2z{{rz 0}steam2y}
rule steam2z{{rz -5}steam2y}
rule steam2z{{rz -2}steam2y}


rule basestem{
leaf4
{s 0.1 0.1 1 z 0.5 color #4A5D23} box}

rule leaflessseam{
{s 0.1 0.1 1 z 0.5 color #4A5D23} box}

rule leaf4{
4 *{rz 90} leafs_f}

rule leafs_f{
{color #8A9A5B}leafs}
rule leafs_f{
{color #4A5D23}leafs}


rule leafz{{rz 10}leaf_f}
rule leafz{{rz 5}leaf_f}
rule leafz{{rz 0}leaf_f}
rule leafz{{rz -5}leaf_f}
rule leafz{{rz -10}leaf_f}

rule leafx{{rx 10}leafz}
rule leafx{{rx 5}leafz}
rule leafx{{rx 0}leafz}
rule leafx{{rx -5}leafz}
rule leafx{{rx -10}leafz}

rule leafy{{ry 10}leafx}
rule leafy{{ry 5}leafx}
rule leafy{{ry 0}leafx}
rule leafy{{ry -5}leafx}
rule leafy{{ry -10}leafx}

rule leafs{{s 1.1}leafy}
rule leafs{{s 1.05}leafy}
rule leafs{{s 1}leafy}
rule leafs{{s 0.95}leafy}
rule leafs{{s 0.9}leafy}

rule leaf_f{
{z 1.6 x -1.8 ry 40}leaf}
rule leaf_f w 0.2 {}


rule leaf{
{x -1 s 2 1 1}base
{s 2 1.414 1 rz 45 }base
{x 1 s 2 1 1}base
}

rule bloom{
6 *{rz 60 color white} petal2
{x -0.2 y -0.2 z 0.5 s 0.4 color yellow}sphere
{x -0.2 y 0.2 z 0.5 s 0.4 color yellow}sphere
{x 0.2 z 0.5 s 0.4 color yellow}sphere
}

rule petal2{
{x 2.1 ry -20 z 1}petal1}


rule petal1{
{x -0.707 s 2 1 1}base
{rz 45 s 1.414 1.414 1}base
{x 0.707 s 2 1 1}base
}


rule base{
{s 1 1 0.1 rz 45}box}