import("rgl")
export("three_d")

three_d <- function() {
    print("VISUALIZING 3D CURVE")
    userinput <- readline(prompt = "Enter a function of x, y to graph: ")
    x <- y <- seq(-2, 2, length = 20)
    z <- eval(parse(text = paste("outer(x,y,function(x,y) {", userinput, "})")))
    rgl::surface3d(x, y, z, color = "#BADA55")
    cat("Area under the curve:\n")
    eval(parse(text = paste("stats::integrate(Vectorize(function(x)
    {stats::integrate((function(y) {",
    userinput,
    "}), -2, 2)$value }), -2,2)")))
}
