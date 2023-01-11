# descriptives 

library(tidyverse)
library(dplyr)


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
  )
