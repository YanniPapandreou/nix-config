#!/usr/bin/env Rscript

library(styler)

# Read from stdin
input <- file("stdin", "r")
code <- readLines(input)
close(input)

# Style the code
styled_code <- style_text(code)

# Write to stdout
writeLines(styled_code)
