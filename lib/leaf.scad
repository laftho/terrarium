use <pentagon.scad>
use <vent.scad>

module Leaf(size=100, vented=false) {
    mid = pmid(size);
    difference() {
        color("purple") Pentagon(size);
        if (vented) translate(mid) vent(size/3);
    }
    
    p = pentagon_points(size);
    
    spacer = [0.01, 0, 0];
    
    translate(p[0]) {
        rotate(-108) {
            translate(spacer) color("blue") PVentagon(size, vented);
        }
    }
    
    translate(p[1]) {
        rotate(-36) {
            translate(spacer) color("red") PVentagon(size, vented);
        }
    }
    
    translate(p[2]) {
        rotate(36) {
            translate(spacer) color("green") PVentagon(size, vented);
        }
    }
    
    translate(p[3]) {
        rotate(108) {
            translate(spacer) color("yellow") PVentagon(size, vented);
        }
    }
    
    translate(p[4]) {
        rotate(180) {
            translate(spacer) color("brown") PVentagon(size, vented);
        }
    }
}

module PVentagon(size=10, vented=false) {
    if (vented) {
        Ventagon(size);
    } else {
        Pentagon(size);
    }
}

// test

Leaf(100);

translate([450, 0, 0]) Leaf(100, true);

