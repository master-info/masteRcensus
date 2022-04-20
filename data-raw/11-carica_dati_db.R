########################################
# CENSIMENTO 2020 Acquisizione dati DB #
########################################
# http://dati-censimentipermanenti.istat.it/

masteRfun::load_pkgs(master = FALSE, 'data.table', 'fst')

down <- FALSE
prfx_url <- 'http://dati-censimentipermanenti.istat.it/FileView2.aspx?IDFile='

out_path <- file.path(app_path, 'censimento')
tmpd <- file.path(ext_path, 'censimento', '2020')
tmpf <- tempfile()

# POPOLAZIONE ---------------------------------------------
if(down){
    download.file(paste0(prfx_url, 'f2618291-b253-4dd3-9240-7b6188017b58'), tmpf)
    unzip(tmpf, exdir = tmpd)
    unlink(tmpf)
}
y <- fread(
        list.files(tmpd, '^DCSS_POP.*csv$', full.names = TRUE), 
        select = c('ITTER107', 'TIPO_DATO_CENS_POP', 'SEXISTAT1', 'ETA1', 'CITTADINANZA', 'ISO', 'TIME', 'Value'),
        col.names = c('CMN', 'dominio', 'sesso', 'eta', 'cittadinanza', 'provenienza', 'anno', 'valore')
)

y <- y[!grepl('^I', CMN)][, CMN := as.numeric(CMN)][order(CMN)]
y <- y[dominio %chin% c('RESPOP_MIN_AV', 'RESPOP_AV', 'RESFORPOP_AV')]
y[, cittadinanza := ifelse(cittadinanza == 'FRGAPO', 'S', ifelse(cittadinanza == 'ITL', 'I', 'T'))]

## residente
yt <- y[dominio == 'RESPOP_AV'][, c('dominio', 'provenienza') := NULL]

### totali
yr <- yt[eta == 'TOTAL'][, eta := NULL]
setorderv(yr)
yr[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), cittadinanza = factor(cittadinanza, levels = c('I', 'S', 'T')) )]
write_fst(yr, file.path(out_path, 'residenti'))

### eta 
ye <- yt[eta != 'TOTAL']
ye[eta == 'Y0-9', eta := 'Y00-09']
ye[eta == 'Y5-9', eta := 'Y05-09']
ye[eta == 'Y_UN4', eta := 'Y00-04']
ye[eta == 'Y_GE100', eta := 'YGE100']
setorderv(ye)

#### eta quinquennale >>> CONTROLLARE CHE CITTADINANZA SIA PRESENTE CORRETTAMENTE, ISTAT DEI MIEI STRACOGLIONI!!!!
ye1 <- ye[grepl('4$|^.{2}5|G', eta) & cittadinanza == 'T'][, cittadinanza := NULL]
setorderv(ye1)
ye1[, `:=`( 
    sesso = factor(sesso, levels = c('F', 'M', 'T')), 
    eta = factor(eta, ordered = TRUE)
)]
write_fst(ye1, file.path(out_path, 'eta05'))

#### eta decennale
ye2 <- ye[!grepl('4$|^.{2}5', eta)]
setorderv(ye2)
ye2[, `:=`( 
    sesso = factor(sesso, levels = c('F', 'M', 'T')), 
    eta = factor(eta, ordered = TRUE),
    cittadinanza = factor(cittadinanza, levels = c('I', 'S', 'T')) 
)]
write_fst(ye2, file.path(out_path, 'eta10'))

## minori
ym <- y[dominio == 'RESPOP_MIN_AV']
ym[, c('dominio', 'eta', 'provenienza') := NULL]
setorderv(ym)
ym[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), cittadinanza = factor(cittadinanza, levels = c('I', 'S', 'T')) )]
write_fst(ym, file.path(out_path, 'minori'))

## stranieri
ys <- y[dominio == 'RESFORPOP_AV']
ys[, c('dominio', 'eta', 'cittadinanza') := NULL]
ys <- ys[provenienza != 'ALL']
ys[provenienza == 'XASI_C_S', provenienza := 'ASI_C_S']
ys[provenienza == 'X95', provenienza := 'XK']
ys[provenienza == 'EU', provenienza := 'EUR_EU']
ys[provenienza == 'XSD_S', provenienza := 'SS']
ys[provenienza == '999', provenienza := 'ZZ']


