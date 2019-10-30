//seeds
//22 

set maxobjects 1000000

// Camera settings. Place these before first rule call.
set translation [-0.550532 -2.92624 -20]
set rotation [0.631267 0.775315 0.0200541 -0.317318 0.234597 0.918833 0.707678 -0.586391 0.394114]
set pivot [0 0 0]
set scale 0.33527



set background grey
{x 0 y 0 z -0.1 s 500 500 0.1 color grey}box

{x 0.9 y 0.9} house
{x 0.9 y -0.9} house
{x -0.9 y -0.9} house
{x -0.9 y 0.9} house

rule house{
10 *{z 0.075}buildy2
{z 0.75}buildtower_f2
}



rule buildtower_f1 {
buildy1
{z 0.1} buildtower_f1 }
rule buildtower_f1 w 0.2{select}

//sidetower for f1
rule buildtower_f1  w 0.01{
buildy1
{z 0.1} buildtower_f1 
{x 0.7 s 0.7}addf3 }
rule buildtower_f1  w 0.01{
buildy1
{z 0.1} buildtower_f1 
{x -0.7 s 0.7}addf3 }
rule buildtower_f1  w 0.01{
buildy1
{z 0.1} buildtower_f1 
{y 0.7 s 0.7}addf3 }
rule buildtower_f1  w 0.01{
buildy1
{z 0.1} buildtower_f1 
{y -0.7 s 0.7}addf3 }

rule addf3{
bottomsupport
buildtower_f3}



rule buildtower_f2 {
buildy2
{z 0.075} buildtower_f2 }
rule buildtower_f2 w 0.2{select} 

rule buildtower_f3 {
buildy3
{z 0.15} buildtower_f3}
rule buildtower_f3 w 0.2{select}


//sidetower for f3
rule buildtower_f3  w 0.01{
buildy3
{z 0.15}  buildtower_f3 
{x 0.7 s 0.7}addf3 }
rule buildtower_f3  w 0.01{
buildy3
{z 0.15}  buildtower_f3 
{x -0.7 s 0.7}addf3 }
rule buildtower_f3  w 0.01{
buildy3
{z 0.15} buildtower_f3 
{y 0.7 s 0.7}addf3 }
rule buildtower_f3  w 0.01{
buildy3
{z 0.15} buildtower_f3 
{y -0.7 s 0.7}addf3 }




rule select w 3{
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.3}bottomsupport
{s 0.8 z 0.3} buildtower_f1}
rule select w 3{
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.275}bottomsupport
{s 0.8 z 0.275} buildtower_f2}
rule select w 3{
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.35}bottomsupport
{s 0.8 z 0.35} buildtower_f3}
rule select w 3{
{s 1.25}bottomsupport
{s 1.25} buildtower_f1}
rule select w 3{
{s 1.25}bottomsupport
{s 1.25} buildtower_f2}
rule select w 3{
{s 1.25}bottomsupport
{s 1.25} buildtower_f3}

rule select {
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.3}bottomsupport
{s 0.8 z 0.3} buildtower_f1zz}
rule select{
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.275}bottomsupport
{s 0.8 z 0.275} buildtower_f2zz}
rule select{
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.35}bottomsupport
{s 0.8 z 0.35} buildtower_f3zz}
rule select {
{s 1.25}bottomsupport
{s 1.25} buildtower_f1zz}
rule select{
{s 1.25}bottomsupport
{s 1.25} buildtower_f2zz}
rule select{
{s 1.25}bottomsupport
{s 1.25} buildtower_f3zz}












rule buildtower_f1zz {
buildy1
{z 0.1} buildtower_f1zz }
rule buildtower_f1zz w 0.2{selectzz}

//sidetower for f1
rule buildtower_f1zz  w 0.02{
buildy1
{z 0.1} buildtower_f1zz 
{x 0.7 s 0.7}addf3 }
rule buildtower_f1zz  w 0.02{
buildy1
{z 0.1} buildtower_f1zz 
{x -0.7 s 0.7}addf3 }
rule buildtower_f1zz  w 0.02{
buildy1
{z 0.1} buildtower_f1zz 
{y 0.7 s 0.7}addf3 }
rule buildtower_f1zz  w 0.02{
buildy1
{z 0.1} buildtower_f1zz 
{y -0.7 s 0.7}addf3 }
rule buildtower_f1zz w 0.3{{s 1.9 z -0.05}rooftopf}




