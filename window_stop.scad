$fn = 50;
difference() {
union() {
for(i = [1,-1])
translate([15*i,0,0]) cylinder(r = 6, h = 3, center = true);
cube([30, 12, 3], center = true);
cylinder(r1 = 8/2, r2 = 5/2, h =15);
}
union() {
for(i = [1,-1])
translate([15*i,0,0]) cylinder(r = 2, h = 5, center = true);

}
}