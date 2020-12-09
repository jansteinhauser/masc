$offlisting offsymlist offsymxref
OPTION SOLPRINT=OFF;
OPTION LIMROW=0;
OPTION LimCOL=0;

$onecho > %system.fn%.gck
blocklist
blockpic
analysis
postopt
insolution

$offecho

***************************************
*               Sets                  *
***************************************

$include 01_b_sets.gms

***************************************
*        KEY PARAMETER: TAX           *
***************************************

Parameter Externalities_Data(Externalities) "Penalty / Tax per Unit Externality; Set to 0 or quasi infty to ignore or minimize Externality in Welfare calc, respectively"
*10000 for CO2eq, 1000000 for the rest
/
CO2eq            0.01
BioDivLoss       1000000
DeForest         0
Water            0
N                0
P                0
/
;


***************************************
*         PARAMETER IMPORT            *
***************************************

$include 02_parameters.gms

***************************************
*             VARIABLES               *
***************************************

Free variable Welfare_var;

Nonnegative variables
Demand_Var(Period,Region,Product) "1000t"

Crop_Var(Period,Region,Crop,CropManagement) "1000ha"
Live_Var(Period,region,AllLive) "1000an"
Cropmix_Var(Period,Region,History)
Livemix_Var(Period,Region, History)

LUM_Var(Period,Region,landtype,management) "1000ha"
LUC_Var(period,region,LUCPre,LUMPre,LUCPost,LUMPost) "1000ha"
LUCSum_Var(period,region,LUCPre,LUCPost)"1000ha"

Process_Var(Period,Region,Process) "1000t"
Storage_Var(Period,Region,Product,AllItem) "1000t"
Trade_Var(Period,Exporter,Importer,Product) "1000t"

Externalities_Var(Period,Region,Externalities)
ExternalitiesCum_Var(Period,Externalities)
EmissionsLUC_Var(Period,Region)

Indicators_Var(AllItem)
Pasture_Var(Pasturemanagement)
;

* Initialize variables to avoid display errors
Demand_Var.L(Period,Region,Product)=0;

Crop_Var.L(Period,Region,Crop,CropManagement)=0;
Live_Var.L(Period,Region,AllLive)=0;
Cropmix_Var.L(Period,Region,History)=0;
Livemix_Var.L(Period,Region, History)=0;

LUM_Var.L(Period,Region,Landtype,Management)=0;
LUC_Var.L(period,region,LUCPre,LUMPre,LUCPost,LUMPost)=0;
LUCSum_Var.L(period,region,LUCPre,LUCPost)=0;

Process_Var.L(Period,Region,Process)=0;
Storage_Var.L(Period,Region,Product,AllItem)=0;
Trade_Var.L(Period,Exporter,Importer,Product)=0;

Externalities_Var.L(Period,Region,Externalities)=0;
ExternalitiesCum_Var.L(Period,Externalities)=0;
EmissionsLUC_Var.L(Period,Region)=0;

Indicators_Var.L(AllItem)=0;
Pasture_Var.L(Pasturemanagement)=0;

********************************************************
*                   EQUATIONS  DEF                     *
********************************************************

Equations
Obj_Equ "optimized for maximum welfare"
*s.t.

*consumption
Product_Equ(Period,Region,Product) "consumption - production balance (+ Trade, Storage)"
**SDG 2
MinKCal_Equ(Period,Region) "Zero hunger (incl. buffer; kcal corridor, upper bound)"
MaxKCal_Equ(Period,Region) "Limit overconsumption (kcal corridor, upper bound)"

*production
Land_Equ(Period,Region) "limits land use to available land"
CropLand_Equ(Period,Region,cropmanagement) "Sum over all Crop per period t, region r to define cropland"
Pasture_Equ(Period,Region) "min pasture for cattle and chickens"

**Land evolution after 2015
MinLand_Equ(Period,Region,landtype) "minimum land per landtype after 2015"
MaxLand_Equ(Period,Region,landtype) "max land per landtype after 2015"

