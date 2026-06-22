// Tray 1 — Skincare / Hair / Body
// Units: 1/5 inch (0.2"). scale(5) → inches, scale(25.4) → mm.
// Footprint: 53u × 38u = 10.6" × 7.6", height: 44u (8.8")
//
// All items raised so tops sit flush at the rim.
// Comb and chapstick use stickout=3 (too thin to pinch at rim level).
// Cantu tub top sits 3u below rim (reach-in access).
//
// Layout:
//   y=1..19  cantu(19×19) │ okeefe(13×13) │ cerave(6×13) │ deo(7×13)
//   y=21..35              │ cleanser(16×9) │ brush(6×15) │ comb(2×6) │ chapstick(4×4)

floor_t  = 1;
cavity_h = 43;
tray_h   = cavity_h + floor_t;
stickout = 3;
wall     = 1;
chamfer  = 1.5;

raise_cantu     = (cavity_h - 3) - 17.5;  // top 3u below rim
raise_okeefe    = cavity_h - 38.5;
raise_cerave    = cavity_h - 30.7;
raise_deo       = cavity_h - 28.15;
raise_cleanser  = cavity_h - 40.0;
raise_brush     = cavity_h - 42.5;
raise_comb      = max(0, cavity_h + stickout - 25);
raise_chapstick = max(0, cavity_h + stickout - 13);

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
        // Hair
        slot( 1,  1, 19, 19, raise_cantu);
        slot(38, 21,  6, 15, raise_brush);
        slot(45, 21,  2,  6, raise_comb);
        // Skin
        slot(21,  1, 13, 13, raise_okeefe);
        slot(35,  1,  6, 13, raise_cerave);
        slot(21, 21, 16,  9, raise_cleanser);
        slot(48, 21,  4,  4, raise_chapstick);
        // Body
        slot(42,  1,  7, 13, raise_deo);
    }
}