### continenti
ys1 <- ys[grepl('^[A-Z]{3}$', provenienza)]
setorderv(ys1)
ys1[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), provenienza = factor(provenienza, levels = c('AFR', 'AME', 'ASI', 'EUR', 'OCE')) )]
write_fst(ys1, file.path(out_path, 'stranieri_continenti'))

### aree
ys2 <- ys[provenienza == 'OCE' | nchar(provenienza) > 3]
setorderv(ys2)
ys2[, `:=`( 
        sesso = factor(sesso, levels = c('F', 'M', 'T')), 
        provenienza = factor(
            provenienza, 
            levels = c(
                'AFR_N', 'AFR_E', 'AFR_W', 'AFR_C_S', 'AME_N', 'AME_C_S', 
                'ASI_E', 'ASI_W', 'ASI_C_S', 'EUR_EU', 'EUR_C_E', 'EUR_OTH', 'OCE'
            )
        ) 
)]
write_fst(ys2, file.path(out_path, 'stranieri_aree'))

### paesi
ys3 <- ys[grepl('^[A-Z]{2}$', provenienza)]
setorderv(ys3)
ys3[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), provenienza = factor(provenienza) )]
write_fst(ys3, file.path(out_path, 'stranieri_paesi'))


# ISTRUZIONE, PROFESSIONE, PENDOLARISMO -------------------
if(down){
    download.file(paste0(prfx_url, '7c8581e8-bf7a-44d1-b626-499dd207a934'), tmpf)
    unzip(tmpf, exdir = tmpd)
    unlink(tmpf)
}
y <- fread(
        list.files(tmpd, '^DCSS_ISTR.*csv$', full.names = TRUE), 
        select = c('ITTER107', 'TIPO_DATO_CENS_POP', 'SEXISTAT1', 'ETA1', 'CITTADINANZA', 'TITOLO_STUDIO', 'FORZE_LAV', 'PROV_DEST_Z', 'MOTIVOPS1', 'TIME', 'Value'),
        col.names = c('CMN', 'dominio', 'sesso', 'eta', 'cittadinanza', 'istruzione_id', 'professione_id', 'destinazione', 'motivo', 'anno', 'valore')
)
y <- y[!grepl('^I', CMN)][, CMN := as.numeric(CMN)][order(CMN)]


## ISTRUZIONE E PROFESSIONE
y1 <- y[dominio == 'RESPOP_AV'][, c('dominio', 'destinazione', 'motivo') := NULL]
lkp.z <- data.table(
    'istruzione_id' = c('NED', 'PSE', 'LSE', 'USE_IF', 'BL', 'ML_RDD', 'ALL'),
    'istruzione' = c('NO', 'EL', 'MI', 'MS', 'LB', 'LM', 'T')
)
lkp.p <- data.table(
    'professione_id' = c(1, 4, 5, 7, 12, 22, 23, 24, 99),
    'professione' = c('FL-O', 'NFL-C', 'NFL-S', 'NFL-O', 'FL-C', 'FL-T', 'NFL-T', 'NFL-P', 'T')
)

### Istruzione Cittadinanza
yz <- y1[eta == 'Y_GE9' & !istruzione_id %chin% c('IL', 'LBNA', 'ML', 'RDD' )][, c('eta', 'professione_id') := NULL]
yz[, cittadinanza := fifelse(cittadinanza == 'FRGAPO', 'S', ifelse(cittadinanza == 'ITL', 'I', 'T'))]
yz <- lkp.z[yz, on = 'istruzione_id'][, istruzione_id := NULL]
setcolorder(yz, c('CMN', 'sesso', 'cittadinanza'))
setorderv(yz)
yz[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), istruzione = factor(istruzione), cittadinanza = factor(cittadinanza, levels = c('I', 'S', 'T')) )]
write_fst(yz, file.path(out_path, 'istruzione'))

