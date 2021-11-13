val scala3Version = "3.1.0"

lazy val root = project
  .in(file("."))
  .settings(
    name := "paper-test-implementation",
    version := "0.1.0-SNAPSHOT",

    scalaVersion := scala3Version,

    libraryDependencies += "com.novocode" % "junit-interface" % "0.11" % "test",
    libraryDependencies += "org.sosy-lab" % "java-smt" % "3.11.0"
  )
