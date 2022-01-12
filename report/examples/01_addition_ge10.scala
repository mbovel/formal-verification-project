object AdditionGE10 {
    def add(x: Int, y: Int): Int = { x + y } ensuring(res => res >= 10)
}