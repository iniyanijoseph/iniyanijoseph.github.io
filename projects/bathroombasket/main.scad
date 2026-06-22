// Bathroom Organizer
// Internal units: 1/5 inch (0.2")
// scale(5) → inches
// scale(25.4) → mm for slicer

floor_t  = 1;      // solid floor thickness (units)
cavity_h = 40;     // slot cavity depth
tray_h   = cavity_h + floor_t;
stickout = 3;      // desired protrusion above rim
wall     = 1;      // wall thickness

// ---------- Heights ----------

// Pump bottles: top flush with rim
raise_okeefe   = cavity_h - 38.5;
raise_cerave   = cavity_h - 30.7;
raise_cleanser = cavity_h - 40.0;

// Non-pump items
raise_deo       = max(0, cavity_h + stickout - 28.15);
raise_comb      = max(0, cavity_h + stickout - 25);
raise_chapstick = max(0, cavity_h + stickout - 13);
raise_brush     = max(0, cavity_h + stickout - 42.5);

// Cantu: 3u below rim
raise_cantu = max(0, (cavity_h - 3) - 17.5);

// Dental
raise_toothbrush = max(0, cavity_h + stickout - 56.25);
raise_toothpaste = max(0, cavity_h + stickout - 42.5);
raise_nightpaste = max(0, cavity_h + stickout - 30);
raise_nightguard = max(0, cavity_h + stickout - 6);
raise_scraper    = max(0, cavity_h + stickout - 36);
raise_mouthwash  = max(0, cavity_h - 56.25); // flush

// Shaving
raise_gel        = max(0, cavity_h + stickout - 42.5);
raise_aftershave = max(0, cavity_h + stickout - 33.125);
raise_razor      = max(0, cavity_h + stickout - 27.5);
raise_shavette   = max(0, cavity_h + stickout - 42.5);
raise_trimmer    = max(0, cavity_h + stickout - 33.75);

chamfer = 1.5;

// ---------- Slot Module ----------

module slot(x, y, w, d, raise) {
    translate([x, y, floor_t + raise])
        cube([w, d, tray_h - floor_t - raise + 1]);

    if (chamfer > 0) {
        translate([x, y, tray_h - chamfer])
            rotate([-45, 0, 0])
                cube([w,
                      chamfer * sqrt(2),
                      chamfer * sqrt(2)]);
    }
}

// ---------- Overall Dimensions ----------
// 64u = 12.8"
// 100u = 20"
W = 64;
D = 100;

scale(25.4)
scale(5)
difference() {

    cube([W, D, tray_h]);

    // =========================================================
    // EXISTING ITEMS
    // =========================================================

    // --- Skin care (front-left) ---
    slot( 1,  1, 13, 13, raise_okeefe);     // O'Keefe pump
    slot(15,  1,  6, 13, raise_cerave);     // CeraVe pump
    slot( 1, 15, 16,  9, raise_cleanser);   // Cleanser
    slot(30,  8,  4,  4, raise_chapstick);  // Chapstick

    // --- Body ---
    slot(22,  1,  7, 13, raise_deo);        // Speed Stick

    // --- Hair ---
    slot( 1, 25, 19, 19, raise_cantu);      // Cantu
    slot(21, 25,  6, 15, raise_brush);      // Brush
    slot(28, 25,  2,  6, raise_comb);       // Comb

    // =========================================================
    // DENTAL
    // =========================================================

    slot( 1, 45, 10, 10, raise_toothbrush); // Toothbrush charger
    slot(12, 45,  9, 12, raise_toothpaste); // Toothpaste
    slot(22, 45,  9, 12, raise_nightpaste); // Night toothpaste
    slot(32, 45,  6, 16, raise_nightguard); // Night guard
    slot(39, 45,  4, 12, raise_scraper);    // Tongue scraper
    slot(44, 45, 19, 23, raise_mouthwash);  // Mouthwash

    // =========================================================
    // SHAVING
    // =========================================================

    slot( 1, 70, 11, 11, raise_gel);        // Shaving gel
    slot(13, 70, 10,  4, raise_aftershave); // Aftershave
    slot(24, 70,  4,  5, raise_razor);      // Clip razor
    slot(29, 70,  3, 11, raise_shavette);   // Shavette

    // Trimmer charger base against back wall
    slot(33, 82, 12, 16, raise_trimmer);    // Trimmer

    // =========================================================
    // CABLE CHANNELS THROUGH BACK WALL
    // =========================================================

    // Toothbrush charger cable channel
    translate([5, D - wall, floor_t])
        cube([2, wall + 1, tray_h]);

    // Trimmer charger cable channel
    translate([38, D - wall, floor_t])
        cube([2, wall + 1, tray_h]);
}