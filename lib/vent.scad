use <pentagon.scad>

module pvent(size=10, edge=1) {
    dots = pentagon_points(size);
    mid = pmid(size);
    translate([-mid[0], -mid[1]]) {
        translate(dots[0]) vent(edge);
        translate(dots[1]) vent(edge);
        translate(dots[2]) vent(edge);
        translate(dots[3]) vent(edge);
        translate(dots[4]) vent(edge);
    }
}

module vent(size=10) {
    points = pentagon_points(size);
    
    mid = pmid(size);
    translate([-mid[0], -mid[1], 0]) {
        translate(mid) hole(size);
        translate(points[0]) hole(size/3);
        translate(points[1]) hole(size/3);
        translate(points[2]) hole(size/3);
        translate(points[3]) hole(size/3);
        translate(points[4]) hole(size/3);
    }
}

module Ventagon(edge=10) {
    difference() {
        Pentagon(edge);
        vsize = 8;
        
        translate(pmid(edge)) {
            vent(vsize);
        
            pvent(edge/3, vsize);
            rotate(36) pvent(edge/2, vsize);
            pvent(edge/1.5, vsize);
        }  
    }
}

module hole(size=1) {
     scale([1/100, 1/100, 1/100]) circle(d=size * 100);
}

//test
Ventagon(10);

