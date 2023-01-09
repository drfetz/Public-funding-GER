# get to know data

sum(foerder_db$Fördersumme.in.EUR)

aggregate(foerder_db$Fördersumme.in.EUR, by = list(Ressort=foerder_db$Ressort), FUN=sum)

aggregate(foerder_db$Fördersumme.in.EUR, by = list(Bundesland=foerder_db$Bundesland.1), FUN=sum)

db <- aggregate(foerder_db$Fördersumme.in.EUR, by = list(Bundesland=foerder_db$Bundesland.1), FUN=sum)

hist(db)

str(db_2)


total_funding <- db_2$Foerdermittel

# Total funding by federal state using barplot()

options(scipen = 999)
format(total_funding, big.mark = ",", scientific = F)

barplot(total_funding[order(total_funding, decreasing = F)],
        names.arg = db$Bundesland[order(total_funding, decreasing = F)],
        main = "Funding by Federal state",
        xlab = "Bundesland / Federal state",
        ylab = "Total funding",
        font.axis=2,
        col = "darkred",
        horiz = T,
        las = 1)

# Total funding by federal state using ggplot()

options(digits = 4)
foerder_db %>%
        mutate(Bundesland = reorder(Bundesland, desc(as.numeric(Fördersumme.in.EUR)))) %>%
        ggplot(aes(x = Bundesland , y = as.numeric(Fördersumme.in.EUR)))+
        geom_col()+
        coord_flip()+
        labs(title = "Funding by Federal State", 
             x = "Bundesland / Federal state", 
             y = "Total funding")+
        scale_y_continuous(labels = label_number(suffix = "M", scale = 1e-6))+
        theme_classic()

# Funding received by federal state by ressort

foerder_db %>%
        mutate(Bundesland = fct_reorder(Bundesland, Fördersumme.in.EUR)) %>%
        ggplot(aes(y=Bundesland,
                   x=Fördersumme.in.EUR))+
        geom_col()+
        facet_wrap(~Ressort)+
        labs(y="Bundesland")

foerder_db %>%
        mutate(Bundesland = reorder(Bundesland, Fördersumme.in.EUR)) %>%
        ggplot(aes(x = Bundesland, y = Fördersumme.in.EUR, fill = Ressort))+
        geom_col()+
        labs(title = "Funding received by Federal State by Ressort", 
             x = "Bundesland / Federal state", 
             y = "Total funding")+
        scale_y_continuous(labels = label_number(suffix = "M", scale = 1e-6))+
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


# Count of fundings received by federal state by ressort

foerder_db %>%
        mutate(Bundesland = reorder(Bundesland, Fördersumme.in.EUR)) %>%
        ggplot(aes(x = Bundesland, fill = Ressort))+
        geom_bar()+
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


# Average funding received by federal state


# Average funding received by federal state
