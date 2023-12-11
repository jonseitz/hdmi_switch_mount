SWITCH_HEIGHT=22;
SWITCH_DEPTH=71;
SWITCH_WIDTH=150;

SHELL_THICKNESS=3;

SCREW_HOLE=4;

$fn = 100;


module screw() {
  union() {
    translate([0,0,SHELL_THICKNESS]) {
      cylinder(h=SHELL_THICKNESS*2, d=SCREW_HOLE, center=true);
    };
    translate([0,0,SHELL_THICKNESS/2]) {
      cylinder(h=SHELL_THICKNESS, d=SCREW_HOLE*2, center=true);
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
        [SHELL_THICKNESS * 2, 0],
        [SHELL_THICKNESS * 2, SWITCH_HEIGHT + SHELL_THICKNESS],
        [SWITCH_WIDTH - (SHELL_THICKNESS * 2), SWITCH_HEIGHT + SHELL_THICKNESS],
        [SWITCH_WIDTH - (SHELL_THICKNESS * 2), 0],
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
    translate([SWITCH_WIDTH/3, 0, SWITCH_DEPTH/2,]) {
      rotate([90,0,0]) {
        screw();
      };
    };
    translate([SWITCH_WIDTH/1.5, 0, SWITCH_DEPTH/2,]) {
      rotate([90,0,0]) {
        screw();
      };
    };
  }
}
