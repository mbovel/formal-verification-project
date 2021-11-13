import org.junit.Test
import org.junit.Assert.*

class DPLLTSTest:
  def assertResultEquals(expected: (Theory, Model), actual: Option[(Theory, Model)]) =
    assertEquals(expected._1, actual.get._1)
    assertEquals(expected._2.toSet, actual.get._2.toSet)

  class MaxSatTheory(
    private val ps: List[Literal],
    private val bestBound: Int,
    private val weight: List[Literal] => Int = _.size
  ) extends Theory:
    def learn(m: Model, f: Formula): Option[Clause] =
      val posFirsts = ps.filter(l => m.contains(l))
      val negatedFirsts = posFirsts.map(!_)
      if weight(posFirsts) > bestBound && !f.contains(negatedFirsts) then Some(negatedFirsts)
      else  None
      
    def propagate(m: Model, undefinedLiterals: List[Literal]): Option[Literal] = None

    def strengthen(m: Model, f: Formula): Option[Theory] =
      if bestBound > 0 then Some(MaxSatTheory(ps, weight(ps.filter(l => m.contains(l))) - 1, weight))
      else None

    override def equals(that: Any) = that match
      case that: MaxSatTheory => that.bestBound == bestBound
      case _ => false
    
    override def toString: String = f"MaxSatTheory($bestBound)"

  @Test def t1(): Unit =
    val p1 = Literal("p1")
    val p2 = Literal("p2")
    val p3 = Literal("p3")
    val ps = List(p1, p2, p3)
    val x = Literal("x")
    val y = Literal("y")
    val z = Literal("z")
    assertResultEquals(
      (
        MaxSatTheory(ps, 1),
        List(!p1, !p2, p3, x)),
      DPLLTS(
        MaxSatTheory(ps, 3),
        List(List(p1, x), List(p2, x), List(p3, !x))))
