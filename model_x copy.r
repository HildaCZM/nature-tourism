install.packages("deSolve")
install.packages("jsonlite")
install.packages("xlsx")
install.packages("rJava")

library("rJava")
library("deSolve")
library("xlsx")

#Read file with non-linear functions
setwd("/Users/hildazamoramaldonado/Library/Mobile Documents/com~apple~CloudDocs/Hilda_DocsMacBookAir/2. PROYECTOS/2023_a.1/Proyecto_2023/Model_1/Model_V0.0_c")
#nef<- loadWorkbook(paste0(dir.file,"Non_Linear_Effects.xlsx"))#in windows
nef<- loadWorkbook("Non_Linear_Effects_copy.xlsx")#in ios

#create functions for interpolation
#effect_HC_on_carrying_capacity
 #sheet<-getSheets(nef)[['effect_HC_on_carrying_capacity']]
 sheet<-getSheets(nef)[['effect_HC_on_carrying_capacity']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_HC_on_carrying_capacity_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_SC_on_carrying_capacity
 sheet<-getSheets(nef)[['effect_SC_on_carrying_capacity']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_SC_on_carrying_capacity_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_GAC_on_carrying_capacity
 sheet<-getSheets(nef)[['effect_GAC_on_carrying_capacity']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_GAC_on_carrying_capacity_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )


#effect_GEC_on_carrying_capacity
 sheet<-getSheets(nef)[['effect_GEC_on_carrying_capacity']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_GEC_on_carrying_capacity_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_HC_on_NC_deterioration_rate
 sheet<-getSheets(nef)[['effect_HC_on_NC_deterioration_r']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_HC_on_NC_deterioration_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_SC_on_NC_deterioration_rate
 sheet<-getSheets(nef)[['effect_SC_on_NC_deterioration_r']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_SC_on_NC_deterioration_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_TP_on_NC_deterioration_rate
 sheet<-getSheets(nef)[['effect_TP_on_NC_deterioration_r']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_TP_on_NC_deterioration_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_GAC_on_NC_deterioration_rate
 sheet<-getSheets(nef)[['effect_GAC_on_NC_deterioration_']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_GAC_on_NC_deterioration_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_GEC_on_NC_deterioration_rate
 sheet<-getSheets(nef)[['effect_GEC_on_NC_deterioration_']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_GEC_on_NC_deterioration_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_TS_on_per_capita_consumption
 sheet<-getSheets(nef)[['effect_TS_on_per_capita_consump']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_TS_on_per_capita_consumption_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_of_TP_on_Cost_of_living
 sheet<-getSheets(nef)[['effect_of_TP_on_Cost_of_living']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_of_TP_on_Cost_of_living_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )


#effect_HC_on_income_diversification
 sheet<-getSheets(nef)[['effect_HC_on_income_diversifica']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_HC_on_income_diversification_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_SC_on_income_diversification
 sheet<-getSheets(nef)[['effect_SC_on_income_diversifica']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_SC_on_income_diversification_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_HC_on_TS_growth_rate
 sheet<-getSheets(nef)[['effect_HC_on_TS_growth_rate']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_HC_on_TS_growth_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_SC_on_TS_growth_rate
 sheet<-getSheets(nef)[['effect_SC_on_TS_growth_rate']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_SC_on_TS_growth_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_NC_on_TS_growth_rate
 sheet<-getSheets(nef)[['effect_NC_on_TS_growth_rate']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_NC_on_TS_growth_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_GAC_on_TS_growth_rate
 sheet<-getSheets(nef)[['effect_GAC_on_TS_growth_rate']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_GAC_on_TS_growth_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_GEC_on_TS_growth_rate
 sheet<-getSheets(nef)[['effect_GEC_on_TS_growth_rate']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_GEC_on_TS_growth_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_TS_on_TA_growth_rate
 sheet<-getSheets(nef)[['effect_TS_on_TA_growth_rate']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_TS_on_TA_growth_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )

#effect_TP_on_TA_degrowth_rate
 sheet<-getSheets(nef)[['effect_TP_on_TA_degrowth_rate']]
 res<-readColumns(sheet,startColumn=1,endColumn=2,startRow=1,colClasses =c("numeric","numeric") )
 effect_TP_on_TA_degrowth_rate_table <- approxfun( x = res$x , y = res$y , yleft=res$y[1], yright=res$y[length(res$y)] )


CoastalResilience<- function(t, state, parameters) {
  with(as.list(c(state,parameters)), {

#====================================
#Non-linear effects
#================================

#estimate indexes to use as inputs to non-linear effects
NC_Index <- NC / as.numeric(ICs["NC"])
SC_Index <- SC / as.numeric(ICs["SC"])
HC_Index <- HC / as.numeric(ICs["HC"])
TS_Index <- TS / as.numeric(ICs["TS"])
TA_Index <- TA / as.numeric(ICs["TA"])
GAC_Index <- GAC / as.numeric(ICs["GAC"])
GEC_Index <- GEC / as.numeric(ICs["GEC"])

#Non-Linear Effects on Carrying Capacity

effect_HC_on_carrying_capacity <- effect_HC_on_carrying_capacity_table(HC_Index)
effect_SC_on_carrying_capacity <- effect_HC_on_carrying_capacity_table(SC_Index)
effect_GAC_on_carrying_capacity <- effect_GAC_on_carrying_capacity_table(GAC_Index)
effect_GEC_on_carrying_capacity  <- effect_GEC_on_carrying_capacity_table(GEC_Index)

#Tourists Pressure on location
Towns_Tourists_Carrying_Capacity <- base_carrying_capacity *  effect_HC_on_carrying_capacity *
                                                              effect_SC_on_carrying_capacity *
                                                              effect_GAC_on_carrying_capacity *
                                                              effect_GEC_on_carrying_capacity
TP <- TA / Towns_Tourists_Carrying_Capacity



#Non-Linear Effects on NC deterioration rate
effect_HC_on_NC_deterioration_rate <- effect_HC_on_NC_deterioration_rate_table(HC_Index)
effect_SC_on_NC_deterioration_rate <- effect_SC_on_NC_deterioration_rate_table(SC_Index)
effect_TP_on_NC_deterioration_rate <- effect_TP_on_NC_deterioration_rate_table(TP)
effect_GAC_on_NC_deterioration_rate <- effect_GAC_on_NC_deterioration_rate_table(GAC_Index)
effect_GEC_on_NC_deterioration_rate <- effect_GEC_on_NC_deterioration_rate_table(GEC_Index)
effect_CC_on_NC_deterioration_rate <-  1.0

#Non-Linear Effects on Revenues

effect_TS_on_per_capita_consumption <- effect_TS_on_per_capita_consumption_table(TS_Index)
effect_of_TP_on_Cost_of_living <- effect_of_TP_on_Cost_of_living_table(TP)
effect_HC_on_income_diversification <- effect_HC_on_income_diversification_table(HC_Index)
effect_SC_on_income_diversification <- effect_SC_on_income_diversification_table(SC_Index)

#Non-Linear Effects on Tourists Satisfaction
effect_HC_on_TS_growth_rate <- effect_HC_on_TS_growth_rate_table(HC_Index)
effect_SC_on_TS_growth_rate <- effect_SC_on_TS_growth_rate_table(SC_Index)
effect_NC_on_TS_growth_rate <- effect_NC_on_TS_growth_rate_table(NC_Index)
effect_GAC_on_TS_growth_rate <- effect_GAC_on_TS_growth_rate_table(GAC_Index)
effect_GEC_on_TS_growth_rate <- effect_GEC_on_TS_growth_rate_table(GEC_Index)

#Non-Linear Effects on Toursists Arrivals
effect_TS_on_TA_growth_rate <- effect_TS_on_TA_growth_rate_table(TS_Index)
effect_TP_on_TA_degrowth_rate <- effect_TP_on_TA_degrowth_rate_table(TP)

#===========================================
#Flow Variables
#===========================================

#Revenue
per_capita_consumption <- base_per_capita_consumption * effect_TS_on_per_capita_consumption
Tourism_Revenue <- TA * per_capita_consumption
Cost_of_living <- base_cost_of_living * effect_of_TP_on_Cost_of_living #percent of revenue used for paying for cost of living
Cost_of_living <- ifelse(Cost_of_living >=1,1.0, Cost_of_living) #keep alwasy under 1.0
Disposable_income <- Tourism_Revenue *(1-Cost_of_living) * effect_HC_on_income_diversification * effect_SC_on_income_diversification

#Investment distribution
SCInvestments <- Disposable_income * SC_investment_share
HCInvestments <- Disposable_income * HC_investment_share
GACInvestments <-  Disposable_income * GAC_investment_share
GECInvestments <-  Disposable_income * GEC_investment_share


#Natural Capital
NC_regeneration_rate <- NC * NC_base_regeneration_rate
NC_deterioration_rate <- NC * NC_base_deterioration_rate * effect_HC_on_NC_deterioration_rate *
                                                           effect_SC_on_NC_deterioration_rate *
                                                           effect_TP_on_NC_deterioration_rate *
                                                           effect_GAC_on_NC_deterioration_rate *
                                                           effect_GEC_on_NC_deterioration_rate *
                                                           effect_CC_on_NC_deterioration_rate
#

NC_deterioration_rate <- ifelse(NC_Index>=8,NC * NC_base_regeneration_rate,NC_deterioration_rate)

#Social Capital
SC_growth_rate <- SCInvestments / SC_development_cost
SC_deterioration_rate <-  SC  * SC_base_deterioration_rate


#Human Capital
HC_growth_rate <- HCInvestments / HC_development_cost
HC_deterioration_rate <- HC * HC_base_deterioration_rate

#Tourists Satisfaction
TS_growth_rate <- TS * TS_base_growth_rate * min(c(effect_HC_on_TS_growth_rate *
                                                   effect_SC_on_TS_growth_rate *
                                                   effect_NC_on_TS_growth_rate *
                                                   effect_GAC_on_TS_growth_rate *
                                                   effect_GEC_on_TS_growth_rate,1.5))

TS_growth_rate <- ifelse(TS_Index>=4,TS * TS_base_deterioration_rate ,TS_growth_rate )

TS_deterioration_rate <- TS * TS_base_deterioration_rate


#Tourists Arrivals
TA_growth_rate <- TA * TA_base_growth_rate * effect_TS_on_TA_growth_rate
TA_degrowth_rate <- TA * TA_base_degrowth_rate * effect_TP_on_TA_degrowth_rate


#Grey Capital
GAC_growth_rate <- GACInvestments / GAC_development_cost
GAC_degrowth_rate <- GAC * GAC_base_degrowth_rate

#Green Capital
GEC_growth_rate <- GECInvestments / GEC_development_cost
GEC_degrowth_rate <- GEC * GEC_base_degrowth_rate


#========================================
#State variables
#========================================

#Natural Capital
dNC <- NC_regeneration_rate - NC_deterioration_rate
#Social Capital
dSC <- SC_growth_rate - SC_deterioration_rate
#Human Capital
dHC <- HC_growth_rate - HC_deterioration_rate
#Tourists Satisfaction
dTS <- TS_growth_rate - TS_deterioration_rate
#Tourists Arrivals
dTA <- TA_growth_rate - TA_degrowth_rate
#Grey Built Capital
dGAC <- GAC_growth_rate - GAC_degrowth_rate
#Green Built Capital
dGEC <- GEC_growth_rate - GEC_degrowth_rate


    list(c(dNC,dSC,dHC,dTS,dTA,dGAC,dGEC),
           Disposable_income = Disposable_income,
           TP = TP,
           Cost_of_living =Cost_of_living,
           TA_growth_rate= TA_growth_rate,
           TA_degrowth_rate =TA_degrowth_rate,
           Towns_Tourists_Carrying_Capacity=Towns_Tourists_Carrying_Capacity
           )
  })
}

#
parameters<-c(NC_base_regeneration_rate  = 0.01, #[1]
              NC_base_deterioration_rate = 0.01,  #[1]
              SC_development_cost = 11.25,
              SC_base_deterioration_rate = 0.02,
              HC_development_cost = 11.25,
              HC_base_deterioration_rate = 0.02,
              TS_base_growth_rate = 0.01,
              TS_base_deterioration_rate = 0.01,
              TA_base_growth_rate = 0.013,
              TA_base_degrowth_rate = 0.01,
              GAC_development_cost = 18,
              GAC_base_degrowth_rate = 0.0125,
              GEC_development_cost = 22.5,
              GEC_base_degrowth_rate = 0.01,
              base_per_capita_consumption = 1.0,
              base_cost_of_living  = 0.1,
              base_carrying_capacity = 150 ,
              SC_investment_share = 0.05,
              HC_investment_share = 0.05,
              GAC_investment_share = 0.8,
              GEC_investment_share = 0.05
             )

#Initial Conditions
ICs <- c(NC=100,
         SC=100,
         HC=100,
         TS=100,
         TA=100,
         GAC=100,
         GEC=100)

#
times <- seq(0,5000,1)

intg.method<-c("rk4")
#intg.method<-c("euler")

#Simulation execution

out <- ode(y = ICs,
            times = times,
            func = CoastalResilience,
            parms = parameters,
            method =intg.method )

#tag scenario
out<-data.frame(out)
out$scenario <- "Grey Capital Only"

#sustainable scenario
parametersS<-c(NC_base_regeneration_rate  = 0.01, #[1]
              NC_base_deterioration_rate = 0.01,  #[1]
              SC_development_cost = 11.25,
              SC_base_deterioration_rate = 0.02,
              HC_development_cost = 11.25,
              HC_base_deterioration_rate = 0.02,
              TS_base_growth_rate = 0.01,
              TS_base_deterioration_rate = 0.01,
              TA_base_growth_rate = 0.013,
              TA_base_degrowth_rate = 0.01,
              GAC_development_cost = 18,
              GAC_base_degrowth_rate = 0.0125,
              GEC_development_cost = 22.5,
              GEC_base_degrowth_rate = 0.01,
              base_per_capita_consumption = 1.0,
              base_cost_of_living  = 0.1,
              base_carrying_capacity = 150 ,
              SC_investment_share = 0.25,
              HC_investment_share = 0.25,#0.25
              GAC_investment_share = 0.25,
              GEC_investment_share = 0.25
             )

#Initial Conditions
ICs <- c(NC=100,
         SC=100,
         HC=100,
         TS=100,
         TA=100,
         GAC=100,
         GEC=100)

#
times <- seq(0,   #initial
            5000, #final
            1)    #time increase

intg.method<-c("rk4")
#intg.method<-c("euler")

#Simulation execution

out2 <- ode(y = ICs,
            times = times,
            func = CoastalResilience,
            parms = parametersS,
            method =intg.method )
#tag scenario
out2<-data.frame(out2)
out2$scenario <- "All Capitals"

#======================================


#80% investment scenario
parametersS<-c(NC_base_regeneration_rate  = 0.01, #[1]
              NC_base_deterioration_rate = 0.01,  #[1]
              SC_development_cost = 11.25,
              SC_base_deterioration_rate = 0.02,
              HC_development_cost = 11.25,
              HC_base_deterioration_rate = 0.02,
              TS_base_growth_rate = 0.01,
              TS_base_deterioration_rate = 0.01,
              TA_base_growth_rate = 0.013,
              TA_base_degrowth_rate = 0.01,
              GAC_development_cost = 18,
              GAC_base_degrowth_rate = 0.0125,
              GEC_development_cost = 22.5,
              GEC_base_degrowth_rate = 0.01,
              base_per_capita_consumption = 1.0,
              base_cost_of_living  = 0.1,
              base_carrying_capacity = 150 ,
              SC_investment_share = 0.2,
              HC_investment_share = 0.2,#0.25
              GAC_investment_share = 0.2,
              GEC_investment_share = 0.2
             )

#Initial Conditions
ICs <- c(NC=100,
         SC=100,
         HC=100,
         TS=100,
         TA=100,
         GAC=100,
         GEC=100)

#
times <- seq(0,   #initial
            5000, #final
            1)    #time increase

intg.method<-c("rk4")
#intg.method<-c("euler")

#Simulation execution

out3 <- ode(y = ICs,
            times = times,
            func = CoastalResilience,
            parms = parametersS,
            method =intg.method )
#tag scenario
out3<-data.frame(out3)
out3$scenario <- "80% investment"


#======================================
#======================================


#65% investment scenario
parametersS<-c(NC_base_regeneration_rate  = 0.01, #[1]
              NC_base_deterioration_rate = 0.01,  #[1]
              SC_development_cost = 11.25,
              SC_base_deterioration_rate = 0.02,
              HC_development_cost = 11.25,
              HC_base_deterioration_rate = 0.02,
              TS_base_growth_rate = 0.01,
              TS_base_deterioration_rate = 0.01,
              TA_base_growth_rate = 0.013,
              TA_base_degrowth_rate = 0.01,
              GAC_development_cost = 18,
              GAC_base_degrowth_rate = 0.0125,
              GEC_development_cost = 22.5,
              GEC_base_degrowth_rate = 0.01,
              base_per_capita_consumption = 1.0,
              base_cost_of_living  = 0.1,
              base_carrying_capacity = 150 ,
              SC_investment_share = 0.1625,
              HC_investment_share = 0.1625,#0.25
              GAC_investment_share = 0.1625,
              GEC_investment_share = 0.1625
             )

#Initial Conditions
ICs <- c(NC=100,
         SC=100,
         HC=100,
         TS=100,
         TA=100,
         GAC=100,
         GEC=100)

#
times <- seq(0,   #initial
            5000, #final
            1)    #time increase

intg.method<-c("rk4")
#intg.method<-c("euler")

#Simulation execution

out4 <- ode(y = ICs,
            times = times,
            func = CoastalResilience,
            parms = parametersS,
            method =intg.method )
#tag scenario
out4<-data.frame(out4)
out4$scenario <- "65% investment"


#======================================
#======================================


#GEC low development cost
parametersS<-c(NC_base_regeneration_rate  = 0.01, #[1]
              NC_base_deterioration_rate = 0.01,  #[1]
              SC_development_cost = 11.25,
              SC_base_deterioration_rate = 0.02,
              HC_development_cost = 11.25,
              HC_base_deterioration_rate = 0.02,
              TS_base_growth_rate = 0.01,
              TS_base_deterioration_rate = 0.01,
              TA_base_growth_rate = 0.013,
              TA_base_degrowth_rate = 0.01,
              GAC_development_cost = 18,
              GAC_base_degrowth_rate = 0.0125,
              GEC_development_cost = 10.5,#22.5
              GEC_base_degrowth_rate = 0.01,
              base_per_capita_consumption = 1.0,
              base_cost_of_living  = 0.1,
              base_carrying_capacity = 150 ,
              SC_investment_share = 0.05,
              HC_investment_share = 0.05,
              GAC_investment_share = 0.8,
              GEC_investment_share = 0.05
             )

#Initial Conditions
ICs <- c(NC=100,
         SC=100,
         HC=100,
         TS=100,
         TA=100,
         GAC=100,
         GEC=100)

#
times <- seq(0,   #initial
            5000, #final
            1)    #time increase

intg.method<-c("rk4")
#intg.method<-c("euler")

#Simulation execution

out5 <- ode(y = ICs,
            times = times,
            func = CoastalResilience,
            parms = parametersS,
            method =intg.method )
#tag scenario
out5<-data.frame(out3)
out5$scenario <- "GEC low cost"


#======================================


#rbind scenarios
out<-rbind(out,out2,out3,out4,out5)

#plot_results
write.csv(out,"test2.csv")

#variables code name
# NC = natural capital
# SC = social capital
# TS = Tourists satisfaction
# TA = Tourists arrivalas
# CC = climate change
# TP = Tourists Pressure
# GAC = grey capital
# GEC = green capital
