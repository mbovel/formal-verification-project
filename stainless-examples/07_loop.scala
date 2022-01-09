object Times {
    // FIXME
    def decreasingLoop(n: Int): Int = {
        require(n >= 0 && n <= 10)
        var i: Int = n
        var sum: Int = 0
        (while (i < 10) {
            decreases(- i)
            sum += n
            i += 1
        }).invariant(0 <= i && i <= 10)
        sum
    } ensuring(res => res >= 4)
}