parameter  TradeStore_Data(AllItem) "co2eq: t / Mtkm; cost: % of price"
/
co2eq      103.4
cost         0.15
feed       100
CostStore    0.3
CostChange   0.1
/
;


table Trade_Distance(region,region)  "distance between countries/regions in 1.000km. src: https://www.distance.to"
           DEU         FRA         CYP         CZE         DNK         ESP         EST         FIN         BGR         GBR         GRC         HRV         HUN         IRL         ITA         LTU         LVA         MLT         NLD         POL         PRT         ROU         SVK         SVN         SWE         AUT         BEL         Asi         Oce         Nam          Lam         MAF         LUX
DEU        0.00        0.87        2.57        0.40        0.50        1.70        1.28        1.66        1.48        0.88        1.65        0.77        0.85        1.27        0.98        0.99        1.12        1.76        0.34        0.66        1.95        1.22        0.71        0.69        1.20        0.51        0.43        7.13        16.19        7.05        9.16        4.45        0.36
FRA        0.87        0.00        2.87        1.09        1.00        1.24        2.15        2.49        1.88        1.11        1.81        1.05        1.38        1.06        0.93        1.86        1.99        1.53        0.75        1.47        1.08        1.77        1.35        1.00        1.96        0.88        0.56        7.96        10.47        4.29        8.37        4.42        0.52
CYP        2.57        2.87        0.00        2.18        2.92        3.29        2.72        3.26        1.08        3.43        1.07        1.86        1.72        3.77        1.94        2.37        2.52        1.68        2.88        2.15        3.64        1.40        1.88        1.95        3.26        2.13        2.88        6.07        14.06        9.54        10.69       2.16        2.72
CZE        0.40        1.09        2.18        0.00        0.78        1.87        1.22        1.70        1.09        1.28        1.31        0.52        0.46        1.66        0.80        0.85        1.02        1.55        0.73        0.40        2.16        0.83        0.32        0.42        1.36        0.32        0.79        6.87        15.84        7.36        9.45        4.11        0.67
DNK        0.50        1.00        2.92        0.78        0.00        2.05        1.01        1.25        1.84        0.80        2.09        1.27        1.21        1.21        1.48        0.88        0.83        2.26        0.50        0.79        2.25        2.14        1.04        1.16        0.73        0.99        0.69        6.97        16.14        6.63        9.28        4.89        0.74
ESP        1.70        1.24        3.29        1.87        2.05        0.00        2.98        3.30        2.45        1.56        2.23        1.69        2.08        1.48        1.44        2.68        2.82        1.68        1.55        2.27        0.35        2.44        2.09        1.68        2.76        1.61        1.37        8.73        17.34        6.95        7.65        4.77        1.35
EST        1.28        2.15        2.72        1.22        1.01        2.98        0.00        0.56        1.82        1.79        2.24        1.69        1.39        2.19        2.01        0.42        0.23        2.70        1.47        0.86        3.21        1.45        1.22        1.61        0.69        1.54        1.64        5.96        15.16        7.08        10.28       4.86        1.64
FIN        1.66        2.49        3.26        1.70        1.25        3.30        0.56        0.00        2.37        1.93        2.79        2.19        1.93        2.28        2.50        0.96        0.78        3.22        1.75        1.38        3.50        2.00        1.75        2.11        0.60        2.01        1.94        5.91        15.12        6.67        10.32       3.56        1.97
BGR        1.48        1.88        1.08        1.09        1.84        2.45        1.82        2.37        0.00        2.35        0.49        0.83        0.64        2.70        1.01        1.42        1.59        1.19        1.80        1.11        2.80        0.37        0.80        0.90        2.25        1.07        1.81        6.43        14.98        8.45        10.07       3.10        1.66
GBR        0.88        1.11        3.43        1.28        0.80        1.56        1.79        1.93        2.35        0.00        2.46        1.59        1.73        0.41        1.65        1.67        1.72        2.38        0.55        1.48        1.66        2.11        1.60        1.49        1.33        1.31        0.57        7.76        16.94        6.14        8.49        5.22        0.76
GRC        1.65        1.81        1.07        1.31        2.09        2.23        2.24        2.79        0.49        2.46        0.00        0.87        0.90        2.76        0.88        1.83        2.01        0.75        1.93        1.45        2.58        0.82        1.09        0.97        2.60        1.16        1.89        6.82        15.13        8.60        9.75        2.80        1.73
HRV        0.77        1.05        1.86        0.52        1.27        1.69        1.69        2.19        0.83        1.59        0.87        0.00        0.40        1.91        0.34        1.29        1.47        1.03        1.06        0.83        2.02        0.74        0.49        0.11        1.87        0.29        1.03        7.06        15.80        7.73        9.34        3.66        0.87
HUN        0.85        1.38        1.72        0.46        1.21        2.08        1.39        1.93        0.64        1.73        0.90        0.40        0.00        2.09        0.73        0.98        1.16        1.32        1.18        0.56        2.40        0.40        0.19        0.40        1.70        0.51        1.21        6.66        15.48        7.82        9.72        3.68        1.07
IRL        1.27        1.06        3.77        1.66        1.21        1.48        2.19        2.28        2.70        0.41        2.76        1.91        2.09        0.00        1.91        2.08        2.13        2.58        0.93        1.89        1.48        2.48        1.98        1.82        1.69        1.64        0.89        8.15        17.35        5.87        8.09        5.46        1.05
ITA        0.98        0.93        1.94        0.80        1.48        1.44        2.01        2.50        1.01        1.65        0.88        0.34        0.73        1.91        0.00        1.61        1.79        0.78        1.17        1.15        1.78        1.03        0.83        0.40        2.14        0.50        1.08        7.36        15.98        7.77        9.07        3.57        0.92
LTU        0.99        1.86        2.37        0.85        0.88        2.68        0.42        0.96        1.42        1.67        1.83        1.29        0.98        2.08        1.61        0.00        0.19        2.29        1.24        0.46        2.94        1.05        0.81        1.21        0.90        1.16        1.40        6.15        15.28        7.30        10.12       4.49        1.35
LVA        1.12        1.99        2.52        1.02        0.83        2.82        0.23        0.78        1.59        1.72        2.01        1.47        1.16        2.13        1.79        0.19        0.00        2.47        1.34        0.64        3.06        1.22        1.00        1.39        0.79        1.33        1.51        6.05        15.22        7.21        10.20       4.65        1.48
MLT        1.76        1.53        1.68        1.55        2.26        1.68        2.70        3.22        1.19        2.38        0.75        1.03        1.32        2.58        0.78        2.29        2.47        0.00        1.94        1.84        2.02        1.43        1.48        1.13        2.90        1.27        1.83        7.57        15.67        8.43        9.03        2.89        1.68
NLD        0.34        0.75        2.88        0.73        0.50        1.55        1.47        1.75        1.80        0.55        1.93        1.06        1.18        0.93        1.17        1.24        1.34        1.94        0.00        0.97        1.75        1.56        1.05        0.96        1.22        0.77        0.19        7.39        16.50        6.68        8.88        4.72        0.28
POL        0.66        1.47        2.15        0.40        0.79        2.27        0.86        1.38        1.11        1.48        1.45        0.83        0.56        1.89        1.15        0.46        0.64        1.84        0.97        0.00        2.55        0.76        0.37        0.75        1.15        0.71        1.08        6.49        15.53        7.41        9.81        4.20        1.00
PRT        1.95        1.08        3.64        2.16        2.25        0.35        3.21        3.50        2.80        1.66        2.58        2.02        2.40        1.48        1.78        2.94        3.06        2.02        1.75        2.55        0.00        2.77        2.40        2.01        2.93        1.92        1.57        9.03        17.69        6.70        7.32        4.76        1.58
ROU        1.22        1.77        1.40        0.83        2.14        2.44        1.45        2.00        0.37        2.11        0.82        0.74        0.40        2.48        1.03        1.05        1.22        1.43        1.56        0.76        2.77        0.00        0.51        0.77        1.89        0.90        1.60        6.33        15.09        8.15        10.08       3.46        1.46
SVK        0.71        1.35        1.88        0.32        1.04        2.09        1.22        1.75        0.80        1.60        1.09        0.49        0.19        1.98        0.83        0.81        1.00        1.48        1.05        0.37        2.40        0.51        0.00        0.44        1.51        0.48        1.10        6.64        15.54        7.66        9.71        3.87        0.98
SVN        0.69        1.00        1.95        0.42        1.16        1.68        1.61        2.11        0.90        1.49        0.97        0.11        0.40        1.82        0.40        1.21        1.39        1.13        0.96        0.75        2.01        0.77        0.44        0.00        1.77        0.19        0.93        7.06        15.85        7.63        9.32        3.77        0.77
SWE        1.20        1.96        3.26        1.36        0.73        2.76        0.69        0.60        2.25        1.33        2.60        1.87        1.70        1.69        2.14        0.90        0.79        2.90        1.22        1.15        2.93        1.89        1.51        1.77        0.00        1.63        1.40        6.50        15.71        6.42        9.74        5.35        1.47
AUT        0.51        0.88        2.13        0.32        0.99        1.61        1.54        2.01        1.07        1.31        1.16        0.29        0.51        1.64        0.50        1.16        1.33        1.27        0.77        0.71        1.92        0.90        0.48        0.19        1.63        0.00        0.75        7.12        15.99        7.45        9.23        3.95        0.59
BEL        0.43        0.56        2.88        0.79        0.69        1.37        1.64        1.94        1.81        0.57        1.89        1.03        1.21        0.89        1.08        1.40        1.51        1.83        0.19        1.08        1.57        1.60        1.10        0.93        1.40        0.75        0.00        7.54        16.61        6.71        8.74        4.65        0.16
Asi        7.13        7.96        6.07        6.87        6.97        8.73        5.96        5.91        6.43        7.76        6.82        7.06        6.66        8.15        7.36        6.15        6.05        7.57        7.39        6.49        9.03        6.33        6.64        7.06        6.50        7.12        7.54        0.00        9.21         10.91       16.24       7.05        7.49
Oce        16.19       10.47       14.06       15.84       16.14       17.34       15.16       15.12       14.98       16.94       15.13       15.80       15.48       17.35       15.98       15.28       15.22       15.67       16.50       15.53       17.69       15.09       15.54       15.85       15.71       15.99       16.61       9.21        0.00         15.13       14.59       13.02       16.51
Nam        7.05        4.29        9.54        7.36        6.63        6.95        7.08        6.67        8.45        6.14        8.60        7.73        7.82        5.87        7.77        7.30        7.21        8.43        6.68        7.41        6.70        8.15        7.66        7.63        6.42        7.45        6.71        10.91       15.13        0.00        6.35        11.35       6.93
Lam        9.16        8.37        10.69       9.45        9.28        7.65        10.28       10.32       10.07       8.49        9.75        9.34        9.72        8.09        9.07        10.12       10.20       9.03        8.88        9.81        7.32        10.08       9.71        9.32        9.74        9.23        8.74        16.24       14.59        6.35        0.00        10.56       8.81
MAF        4.45        4.42        2.16        4.11        4.89        4.77        4.86        3.56        3.10        5.22        2.80        3.66        3.68        5.46        3.57        4.49        4.65        2.89        4.72        4.20        4.76        3.46        3.87        3.77        5.35        3.95        4.65        7.05        13.02        11.35       10.56       0.00        4.49
LUX        0.36        0.52        2.72        0.67        0.74        1.35        1.64        1.97        1.66        0.76        1.73        0.87        1.07        1.05        0.92        1.35        1.48        1.68        0.28        1.00        1.58        1.46        0.98        0.77        1.47        0.59        0.16        7.49        16.51        6.93        8.81        4.49        0.00

;