**urban evolution
Urban_Equ(Period,Region) "urban changes with pop"
*UrbanMin_Equ(Period,Region) "urban can only grow"
*UrbanMax_Equ(Period,Region) "urban can't be larger than twice as large as the hist urban/pop share*current pop"

*Land-use and land-management change
LUCSum_Equ(period,region,LUCPre,LUCPost)"LUC without LUMC"
LUC_Equ(period,region,landtype,management)
ForbiddenManagement_EQU(Period,Region) "forces forbidden LU-LUM combinations to zero"

*LUCCrop_Equ(period,region,management) "track LUC from/to Cropland"
*LUCPasture_Equ(period,region,management) "track LUC from/to Pasture"
*LUCForest_Equ(period,region,management) "track LUC from/to forest"
*LUCOther_Equ(period,region,management) "track LUC from/to other natural land"

*Prohibited LU-LUM combinations
CropForbidden(period,region,management)  "crop can't be urban or natural"
PastureForbidden(period,region,management) "pasture can't be organic, irrigated, or urban"
NatureForbidden(period,region,management) "other natural land and forests can only be natural"
*OtherForbidden(period,region,management) "other natural land only be natural"
UrbanForbidden(period,region,management) "urban can only be urban"


Cropmix_Equ(Period,Region,Crop)
Livemix_Equ(Period,Region,AllLive)

*Storage
Storage_Equ(Period,Region,Product)
StorageChange_Equ(Period,Region,Product) "Items (on average) can't be stored longer than five years"

*Indicators / Externalities

Emissions_Equ(Period,Region) "total emissions from Crop, Livestock, Soil, Biomass, LUC; tCO2eq"
EmissionsLUC_EQU(Period2020,Region) "calc LUC emissions between 2020-2050; t/1000ha LUC "
BioDiv2015_Equ(Region)  "initial biodiv loss; share of 100% natural Earth"
BioDiv_Equ(Period,Region) "LUC biodiv loss; share of 100% natural Earth"
Nutrients_Equ(Period,Region,Nutrients) "N, P applied; t"
Water_Equ(Period,Region) "1000 m3 blue and grey combined"
Deforest_Equ(Period,Region) "1000 ha lost to LUC; afforestation/reforestation ignored"
ExternalitiesCum_Equ(Period,Externalities) "Cummulative Externalties"

**Summarizing Indicators
Indicators_EQU(Externalities)
IndicatorsLand_EQU(landtype) "Total accumulated cropland 2015-2050"
IndicatorsKCAL_Equ "Global avg kcal consumed 2015-2050"

**Additional Indicators
IndicatorsAfforest_Equ "New Forest globally 2020-2050"
IndicatorsLive_Equ(AllItem) "Animals (1000 an) raised globally 2015-2050"
IndicatorsCropMan_Equ(cropmanagement) "Global crop management systems over 2015-2050"
IndicatorsPasMan_Equ(Pasturemanagement) "Global Pasture management systems over 2015-2050"
IndicatorsConsu_Equ(Product) "Global product consumption over 205-2050"
**Checks
CheckLandPar_Equ
CheckLandVar_Equ
;

Models
landuse_model
/
all
/

;


********************************************************
*                        EQUATIONS                     *
********************************************************



Obj_Equ..
 Welfare_var *1000000
 =E=

   SUM((Period,Region,Product) $ (Not(nonConsu(product))),
         Market_Data(Region,Product,"Price") *
         Demand_Var(Period,Region,Product))

 - SUM((Period,Region,Crop,CropManagement),
         Crop_Data(Region,Crop,"Cost") *
         Crop_Var(Period,Region,Crop,CropManagement) *
         Management_Data(CropManagement,"Cost"))


 - SUM((Period,Region,AllLive),
         Live_Data(Region,AllLive,"Cost") *
         Live_Var(Period,Region,AllLive))

 - SUM((Period,Exporter,Importer,Product) $(Not sameas (Exporter,Importer)),
         Market_Data(Importer,Product,"Price") *
         TradeStore_Data("Cost") *
         Trade_Var(Period,Exporter,Importer,Product) +
* avoding free feed transport despite its price of 0
         (TradeStore_Data("Feed") *
         Trade_Var(Period,Exporter,Importer,product))$ (nonConsu(product)))

 - SUM((Period,Region,Product),
         Market_Data(Region,Product,"Price") *
                  (
                         TradeStore_Data("CostChange") *
                         ( Storage_Var(Period,Region,Product,"Add") +
                           Storage_Var(Period,Region,Product,"Remove") )   +

                         TradeStore_Data("CostStore") *
                         Storage_Var(Period,Region,Product,"Level") ) )

 - SUM((period,region,process),
         process_data(region,process,"cost") *
         process_Var(period,region,process))

 - SUM((Period,Region,Externalities),
         Externalities_Data(Externalities) *
         Externalities_Var(Period,Region,Externalities))

