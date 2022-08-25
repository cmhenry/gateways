## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### Calculate the subpopulation enrollment total
subpopulation_enr_tot<- function(df_ocr_wide) {
  df_ocr_wide<- transform(df_ocr_wide, 
                        TOT_ENR = TOT_ENR_F + TOT_ENR_M,
                        HI_ENR = SCH_ENR_HI_M+SCH_ENR_HI_F,
                        AM_ENR = SCH_ENR_AM_M+SCH_ENR_AM_F,
                        AS_ENR = SCH_ENR_AS_M+SCH_ENR_AS_F,
                        HP_ENR = SCH_ENR_HP_M+SCH_ENR_HP_F,
                        BL_ENR = SCH_ENR_BL_M+SCH_ENR_BL_F,
                        WH_ENR = SCH_ENR_WH_M+SCH_ENR_WH_F,
                        TR_ENR = SCH_ENR_TR_M+SCH_ENR_TR_F)

  return(df_ocr_wide)
}


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### Calculate the subpopulation gifted and talented enrollment total
subpopulation_gtenr_tot<- function(df_ocr_wide) {
  df_ocr_wide<- transform(df_ocr_wide, 
                        TOT_GTENR = TOT_GTENR_F + TOT_GTENR_M,
                        HI_GTENR = SCH_GTENR_HI_M+SCH_GTENR_HI_F,
                        AM_GTENR = SCH_GTENR_AM_M+SCH_GTENR_AM_F,
                        AS_GTENR = SCH_GTENR_AS_M+SCH_GTENR_AS_F,
                        HP_GTENR = SCH_GTENR_HP_M+SCH_GTENR_HP_F,
                        BL_GTENR = SCH_GTENR_BL_M+SCH_GTENR_BL_F,
                        WH_GTENR = SCH_GTENR_WH_M+SCH_GTENR_WH_F,
                        TR_GTENR = SCH_GTENR_TR_M+SCH_GTENR_TR_F)

  return(df_ocr_wide)
}


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### Calculate the subpopulation enrollment percentages using the wide data set
subpopulation_enr_percentage<- function(df_ocr_wide) {
  df_ocr_wide<- transform(df_ocr_wide, 
                        HI_ENR_PERCENTAGE = round((HI_ENR)/(TOT_ENR),4),
                        AM_ENR_PERCENTAGE = round((AM_ENR)/(TOT_ENR),4),
                        AS_ENR_PERCENTAGE = round((AS_ENR)/(TOT_ENR),4),
                        HP_ENR_PERCENTAGE = round((HP_ENR)/(TOT_ENR),4),
                        BL_ENR_PERCENTAGE = round((BL_ENR)/(TOT_ENR),4),
                        WH_ENR_PERCENTAGE = round((WH_ENR)/(TOT_ENR),4),
                        TR_ENR_PERCENTAGE = round((TR_ENR)/(TOT_ENR),4))

  return(df_ocr_wide)
}


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### Calculate the subpopulation gifted and talented enrollment percentages using the wide data set
subpopulation_gtenr_percentage<- function(df_ocr_wide) {
  df_ocr_wide<- transform(df_ocr_wide, 
                        HI_GTENR_PERCENTAGE = round((HI_GTENR)/(TOT_GTENR),4),
                        AM_GTENR_PERCENTAGE = round((AM_GTENR)/(TOT_GTENR),4),
                        AS_GTENR_PERCENTAGE = round((AS_GTENR)/(TOT_GTENR),4),
                        HP_GTENR_PERCENTAGE = round((HP_GTENR)/(TOT_GTENR),4),
                        BL_GTENR_PERCENTAGE = round((BL_GTENR)/(TOT_GTENR),4),
                        WH_GTENR_PERCENTAGE = round((WH_GTENR)/(TOT_GTENR),4),
                        TR_GTENR_PERCENTAGE = round((TR_GTENR)/(TOT_GTENR),4))

  return(df_ocr_wide)
}


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### Calculate the subpopulation representation index % of GT/ % of ENR (call this function after the enrollment and GT enrollment percentages are calculated)
subpopulation_representation_index<- function(df_ocr_wide) {
   df_ocr_wide<- transform(df_ocr_wide, 
                        HI_REP_INDEX = HI_GTENR_PERCENTAGE/HI_ENR_PERCENTAGE,
                        AM_REP_INDEX = AM_GTENR_PERCENTAGE/AM_ENR_PERCENTAGE,
                        AS_REP_INDEX = HI_GTENR_PERCENTAGE/HI_ENR_PERCENTAGE,
                        HP_REP_INDEX = HP_GTENR_PERCENTAGE/HP_ENR_PERCENTAGE,
                        BL_REP_INDEX = BL_GTENR_PERCENTAGE/BL_ENR_PERCENTAGE,
                        WH_REP_INDEX = WH_GTENR_PERCENTAGE/WH_ENR_PERCENTAGE,
                        TR_REP_INDEX = TR_GTENR_PERCENTAGE/TR_ENR_PERCENTAGE)
   
  return(df_ocr_wide)
}



## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
### Calculate the subpopulation access Race GT_ENR/ Race ENR 
subpopulation_gifted_access<- function(df_ocr_wide) {
   df_ocr_wide<- transform(df_ocr_wide, 
                        HI_GTACCESS = HI_GTENR/HI_ENR,
                        AM_GTACCESS = AM_GTENR/AM_ENR,
                        AS_GTACCESS = HI_GTENR/HI_ENR,
                        HP_GTACCESS = HP_GTENR/HP_ENR,
                        BL_GTACCESS = BL_GTENR/BL_ENR,
                        WH_GTACCESS = WH_GTENR/WH_ENR,
                        TR_GTACCESS = TR_GTENR/TR_ENR)
   
  return(df_ocr_wide)
}



## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
subpopulation_gentable <- function(df_ocr_wide, groupby_colnames){
  df_ocr_wide <- df_ocr_wide %>%
    subpopulation_enr_tot(.) %>%
    subpopulation_gtenr_tot(.) %>%
    select(groupby_colnames,
           TOT_ENR, TOT_GTENR, 
           HI_ENR, AM_ENR, AS_ENR, HP_ENR, BL_ENR, WH_ENR, TR_ENR, #Total enrollment by race
           HI_GTENR, AM_GTENR, AS_GTENR, HP_GTENR, BL_GTENR, WH_GTENR, TR_GTENR #Gifted enrollment by race
    ) %>%
    group_by(across({{groupby_colnames}})) %>%
    summarise_each(funs(sum)) %>%
    subpopulation_enr_percentage(.) %>%
    subpopulation_gtenr_percentage(.) %>%
    subpopulation_representation_index(.) %>%
    subpopulation_gifted_access(.)
  
  return(df_ocr_wide)
}


