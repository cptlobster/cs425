ThisBuild / scalaVersion := "3.3.1"

ThisBuild / version := "1.0-SNAPSHOT"

lazy val root = (project in file("."))
  .enablePlugins(PlayScala)
  .settings(
    name := """backend""",
    libraryDependencies ++= Seq(
      guice,
      jdbc,
      "org.postgresql" % "postgresql" % "42.5.4",
      "org.playframework.anorm" %% "anorm" % "2.7.0"
    )
  )