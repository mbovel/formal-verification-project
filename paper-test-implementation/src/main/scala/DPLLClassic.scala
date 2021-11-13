import scala.annotation.tailrec
import scala.annotation.constructorOnly

case class Literal(id: String, negative: Boolean)(val decision: Boolean):
  def unary_! = Literal(id, !negative)(decision)
  def decided: Literal = Literal(id, negative)(true)
  def fixed: Literal = Literal(id, negative)(false)

  override def toString() = (if negative then "!" else "") + id + (if decision then "?" else "")

object Literal:
  def apply(id: String): Literal = Literal(id: String, false)(false)

type Formula = List[List[Literal]]

type Model = List[Literal]

final val DEBUG = true

inline def logStep(step: String, m: Model) =
  inline if DEBUG then println(f"${m.mkString(" ")}%20s ==> ($step)")

def DDPL(f: Formula): Option[Model] =
  val allLiterals = f.flatten.distinct

  @tailrec
  def loop(m: Model): Option[Model] =
    val negM = m.map(!_)

    val undefinedClauses = f
      .withFilter(!_.exists(m.contains(_))) // Filter out all clauses already satisfied.
      .map(_.diff(negM)) // Filter out all literals set to false.

    if undefinedClauses.exists(_.isEmpty) then
      if !m.exists(_.decision) then
        logStep("Fail", m)
        None
      else
        val i = m.indexWhere(_.decision)
        logStep("Backtrack", m)
        loop(!m(i).fixed :: m.drop(i + 1))
    else
      val unit = undefinedClauses.find(_.length == 1)
      if !unit.isEmpty then
        logStep("UnitPropagate", m)
        loop(unit.get.head :: m)
      else
        val undefinedLiterals = allLiterals.diff(m).diff(negM)
        if !undefinedLiterals.isEmpty then
          logStep("Decide", m)
          loop(undefinedLiterals(0).decided :: m)
        else
          logStep("SUCCESS", m)
          println()
          Some(m)

  val pureLitterals = allLiterals.filter(l => !allLiterals.contains(!l))
  if !pureLitterals.isEmpty then
    logStep("PureLitterals", Nil)
    loop(pureLitterals.toList)
  else loop(Nil)
