*Market Data: USD per ton sold
*market_data(region,product,allItem)
$include para_market.gms

*Product Data: kcal avg per Product
*Product_Data(Product,AllItem)
$include para_product.gms

*Crop Yield Data: Tonne/Ha / crop / region; Cost (1000)USD / (1000)Ha / region
**crop_data (region,crop,allitem)
$include para_crop.gms

*Livestock yield 1000t/1000an, feed req. 1000t/1000an, CO2eq t/1000an, Cost 1000USD/1000An, TLU and TLU capacity on Pasture
*Live_Data(Region,AllLive, AllItem)
*pasture_data(PastureManagement,AllItem)
$include para_live.gms

*Management factors: cost, water nutrients by system; yield, CO2eq by system and crop due to exceptions
*management_data(cropmanagement,AllItem)
*management_data_long(crop,cropmanagement,AllItem)
$include para_management.gms

*Trade_Data: Distances region-region; emissions per 1.000000 t-km; costs, emissions; special feed trade costs; also storage parameters
*TradeStore_Data(AllItem)
*Trade_Distance(region,region)
$include para_trade.gms

*Process data: cost, yield per process
*process_data (region,process,allitem
$include para_process.gms

*Population / region / period
*Population_Data(region,Allperiod)
$include para_population.gms

*MDER / region / period
*kcalMin_Data(Region,AllPeriod)
$include para_mder.gms

*Resource max: Land; (Water?)
*Resource_Data(Region,AllItem)
$include para_resources.gms

*Landtype historical: (1000ha)
*landtype_buffer(AllItem)
**LandType_Data(AllPeriod,Region,landtype)
$include para_landtype_hist.gms

*Cropmix / Livemix data
*Cropmix_data(History,Region,Crop) (Ha)
*Livemix_Data(History,Region,AllLive) (1000an)
$include para_mix.gms

*Emissions per Crop and Emissionstype, from soils, and through LUC;  t CO2eq/1000 ha
**emissions_LUC(region,LUCPre,LUCPost)
**emissions_LU(region,landtype)
**emissions_crop(region,crop,cropEmis)
$include para_emissions.gms

*P and N application in t per 1000 ha
**nutrients_data(region,AllItem)
$include para_nutrients.gms

*Biodiversity loss in share of max biodiv/ha
**BioDivLoss_LU(landtype, management)
**BioDivLoss_LUC(LUCPre,LUMPre,LUCPost,LUMPost)
$include para_biodivloss.gms
