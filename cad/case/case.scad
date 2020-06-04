$fn=40; // defines the resolution for calculation by OpenSCAD

use <./laser-cut-box/pcbbox/box.scad>;

extend=10;
thickness=5;

pcbHoles=4.318;
pcbWidth=100.154;
pcbHeight=87.007;
pcbXPos=58;
pcbYPos=0.5;
pcbZPos=5;


heatingPlateSize=214;
heatingPlateGap=2;
heatingPlateThickness=2.2;

// position of the 4 corner screws that allows to close the box
screwDiameter=4;
screwDistance=10+screwDiameter/2; // distance from internal corner to center of screw

externalSize=heatingPlateSize-2*heatingPlateGap-2*extend;
internalSize=externalSize-2*thickness;

box(
    3d=false, // true: render as 3D, false: render as 2D (for laser cutting)
    width=externalSize, // width of the box
    depth=externalSize, // depth of the box
    height=70, // height of the box
    thickness=thickness, // thickness of the wood
    fingerWidth=undef, // if undefine 2 times the thickness
    labelsSize=10, 
    showLabels=true,
    extends=[extend,extend,0,0,0,0],
    labels=["Top","Bottom","Left","Right","Front","Back"],
    space=2, // space between the parts when rendering as 2D
    active=[1,1,1,1,1,1],  // side that should be displayed
    specialFingers=[1,1,1,1,1,1],
                        // for a normal box you should leave the default. However what is currently
                        // supported is to specify either on 'top' (first element of the array) or the
                        // 'bottom' (second element in the array) that is is fully female (2) or male (3).
    holes=[ // relative to the inside of the box
        [
            // the screws
             [screwDistance,screwDistance,screwDiameter],
             [internalSize-screwDistance,screwDistance,screwDiameter],
             [internalSize-screwDistance,internalSize-screwDistance,screwDiameter],
             [screwDistance,internalSize-screwDistance,screwDiameter],
        ], // top
        [
            // the screws
             [screwDistance,screwDistance,screwDiameter],
             [internalSize-screwDistance,screwDistance,screwDiameter],
             [internalSize-screwDistance,internalSize-screwDistance,screwDiameter],
             [screwDistance,internalSize-screwDistance,screwDiameter],
             // PCB screws
             
        ], // bottom
        [], // left
        [], // right
        [], // front
        [] // back
    ]
);
