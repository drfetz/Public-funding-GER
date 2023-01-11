# Variables

# format number as numeric

foerder_db$Fördersumme.in.EUR <- as.numeric(foerder_db$Fördersumme.in.EUR)



# format dates

foerder_db$date_start <- as.Date(foerder_db$Laufzeit.von, format = "%d.%m.%y")

class(foerder_db$date_start)

foerder_db$date_end <- as.Date(foerder_db$Laufzeit.bis, format = "%d.%m.%y")

class(foerder_db$date_end)

# project duration

foerder_db$duration <- (foerder_db$date_end - foerder_db$date_start)

