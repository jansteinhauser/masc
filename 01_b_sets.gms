
SETS
AllPeriod "Time steps"
/1995*2050/

Period(AllPeriod)
/2015,2020,2025,2030,2035,2040,2045,2050/

Period2020(Period)
/2020,2025,2030,2035,2040,2045,2050/

History(AllPeriod)"Historic years used to calculated crop mix"
/1995*2014/

Region "Regions modelled"
/DEU,CYP,CZE,DNK,ESP,EST,FIN,FRA,GBR,GRC,HRV,HUN,IRL,ITA,LTU,LUX,LVA,MLT,NLD,POL,PRT,ROU,SVK,SVN,SWE,AUT,BEL,BGR "EU 28"
ASI,OCE,NAM,LAM,MAF "5 Regions: Asia, Australia+NZ, Northern America (USA+Canada), Latin America (Central and South America, Caribbean), Middle East and Africa"
/



AllItem
/Pop "Population"
kcal, kcal_min, kcal_max
lower,upper     "bounds for land evolution corridor"
Level, Add, Remove, CostChange, CostStore "Storage Properties"

Wheat "Wheat and Wheat products", Potato "Potatoes and Potato products", sorghum, rice, millet, cassava, barley
Sunflower "sunflower seeds", rapeseed,olive,soybean,oilpalm "oilpalm fruit"
SunflowerOil, RapeOil, OliveOil,Soyoil, palmoil
tomatoes, onion, maize, chickpea "pulses and other", bean
oranges,bananas, apples, sugarcane
Milk, SkimmedMilk, Pork,beef,butter,poultry, eggs
cattle, chickens,pigs
Feed,TLU

yield
land
cost, price
distance

water,wf_blue, wf_grey
CO2eq, synthetic, manure, residues, enteric
N,P
BioDivLoss
DeForest, Afforest,
urban,forest,pasture,cropland,other
IntensiveIrr,IntensiveRF,OrganicIrr,OrganicRF, Extensive "crop management"
Natural

LandVar,LandPar
/



AllLandUse(AllItem)
/
urban,forest,pasture,cropland,other
Wheat, Potato, Sorghum, Rice, Millet, Cassava, Barley
Sunflower,Rapeseed,Olive,Soybean, Oilpalm
Tomatoes, Onion, Maize, Chickpea, Bean
Oranges, Bananas, Apples, sugarcane
/

landtype(AllLandUse)
/
urban,forest,pasture,cropland,other
/

Nature(landtype)
/forest,other/

Crop(AllLandUse) "Crops grown"
/Wheat, Potato, Sorghum, Rice, Millet, Cassava, Barley
Sunflower,Rapeseed,Olive,Soybean, Oilpalm
Tomatoes, Onion, Maize, Chickpea, Bean
Oranges, Bananas, Apples, sugarcane
/




AllLive(AllItem) "Livestock raised"
/cattle, chickens,pigs/

Product(AllItem)
/
Wheat "Wheat and Wheat products", Potato "Potatoes and Potato products", sorghum, rice, millet, cassava, barley
Sunflower "sunflower seeds", rapeseed,olive,soybean,oilpalm "oilpalm fruit"
SunflowerOil, RapeOil, OliveOil,Soyoil, palmoil
tomatoes, onion, maize, chickpea "pulses and other", bean
oranges,bananas, apples, sugarcane
Milk, SkimmedMilk, Pork,beef,butter,poultry, eggs
Feed
/

NonConsu(Product)
/oilpalm, sugarcane, feed/

Management(AllItem) "placeholder for forest and pasture"
/
IntensiveIrr,IntensiveRF,OrganicIrr,OrganicRF, Extensive "crop management"
Natural
urban
/

CropManagement(Management)"Land-management types crop"
/IntensiveIrr,IntensiveRF,OrganicIrr,OrganicRF, Extensive "crop management"/

PastureManagement(Management)
/IntensiveRF,Extensive, Natural/

Natural(Management)
/natural/

urban(Management)
/urban/

Indicators(AllItem)
/
CO2eq
N,P
Water
BioDivLoss
DeForest, Afforest
urban,forest,pasture,cropland,other
kcal
cattle, chickens, pigs
IntensiveIrr,IntensiveRF,OrganicIrr,OrganicRF, Extensive
LandVar,LandPar

Wheat "Wheat and Wheat products", Potato "Potatoes and Potato products", sorghum, rice, millet, cassava, barley
Sunflower "sunflower seeds", rapeseed,olive,soybean
SunflowerOil, RapeOil, OliveOil,Soyoil, palmoil
tomatoes, onion, maize, chickpea "pulses and other", bean
oranges,bananas, apples,
Milk, SkimmedMilk, Pork,beef,butter,poultry, eggs
/



Externalities(Indicators)
/CO2eq
N,P
Water
BioDivLoss
DeForest/

Nutrients(Externalities)
/N,P/

Emissions(AllItem)
/ synthetic, manure, residues, rice
enteric/

CropEmis(Emissions)
/  synthetic, manure, residues, rice/

Resources(AllItem)
/land /

Process
/
BarleyToFeed,CassavaToFeed,ChickpeaToFeed,MaizeToFeed,MilkToFeed
PotatoToFeed,RiceToFeed,SorghumToFeed,SoybeanToFeed,SugarcaneToFeed,WheatToFeed
MilkToButter
OliveToOil,PalmToOil,RapeToOil,SoyToOil,SunToOil
/

;
Alias (Region, Importer, Exporter);
Alias (landtype,LUCPre,LUCPost),(management,LUMPre,LUMPost);
Alias (cropmanagement, cropmanagementPre,CropmanagementPost);
Alias (pasturemanagement, pasturemanagementPre,pasturemanagementPost) ;
Alias(Nature,NaturePre,NaturePost);
