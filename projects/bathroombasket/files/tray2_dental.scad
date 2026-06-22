// Tray 2 — Dental / Oral Care
// Units: 1/5 inch (0.2"). scale(5) → inches, scale(25.4) → mm.
// Footprint: 53u × 38u = 10.6" × 7.6", height: 58u (11.6")
//
// All items raised so tops sit flush at the rim.
// Toothbrush charger against left outer wall; USB-A hole pierces that wall.
//
// Layout:
//   y=1..12   toothbrush(10×10) │ toothpaste(9×12) │ night_toothpaste(9×12) │ tongue_scraper(4×12)
//   y=14..29  night_guard(6×16) │
//   y=14..36                    │ listerine(19×23)

floor_t  = 1;
cavity_h = 57;
tray_h   = cavity_h + floor_t;
wall     = 1;
chamfer  = 1.5;

raise_toothbrush       = cavity_h - 56.25;
raise_listerine        = cavity_h - 56.25;
raise_toothpaste       = cavity_h - 42.5;
raise_night_toothpaste = cavity_h - 30;
raise_tongue_scraper   = cavity_h - 36;
raise_night_guard      = cavity_h - 6;

// USB-A hole through left wall into toothbrush charger slot
// Charger slot: x=1..10, y=1..10. Hole centered in y at y=4..7, z at floor+2..floor+4
usb_w = 3;  // ~0.6" wide
usb_h = 2;  // ~0.4" tall

module slot(x, y, w, d, raise) {
    translate([x, y, floor_t + raise])
        cube([w, d, tray_h - floor_t - raise + 1]);
    if (chamfer > 0) {
        translate([x, y, tray_h - chamfer])
            rotate([-45, 0, 0])
                cube([w, chamfer * sqrt(2), chamfer * sqrt(2)]);
    }
}

W = 53; D = 38;

scale(25.4) scale(5) {
    difference() {
        cube([W, D, tray_h]);
        // Front row
        slot( 1,  1, 10, 10, raise_toothbrush);
        slot(12,  1,  9, 12, raise_toothpaste);
        slot(22,  1,  9, 12, raise_night_toothpaste);
        slot(32,  1,  4, 12, raise_tongue_scraper);
        // Back row
        slot( 1, 14,  6, 16, raise_night_guard);
        slot( 8, 14, 19, 23, raise_listerine);
        // USB-A cable hole through left outer wall
        translate([-0.5, 4, floor_t + 2])
            cube([wall + 1, usb_w, usb_h]);
    }
}
