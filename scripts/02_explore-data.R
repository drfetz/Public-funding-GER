# get to know data

sum(foerder_db$Fördersumme.in.EUR)

aggregate(foerder_db$Fördersumme.in.EUR, by = list(Ressort=foerder_db$Ressort), FUN=sum)

aggregate(foerder_db$Fördersumme.in.EUR, by = list(Bundesland=foerder_db$Bundesland.1), FUN=sum)

