import scala.annotation.tailrec
import scala.annotation.constructorOnly

trait Theory:
  def learn(m: Model, f: Formula): Option[Clause]
  def propagate(m: Model, undefinedLiterals: List[Literal]): Option[Literal]
  def strengthen(m: Model, f: Formula): Option[Theory]

private def logStep(step: String, m: Model, f: Formula, t: Theory) =
  println(f"${t}%10s || ${m.mkString(" ")}%20s || ${f.map(_.mkString("{", ",", "}")).mkString(", ")}%80s ==> ($step)")

def DPLLTS(t: Theory, f: Formula): Option[(Theory, Model)] =
  val allLiterals = f.flatten.distinct

  @tailrec
  def loop(t: Theory, m: Model, f: Formula, s: Option[(Theory, Model)]): Option[(Theory, Model)] =
    val negM = m.map(!_)

    val undefinedClauses = f
      .withFilter(!_.exists(m.contains(_))) // Filter out all clauses already satisfied.
      .map(_.diff(negM)) // Filter out all literals set to false.

    if undefinedClauses.exists(_.isEmpty) then
      if !m.exists(_.decision) then
        logStep("Fail", m, f, t)
        s
      else
        val i = m.indexWhere(_.decision)
        logStep("Backtrack", m, f, t)
        loop(t, !m(i).fixed :: m.drop(i + 1), f, s)
    else
      val learnedClause = t.learn(m, f)
      if learnedClause.isDefined then
        logStep("TheoryLearn", m, f, t)
        loop(t, m, learnedClause.get :: f, s)
      else 
        val unit = undefinedClauses.find(_.length == 1)
        if !unit.isEmpty then
          logStep("UnitPropagate", m, f, t)
          loop(t, unit.get.head :: m, f, s)
        else
          val undefinedLiterals = allLiterals.diff(m).diff(negM)
          if !undefinedLiterals.isEmpty then
            val propagatedLiteral = t.propagate(m, undefinedLiterals)
            if propagatedLiteral.isDefined then
              logStep("TheoryPropagate", m, f, t)
              loop(t, propagatedLiteral.get :: m, f, s)
            else
              logStep("Decide", m, f, t)
              loop(t, undefinedLiterals(0).decided :: m, f, s)
          else
            val strenghtenTheory = t.strengthen(m, f)
            if strenghtenTheory.isDefined then
              logStep("TheoryStrengthen", m, f, t)
              loop(strenghtenTheory.get, m, f, Some((t, m)))
            else
              logStep("SUCCESS", m, f, t)
              Some((t, m))

  loop(t, Nil, f, None)