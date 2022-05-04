export("line_int")

line_int <- function() {
    print("LINE INTEGRAL")
    cat("Enter, separated by commas, r1, r2, r3 (where r(t) is a",
    "parametrization of a line), t lower bound, t upper bound, and",
    "f1, f2, f3 (where f(x,y,z) is a vector field)\n")
    lineinput <- readline()
    split_line_input <- strsplit(lineinput, split = ",", fixed = TRUE)
    rprime <- list(stats::D(parse(text = split_line_input[[1]][1]), "t"),
    stats::D(parse(text = split_line_input[[1]][2]), "t"),
    stats::D(parse(text = split_line_input[[1]][3]), "t"))
    rprime <- lapply(rprime, deparse)
    str1 <- gsub("x", paste("(", split_line_input[[1]][1], ")"),
    split_line_input[[1]][6])
    str1 <- gsub("y", paste("(", split_line_input[[1]][2], ")"), str1)
    str1 <- gsub("z", paste("(", split_line_input[[1]][3], ")"), str1)
    str2 <- gsub("x", paste("(", split_line_input[[1]][1], ")"),
    split_line_input[[1]][7])
    str2 <- gsub("y", paste("(", split_line_input[[1]][2], ")"), str2)
    str2 <- gsub("z", paste("(", split_line_input[[1]][3], ")"), str2)
    str3 <- gsub("x", paste("(", split_line_input[[1]][1], ")"),
    split_line_input[[1]][8])
    str3 <- gsub("y", paste("(", split_line_input[[1]][2], ")"), str3)
    str3 <- gsub("z", paste("(", split_line_input[[1]][3], ")"), str3)
    fr <- list(str1, str2, str3)
    cat("Line integral:\n")
    print(eval(parse(text = paste("stats::integrate(function(t) {", fr[1], "*(",
    rprime[1], ")+", fr[2], "*(", rprime[2], ")+", fr[3], "*(",
    rprime[3], ")}, ", split_line_input[[1]][4], ",",
    split_line_input[[1]][5], ")"))))
}