;

********SUPPLY**********

Product_Equ(Period,Region,Product)..
 Demand_Var(Period,Region,Product) $ Market_data(Region,Product,"Price")
 =E=

  SUM((CropManagement,Crop),
         Crop_Data(Region,Crop,Product) *
         Crop_Var(Period,Region,Crop,CropManagement) *
         Management_Data_long(crop,CropManagement,"Yield"))

 + SUM(AllLive,
         Live_Data(Region,AllLive,Product) *
         Live_Var(Period,Region,AllLive))

+ SUM((Process),
         Process_Data(Region,Process,Product) *
         Process_Var(Period,Region,Process))

 + SUM((Exporter) $ (not sameas (Exporter,Region)),Trade_Var(Period,Exporter,Region,Product))

 - SUM((Importer) $ (not sameas (Region,Importer)),Trade_Var(Period,Region,Importer,Product))

 + Storage_Var(Period,Region,Product,"Remove")

 - Storage_Var(Period,Region,Product,"Add")

;

********ZERO HUNGER**********

MinKCal_Equ(Period,Region)..
 KcalMin_Data(Region,Period)*1.2
 =L=

  SUM((Product),
         Demand_Var(Period,Region,Product) *
         Product_Data(Product,"kcal")) /
  Population_Data(Region,Period)
;

MaxKCal_Equ(Period,Region)..
 KcalMin_Data(Region,Period) *  1.8
 =G=

  SUM((Product),
         Demand_Var(Period,Region,Product) *
         Product_Data(Product,"kcal")) /
  Population_Data(Region,Period)
;




********LAND*********

Land_Equ(Period,Region)..
 Resource_Data(Region,"Land")
 =E=

  SUM(cropmanagement,LUM_Var(Period,Region,"cropland",CropManagement)) +
  SUM(pasturemanagement,  LUM_Var(period,region,"pasture",pasturemanagement)) +
  LUM_Var(period,region,"forest","natural") +
  LUM_Var(period,region,"other","natural") +
  LUM_Var(period,region,"urban","urban")
;

*force unwanted LU-LUM combinations to 0 (in combination with Land_Equ)
*$include management_equations.gms


ForbiddenManagement_Equ(Period,Region)..
 Resource_Data(Region,"Land")
 =G=
  SUM((landtype,management),LUM_Var(Period,Region,landtype,Management))
;


* cropland = Sum over crops
CropLand_Equ(Period,Region,cropmanagement)..

 LUM_Var(Period,Region,"cropland",cropmanagement)
 =E=

  SUM(crop,Crop_Var(Period,Region,Crop,CropManagement))
;

*pasture needed to sustain livestock
Pasture_Equ(Period,Region)..
 SUM(PastureManagement,
         LUM_Var(Period,Region,"pasture",PastureManagement) *
         pasture_data(PastureManagement,"TLU"))
 =G=

 Live_Var(period,region,"cattle") * live_data(region,"cattle","TLU")
 + Live_Var(period,region,"chickens") * live_data(region,"chickens","TLU")
;


**********Land use Change*********


LUCSum_Equ(period2020,region,LUCPre,LUCPost)..

 LUCSum_Var(period2020,region,LUCPre,LUCPost)
 =E=

 SUM((LUMPre,LUMPost),LUC_Var(period2020,region,LUCPre,LUMPre,LUCPost,LUMPost))
