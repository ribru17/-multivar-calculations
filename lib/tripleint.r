export("triple_int")

triple_int <- function() {
    print("TRIPLE INTEGRAL: dzdydx")
    cat("Enter (separated by commas) a function of x,y,z",
    "(inner function), lower then upper x bounds, lower then",
    "upper y bounds, and lower then upper z bounds:\n")

    # take and parse user input
    whole_data <- readline()
    split_data <- strsplit(whole_data, split = ",", fixed = TRUE)

    # use input to compute a triple integral of the
    # given function over the specified bounds
    eval(parse(text = paste("stats::integrate(Vectorize(function(x) {
        stats::integrate(Vectorize(function(y) {
            stats::integrate(function(z) {",
        split_data[[1]][1], " }, ", split_data[[1]][6], ", ",
        split_data[[1]][7], ")$value }), ", split_data[[1]][4], ",",
        split_data[[1]][5], ")$value }), ", split_data[[1]][2], ",",
        split_data[[1]][3], ")")))
}
