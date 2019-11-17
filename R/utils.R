#' Use skimr to produce a variable table
#'
#' @params x Data frame to be processed to produce variable table.
#' @param digits Number of digits to use for meta data
#' @export
skim_to_var_table <- function(x, digits = 2){
  results <- skim_var_table(x) %>%
    skimr::partition() %>%
    #lapply(dplyr::mutate_all, as.character) %>%
    dplyr::bind_rows() %>%
    as.data.frame()
  format(results, digits = digits)

}
