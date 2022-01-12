object SubtractionCommutativity {
    def subtract(x: Int, y: Int) = {x - y}.ensuring(_ == y - x)
}