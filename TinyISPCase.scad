$fn = 50;
ww=3;
int_radius = 3.5;
h = 15;
w = 49;

module rounded_cube(w,h,r) {
for(i = [-1,1]) for(j = [-1,1])
translate([(w/2-r)*i, (w/2-r)*j, 0]) cylinder(r = r, h = h, center = true);
cube([w-r,w-r,h],center = true);
for(i = [-1,1]) for(j = [0,1])
rotate([0,0,90*j]) translate([0,(w-r)/2*i,0]) cube([w-2*r,r,h], center = true);
}

module TinyISP() {
translate([0,0,1])
difference() {
union() {
color("green")
rounded_cube(48.5, 2, 3);
color("grey")
translate([0,17/2 + 15,11/2  + 1]) cube([13,17,11], center = true);
}
for(i = [-1,1]) for(j = [-1,1])
translate([42/2*j, 42/2*i, 0]) cylinder(r = 3/2, h = h+2, center = true);
}
}

module TinyISPBox() {
translate([0,0,h/2])
difference() {
union() {
rounded_cube(w + ww*2, h, 7/2);
}
union() {
for(i = [-1,1]) for(j = [-1,1])
translate([42/2*j, 42/2*i, 0]) cylinder(r = 3/2, h = h+2, center = true);
translate([0,0,ww]) rounded_cube(w,h,3);
translate([0,0,-h/2 + ww + 2]) TinyISP();
}
}
}

TinyISPBox();
//translate([0,0,ww + 2]) TinyISP();

//translate([60,0,0]) TinyISP();