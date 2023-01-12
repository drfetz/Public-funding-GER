# Blockchain projects

library(stringr)

foerder_blockchain_db <- foerder_db[str_detect(foerder_db$Thema, "blockchain"), ]

head(foerder_blockchain_db)


datatable(foerder_blockchain_db)
