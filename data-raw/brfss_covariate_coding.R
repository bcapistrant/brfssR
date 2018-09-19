##README: REPLACE BRFSS_CG WITH FILE NAME AS NEEDED


## Demographics, Covariates & Health Outcomes

brfss_cg <- brfss_cg %>%
  mutate(  
    # Covariates
    #Age
    age5yr=as.numeric(if_else(X.AGEG5YR<14, X.AGEG5YR,NA_integer_)),
    millennial=as.numeric(if_else(age5yr %in% 1:3, 1,
               if_else(age5yr %in% 4:13,0, NA_real_))),
    
    millennial_d=as.factor(if_else(age5yr %in% 1:3, "Yes",
                                 if_else(age5yr %in% 4:13, "No", NA_character_))),
    #Race / Ethnicity
    race=as.factor(if_else(X.RACEGR3==1, "White",
                           if_else(X.RACEGR3==2, "Black",
                                   if_else(X.RACEGR3==3, "Other",
                                           if_else(X.RACEGR3==4, "Multi",
                                                   if_else(X.RACEGR3==5, "Hispanic",
                                                           if_else(X.RACEGR3==9, "DK/NS/Refused", NA_character_))))))),
    
    # Marital Status
    marstat=as.factor(if_else(MARITAL==1, "Married",
                              if_else(MARITAL==2, "Divorced",
                                      if_else(MARITAL==3, "Widowed",
                                              if_else(MARITAL==4, "Separated",
                                                      if_else(MARITAL==5, "Never Married",
                                                              if_else(MARITAL==6, "Coupled",
                                                                      if_else(MARITAL==9, "Refused",NA_character_)))))))),
    #Sexual and Gender Minority Status
        #Sexual Orientation - Lesbian, Gay, Bisexual vs. Heterosexual
            lgb_d=as.factor(if_else(SXORIENT %in% 2:3, "Sexual Minority", "Heterosexual")),
        #Gender Minority Identity - Trans* or Gender-non-Conforming vs. Cis-gendered
            genmin_d=as.factor(if_else(TRNSGNDR %in% 1:3, "Gender Minority", "Non-Gender Minority")),
        #Sexual / Gender Minority - Either LGB or Trans/GNC vs. Cis-gendered Heterosexuals
            sgm_d=as.factor(if_else(lgb_d=="Sexual Minority" | genmin_d=="Gender Minority", "SGM", "Non-SGM")),
    # Children
    numchild=as_factor(if_else(X.CHLDCNT==1,"None",
                               if_else(X.CHLDCNT==2, "One",
                                       if_else(X.CHLDCNT==3, "Two",       
                                               if_else(X.CHLDCNT %in% 4:6, "3+",NA_character_
                                               ))))),
    
    # Education
    education=as.factor(if_else(EDUCA %in% 1:3, "<High School",
                                if_else(EDUCA==4, "High School",
                                        if_else(EDUCA==5, "Some College",
                                                if_else(EDUCA==6, "College+",NA_character_))))),
    
    # Income
    income=as.factor(if_else(INCOME2==1, "<$10,000",
                             if_else(INCOME2==2, "$10,000-$15,000",
                                     if_else(INCOME2==3, "$15,000-$20,000",
                                             if_else(INCOME2==4, "$20,000-$25,000",
                                                     if_else(INCOME2==5, "$25,000-$35,000",
                                                             if_else(INCOME2==6, "$35,000-$50,000",
                                                                     if_else(INCOME2==7, "$50,000-$75,000",
                                                                             if_else(INCOME2==8, ">$75,000",
                                                                                     if_else(INCOME2>8, "Don't Know / Refused",NA_character_)))))))))),
    
    # Work Status
    employed=as.factor(if_else(EMPLOY1 %in% 1:2, "Employed",
                               if_else(EMPLOY1 %in% c(3,4,8), "Not Working",
                                       if_else(EMPLOY1==5, "Homemaker",
                                               if_else(EMPLOY1==6, "Student",
                                                       if_else(EMPLOY1==7, "Retired",NA_character_)))))),
    
    # Chronic Conditions
    # Diabetes
    diabetes=as_factor(if_else(DIABETE3 %in% c(1,2,4),"Diabetic",
                               if_else(DIABETE3==3,"Non-Diabetic",
                                       NA_character_))),
    
    # Tobacco
    
    smoking=as_factor(if_else((SMOKE100==1 & SMOKDAY2 %in% 1:2), "Current",
                       if_else((SMOKE100==1 & SMOKDAY2==3), "Former",
                       if_else((SMOKE100==2), "Never", NA_character_)))),
    
    # Alcohol
    binge_drink=as.factor(if_else((ALCDAY5==888 | DRNK3GE5==88), "None",
                                  if_else(DRNK3GE5>=1, "1+", NA_character_))),
    # Physical Activity
    physact=as.factor(if_else(EXERANY2==1,"Yes",
                              if_else(EXERANY2==2,"No", NA_character_))),
    
    # Sleep
    sleephrs=if_else(SLEPTIM1>24,NA_integer_,SLEPTIM1),
    
    # QOL
    # Self-Rated Health
    SRH=replace(GENHLTH,GENHLTH>5,NA_integer_),
    SRH_d=as.factor(if_else(SRH %in% 3:5, "Good/Fair/Poor", "Very Good/Excellent")),
    # Healthy Days - Physical, Mental, and Poor Health     
    Days_Phys=(if_else(PHYSHLTH<=30, PHYSHLTH,
                if_else(PHYSHLTH>30,NA_integer_, NA_integer_))),
    Days_Ment=(if_else(MENTHLTH<=30, MENTHLTH,
                       if_else(MENTHLTH>30,NA_integer_, NA_integer_))),
    Days_Poor=(if_else(POORHLTH<=30, POORHLTH,
                       if_else(POORHLTH>30,NA_integer_, NA_integer_)))
    
  )



