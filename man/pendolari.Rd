% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dati.R
\docType{data}
\name{pendolari}
\alias{pendolari}
\title{pendolari}
\format{
Una data.table con i campi seguenti:
\describe{
  \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
  \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
  \item{\code{destinazione}}{ \code{S}: Nel Comune di Residenza, \code{A}: Oltre il Comune di Residenza, \code{T}: Totale Popolazione Rilevata }
  \item{\code{motivo}}{ \code{L}-Lavoro, \code{D}-Studio, \code{T}-Totale }
  \item{\code{anno}}{ Anno di Riferimento }
  \item{\code{valore}}{ Valore del Dato }
}
}
\usage{
pendolari
}
\description{
Tabella contenente il conteggio della Popolazione Residente maggiore di anni 14 che viaggia per motivi di studio e lavoro,
raggruppata per Sesso, Destinazione e Motivo
}
\details{
La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{destinazione}, \code{motivo}.
}
\keyword{datasets}
