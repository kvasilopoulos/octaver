rmd <- function(){
  stopifnot(
    rstudioapi::isAvailable(),
    msg = "Can't run this function outside RStudio."
  )

  stopifnot(
    rstudioapi::hasFun(
      c("getActiveDocumentContext",
        "insertText")
    ),
    msg = "Your RStudio version is too old to run this addin."
  )

  loc <- rstudioapi::getActiveDocumentContext()$selection[[1]]$range
  rstudioapi::insertText(
    location = loc,
    text = "```{octave}\n\n```\n"
  )

  loc$start[[1]] <- loc$start[[1]] + 1
  loc$end[[1]] <- loc$end[[1]] + 1
  rstudioapi::setCursorPosition(
    loc
  )
}
