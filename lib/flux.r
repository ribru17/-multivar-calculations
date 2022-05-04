export("compute_flux")

compute_flux <- function() {
    print("FLUX COMPUTATION")
    cat("Enter, separated by commas, g1, g2, g3 (where g(x,y)",
    "is the surface parametrization), x lower bound, x upper,",
    "y lower, y upper, f1, f2, f3 (where f(x,y,z) is the vector field):\n")

    # take and parse user input
    whole_flux_data <- readline()
    sfd <- strsplit(whole_flux_data, split = ",", fixed = TRUE)
    g <- list(sfd[[1]][1], sfd[[1]][2], sfd[[1]][3])
    f <- list(sfd[[1]][8], sfd[[1]][9], sfd[[1]][10])

    # compute Tx, Ty vectors and format accordingly
    tx <- list(eval(parse(text = paste("stats::D(expression(",
    g[[1]], "), 'x')"))),
    eval(parse(text = paste("stats::D(expression(", g[[2]], "), 'x')"))),
    eval(parse(text = paste("stats::D(expression(", g[[3]], "), 'x')"))))
    ty <- list(eval(parse(text = paste("stats::D(expression(",
    g[[1]], "), 'y')"))),
    eval(parse(text = paste("stats::D(expression(", g[[2]], "), 'y')"))),
    eval(parse(text = paste("stats::D(expression(", g[[3]], "), 'y')"))))
    txs <- lapply(tx, FUN = deparse)
    tys <- lapply(ty, FUN = deparse)

    # compute components of f(g(x,y))
    stry1 <- gsub("x", "ax", f[[1]])
    stry1 <- gsub("y", "by", stry1)
    stry1 <- gsub("ax", paste("(", g[[1]], ")"), stry1)
    stry1 <- gsub("by", paste("(", g[[2]], ")"), stry1)
    stry1 <- gsub("z", paste("(", g[[3]], ")"), stry1)
    stry2 <- gsub("x", "ax", f[[2]])
    stry2 <- gsub("y", "by", stry2)
    stry2 <- gsub("ax", paste("(", g[[1]], ")"), stry2)
    stry2 <- gsub("by", paste("(", g[[2]], ")"), stry2)
    stry2 <- gsub("z", paste("(", g[[3]], ")"), stry2)
    stry3 <- gsub("x", "ax", f[[3]])
    stry3 <- gsub("y", "by", stry3)
    stry3 <- gsub("ax", paste("(", g[[1]], ")"), stry3)
    stry3 <- gsub("by", paste("(", g[[2]], ")"), stry3)
    stry3 <- gsub("z", paste("(", g[[3]], ")"), stry3)

    # construct f(g(x,y))
    fg <- list(stry1, stry2, stry3)

    # compute normal vector (Tx x Ty) and format as string
    n <- list(eval(expression(parse(text = paste("(", txs[[2]], ")*(",
    tys[[3]], ")-(", txs[[3]], ")*(", tys[[2]], ")")))),
    eval(expression(parse(text = paste("(", txs[[3]], ")*(",
    tys[[1]], ")-(", txs[[1]], ")*(", tys[[3]], ")")))),
    eval(expression(parse(text = paste("(", txs[[1]], ")*(",
    tys[[2]], ")-(", txs[[2]], ")*(", tys[[1]], ")")))))
    ns <- lapply(n, FUN = toString)

    # compute flux through the surface
    cat("Flux:\n")
    print(eval(parse(text = paste("stats::integrate(Vectorize(function(x) {
        stats::integrate(function(y) { (", ns[[1]], ")*(", fg[[1]], ")+(",
        ns[[2]], ")*(", fg[[2]], ")+(", ns[[3]], ")*(", fg[[3]], ") }, ",
        sfd[[1]][6], ",", sfd[[1]][7], ")$value }), ", sfd[[1]][4], ",",
        sfd[[1]][5], ")"))))

    # compute surface area (for reference)
    cat("Surface area:\n")
    print(eval(parse(text = paste("stats::integrate(Vectorize(function(x) {
        stats::integrate(function(y) { sqrt((", ns[[1]], ")^2+(", ns[[2]],
        ")^2+(", ns[[3]], ")^2) }, ", sfd[[1]][6], ",", sfd[[1]][7],
        ")$value }), ", sfd[[1]][4], ",", sfd[[1]][5], ")"))))
}
