$fn=64;
cylinder_diamter = 8;
total_width = 12;
stem_diameter = 2.4;
stem_height = 2;

stem_width = total_width - 4;

corner_radius = 3;
inner_width = 26;
wall_strength = 3;

inner_corner_radius = corner_radius - wall_strength;
inner_inner_width = inner_width - (wall_strength * 2);

connector_cube_width = 5;
connector_cube_height = 5;
connector_cube_thickness = 4;
base_cube_height = 1;

difference() {
    hull() {
        cylinder(r=corner_radius, h=total_width);
        translate([inner_width, 0, 0]) cylinder(r=corner_radius, h=total_width);
        translate([-corner_radius, 0, 0]) cube([inner_width + (corner_radius * 2), 20.4 - corner_radius, total_width]);
    }

    color("green") hull() {
        cylinder(r=inner_corner_radius, h=total_width+2);
        translate([inner_width, 0, 0]) cylinder(r=inner_corner_radius, h=total_width+2);
        translate([-inner_corner_radius, 0, 0]) cube([inner_width + (inner_corner_radius * 2), 30, total_width+2]);
    }
}
color("red") translate([(inner_width / 2) - (connector_cube_width / 2), -3, 0]) cube([connector_cube_width, connector_cube_height + 3, connector_cube_thickness]);
translate([(inner_width / 2) - (connector_cube_width / 2), 5, 0]) cube([connector_cube_width, base_cube_height, 12]);
translate([(inner_width / 2) - (stem_diameter / 2), 5, 0]) cube([stem_diameter, stem_height + 1, total_width]);
translate([(inner_width / 2), connector_cube_height + stem_height + cylinder_diamter / 2, 0]) cylinder(d = cylinder_diamter, h=total_width);


// translate([(inner_width / 2) - stem_diameter, 0, 4]) union() {
//     // cylinder(d = 8, h=stem_width);
//     translate([0, 0, 0]) ;
// }



// %difference() {
//     cube([10, 20, 10]);
//     translate([0, 1, 0]) cube([9, 18, 10]);
// }