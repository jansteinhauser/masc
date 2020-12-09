Parameter BioDivLoss_LU(landtype, management) "Share of max biodiversity lost in initial land grab"

/
Cropland. Extensive    0.65
Cropland. IntensiveIrr  0.95
Cropland. IntensiveRF    0.9
Cropland. OrganicIrr   0.85
Cropland. OrganicRF     0.8
Forest.   Natural         0
Other.    Natural         0
Pasture.  Extensive     0.6
Pasture.  IntensiveRF   0.8
Pasture.  Natural         0
Urban.    Urban           1
/
;

Parameter BioDivLoss_LUC(LUCPre,LUMPre,LUCPost,LUMPost)  "Share of maximum biodiversity lost or recovered (negative sign)"
/
Cropland.    Extensive.   Cropland. IntensiveIrr     0.3
Cropland.    Extensive.   Cropland. IntensiveRF     0.25
Cropland.    Extensive.   Cropland. OrganicIrr      0.2
Cropland.    Extensive.   Cropland. OrganicRF      0.15
Cropland.    Extensive.   Forest.   Natural      -0.325
Cropland.    Extensive.   Other.    Natural      -0.325
Cropland.    Extensive.   Pasture.  Extensive    -0.025
Cropland.    Extensive.   Pasture.  IntensiveRF    0.15
Cropland.    Extensive.   Pasture.  Natural      -0.325
Cropland.    Extensive.   Urban.    Urban          0.35
Cropland.    IntensiveIrr. Cropland. Extensive     -0.15
Cropland.    IntensiveIrr. Cropland. IntensiveRF   -0.025
Cropland.    IntensiveIrr. Cropland. OrganicIrr    -0.05
Cropland.    IntensiveIrr. Cropland. OrganicRF    -0.075
Cropland.    IntensiveIrr. Forest.   Natural      -0.475
Cropland.    IntensiveIrr. Other.    Natural      -0.475
Cropland.    IntensiveIrr. Pasture.  Extensive    -0.175
Cropland.    IntensiveIrr. Pasture.  IntensiveRF  -0.075
Cropland.    IntensiveIrr. Pasture.  Natural      -0.475
Cropland.    IntensiveIrr. Urban.    Urban          0.05
Cropland.    IntensiveRF.  Cropland. Extensive    -0.125
Cropland.    IntensiveRF.  Cropland. IntensiveIrr    0.05
Cropland.    IntensiveRF.  Cropland. OrganicIrr   -0.025
Cropland.    IntensiveRF.  Cropland. OrganicRF     -0.05
Cropland.    IntensiveRF.  Forest.   Natural       -0.45
Cropland.    IntensiveRF.  Other.    Natural       -0.45
Cropland.    IntensiveRF.  Pasture.  Extensive     -0.15
Cropland.    IntensiveRF.  Pasture.  IntensiveRF   -0.05
Cropland.    IntensiveRF.  Pasture.  Natural       -0.45
Cropland.    IntensiveRF.  Urban.    Urban           0.1
Cropland.    OrganicIrr.  Cropland. Extensive      -0.1
Cropland.    OrganicIrr.  Cropland. IntensiveIrr     0.1
Cropland.    OrganicIrr.  Cropland. IntensiveRF     0.05
Cropland.    OrganicIrr.  Cropland. OrganicRF    -0.025
Cropland.    OrganicIrr.  Forest.   Natural      -0.425
Cropland.    OrganicIrr.  Other.    Natural      -0.425
Cropland.    OrganicIrr.  Pasture.  Extensive    -0.125
Cropland.    OrganicIrr.  Pasture.  IntensiveRF  -0.025
Cropland.    OrganicIrr.  Pasture.  Natural      -0.425
Cropland.    OrganicIrr.  Urban.    Urban          0.15
Cropland.    OrganicRF.   Cropland. Extensive    -0.075
Cropland.    OrganicRF.   Cropland. IntensiveIrr    0.15
Cropland.    OrganicRF.   Cropland. IntensiveRF      0.1
Cropland.    OrganicRF.   Cropland. OrganicIrr     0.05
Cropland.    OrganicRF.   Forest.   Natural        -0.4
Cropland.    OrganicRF.   Other.    Natural        -0.4
Cropland.    OrganicRF.   Pasture.  Extensive      -0.1
Cropland.    OrganicRF.   Pasture.  IntensiveRF       0
Cropland.    OrganicRF.   Pasture.  Natural        -0.4
Cropland.    OrganicRF.   Urban.    Urban           0.2
Forest.      Natural.     Cropland. Extensive      0.65
Forest.      Natural.     Cropland. IntensiveIrr    0.95
Forest.      Natural.     Cropland. IntensiveRF      0.9
Forest.      Natural.     Cropland. OrganicIrr     0.85
Forest.      Natural.     Cropland. OrganicRF       0.8
Forest.      Natural.     Other.    Natural         0.5
Forest.      Natural.     Pasture.  Extensive       0.6
Forest.      Natural.     Pasture.  IntensiveRF     0.8
Forest.      Natural.     Pasture.  Natural         0.5
Forest.      Natural.     Urban.    Urban             1
Other.       Natural.     Cropland. Extensive      0.65
Other.       Natural.     Cropland. IntensiveIrr    0.95
Other.       Natural.     Cropland. IntensiveRF      0.9
Other.       Natural.     Cropland. OrganicIrr     0.85
Other.       Natural.     Cropland. OrganicRF       0.8
Other.       Natural.     Forest.   Natural         0.5
Other.       Natural.     Pasture.  Extensive       0.6
Other.       Natural.     Pasture.  IntensiveRF     0.8
Other.       Natural.     Pasture.  Natural         0.5
Other.       Natural.     Urban.    Urban             1
Pasture.     Extensive.   Cropland. Extensive      0.05
Pasture.     Extensive.   Cropland. IntensiveIrr    0.35
Pasture.     Extensive.   Cropland. IntensiveRF      0.3
Pasture.     Extensive.   Cropland. OrganicIrr     0.25
Pasture.     Extensive.   Cropland. OrganicRF       0.2
Pasture.     Extensive.   Forest.   Natural        -0.3
Pasture.     Extensive.   Other.    Natural        -0.3
Pasture.     Extensive.   Pasture.  IntensiveRF     0.2
Pasture.     Extensive.   Pasture.  Natural        -0.3
Pasture.     Extensive.   Urban.    Urban           0.4
Pasture.     IntensiveRF. Cropland. Extensive    -0.075
Pasture.     IntensiveRF. Cropland. IntensiveIrr    0.15
Pasture.     IntensiveRF. Cropland. IntensiveRF      0.1
Pasture.     IntensiveRF. Cropland. OrganicIrr     0.05
Pasture.     IntensiveRF. Cropland. OrganicRF         0
Pasture.     IntensiveRF. Forest.   Natural        -0.4
Pasture.     IntensiveRF. Other.    Natural        -0.4
Pasture.     IntensiveRF. Pasture.  Extensive      -0.1
Pasture.     IntensiveRF. Pasture.  Natural        -0.4
Pasture.     IntensiveRF. Urban.    Urban           0.2
Pasture.     Natural.     Cropland. Extensive      0.65
Pasture.     Natural.     Cropland. IntensiveIrr    0.95
Pasture.     Natural.     Cropland. IntensiveRF      0.9
Pasture.     Natural.     Cropland. OrganicIrr     0.85
Pasture.     Natural.     Cropland. OrganicRF       0.8
Pasture.     Natural.     Forest.   Natural         0.5
Pasture.     Natural.     Other.    Natural         0.5
Pasture.     Natural.     Pasture.  Extensive       0.6
Pasture.     Natural.     Pasture.  IntensiveRF     0.8
Pasture.     Natural.     Urban.    Urban             1


/
;
