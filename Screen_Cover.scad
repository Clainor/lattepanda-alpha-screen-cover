//// LattePanda original values:
// screen_y_view = 87;
// screen_y_size = 97.5;
// screen_x_view = 156;
// screen_x_size = 165;
// x_offset = 2;
// y_offset = 7;
// border = 2.5;
//
// panda_holes_x = 81.5;
// panda_holes_y = 63.5;

//// Additionnal values for LattePanda original:
// back_border = 6;
// screen_height = 3;
// titan_holes = 0;
// titan_mount = false;
// board_mount = true;

screen_y_view = 107;
screen_y_size = 111;
screen_x_view = 175;
screen_x_size = 179;
x_offset = 2;
y_offset = 2;
border = 3;

panda_holes_x = 113;
panda_holes_y = 76;
titan_holes = 75.5;
titan_mount = true;
board_mount = false;

back_border = 6;
screen_height = 6;

// Screen_Front();
// Screen_Back();
Base();

module Base(){
	difference(){
		union(){
			hull(){
			sphere(r = 5);
			translate([120, 0, 0]) sphere(r = 5);
			}
			hull(){
			translate([60, 0, 0])	sphere(r = 5);
			translate([60, 50, 0]) sphere(r = 5);
			}
			sphere(r = 25);
			translate([120, 0, 0]) sphere(r = 25);
			translate([60, 0, 0]) sphere(r = 10);
		}
		translate([0, -(screen_height + 8), 15])	rotate([-30, 0, 0])	Cover_Cut();
		translate([-30 , -30, -25])	cube([200, 200, 25]); 
	}
}

module Cover_Cut(){
		translate([-30, 0, 0])	cube([175, (screen_height + 6), 20]);
		translate([60, (screen_height + 8), 0])	rotate([90, 0, 0])	cylinder(r = 8, h = (screen_height + 8));
		translate([58, (screen_height + 7), -7.5])	cube([4, 4, 30]);
}

module Panda_Mount(){
	cylinder(r = 3, h = 8);
	translate([panda_holes_x, 0, 0])	cylinder(r = 3, h = 8);
	translate([panda_holes_x, panda_holes_y, 0])	cylinder(r = 3, h = 8);
	translate([0, panda_holes_y, 0])	cylinder(r = 3, h = 8);
}

module Panda_Holes(){
	cylinder(r = 1.6, h = 9);
    translate([panda_holes_x, 0, 0])   cylinder(r = 1.6, h = 9);
	translate([panda_holes_x, panda_holes_y, 0])    cylinder(r = 1.6, h = 9);
    translate([0, panda_holes_y, 0])    cylinder(r = 1.6, h = 9);
}

module Titan_Mount() {
    cylinder(r = 4, h = 7);
    translate([titan_holes, 0, 0]) cylinder(r = 4, h = 7);
}

module Titan_Holes() {
    translate([0, 0, 4.8]) cylinder(r = 2.1, h = 8);
    translate([titan_holes, 0, 4.8]) cylinder(r = 2.1, h = 8);
    cylinder(r = 3.6, h = 4.2);
    translate([titan_holes, 0, 0]) cylinder(r = 3.6, h = 4.2);
}

module Screen_Back(){
    // Local variables
    panda_hole_initial_x = (((border * 2) + screen_x_size) / 2) - (panda_holes_x / 2);
    panda_hole_initial_y = (((border * 2) + screen_y_size) / 2) - (panda_holes_y / 2);
    
