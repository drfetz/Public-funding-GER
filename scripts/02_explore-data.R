# get to know data

sum(foerder_db$Fördersumme.in.EUR)

aggregate(foerder_db$Fördersumme.in.EUR, by = list(Ressort=foerder_db$Ressort), FUN=sum)

aggregate(foerder_db$Fördersumme.in.EUR, by = list(Bundesland=foerder_db$Bundesland.1), FUN=sum)

db <- aggregate(foerder_db$Fördersumme.in.EUR, by = list(Bundesland=foerder_db$Bundesland.1), FUN=sum)

hist(db)

str(db_2)


total_funding <- db_2$Foerdermittel

options(scipen = 999)
format(total_funding, big.mark = ",", scientific = F)

barplot(total_funding,
        main = "Funding by Federal state",
        xlab = "Bundesland / Federal state",
        ylab = "Total funding",
        font.axis=2,
        names.arg = db$Bundesland,
        col = "darkred",
        horiz = T,
        las = 1)

