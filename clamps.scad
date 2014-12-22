$fn = 505;
radius = 8/2;
h = 8;
ww = 3; //wall width

module rod_end_2(radius, h, ww, tube_r) {
difference() {
union() {
translate([0,-ww*2,0]) rotate([0,0,0]) cylinder(r = 3*ww/2, h = h, center = true);
translate([0,0,0]) cube([ww*3, ww*4, h], center = true);
translate([0,ww*2,0]) rotate([0,0,180]) cylinder(r = 3*ww/2, h = h, center = true);
}
rotate([90,0,0]) cylinder(r = tube_r, h = 100, center = true);
translate([0,2*ww,0]) rotate([0,0,180]) cylinder(r = 3/2, h = 100, center = true);
}
}

module rod_end(radius, h, ww, tube_r) {
difference() {
union() {
for(i=[1,-1])
translate([ww*i,0, 0]) rotate([90,-90,90]) connector(); 
translate([0,ww,0]) cube([ww*3, ww*2, h], center = true);
translate([0,ww*2,0]) rotate([0,0,180]) cylinder(r = 3*ww/2, h = h, center = true);
}
//translate([0,-ww,0]) rotate([90,0,180]) cylinder(r = tube_r, h = 100);
translate([0,2*ww,0]) rotate([0,0,180]) cylinder(r = 3/2, h = 100, center = true);
}
}

module connector() {
difference() {
union() {
translate([0,ww*2,0]) cylinder(r = h/2, h = ww, center = true);
translate([0,ww/2,0]) cube([h, ww*3, ww], center = true);
}
translate([0,ww*2,0]) cylinder(r = 3/2, h = ww+2, center = true);
}
}

module band(radius, h, ww) {
difference() {
union() {
cylinder(r = radius + ww, h = h, center = true); //outer band

for(i=[1,-1]) //connectors
translate([(radius)*i,ww,0]) rotate([90,i*90,0]) connector(radius, h, ww);
}
union() {
cylinder(r = radius, h = h + 2, center = true);
translate([0,ww/2-100,0]) cube([(radius + ww)*2, 200, h+1], center=true);
}
}
}

module clamp(radius, h, ww) {
translate([0,0,h/2]){
translate([0,radius+ww,0]) rotate([90,90,90]) connector(radius, h, ww);
band(radius, h, ww);
scale([1,-1,1]) band(radius, h, ww);
}
}

module demo() {
translate([0,radius+ww*3,h/2])
rotate([15,0,0])
translate([0,ww*2,0])
{
translate([0,ww*2,h]) rotate(160) translate([0, -ww*2, 0]) {
rod_end_2(radius, h, ww, 4.5/2);
#rotate([90,90,0]) cylinder(r = 4.5/2, h =50);
}
rod_end(radius, h, ww, 4.5/2);
}
clamp(radius, h, ww);
%cylinder(r = radius, h = 20);
}



demo();
//translate([0,0,h/2]) rod_end_2(radius, h, ww, 4.5/2);