### Istruzione eta
yze <- y1[eta != 'Y_GE9' & istruzione_id != 'ALL'][, c('cittadinanza', 'professione_id') := NULL]
yze[eta == 'Y9-24', eta := 'Y09-24']
yze[eta == 'Y_GE65', eta := 'YGE65']
yze <- lkp.z[yze, on = 'istruzione_id'][, istruzione_id := NULL]
setcolorder(yze, c('CMN', 'sesso', 'eta'))
setorderv(yze)
yze[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), eta = factor(eta), istruzione = factor(istruzione) )]
write_fst(yze, file.path(out_path, 'istruzione_eta'))

### Professione Cittadinanza
yp <- y1[istruzione_id == 'ALL' & eta == 'Y_GE15'][, c('eta', 'istruzione_id') := NULL]
yp[, cittadinanza := fifelse(cittadinanza == 'FRGAPO', 'S', ifelse(cittadinanza == 'ITL', 'I', 'T'))]
yp <- lkp.p[yp, on = 'professione_id'][, professione_id := NULL]
setcolorder(yp, c('CMN', 'sesso', 'cittadinanza'))
setorderv(yp)
yp[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), professione = factor(professione), cittadinanza = factor(cittadinanza, levels = c('I', 'S', 'T')) )]
write_fst(yp, file.path(out_path, 'professione'))

### Professione Eta
ype <- y1[istruzione_id == 'ALL' & !eta %chin% c('Y9-24', 'Y_GE9', 'Y_GE15')][, c('cittadinanza', 'istruzione_id') := NULL]
ype <- lkp.p[ype, on = 'professione_id'][, professione_id := NULL]
ype[eta == 'Y_GE65', eta := 'YGE65']
setcolorder(ype, c('CMN', 'sesso', 'eta'))
setorderv(ype)
ype[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), professione = factor(professione), eta = factor(eta) )]
write_fst(ype, file.path(out_path, 'professione_eta'))


# PENDOLARISMO --------------------------------------------
yc <- y[dominio == 'RP_COM_DAY', .(CMN, sesso, destinazione, motivo, anno, valore)]
yc[, destinazione := fifelse(destinazione == 'SMPUR', 'S', ifelse(destinazione == 'OMPUR', 'A', 'T'))]
yc[, motivo := fifelse(motivo == 'WK', 'L', ifelse(motivo == 'STD', 'S', 'T'))]
setorderv(yc)
yc[, `:=`( sesso = factor(sesso, levels = c('F', 'M', 'T')), destinazione = factor(destinazione, levels = c('S', 'A', 'T')), motivo = factor(motivo, levels = c('L', 'S', 'T')) )]
write_fst(yc, file.path(out_path, 'pendolari'))


# FAMIGLIE ------------------------------------------------

## Totali
if(down){
    download.file(paste0(prfx_url, '77e1e557-38c9-461f-a93a-7ca30b7ccaf5'), tmpf)
    unzip(tmpf, exdir = tmpd)
    unlink(tmpf)
}
yf <- fread(
        list.files(tmpd, '^DCSS_FAM_POP.*csv$', full.names = TRUE),
        select = c('ITTER107', 'TIPO_DATO_CENS_POP', 'TIME', 'Value'),
        col.names = c('CMN', 'dominio', 'anno', 'valore')
)
yf <- yf[!grepl('^I', CMN)][, CMN := as.numeric(CMN)][order(CMN)
            ][dominio %chin% c('NPHH_AV', 'POPHH_AV')
                ][, dominio := fifelse(dominio == 'NPHH_AV', 'F', 'PF')]
yf[, `:=`( dominio = factor(dominio, levels = c('F', 'PF')), valore = round(valore) )]

## Numero Componenti + Stranieri (solo grandi comuni)
# if(down){
#     download.file(paste0(prfx_url, 'd7441a05-07ae-4bbf-aba3-1fb5d4eba4d7'), tmpf)
#     unzip(tmpf, exdir = tmpd)
# }
# yfs <- fread(
#         list.files(tmpd, '^DCSS_FAMIGLIE.*csv$', full.names = TRUE),
#         select = c('ITTER107', 'TIPO_DATO_CENS_POP', 'NUMEROSITA_A', 'NUMEROSITA_B', 'TIME', 'Value'),
#         col.names = c('CMN', 'dominio', 'comp_tot', 'comp_stran', 'anno', 'valore')
# )
# yfs <- yfs[!grepl('^I', CMN)][, CMN := as.numeric(CMN)][order(CMN)]
# yfs1 <- yfs[dominio == 'NPHH_AV']  # TOT + NUM COMP
# yfs2 <- yfs[dominio == 'NFPHH']    # NUM_COMP faig lie tuttei stranieri (= NFPHH solo per comp 1,2,3)
# yfs3 <- yfs[dominio == 'WH_FR_HH'] # TOT_COMP * COMP_STRAN

