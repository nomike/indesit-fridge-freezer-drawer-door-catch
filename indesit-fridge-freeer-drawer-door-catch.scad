/*
Indesit fridge freezer door catch

Copyright 2024 nomike[AT]nomike[DOT]com

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

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

    hull() {
        cylinder(r=inner_corner_radius, h=total_width+2);
        translate([inner_width, 0, 0]) cylinder(r=inner_corner_radius, h=total_width+2);
        translate([-inner_corner_radius, 0, 0]) cube([inner_width + (inner_corner_radius * 2), 30, total_width+2]);
    }
}
translate([(inner_width / 2) - (connector_cube_width / 2), -3, 0]) cube([connector_cube_width, connector_cube_height + 3, connector_cube_thickness]);
translate([(inner_width / 2) - (connector_cube_width / 2), 5, 0]) cube([connector_cube_width, base_cube_height, 12]);
translate([(inner_width / 2) - (stem_diameter / 2), 5, 0]) cube([stem_diameter, stem_height + 1, total_width]);
translate([(inner_width / 2), connector_cube_height + stem_height + cylinder_diamter / 2, 0]) cylinder(d = cylinder_diamter, h=total_width);
