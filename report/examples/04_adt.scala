import stainless.lang._

object ADT {

    final case class BoxedInt(value: BigInt)

    sealed trait Complex
    final case class BoxedComplex(x: BoxedInt, y: BoxedInt) extends Complex
    final case class UnboxedComplex(x: BigInt, y: BigInt) extends Complex

    def getRealPart(p: Complex): BigInt = p match {
        case BoxedComplex(x, _) => x.value
        case UnboxedComplex(x, _) => x
    }

    def getImaginaryPart(p: Complex): BigInt = p match {
        case BoxedComplex(_, y) => y.value
        case UnboxedComplex(_, y) => y
    }

    def mult(a: Complex, b: Complex): Complex = {
        UnboxedComplex(
            getRealPart(a) * getRealPart(b) - getImaginaryPart(a) * getImaginaryPart(b),
            getRealPart(a) * getImaginaryPart(b) + getImaginaryPart(a) * getRealPart(a),
        )
    }

    def multCommutative(a: Complex, b: Complex) = {mult(a, b) == mult(b, a)}.holds
}