;


LUC_Equ(period,region,landtype,management)
 $ (ord(period) > 1) ..

 SUM((LUCPre,LUMPre),LUC_Var(period,region,LUCPre,LUMPre,landtype,management))
 - SUM((LUCPost,LUMPost), LUC_Var(period,region,landtype,management,LUCPost,LUMPost))

 =E=

 LUM_Var(period,region,landtype,management)
 - LUM_VAR(period-1,region,landtype,management)
;

*Prohibited LUC combinations

CropForbidden(period,region,management)
 $ (Not(Cropmanagement(management)) and  (ord(period) > 1))..
 SUM((landtype,LUMPre),LUC_Var(period,region,landtype,LumPre,"cropland",Management))
 + SUM((landtype,LUMPost),LUC_Var(period,region,"cropland",Management,landtype,LumPost))

 =E= 0
;

PastureForbidden(period,region,management)
 $ (Not(pasturemanagement(management)) and  (ord(period) > 1))..

 SUM((landtype,LUMPre),LUC_Var(period,region,landtype,LumPre,"pasture",Management))
 + SUM((landtype,LUMPost),LUC_Var(period,region,"pasture",Management,landtype,LumPost))

 =E=
  0
;

NatureForbidden(period,region,management)
 $ (Not(natural(management)) and  (ord(period) > 1))..

 SUM((landtype,LUMPre,Nature),LUC_Var(period,region,landtype,LumPre,nature,Management))
 +  SUM((landtype,LUMPost,Nature),LUC_Var(period,region,nature,Management,landtype,LumPost))

 =E=
 0
;

UrbanForbidden(period,region,management)
 $ (Not(urban(management)) and  (ord(period) > 1))..

 SUM((landtype,LUMPre),LUC_Var(period,region,landtype,LumPre,"urban",Management))
 + SUM((landtype,LUMPost),LUC_Var(period,region,"urban",Management, landtype,LumPost))

 =E=
  0
;


***********Land evolution corridor***********

*Minimum
MinLand_Equ(Period,Region,landtype)
    $ (LandType_Data("2010",Region,landtype))..

 SUM(management, LUM_Var(Period,Region,landtype,management))
 =G=

**all but urban
  (SUM((management) $ (ord(period) > 1), LUM_Var(Period-1,Region,landtype,management)*landtype_buffer("lower"))

  + (LandType_Data("2010",Region,landtype)*landtype_buffer("lower")) $ (ord(period)=1)) $ (ord(landtype) > 1)

**urban

  + ((landtype_Data("2010",Region,"urban")) $ (ord(period) = 1)
  + (LUM_Var(Period-1,Region,"urban","urban")) $ (ord(Period) > 1)) $ (ord(landtype) = 1)
;



*Maximum
MaxLand_Equ(Period,Region,landtype)
    $ (LandType_Data("2010",Region,landtype)) ..
 SUM(management, LUM_Var(Period,Region,landtype,management))
 =L=

**all but urban
  (SUM((management) $ (ord(period) > 1),LUM_Var(Period-1,Region,landtype,management)*landtype_buffer("upper"))
  + (LandType_Data("2010",Region,landtype)*landtype_buffer("upper"))$ (ord(period)=1)) $ (ord(landtype) > 1)

**urban
 + ((landtype_Data("2010",Region,"urban") / Population_Data(Region,"2010")) * Population_Data(Region,Period) * 2)
         $ (ord(landtype) = 1)
;

*******Urban evolution by pop*********

Urban_Equ(period,Region)..
 LUM_Var(Period,Region,"urban","urban")
 =G=

  (landtype_Data("2010",Region,"urban")
  / Population_Data(Region,"2010"))*
  Population_Data(Region,Period)
;


**** Mix requirements******


Cropmix_Equ(Period,Region,Crop)
 $ SUM(History,Cropmix_Data(History,Region,Crop))..

  SUM(Cropmanagement,Crop_Var(Period,Region,Crop,CropManagement))

   =E=

  SUM(history,
   Cropmix_Data(History,Region,Crop)*
   Cropmix_Var(Period,Region, History))
