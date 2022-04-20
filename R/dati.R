#' @importFrom data.table data.table
NULL

#' etichette
#'
#' Descrizione dei Valori assunti dagli Attributi presenti nelle Tabelle 
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{tabella}}{ Nome Tabella }
#'   \item{\code{attributo}}{ Nome Variabile }
#'   \item{\code{valore}}{ Valore }
#'   \item{\code{etichetta}}{ Etichetta }
#' }
#'
'etichette'

#' residenti
#'
#' Tabella contenente il conteggio della Popolazione Residente raggruppata per Sesso e cittadinanza
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{cittadinanza}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (vedere tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{cittadinanza}}{ \code{I}-Italiano, \code{S}-Straniero, \code{T}-Totale }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'residenti'

#' famiglie
#'
#' Tabella contenente il conteggio delle Famiglie e della Popolazione Residente in Famiglia (nessun raggruppamento)
#' 
#' La tabella è indicizzata secondo i campi \code{CMN} ed \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{dominio}}{ \code{F}-Famiglie, \code{PF}-Popolazione Residente in Famiglia }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'famiglie'

#' eta05
#'
#' Tabella contenente il conteggio della Popolazione residente raggruppata per Sesso ed eta in classi quinquennali
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{eta}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{eta}}{ Classi di eta quinquennali (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'eta05'

#' eta10
#'
#' Tabella contenente il conteggio della Popolazione residente raggruppata per Sesso,cittadinanza ed eta in classi decennali
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{eta}, \code{cittadinanza}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{cittadinanza}}{ \code{I}-Italiano, \code{S}-Straniero, \code{T}-Totale }
#'   \item{\code{eta}}{ Classi di eta decennali (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'eta10'

#' minori
#'
#' Tabella contenente il conteggio dei Minorenni Residenti raggruppati per Sesso e cittadinanza
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{cittadinanza}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{cittadinanza}}{ \code{I}-Italiano, \code{S}-Straniero, \code{T}-Totale }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'minori'

#' stranieri_continenti
#'
#' Tabella contenente il conteggio degli Stranieri Residenti raggruppati per Sesso e Continente di provenienza
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{provenienza}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{provenienza}}{ Continente di provenienza (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'stranieri_continenti'

#' stranieri_aree
#'
#' Tabella contenente il conteggio degli Stranieri Residenti raggruppati per Sesso e Macro-Area geografica di provenienza
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{provenienza}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{provenienza}}{ Macro-Area geografica di provenienza (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'stranieri_aree'

#' stranieri_paesi
#'
#' Tabella contenente il conteggio degli Stranieri Residenti raggruppati per Sesso e Paese di provenienza
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{provenienza}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{provenienza}}{ Paese di provenienza (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'stranieri_paesi'

#' istruzione
#'
#' Tabella contenente il conteggio della Popolazione Residente maggiore di anni 8 raggruppata per Sesso, Cittadinanza e Livello di Istruzione.
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{cittadinanza}, \code{istruzione}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{cittadinanza}}{ \code{I}-Italiano, \code{S}-Straniero, \code{T}-Totale }
#'   \item{\code{istruzione}}{ Livello di Istruzione (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'istruzione'

#' istruzione_eta
#'
#' Tabella contenente il conteggio della Popolazione Residente maggiore di anni 8 raggruppata per Sesso, Eta e Livello di Istruzione.
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{eta}, \code{istruzione}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{eta}}{ Classi di eta. \code{Y09-24}: da 9 a 24 anni, \code{Y25-49}: da 25 a 49 anni, \code{Y50-64}: da 50 a 64 anni, \code{YGE65}: oltre 64 anni }
#'   \item{\code{istruzione}}{ Livello di Istruzione (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'istruzione_eta'

#' professione
#'
#' Tabella contenente il conteggio della Popolazione Residente maggiore di anni 14 raggruppata per Sesso, Cittadinanza e Condizione Professionale.
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{cittadinanza}, \code{professione}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{cittadinanza}}{ \code{I}-Italiano, \code{S}-Straniero, \code{T}-Totale }
#'   \item{\code{professione}}{ Condizione Professionale (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'professione'

#' professione_eta 
#'
#' Tabella contenente il conteggio della Popolazione Residente maggiore di anni 14 raggruppata per Sesso, Eta e Condizione Professionale.
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{eta}, \code{professione}, \code{anno}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{eta}}{ Classi di eta. \code{Y15-24}: da 15 a 24 anni, \code{Y25-49}: da 25 a 49 anni, \code{Y50-64}: da 50 a 64 anni, \code{YGE65}: oltre 64 anni }
#'   \item{\code{professione}}{ Condizione Professionale (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
#'   \item{\code{anno}}{ Anno di riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'professione_eta'

#' pendolari
#'
#' Tabella contenente il conteggio della Popolazione Residente maggiore di anni 14 che viaggia per motivi di studio e lavoro,
#' raggruppata per Sesso, Destinazione e Motivo
#' 
#' La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{destinazione}, \code{motivo}.
#' 
#' @format Una data.table con i campi seguenti:
#' \describe{
#'   \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
#'   \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
#'   \item{\code{destinazione}}{ \code{S}: Nel Comune di Residenza, \code{A}: Oltre il Comune di Residenza, \code{T}: Totale Popolazione Rilevata }
#'   \item{\code{motivo}}{ \code{L}-Lavoro, \code{D}-Studio, \code{T}-Totale }
#'   \item{\code{anno}}{ Anno di Riferimento }
#'   \item{\code{valore}}{ Valore del Dato }
#' }
#'
'pendolari'
