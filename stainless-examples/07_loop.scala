object Times {
    def decreasingLoop(n: Int): Int = {
        require(n >= 0)
        var i: Int = n
        var sum: Int = 0
        while(i < 10) {
            sum += n
            i += 1
        }
        n
    } ensuring(res => res >= 4)
}