;

Livemix_Equ(Period,Region,AllLive)
 $ SUM(History,Livemix_Data(History,Region,AllLive))..

  Live_Var(Period,Region,AllLive)

   =E=

  SUM(history,
   Livemix_Data(History,Region,AllLive)*
   Livemix_Var(Period,Region, History))
;




********STORAGE**********

Storage_Equ(Period,Region,Product)..
 Storage_Var(Period,Region,Product,"Level")

 =E=

  Storage_Var(Period-1,Region,Product,"Level") +
  Storage_Var(Period,Region,Product,"Add") -
  Storage_Var(Period,Region,Product,"Remove")
;

StorageChange_Equ(Period,Region,Product)..
 Storage_Var(Period,Region,Product,"Remove")

 =G=

 Storage_Var(Period-1,Region,Product,"Add")
;



******INDICATORS / Externalities***




Emissions_Equ(Period,Region)..
 Externalities_Var(Period,Region,"CO2eq")

 =E=
*Crop emissions (manure, fertilizer, rice, biomass)
 SUM((Crop,CropManagement,CropEmis),
         Crop_Var(Period,Region,Crop,CropManagement) *
         emissions_crop(Region,Crop,CropEmis) *
         Management_Data_long(crop,CropManagement,CropEmis))
*Livestock and Pasture (manure) emissions
 + SUM(AllLive,
         Live_Var(Period,Region,AllLive) *
         Live_Data(Region,AllLive,"CO2eq"))

*emissions from soil, uptake from biomass (forest, other land)
 + SUM((management,landtype),
         LUM_Var(period,region,landtype,management) *
         emissions_LU(region,landtype))



*Transport emissions
 + SUM((Exporter,Importer,Product),
         Trade_Var(Period,Exporter,Importer,Product) *
         Trade_Distance(Exporter,Importer) *
         TradeStore_Data("CO2eq"))

*emissions from LUC
 + EmissionsLUC_Var(Period,Region)

;


EmissionsLUC_EQU(Period2020,Region)..
 EmissionsLUC_Var(Period2020,Region)

 =E=

  SUM(LUCPost,LUCSum_Var(period2020,region,"cropland",LUCPost)
  * emissions_LUC(region,"cropland",LUCPost))

  + SUM(LUCPost,LUCSum_Var(period2020,region,"pasture",LUCPost)
  * emissions_LUC(region,"pasture",LUCPost))

  + SUM(LUCPost,LUCSum_Var(period2020,region,"forest",LUCPost)
  * emissions_LUC(region,"forest",LUCPost))

  + SUM(LUCPost,LUCSum_Var(period2020,region,"other",LUCPost)
  * emissions_LUC(region,"other",LUCPost))
;




**Biodiversity loss

BioDiv2015_Equ(Region)..
 Externalities_Var("2015",Region,"BioDivLoss")
 =E=

  SUM((landtype,management),LUM_Var("2015",region,landtype,management) *
  BioDivLoss_LU(landtype,management))
;

BioDiv_Equ(Period2020,Region)..
 Externalities_Var(Period2020,Region,"BioDivLoss")
 =E=
  SUM((LUCPre,LUMPre,LUCPost,LUMPost),LUC_Var(period2020,region,LUCPre,LUMPre,LUCPost,LUMPost) *
  BioDivLoss_LUC(LUCPre,LUMPre,LUCPost,LUMPost))
;

** Nutrients use / environmental damage

Nutrients_Equ(Period,Region,Nutrients)..
 Externalities_Var(Period,Region,Nutrients)

 =G=

 SUM((Crop,CropManagement),
         Crop_Var(Period,Region,Crop,CropManagement) *
         Nutrients_Data(Region,Nutrients) *
         Management_Data(CropManagement,Nutrients))
;

**Blue + Grey water use

Water_Equ(Period,Region)..
 Externalities_Var(Period,Region,"water")

 =G=

  SUM((Crop,CropManagement),
         Crop_Var(Period,Region,Crop,CropManagement) *
                 (Crop_Data(Region,Crop,"wf_blue") *
                 Management_Data(CropManagement,"wf_blue") +
                 Crop_Data(Region,Crop,"wf_grey") *
                 Management_Data(CropManagement,"wf_grey")))