rule buildtower_f2zz {
buildy2
{z 0.075} buildtower_f2zz }
rule buildtower_f2zz w 0.2{selectzz} 
//addroof
rule buildtower_f2zz w 0.3{{s 1.9 z -0.05}rooftopf}


rule buildtower_f3zz {
buildy3
{z 0.15} buildtower_f3zz}
rule buildtower_f3zz w 0.2{selectzz}
//addroof
rule buildtower_f3zz w 0.3{{s 1.9 z -0.05}rooftopf} 

//sidetower for f3
rule buildtower_f3zz  w 0.02{
buildy3
{z 0.15}  buildtower_f3zz 
{x 0.7 s 0.7}addf3 }
rule buildtower_f3zz  w 0.02{
buildy3
{z 0.15}  buildtower_f3zz 
{x -0.7 s 0.7}addf3 }
rule buildtower_f3zz  w 0.02{
buildy3
{z 0.15} buildtower_f3zz 
{y 0.7 s 0.7}addf3 }
rule buildtower_f3zz  w 0.02{
buildy3
{z 0.15} buildtower_f3zz 
{y -0.7 s 0.7}addf3 }




rule selectzz {
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.3}bottomsupport
{s 0.8 z 0.3} buildtower_f1zz}
rule selectzz{
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.275}bottomsupport
{s 0.8 z 0.275} buildtower_f2zz}
rule selectzz{
{s 0.8 z -0.2} roofsd
{s 0.8 z 0.35}bottomsupport
{s 0.8 z 0.35} buildtower_f3zz}
rule selectzz {
{s 1.1}bottomsupport
{s 1.1} buildtower_f1zz}
rule selectzz{
{s 1.1}bottomsupport
{s 1.1} buildtower_f2zz}
rule selectzz{
{s 1.1}bottomsupport
{s 1.1} buildtower_f3zz}


















rule buildx1{
{x -0.6 y -0.6} basetower1
{x -0.6 y 0} basetower1
{x -0.6 y 0.6} basetower1
}
rule buildx2{
{x -0.675 y -0.675 s 0.75} basetower1
{x -0.675 y -0.225 s 0.75} basetower1
{x -0.675 y 0.225 s 0.75} basetower1
{x -0.675 y 0.675 s 0.75} basetower1
}
rule buildx3{
{x -0.45 y -0.45 s 1.5} basetower1
{x -0.45 y 0.45 s 1.5} basetower1
}

rule buildy1{
buildx1
{rz 90} buildx1
{rz 180} buildx1
{rz 270} buildx1}
rule buildy2{
buildx2
{rz 90} buildx2
{rz 180} buildx2
{rz 270} buildx2}
rule buildy3{
buildx3
{rz 90} buildx3
{rz 180} buildx3
{rz 270} buildx3}

rule bottomsupport{
buildbottomsupport
{rz 90} buildbottomsupport
{rz 180} buildbottomsupport
{rz 270} buildbottomsupport}

rule buildbottomsupport{
{y 0.94 s 2.05 0.02 0.02}box
{z -0.05 y 0.59 s 1.9 0.78 0.07}box
}



rule roofsd{
buildroofside
{rz 90} buildroofside
{rz 180} buildroofside
{rz 270} buildroofside}


rule buildroofside{
{x 0.8 y -0.8} roofcorner
sr1
6 *{x 0.1} sr1
8 *{x -0.1} sr1
sr2
7 *{x 0.1} sr2
8 *{x -0.1} sr2
}

rule sr1{{y -0.8} roofs_11}
rule sr2{{y -0.8} roofs_12}


rule basetower1{
//{y -0.3 rx 90} b_row_6
{x -0.3 rx 90 ry 270} b_row_6
//{y 0.3 rx 90 ry 180} b_row_6
//{x 0.3 rx 90 ry 90} b_row_6
}







