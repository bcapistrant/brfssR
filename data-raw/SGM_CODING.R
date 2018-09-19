#README: REPLACE brfss_cg WITH THE NAME OF THE DATASET YOU'RE DRAWING FROM


## Sexual / Gender Minority Status
brfss_cg <- brfss_cg %>%
  mutate(         
    #Sexual and Gender Minority Status
    #Sexual Orientation - Lesbian, Gay, Bisexual vs. Heterosexual
    lgb_d=as.factor(if_else(SXORIENT %in% 2:3, "Sexual Minority", "Heterosexual")),
    #Gender Minority Identity - Trans* or Gender-non-Conforming vs. Cis-gendered
    genmin_d=as.factor(if_else(TRNSGNDR %in% 1:3, "Gender Minority", "Non-Gender Minority")),
    #Sexual / Gender Minority - Either LGB or Trans/GNC vs. Cis-gendered Heterosexuals
    sgm_d=as.factor(if_else(lgb_d=="Sexual Minority" | genmin_d=="Gender Minority", "SGM", "Non-SGM"))
  )

# Dichotomous Sexual Minority Indicator Variable: LGB vs. (reference) Heterosexual
brfss_cg$lgb_d<-relevel(factor(brfss_cg$lgb_d), ref="Heterosexual")

# Dichotomous Gender Minority Indicator Variable: Trans/GNC vs. (reference) Cis
brfss_cg$genmin_d<-relevel(factor(brfss_cg$genmin_d), ref="Non-Gender Minority")