;

*Deforestation

Deforest_Equ(Period2020,Region)..
 Externalities_Var(period2020,Region,"DeForest")

 =E=

 SUM((CropManagement),LUC_Var(period2020,region,"forest","natural","cropland",Cropmanagement))
 +  SUM((Pasturemanagement),LUC_Var(period2020,region,"forest","natural","pasture",Pasturemanagement))
 + LUC_Var(period2020,region,"forest","natural","other","natural")
 + LUC_Var(period2020,region,"forest","natural","urban","urban" )
;


ExternalitiesCum_Equ(Period,Externalities)..
 ExternalitiesCum_Var(Period,Externalities)

 =E=

  ExternalitiesCum_Var(Period-1,Externalities) +
  SUM((Region),Externalities_var(Period,Region,Externalities))
;


********************************************
*             Final Indicators             *
********************************************
Indicators_EQU(Externalities)..
 Indicators_Var(Externalities)

 =E=

 ExternalitiesCum_Var("2050",Externalities)
;

IndicatorsLand_EQU(landtype)..
 Indicators_Var(landtype)

 =E=

 SUM((period,region,management),LUM_Var(period,Region,landtype,management))
;

IndicatorsKCAL_Equ..
 Indicators_Var("Kcal")

 =E=

 SUM((period,region,Product),
         Demand_Var(Period,Region,Product) *
         Product_Data(Product,"kcal"))
;

IndicatorsAfforest_Equ..
 Indicators_Var("Afforest")

 =E=

 SUM((period2020,region,Cropmanagement),LUC_Var(period2020,region,"cropland",cropmanagement,"forest","natural"))
 +  SUM((period2020,region,Pasturemanagement),LUC_Var(period2020,region,"pasture",pasturemanagement,"forest","natural"))
 +  SUM((period2020,region,Pasturemanagement),LUC_Var(period2020,region,"other","natural","forest","natural"))
;

IndicatorsLive_Equ(AllLive)..
 Indicators_Var(AllLive)

 =E=

 SUM((period,region),Live_Var(Period,Region,AllLIve))
;
IndicatorsCropMan_Equ(cropmanagement)..
 Indicators_Var(Cropmanagement)

 =E=

 SUM((period,region), LUM_Var(Period,Region,"Cropland",Cropmanagement))
;

IndicatorsPasMan_Equ(Pasturemanagement)..
 Pasture_Var(Pasturemanagement)

 =E=

 SUM((period,region), LUM_Var(Period,Region,"Pasture",Pasturemanagement))
;

IndicatorsConsu_Equ(Product)
 $ ( Not(NonConsu(Product)))..

Indicators_Var(Product)

 =E=

 SUM((period,region),Demand_Var(period,region,product))
;

***Check land
CheckLandPar_Equ..
 Indicators_Var("LandPar")
 =E=
 SUM(region,resource_data(region,"land"))
;

CheckLandVar_Equ..
 Indicators_Var("LandVar")
 =E=
 SUM((period,region,landtype,management),LUM_Var(period,region,landtype,management))/8
;


*option LP=GAMSCHK;
*welfare_var.up = 1E12;
*landuse_model.optfile=1;

Solve landuse_model USING LP MAXIMIZING Welfare_var;
option dispwidth = 15;
display demand_var.L,cropmix_var.L, crop_var.L, trade_var.L, process_var.L, livemix_var.L, live_var.L,luc_var.L,Lum_var.L
display  ExternalitiesCum_Var.L, Indicators_var.L, Welfare_var.L;

$ontext
file results / resultsSe4-7-tot.csv /;
results.pc = 5;
put results;
put "Welfare" welfare_var.L /;
loop(indicators, put indicators.tl,Indicators_Var.L(indicators) /);
loop(pastureManagement, put PastureManagement.tl,Pasture_Var.L(PastureManagement) /);
putclose;
$offtext
