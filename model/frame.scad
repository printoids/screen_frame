include <BOSL/constants.scad>
use <BOSL/shapes.scad>


module frame() {
    module hole() {
        translate([0, 0, -7])
            cube([5.5, 2.8, 20], true);
        
        translate([0, 2.5, 0])
            cube([5.5, 5, 3.2], true);

    }
    
    translate([0, 0, 95]) {
        difference() {
            translate([0, 2, 0]) cube([225, 8, 190], true);
            
            translate([0, -4.5, 7])
                rotate([-90, 0, 0])
                prismoid(size1=[220, 169], size2=[210, 157.5], h=4.01);
            
            translate([0, 2, 2.1]) cube([217.8, 5, 175.4], true);
            translate([0, 2, -70]) cube([190, 5, 40], true);
            
            translate([0, 12, 0]) cube([221, 20, 184], true);
            
            translate([103, 0, -89]) 
                hole();
            
            translate([-103, 0, -89]) 
                hole();
        }
    }
    
    translate([-111, 4, 187])
        rotate([-90, 0, 0])
        linear_extrude(2)
        polygon([[0, 0], [10, 0], [0, 10]]);
    
    mirror([1, 0, 0])
        translate([-111, 4, 187])
        rotate([-90, 0, 0])
        linear_extrude(2)
        polygon([[0, 0], [10, 0], [0, 10]]);
}

module back() {
    difference() {
        union () {
            translate([0, 2, 183.5 / 2]) cube([220.5, 4, 183.5], true);
            
            translate([0, 5, 15])
                cube([166, 2, 30], true);
        }
        
        translate([0, 4, 106]) cube([210, 4, 145], true);

        
        rotate([-90, 0, 0])
            translate([103, -2.75, -5])
            cylinder(10, 1.6, 1.6, $fn=30);
        
        rotate([-90, 0, 0])
            translate([-103, -2.75, -5])
            cylinder(10, 1.6, 1.6, $fn=30);
        
        translate([-111, 1.8, 183.6])
            rotate([-90, 0, 0])
            linear_extrude(3)
            polygon([[0, 0], [10.5, 0], [0, 10.5]]);
        
        mirror([1, 0, 0])
            translate([-111, 1.8, 183.6])
            rotate([-90, 0, 0])
            linear_extrude(3)
            polygon([[0, 0], [10.5, 0], [0, 10.5]]);
        
        translate([24.5, -2, 30])
            difference() {
                cube([57, 25, 67]);
            }
            
        translate([0, 1, 15])
            cube([162, 6, 26], true);
            
        translate([53, 4, 23])
            cube([40, 10, 26], true);
        
        translate([53, -0.5, 15])
            cube([40, 10, 26], true);
    }
    
    translate([0, 3, 106]) cube([4, 2, 145], true);
    translate([0, 3, 106]) cube([210, 2, 4], true);
    translate([104, 3, 177]) rotate([0, 45, 0]) cube([10, 2, 4], true);
    mirror([1, 0, 0]) translate([104, 3, 177]) rotate([0, 45, 0]) cube([10, 2, 4], true);
    
    translate([20, 4, 15])
        cube([2, 2, 26], true);
    
    translate([-30, 4, 15])
        cube([2, 2, 26], true);
    
    difference() {
        union() {
            translate([83, 4, -3.2])
                rotate([90, 0, 90])
                linear_extrude(10)
                polygon([
                    [0, 3.2], [3.2, 0], [25, 0], [25, 2], [0, 25]
                ]);
            
            translate([-93, 4, -3.2])
                rotate([90, 0, 90])
                linear_extrude(10)
                polygon([
                    [0, 3.2], [3.2, 0], [25, 0], [25, 2], [0, 25]
                ]);
            }
        
        translate([-100, 8, -1]) cube([300, 3, 3]);
        translate([-100, 18, -1]) cube([300, 3, 3]);
    }
    
    translate([53, 11, 64])
    rotate([90, -90, 0]) 
    difference() {
        %translate([0, 0, 0.8]) controller();
        controller_box();
    }   
}

module controller_box() {
    module support() {
        difference() {
            cube([7, 7, 10]);
            
            translate([-2, 7.5, 10])
                rotate([45, 0, -45])
                translate([0, 0, -20])
                cube([20, 20, 20]);
            
            translate([4.15, 4.15, -5])
                cylinder(20, 1.4, 1.4, $fn=40);
        }
    }
    
    difference() {
        union() {
            translate([0, 0, -2]) cube([69, 60, 26], true);
            translate([-40, 0, 3]) cube([30, 44, 6], true);
        }
        translate([0, 0, 6.5]) cube([65.5, 57, 40], true);
        translate([-30, 0, 11]) cube([48, 40, 20], true);
        translate([21.5, -30, 3.1]) cube([8, 10, 3], true);
    }
    
    translate([-33, -28.5, -10]) support();
    mirror([0, 1, 0]) translate([-33.1, -28.6, -10]) support();
    mirror([0, 1, 0]) translate([-33.1, -28.6, -10]) support();
    mirror([1, 0, 0]) translate([-33.1, -28.6, -10]) support();
    mirror([0, 1, 0]) mirror([1, 0, 0]) translate([-33.1, -28.6, -10]) support();
}

module controller() {
    $fn=30;
    difference() {
        cuboid([65, 56.5, 1.6], fillet=3.5, edges=EDGES_Z_ALL, $fn=20);
        translate([28.85, 24.35, -1]) cylinder(5, 1.5, 1.5);
        translate([28.85, -24.35, -1]) cylinder(5, 1.5, 1.5);
        translate([-28.85, 24.35, -1]) cylinder(5, 1.5, 1.5);
        translate([-28.85, -24.35, -1]) cylinder(5, 1.5, 1.5);
    }
    
    translate([0, 25, -7.5]) cube([51.3, 5, 13.5], true);
    translate([31, 0, 5]) cube([2.6, 33, 8.5], true);
    translate([21.5, -26, 2.3]) cube([8, 6, 3], true);
    translate([-29.5, 6.5, 1.8]) cube([6, 24, 2], true);
}


module screen() {
    cube([216.7, 174.4, 1], true);
    translate([0, 5, 0]) color("#eeec") cube([209.66, 157.25, 1.1], true);
    translate([0, -79.2, -1]) cube([146, 20, 3], true);
    
    translate([47.4, -69.2, -4]) cube([22, 26, 3]);    
}

%translate([0, 0.5, 174.4 / 2 + 10]) rotate([90, 0, 0]) screen();


intersection() {
    union () {
        translate([0, 2, 3.25]) back();
        frame();
    }
}    
    