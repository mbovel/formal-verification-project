object Id {
    def id(x: Int): Int = {
        x
    } ensuring(res => res < 10)

    def id2(x: Int): Int = {
        x
    } ensuring(res => res <= 10)

    def id3(x: Int): Int = {
        x
    } ensuring(res => res > 0)

    def id4(x: Int): Int = {
        x
    } ensuring(res => res >= 0)

    def idBound(x: Int, y: Int): Int = {
        x
    } ensuring(res => res < y)

    def idBound2(x: Int, y: Int): Int = {
        x
    } ensuring(res => res <= y)

    def idBound3(x: Int, y: Int): Int = {
        x
    } ensuring(res => res > y)

    def idBound4(x: Int, y: Int): Int = {
        x
    } ensuring(res => res >= y)
}