	difference(){
        // Frame
		union(){
			hull(){
				cylinder(r = 4, h = 5);
				translate([0, (border * 2) + screen_y_size, 0])	cylinder(r = 4, h = 5);
				translate([(border * 2) + screen_x_size, (border * 2) + screen_y_size, 0])	cylinder(r = 4, h = 5);
				translate([(border * 2) + screen_x_size, 0, 0])	cylinder(r = 4, h = 5);
			}
			translate([((border * 2) + screen_x_size) / 2, -3, 0])	cylinder(r = 5, h = 5);
			translate([((border * 2) + screen_x_size) / 2, (border * 2) + screen_y_size + 3, 0])	cylinder(r = 5, h = 5);
            // Board mount
            if (board_mount) {
                translate([panda_hole_initial_x, panda_hole_initial_y, 0])	Panda_Mount();
            }
            // Titan mount
            if (titan_mount) {
                translate([((border * 2) + screen_x_size) / 2 - titan_holes / 2, screen_y_size / 2 + back_border, 0]) Titan_Mount();
            }
		}
        
        // Hex nut holes
		translate([0, 0, 1.5])	cylinder(r = 6.5 / 2, h = 3.6, $fn = 6);
		translate([0, (border * 2) + screen_y_size, 1.5])	cylinder(r = 6.5 / 2, h = 3.6, $fn = 6);
		translate([(border * 2) + screen_x_size, (border * 2) + screen_y_size, 1.5])	cylinder(r = 6.5 / 2, h = 3.6, $fn = 6);
		translate([(border * 2) + screen_x_size, 0, 1.5])	cylinder(r = 6.5 / 2, h = 3.6, $fn = 6);

		translate([((border * 2) + screen_x_size) / 2, -3, 1.5])	cylinder(r = 6.5 / 2, h = 4, $fn = 6);
		translate([((border * 2) + screen_x_size) / 2, (border * 2) + screen_y_size + 3, 1.5])	cylinder(r = 6.5  / 2, h = 4, $fn = 6);

        // Screw holes
		translate([((border * 2) + screen_x_size) / 2, -3, 0])	cylinder(r = 1.6, h = 5, $fn = 6);
		translate([((border * 2) + screen_x_size) / 2, (border * 2) + screen_y_size + 3, 0])	cylinder(r = 1.6, h = 5, $fn = 6);
		cylinder(r = 1.6, h = 5);
		translate([0, (border * 2) + screen_y_size, 0])	cylinder(r = 1.6, h = 5);
		translate([(border * 2) + screen_x_size, (border * 2) + screen_y_size, 0])	cylinder(r = 1.6, h = 5);
		translate([(border * 2) + screen_x_size, 0, 0])	cylinder(r = 1.6, h = 5);

        // Screen cable hole // translate([52, 5, 0])	cube([25, 3, 5]); // 58 for Alpha
		translate([panda_hole_initial_x + back_border, back_border - 1, 0])	cube([panda_holes_x - (back_border * 2), 3, 6]);
	
        // Frame holes 
            // Origin left hole
		translate([back_border, back_border, 0])	cube([(panda_hole_initial_x - back_border * 2), screen_y_size - back_border, 6]);
            // Origin right hole
		translate([back_border + panda_hole_initial_x + panda_holes_x , back_border, 0])	cube([(panda_hole_initial_x - back_border * 2), screen_y_size - back_border, 6]);
            // Origin middle low hole
		translate([panda_hole_initial_x + back_border, back_border * 2, 0])	cube([panda_holes_x - (back_border * 2), (screen_y_size / 2) - (back_border * 2), 6]);
            // Origin middle high hole
		translate([panda_hole_initial_x + back_border, (screen_y_size / 2) + back_border * 2, 0])	cube([panda_holes_x - (back_border * 2), (screen_y_size / 2) - (back_border * 2), 6]);

        // Mount holes
        if (board_mount) {
            translate([(((border * 2) + screen_x_size) / 2) - (panda_holes_x / 2), (((border * 2) + screen_y_size) / 2) - (panda_holes_y / 2), 0])	Panda_Holes();
        }
        
        // Titan holes
        if (titan_mount) {
            translate([((border * 2) + screen_x_size) / 2 - titan_holes / 2, screen_y_size / 2 + back_border, 0]) Titan_Holes();
        }
	}
	
}


module Screen_Front(){	
	difference(){
        // Frame
		union(){
			hull(){
				cylinder(r = 4, h = screen_height + 1);
				translate([0, (border * 2) + screen_y_size, 0])	cylinder(r = 4, h = screen_height + 1);
				translate([(border * 2) + screen_x_size, (border * 2) + screen_y_size, 0])	cylinder(r = 4, h = screen_height + 1);
				translate([(border * 2) + screen_x_size, 0, 0])	cylinder(r = 4, h = screen_height + 1);
			}
            // Middle screw holes
			translate([((border * 2) + screen_x_size) / 2, -3, 0])	cylinder(r = 5, h = screen_height + 1);
			translate([((border * 2) + screen_x_size) / 2, (border * 2) + screen_y_size + 3, 0])	cylinder(r = 5, h = screen_height + 1);
		}
        
        // Original LattePanda
//        translate([border + x_offset + 1, border + y_offset - 4, 0])	cube([screen_x_view, screen_y_view, 5]);
//		translate([border + 1, border, .5])	cube([screen_x_size, screen_y_size, 5]);
        
        // Screen holder
		translate([border + x_offset + 1, border + y_offset, 0])	cube([screen_x_view, screen_y_view, screen_height + 2]);
		translate([border + 1, border, .6])	cube([screen_x_size, screen_y_size, screen_height + 2]);

        // Holes for mounting
		translate([((border * 2) + screen_x_size) / 2, -3, 0])	cylinder(r = 3.1, h = 3.6);
		translate([((border * 2) + screen_x_size) / 2, (border * 2) + screen_y_size + 3, 0])	cylinder(r = 3.1, h = 3.6);
		cylinder(r = 3.1, h = 3.6);
		translate([0, (border * 2) + screen_y_size, 0])	cylinder(r = 3.1, h = 3.6);
		translate([(border * 2) + screen_x_size, (border * 2) + screen_y_size, 0])	cylinder(r = 3.1, h = 3.6);
		translate([(border * 2) + screen_x_size, 0, 0])	cylinder(r = 3.1, h = 3.6);

        // Frame holes
		translate([0, 0, screen_height + 0.8])	cylinder(r = 1.6, h = screen_height);
		translate([0, (border * 2) + screen_y_size, screen_height + 0.8])	cylinder(r = 1.6, h = screen_height);
		translate([(border * 2) + screen_x_size, (border * 2) + screen_y_size, screen_height + 0.8])	cylinder(r = 1.6, h = screen_height);
		translate([(border * 2) + screen_x_size, 0, screen_height + 0.8])	cylinder(r = 1.6, h = screen_height);
		translate([((border * 2) + screen_x_size) / 2, -3, screen_height + 0.8])	cylinder(r = 1.6, h = screen_height);
		translate([((border * 2) + screen_x_size) / 2, (border * 2) + screen_y_size + 3, screen_height + 0.8])	cylinder(r = 1.6, h = screen_height);
	}
}