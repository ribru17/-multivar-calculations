import("rgl")
export("three_d")

three_d <- function() {
    print("VISUALIZING 3D CURVE")
    userinput <- readline(prompt = "Enter a function of x, y to graph: ")

    # define x, y as sequences of length 20 that will be used
    # as an input lattice to graph the function
    x <- y <- seq(-2, 2, length = 20)
    z <- eval(parse(text = paste("outer(x,y,function(x,y) {", userinput, "})")))

    # graph z = f(x,y)
    rgl::surface3d(x, y, z, color = "#BADA55")

    # find the area under the curve in the graphed domain
    cat("Area under the curve:\n")
    print(eval(parse(text = paste("stats::integrate(Vectorize(function(x)
    {stats::integrate((function(y) {",
    userinput,
    "}), -2, 2)$value }), -2,2)"))))
}
