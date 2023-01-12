# descriptives 

library(tidyverse)
library(dplyr)
library(kableExtra)

# overview per Ressort

foerder_db %>%
  group_by(Ressort) %>%
  summarise(Number_Fundings = prettyNum(n(),big.mark = ",", scientific = F),
            Number_Orgs = prettyNum(n_distinct(Zuwendungsempfänger),big.mark = ",", scientific = F),
            Number_Cities = prettyNum(n_distinct(Ort),big.mark = ",", scientific = F),
            Funding_Ave = prettyNum(mean(Fördersumme.in.EUR),big.mark = ",", scientific = F),
            Funding_Total = prettyNum(sum(Fördersumme.in.EUR), big.mark = ",", scientific = F),
            Duration_Ave = prettyNum(mean(duration, na.rm = T),big.mark = ",", scientific = F),
            From = min(date_start, na.rm = T),
            To = max(date_start, na.rm = T)
  ) %>%
kbl() %>%
  kable_styling()

foerder_ressort_db <- foerder_db %>%
  group_by(Ressort) %>%
  summarise(Number_Fundings = prettyNum(n(),big.mark = ",", scientific = F),
            Number_Orgs = prettyNum(n_distinct(Zuwendungsempfänger),big.mark = ",", scientific = F),
            Number_Cities = prettyNum(n_distinct(Ort),big.mark = ",", scientific = F),
            Funding_Ave = prettyNum(mean(Fördersumme.in.EUR),big.mark = ",", scientific = F),
            Funding_Total = prettyNum(sum(Fördersumme.in.EUR), big.mark = ",", scientific = F),
            Duration_Ave = prettyNum(mean(duration, na.rm = T),big.mark = ",", scientific = F),
            From = min(date_start, na.rm = T),
            To = max(date_start, na.rm = T)
  )

datatable(foerder_ressort_db)


# Overview Programs / Tech funding

foerder_db %>%
  group_by(Förderprofil = "Technologie- und Innovationsförderung") %>%
  summarise(Number_Fundings = prettyNum(n(),big.mark = ",", scientific = F),
            Number_Orgs = prettyNum(n_distinct(Zuwendungsempfänger),big.mark = ",", scientific = F),
            Number_Cities = prettyNum(n_distinct(Ort),big.mark = ",", scientific = F),
            Funding_Ave = prettyNum(mean(Fördersumme.in.EUR),big.mark = ",", scientific = F),
            Funding_Total = prettyNum(sum(Fördersumme.in.EUR), big.mark = ",", scientific = F),
            Duration_Ave = prettyNum(mean(duration, na.rm = T),big.mark = ",", scientific = F),
            From = min(date_start, na.rm = T),
            To = max(date_start, na.rm = T)
  ) %>%
  kbl() %>%
  kable_styling()

foerder_db %>%
  group_by(Bundesland) %>%
  summarise(Number_Fundings = prettyNum(n(),big.mark = ",", scientific = F),
            Number_Orgs = prettyNum(n_distinct(Zuwendungsempfänger),big.mark = ",", scientific = F),
            Number_Cities = prettyNum(n_distinct(Ort),big.mark = ",", scientific = F),
            Funding_Ave = prettyNum(mean(Fördersumme.in.EUR),big.mark = ",", scientific = F),
            Funding_Total = prettyNum(sum(Fördersumme.in.EUR), big.mark = ",", scientific = F),
            Duration_Ave = prettyNum(mean(duration, na.rm = T),big.mark = ",", scientific = F)
  ) %>%
  kbl() %>%
  kable_styling()


# Most interesting/funded Orgs in Tech funding

foerder_tech_db <- foerder_db %>%
  filter(Förderprofil == "Technologie- und Innovationsförderung" & Fördersumme.in.EUR > 0) %>%
  group_by(Zuwendungsempfänger) %>%
  summarise(Fundings = prettyNum(n(),big.mark = ",", scientific = F),
            Funding_Ave = prettyNum(mean(Fördersumme.in.EUR),big.mark = ",", scientific = F),
            Funding_Total = prettyNum(sum(Fördersumme.in.EUR), big.mark = ",", scientific = F)
  )

datatable(foerder_tech_db)

# over view per Federal state 

foerder_federal_db <- foerder_db %>%
  filter(Förderprofil == "Technologie- und Innovationsförderung" & Fördersumme.in.EUR > 0) %>%
  group_by(Bundesland) %>%
  summarise(Fundings = prettyNum(n(),big.mark = ",", scientific = F),
            Funding_Ave = prettyNum(mean(Fördersumme.in.EUR),big.mark = ",", scientific = F),
            Funding_Total = prettyNum(sum(Fördersumme.in.EUR), big.mark = ",", scientific = F)
  )

datatable(foerder_federal_db)

