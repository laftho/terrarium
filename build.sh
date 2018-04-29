
openscad -o top.png top.scad --render --camera=50,50,0,0,0,0,1100
openscad -o bottom.png bottom.scad --render --camera=50,50,0,0,0,0,1100

openscad -o top.svg top.scad
openscad -o bottom.svg bottom.scad

openscad -o top.dxf top.scad
openscad -o bottom.dxf bottom.scad
