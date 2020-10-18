$fn=50;

magnetDiameter=20;
magnetThickness=5.2+0.5;

thickness=2;

axisDiameter=5.05;
cutSize=0.5;

extraHeight=6;
totalHeight=20;

difference() {
    union() {
        // axis of the stepper
        cylinder(h = totalHeight, d=axisDiameter+2*thickness);


        // walls
        translate([-magnetDiameter/2-axisDiameter/2-thickness,-magnetDiameter/2-thickness,0]) {
            cube([magnetDiameter+axisDiameter+2*thickness,thickness,2*thickness+magnetThickness]);
        }
        translate([-magnetDiameter/2-axisDiameter/2-thickness,+magnetDiameter/2,0]) {
            cube([magnetDiameter+axisDiameter+2*thickness,thickness,2*thickness+magnetThickness]);
        }

        // top layer
        translate([0,0,thickness+magnetThickness]) {
            translate([-magnetDiameter/2-axisDiameter/2-thickness,-magnetDiameter/2-thickness,0]) {
                cube([magnetDiameter+axisDiameter+2*thickness,magnetDiameter+2*thickness,thickness]);
            }
            translate([-(thickness+axisDiameter/2+magnetDiameter/2),0,0]) {
                cylinder(h = thickness, d=magnetDiameter+2*thickness);
            }
            translate([+(thickness+axisDiameter/2+magnetDiameter/2),0,0]) {
                cylinder(h = thickness, d=magnetDiameter+2*thickness);
            } 
        }
        // bottom layer
        translate([-magnetDiameter/2-axisDiameter/2-thickness,-magnetDiameter/2-thickness,0]) {
            cube([magnetDiameter+axisDiameter+2*thickness,magnetDiameter+2*thickness,thickness]);
        }
        translate([-(thickness+axisDiameter/2+magnetDiameter/2),0,0]) {
            cylinder(h = thickness, d=magnetDiameter+2*thickness);
        }
        translate([+(thickness+axisDiameter/2+magnetDiameter/2),0,0]) {
            cylinder(h = thickness, d=magnetDiameter+2*thickness);
        } 
    };
    translate([0,0,extraHeight]) {
        difference() {
            cylinder(h = totalHeight, d=axisDiameter);
            translate([-axisDiameter/2,axisDiameter/2-cutSize,0]) {
                cube([axisDiameter, axisDiameter, totalHeight]);
            }
        }
    }
}
