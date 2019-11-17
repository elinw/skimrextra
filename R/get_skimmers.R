#' Retrieve the summary functions for a specific data type

#' @export
get_skimmers.sfc_MULTIPOLYGON <- function(column) {
  sfl(
    skim_type = "sfc_MULTIPOLYGON",
    n_unique = n_unique,
    valid = ~ sum(sf::st_is_valid(.)),
    simple = ~ sum(sf::st_is_simple(.)),
    n_empty = ~ attributes(.)$n_empty
  )
}

#' @export
get_skimmers.sfc_POINT <- function(column) {
  modify_default_skimmers("sfc_MULTIPOLYGON",
                          new_skim_type = "sfc_POINT")

}

#' @export
get_skimmers.sfc_MULTIPOINT <- function(column) {
    modify_default_skimmers("sfc_MULTIPOLYGON",
                            new_skim_type = "sfc_MULTILINEPOINT")
}

#' @export
get_skimmers.sfc_LINESTRING <- function(column) {
  modify_default_skimmers("sfc_MULTIPOLYGON",
                          new_skim_type = "sfc_LINESTRING")
}

#' @export
get_skimmers.sfc_MULTILINESTRING <- function(column) {
  modify_default_skimmers("sfc_MULTIPOLYGON",
                          new_skim_type = "sfc_MULTILINESTRING")
}

#' @export
get_skimmers.sfc_POLYGON <- function(column) {
  modify_default_skimmers("sfc_MULTIPOLYGON",
                          new_skim_type = "sfc_POLYGON")
}

#' @export
get_skimmers.haven_labelled <- function(column) {
  haven_labelled = sfl(
    skim_type = "haven_labelled",
    type = ~ typeof(.),
    var_label = ~var_label(., unlist = TRUE),
    n_labels = ~ length(val_labels(.))
  )
}
