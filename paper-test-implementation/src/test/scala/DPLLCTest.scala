import org.junit.Test
import org.junit.Assert.*

class DPLLCTest:
  def assertModelEquals(expected: Model, actual: Option[Model]) =
    assertEquals(expected.toSet, actual.get.toSet)

  @Test def t1(): Unit =
    val x = Literal("x")
    val y = Literal("y")
    val z = Literal("z")
    assertModelEquals(List(x, !y, !z), DPLLC(List(List(x, y), List(!y, z), List(!x, !z))))
  
  @Test def t2(): Unit =
    val x = Literal("x")
    val y = Literal("y")
    val z = Literal("z")
    assertModelEquals(List(!x, y, z), DPLLC(List(List(!x, y), List(!y, z))))
  
  @Test def t3(): Unit =
    val x = Literal("x")
    val y = Literal("y")
    assertModelEquals(List(!x, y), DPLLC(List(List(x, y), List(!x, !y), List(!x, y))))
