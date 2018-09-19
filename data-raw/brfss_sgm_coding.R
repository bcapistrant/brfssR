# libraries needed
library(magrittr)
library(foreign)
library(tidyverse)

# pulling in the datasets
### 2015
#Colorado, Kansas, Maryland
sgm2015_0<-c(8,20,24)

BRFSS_2015_0<-read.xport("LLCP2015.XPT")

data_2015 <- BRFSS_2015_0 %>%
  filter(X_STATE %in% sgm2015_0) %>%
  mutate(YEAR=2015,
         SEQNO=as.integer(SEQNO))

rm(BRFSS_2015_0)

### 2016
## Idaho, Kentucky, Missouri
sgm2016_0<-c(16,21,29)

BRFSS_2016_0<-read.xport("LLCP2016.XPT")
data_2016 <- BRFSS_2016_0 %>%
  filter(X_STATE %in% sgm2016_0) %>%
  mutate(YEAR=2016,
         SEQNO=as.integer(SEQNO))


rm(BRFSS_2016_0)

### 2017
# California (6), Connecticut (9), Delaware (10),
# Florida (12), Georgia(13), Guam (66), Hawaii (15),
# Illinois (17), Indiana (18), Iowa (19), 
# Louisiana (22), Massachusetts (25), Minnesota (27),
# Mississippi (28), Montana (30), Nevada (32), NewYork (36)
# NorthCarolina (37), Ohio (39), Oklahoma (40), Pennsylvania (42)
# RhodeIsland (44), SouthCarolina (45), Texas (48), Vermont (50)
# Virginia (51), Washington (53), Wisconsin (55)
#8,16,20,21,24,29
sgm2017_0<-c(6,9,10,12,13,66,15,17,18,19,22,25,27,28,30,32,36,
            37,39,40,42,44,45,48,50,51,53,55)

BRFSS_2017_0<-read.xport("LLCP2017.XPT")
data_2017 <- BRFSS_2017_0 %>%
  filter(X_STATE %in% sgm2017_0) %>%
  mutate(YEAR=2017,
         SEQNO=as.integer(SEQNO))

rm(BRFSS_2017_0)

### COMBINING 2015, 2016, 2017
brfss_sgm<-bind_rows(data_2017,data_2016,data_2015)
#rm(data_2017,data_2016,data_2015)

### Labeling State indicators
sgmstates<-c(6,8,9,10,12,13,15,16,
               17,18,19,20,21,22,24,25,
               27,28,29,30,31,32,36,37,
               39,40,42,44,45,48,50,51,
               53,55,66)
sgmstatelabel<-c("CA","CO","CT","DE","FL","GA","HI","ID",
                 "IL","IN","IA","KS","KY","LA","MD","MA",
                 "MN","MS","MO","MT","NE","NV","NY","NC",
                 "OH","OK","PA","RI","SC","SD","TX","VA",
                 "WA","WI","GU")
brfss_sgm$X_STATE<- factor(brfss_sgm$X_STATE, levels=sgmstates, labels=sgmstatelabel)