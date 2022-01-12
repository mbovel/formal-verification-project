import stainless.lang._

object ADT {
    final case class BoxedInt(value: BigInt)

    sealed trait Complex
    final case class BoxedComplex(a: BoxedInt, b: BoxedInt) extends Complex
    final case class UnboxedComplex(a: BigInt, b: BigInt) extends Complex

    def getRealPart(p: Complex): BigInt = p match {
        case BoxedComplex(a, _) => a.value
        case UnboxedComplex(a, _) => a
    }

    def getImaginaryPart(p: Complex): BigInt = p match {
        case BoxedComplex(_, b) => b.value
        case UnboxedComplex(_, b) => b
    }

    def mult(z1: Complex, z2: Complex): Complex = {
        UnboxedComplex(
            getRealPart(z1) * getRealPart(z2) - getImaginaryPart(z1) * getImaginaryPart(z2),
            getRealPart(z1) * getImaginaryPart(z2) + getImaginaryPart(z1) * getRealPart(z1),
        )
    }

    def multCommutative(z1: Complex, z2: Complex) = {mult(z1, z2) == mult(z2, z1)}.holds
}