# SALVATAGGIO ----------------------------------------------

## store all datasets in a single file
yt <- list()
yt[['CMN']] <- list(
        'residenti' = converti_CMN(yr),
        'famiglie' = converti_CMN(yf),
        'eta05' = converti_CMN(ye1),
        'eta10' = converti_CMN(ye2),
        'minori' = converti_CMN(ym),
        'stranieri_continenti' = converti_CMN(ys1),
        'stranieri_aree' = converti_CMN(ys2),
        'stranieri_paesi' = converti_CMN(ys3),
        'istruzione' = converti_CMN(yz),
        'istruzione_eta' = converti_CMN(yze),
        'professione' = converti_CMN(yp),
        'professione_eta' = converti_CMN(ype),
        'pendolari' = converti_CMN(yc)
)
yn <- names(yt[['CMN']])

## save in database
for(idx in 1:length(yt$CMN)) dbm_do('censimento', 'w', yn[[idx]], yt$CMN[[idx]])

## save in project path as csv files
for(idx in 1:length(yt$CMN)) fwrite(yt$CMN[[idx]], file.path('./', 'data-raw', 'csv', paste0(yn[[idx]], '.csv')))
system('rm ./data-raw/csv/censimento.zip')
zip('./data-raw/csv/censimento', './data-raw/csv/')

## aggregate to higher location types
for(x in c('PRV', 'RGN', 'RPT', 'SLL', 'ESSZ')) yt[[x]] <- lapply(yt$CMN, somma_valori_localita, x)
yt[['ITA']] <- lapply(yt$CMN, \(z) z[, .(valore = sum(valore)), setdiff(names(z), c('CMN', 'valore')) ])

## save in app path as binary
saveRDS(yt, file.path(app_path, 'censimento', 'dati_completo'))

## save flatten upper CMN
# tabella tipo_zona cod_zona sesso eta cittadinanza istruzione professione provenienza anno valore
# rbindlist(lapply(c('PRV', 'RGN', 'RPT', 'SLL', 'ESSZ', 'ITA'), \(x) rbindlist(lapply(yn, \(z) data.table(z, x, yt[[x]][[z]]) )) ))

## save data for tabella "comuni"
# y <- readRDS(file.path(app_path, 'censimento', 'dati_completo'))
y <- y[['CMN']]
yg <- rbindlist(list(
        data.table( 'pop', y$residenti[anno == 2020 & sesso == 'T' & cittadinanza == 'T', .(CMN, valore)]),
        data.table( 'maschi', y$residenti[anno == 2020 & sesso == 'M' & cittadinanza == 'T', .(CMN, valore)]),
        data.table( 'minori', y$minori[anno == 2020 & sesso == 'T' & cittadinanza == 'T', .(CMN, valore)]),
        data.table( 'anziani', y$eta10[anno == 2020 & sesso == 'T' & cittadinanza == 'T' & eta %in% c('Y70-79', 'Y80-89', 'Y90-99', 'YGE100'), .(valore = sum(valore)), CMN]),
        data.table( 'fam', y$famiglie[anno == 2019 & dominio == 'F', .(CMN, valore)]),
        data.table( 'stran', y$residenti[anno == 2020 & sesso == 'T' & cittadinanza == 'S', .(CMN, valore)]),
        data.table( 'istr_sup', y$istruzione[anno == 2019 & sesso == 'T' & cittadinanza == 'T' & istruzione == 'LM', .(CMN, valore)]),
        data.table( 'occ', y$professione[anno == 2019 & sesso == 'T' & cittadinanza == 'T' & professione == 'FL-O', .(CMN, valore)])
))
fwrite(dcast(yg, CMN~V1, fill = 0), './data-raw/csv/dati_per_tab_comuni.csv')

# Clean and exit ------------------------------------------
rm(list = ls())
gc()
