$fn=50;

holeDifference=(18.30+11.9)/2;
holeDiamseter=3.3;
height=7;
thickness=2;
width=8;
length=holeDifference+10;
round=3;


hull() {
    translate([-length/2+round/2,-width/2+round/2,0]) {
        cylinder(h=thickness, d=round);
    }
    translate([length/2-round/2,-width/2+round/2,0]) {
        cylinder(h=thickness, d=round);
    }
    translate([-length/2+round/2,width/2-round/2,0]) {
        cylinder(h=thickness, d=round);
    }
    translate([length/2-round/2,width/2-round/2,0]) {
        cylinder(h=thickness, d=round);
    }
}

translate([-holeDifference/2,0,0]) {
    cylinder(h=height, d=holeDiamseter);
}

translate([holeDifference/2,0,0]) {
    cylinder(h=height, d=holeDiamseter);
}
