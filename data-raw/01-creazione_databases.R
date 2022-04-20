#################################################
# Creazione databases e tabelle in MySQL server #
#################################################

library(masteRfun)

dbn <- 'censimento'
crea_db(dbn)

## TABELLA <ETICHETTE> ----------------
x <- "
    `tabella` CHAR(20) NOT NULL,
    `attributo` CHAR(12) NOT NULL,
    `valore` CHAR(7) NULL DEFAULT NULL,
    `etichetta` CHAR(50) NOT NULL,
    `ordine` TINYINT UNSIGNED NOT NULL,
    UNIQUE KEY `pk` (`tabella`, `attributo`, `valore`),
    KEY `tabella` (`tabella`),
    KEY `attributo` (`attributo`),
    KEY `valore` (`valore`),
    KEY(`ordine`)
"
crea_tabella_db(dbn, 'etichette', x)

## TABELLA <RESIDENTI> ----------------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `cittadinanza` CHAR(1) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `cittadinanza`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `cittadinanza` (`cittadinanza`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'residenti', x)

## TABELLA <FAMIGLIE> -----------------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `dominio` CHAR(2) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `dominio`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `dominio` (`dominio`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'famiglie', x)

## TABELLA <ETA QUINQUENNALE> ---------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `eta` CHAR(6) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `eta`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `eta` (`eta`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'eta05', x)

## TABELLA <ETA DECENNALE> ------------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `eta` CHAR(6) NOT NULL,
    `cittadinanza` CHAR(1) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `eta`, `cittadinanza`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `eta` (`eta`),
    KEY `cittadinanza` (`cittadinanza`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'eta10', x)

## TABELLA <MINORI> -------------------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `cittadinanza` CHAR(1) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `cittadinanza`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `cittadinanza` (`cittadinanza`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'minori', x)

## TABELLA <STRANIERI_CONTINENTI> -----
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `provenienza` CHAR(3) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `provenienza`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `provenienza` (`provenienza`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'stranieri_continenti', x)

## TABELLA <STRANIERI_AREE> -----------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `provenienza` CHAR(7) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `provenienza`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `provenienza` (`provenienza`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'stranieri_aree', x)

## TABELLA <STRANIERI_PAESI> ----------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `provenienza` CHAR(2) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `provenienza`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `eta` (`provenienza`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'stranieri_paesi', x)

## TABELLA <ISTRUZIONE> ---------------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `cittadinanza` CHAR(1) NOT NULL,
    `istruzione` CHAR(16) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `cittadinanza`, `istruzione`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `cittadinanza` (`cittadinanza`),
    KEY `istruzione` (`istruzione`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'istruzione', x)

## TABELLA <ISTRUZIONE_ETA> -----------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `eta` CHAR(6) NOT NULL,
    `istruzione` CHAR(16) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `eta`, `istruzione`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `eta` (`eta`),
    KEY `istruzione` (`istruzione`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'istruzione_eta', x)

## TABELLA <PROFESSIONE> --------------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `cittadinanza` CHAR(1) NOT NULL,
    `professione` CHAR(23) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `cittadinanza`, `professione`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `cittadinanza` (`cittadinanza`),
    KEY `professione` (`professione`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'professione', x)

## TABELLA <PROFESSIONE_ETA> ----------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `eta` CHAR(6) NOT NULL,
    `professione` CHAR(23) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `eta`, `professione`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `eta` (`eta`),
    KEY `professione` (`professione`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'professione_eta', x)

## TABELLA <PENDOLARI> ----------------
x <- "
    `CMN` MEDIUMINT UNSIGNED NOT NULL,
    `sesso` CHAR(1) NOT NULL,
    `destinazione` CHAR(1) NOT NULL,
    `motivo` CHAR(1) NOT NULL,
    `anno` SMALLINT UNSIGNED NOT NULL,
    `valore` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`CMN`, `sesso`, `destinazione`, `motivo`, `anno`),
    KEY `CMN` (`CMN`),
    KEY `sesso` (`sesso`),
    KEY `destinazione` (`destinazione`),
    KEY `motivo` (`motivo`),
    KEY(`anno`)
"
crea_tabella_db(dbn, 'pendolari', x)

## FINE -------------------------------
rm(list = ls())
gc()