# Labelling and Reordering Factor Levels

# Age
agegroups<- c("18-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", 
              "55-59", "60-64", "65-69", "70-74", "75-79", "80+")
brfss_cg$age5yr <- factor( brfss_cg$age5yr, levels=c(1:13), labels=agegroups)

#Millennial
brfss_cg$millennial_d<-relevel(factor(brfss_cg$millennial_d), ref="No")

# Race: (reference) White
brfss_cg$race<-relevel(factor(brfss_cg$race), ref="White")

# Marital Status
brfss_cg$marstat=relevel(factor(brfss_cg$marstat), ref="Married")

# Dichotomous Sexual Minority Indicator Variable: LGB vs. (reference) Heterosexual
brfss_cg$lgb_d<-relevel(factor(brfss_cg$lgb_d), ref="Heterosexual")

# Dichotomous Gender Minority Indicator Variable: Trans/GNC vs. (reference) Cis
brfss_cg$genmin_d<-relevel(factor(brfss_cg$genmin_d), ref="Non-Gender Minority")

# Dichotomous Sexual/Gender Minority Indicator Variable: SGM vs. (reference) Cis,Heterosexual
brfss_cg$sgm_d<-relevel(factor(brfss_cg$sgm_d), ref="Non-SGM")

#Children
brfss_cg$numchild<-relevel(factor(brfss_cg$numchild), ref="None")

#Education
brfss_cg$education<-relevel(factor(brfss_cg$education), ref="High School")

#Income
brfss_cg$income<-relevel(factor(brfss_cg$income), ref=">$75,000")

#Employed
brfss_cg$employed<-relevel(factor(brfss_cg$employed), ref="Employed")

#Diabetes
brfss_cg$diabetes<-relevel(factor(brfss_cg$diabetes), ref="Non-Diabetic")

#Self-Rated Health
brfss_cg$SRH_d<-relevel(factor(brfss_cg$SRH_d), ref="Very Good/Excellent")

#Smoking
brfss_cg$smoking<-relevel(factor(brfss_cg$smoking), ref="Never")

#Binge Drinking
brfss_cg$binge_drink<-relevel(factor(brfss_cg$binge_drink), ref="None")

#Physical Activity
brfss_cg$physact<-relevel(factor(brfss_cg$physact), ref="Yes")
