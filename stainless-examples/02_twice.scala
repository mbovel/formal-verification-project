object Twice {
    def twice(x: Int): Int = {
        require(x <= 100)
        x * 2
    } ensuring(res => res >= x)
}