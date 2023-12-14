// The height of the switch while horizontal, which will be the amount the switch sticks out from the wall when mounted vertically
SWITCH_HEIGHT=22;

// The depth of the switch while horizontal, which will be the vertical dimension on the wall
SWITCH_DEPTH=85;

// The width of the switch while horizontal, which will still be the width on the wall
SWITCH_WIDTH=152;

// How thick the exterior of the mount should be. This will be doubled for the back panel
SHELL_THICKNESS=3;

// How far the overhand should extend to suppor the switch
OVERHANG = 9;

// The diameter of the screw shaft.
SCREW_HOLE_DIAMETER=4;

$fn = 100;


module screw() {
  union() {
    translate([0,0,SHELL_THICKNESS]) {
      cylinder(h=SHELL_THICKNESS*2, d=SCREW_HOLE_DIAMETER, center=true);
    };
    translate([0,0,SHELL_THICKNESS/2]) {
      cylinder(h=SHELL_THICKNESS, d=SCREW_HOLE_DIAMETER*2, center=true);
    };
  }
}

difference() {
  linear_extrude(SWITCH_DEPTH + (SHELL_THICKNESS)) {
    polygon([
    [-SHELL_THICKNESS, -SHELL_THICKNESS * 2],
    [-SHELL_THICKNESS, SWITCH_HEIGHT + SHELL_THICKNESS],
    [SWITCH_WIDTH + SHELL_THICKNESS, SWITCH_HEIGHT + SHELL_THICKNESS],
    [SWITCH_WIDTH + SHELL_THICKNESS, -SHELL_THICKNESS * 2],
    ]);
  }
  union () {
    linear_extrude(SWITCH_DEPTH + (SHELL_THICKNESS)) {
      polygon([
        [OVERHANG, 0],
        [OVERHANG, SWITCH_HEIGHT + SHELL_THICKNESS],
        [SWITCH_WIDTH - OVERHANG, SWITCH_HEIGHT + SHELL_THICKNESS],
        [SWITCH_WIDTH - OVERHANG, 0],
      ]);
    };
    linear_extrude(SWITCH_DEPTH) {
      polygon([
        [0, 0],
        [0, SWITCH_HEIGHT],
        [SWITCH_WIDTH,SWITCH_HEIGHT],
        [SWITCH_WIDTH,0],
      ]);
    };
  };
  union () {
    translate([SWITCH_WIDTH/3, 0, SWITCH_DEPTH/2]) {
      rotate([90,0,0]) {
        screw();
      };
    };
    translate([SWITCH_WIDTH/1.5, 0, SWITCH_DEPTH/2]) {
      rotate([90,0,0]) {
        screw();
      };
    };
  }
}
