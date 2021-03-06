% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dati.R
\docType{data}
\name{professione_eta}
\alias{professione_eta}
\title{professione_eta}
\format{
Una data.table con i campi seguenti:
\describe{
  \item{\code{CMN}}{ Codice ISTAT del Comune (si veda la tabella \code{comuni} nel pacchetto \code{masteRgeo} ) }
  \item{\code{sesso}}{ \code{M}-Maschio, \code{F}-Femmina, \code{T}-Totale }
  \item{\code{eta}}{ Classi di eta. \code{Y15-24}: da 15 a 24 anni, \code{Y25-49}: da 25 a 49 anni, \code{Y50-64}: da 50 a 64 anni, \code{YGE65}: oltre 64 anni }
  \item{\code{professione}}{ Condizione Professionale (si veda la tabella \code{cens_diz} per la descrizione delle etichette) }
  \item{\code{anno}}{ Anno di riferimento }
  \item{\code{valore}}{ Valore del Dato }
}
}
\usage{
professione_eta
}
\description{
Tabella contenente il conteggio della Popolazione Residente maggiore di anni 14 raggruppata per Sesso, Eta e Condizione Professionale.
}
\details{
La tabella è indicizzata secondo i campi \code{CMN}, \code{sesso}, \code{eta}, \code{professione}, \code{anno}.
}
\keyword{datasets}