//roof

rule rooftopf{
roofcorner
{rz 90} roofcorner
{rz 180}roofcorner
{rz 270}roofcorner
}

rule roofcorner{
{s 0.1 0.1 0.1}roof1
{s 0.1 0.1 0.1}roof2}
rule roof2{
{x 5.45 rz 90 ry 180 rx -45} roofside}
rule roof1{
{y -5.45 rx 45} roofside}
rule roofside{
{x 6 rx 5} tri6
{x 5.5 y 0.7 rx 5} tri7
{x 5 y 1.4 rx 5} tri7
{x 4.5 y 2.1 rx 5} tri8
{x 4 y 2.8 rx 5} tri8
{x 3.5 y 3.5 rx 5} tri9
{x 3 y 4.2 rx 5} tri9
{x 2.5 y 4.9 rx 5} tri10
{x 2 y 5.6 rx 5} tri10
{x 1.5 y 6.3 rx 5} tri11
{x 1 y 7 rx 5} tri11
}
rule tri6{6 *{x -1}sc}
rule tri7{5 *{x -1}sc}
rule tri8{4 *{x -1}sc}
rule tri9{3 *{x -1}sc}
rule tri10{2 *{x -1}sc}
rule tri11{1 *{x -1}sc}
rule sc {{rz 45 ry 5 s 1 1 0.05 color red} box}
rule sc {{rz 45 ry 5 s 0.95 0.95 0.05 color red} box}
rule sc {{rz 45 ry 5 s 1.05 1.05 0.05 color red} box}






rule roofs_11{
{s 0.1 0.1 0.1}roofs1}
rule roofs_12{
{s 0.1 0.1 0.1}roofs2}

rule roofsp{
{s 0.1 0.1 0.1}roofs_point}

rule roofs1{
{y -5.45 rx 45} roofside_21}
rule roofs2{
{y -5.45 rx 45} roofside_22}

rule roofs_point{
{y -5.45 rx 45} roofpattern
{y 5.45 rx -225} roofpattern}

rule roofpattern{
roofside_31
{x -2.2  y 5 rz 36 s 0.3 12 0.3}box
{y 1.4 x -1} roofside_32
{y 2.8 x -2} roofside_33
{y 4.2 x -3} roofside_34
{y 5.6 x -4} roofside_35
}

rule roofside_31{5 *{y 1.4} roofside_11
5 *{y 1.4} roofside_12}
rule roofside_32{4 *{y 1.4} roofside_11
4 *{y 1.4} roofside_12}
rule roofside_33{3 *{y 1.4} roofside_11
3 *{y 1.4} roofside_12}
rule roofside_34{2 *{y 1.4} roofside_11
2 *{y 1.4} roofside_12}
rule roofside_35{1 *{y 1.4} roofside_11
1 *{y 1.4} roofside_12}

rule roofside_21{
roofside_11
5 *{y 1.4} roofside_11}
rule roofside_22{
roofside_12
5 *{y 1.4} roofside_12}

rule roofside_11{{x 1 rx 5} sc}
rule roofside_12{{x 0.5 y 0.7 rx 5} sc}





//tower
rule br {b_row_6
5 * {y 0.1}b_row_6}

rule b_row_6{{ x -0.35} base_row_6
{x -0.3 color red s 0.1}box}
rule base_row_6 {{x 0.31}rowbase}
rule rowbase{{s 0.5 }rowbase1}
rule rowbase1 {
{s 1.2 0.2 0.08 color grey}box}
rule basex{{s 0.9 1 1}baset}
rule basex{{s 0.85 1 1}baset}
rule basex{{s 0.95 1 1}baset}
rule basey{{s 1 0.9 1}basex}
rule basey{{s 1 0.85 1}basex}
rule basey{{s 1 0.95 1}basex}
rule basez{{s 1 1 0.95}basey}
rule basez{{s 1 1 1}basey}
rule basez{{s 1 1 1.05}basey}
rule baset {
{s 0.2 0.1 0.11 color white}box}