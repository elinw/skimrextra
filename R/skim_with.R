#' Alternative skim_with() functions built with the skimr function factory.

#' Skimmers to produce a table of variables with same named values
#' in a single column.
#' @importFrom skimr skim_with
#' @importFrom skimr sfl
#' @export
skim_var_table <- skim_with(
  POSIXct = sfl(
    data_type = ~"POSIXct",
    p0 = ~as.character(min(., na.rm = TRUE)),
    p50 = ~as.character(median(., na.rm = TRUE)),
    p100 = ~as.character(max(., na.rm = TRUE)),
    median = NULL,
    max = NULL,
    min = NULL
  ),
  numeric = sfl(
    data_type = ~"numeric",
    mean = ~ as.character(format(mean(., na.rm = TRUE), digits =2)),
    sd = ~ as.character(format(sd(., na.rm = TRUE), digits =2)),
    p0 = ~as.character(format(min(., na.rm = TRUE), digits = 2)),
    p25 = ~as.character(format(quantile(., probs = c(.25), na.rm = TRUE), digits =2)),
    p50 = ~as.character(format(median(., na.rm = TRUE), digits =2)),
    p75 = ~as.character(format(quantile(., probs = c(.75), na.rm = TRUE), digits =2)),
    p100 = ~as.character(format(max(., na.rm = TRUE), digits =2))
  ),
  logical = sfl(
    data_type = ~"logical",
    mean = ~ as.character(format(mean(., na.rm = TRUE), digits =2))
  ),
  factor = sfl(
    data_type = ~"factor"
  ),
  haven_labelled = sfl(
    data_type = ~"haven_labelled",
    type = ~ typeof(.),
    label = ~var_label(., unlist = TRUE),
    n_labels = ~ length(val_labels(.))
  ),
  character = sfl(
    data_type = ~"character"
  ),
  ts = sfl(
    p0 = ~as.character(format(min(., na.rm = TRUE), digits = 2)),
    p50 = ~as.character(format(median(., na.rm = TRUE), digits =2)),
    p100 = ~as.character(format(max(., na.rm = TRUE), digits =2)),
    mean = ~ as.character(format(mean(., na.rm = TRUE), digits =2)),
    sd = ~ as.character(format(sd(., na.rm = TRUE), digits =2)),
    median = NULL,
    max = NULL,
    min = NULL
  )
)