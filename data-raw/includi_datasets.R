#############################################################
# Copia dati territoriali da PUBLIC REPO a PACKAGE DATA DIR #
#############################################################

library(data.table)

y <- readRDS(file.path(masteRfun::app_path, 'censimento', 'dati_completo'))
y <- y[['CMN']]

for(fn in names(y)){
    message(' - Salvo ', fn, '...')
    assign(fn, y[[fn]])
    save( list = fn, file = file.path('data', paste0(fn, '.rda')), version = 3, compress = 'gzip' )
}

fn <- 'etichette'
message(' - Salvo ', fn, '...')
y <- fread('./data-raw/csv/etichette.csv')
assign(fn, y)
save( list = fn, file = file.path('data', paste0(fn, '.rda')), version = 3, compress = 'gzip' )
masteRfun::dbm_do('censimento', 'w', 'etichette', y)
