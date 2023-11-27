package database

import anorm._
import play.api.db.Database

import javax.inject.Inject
import scala.concurrent.{Future, Await}

import scala.concurrent.duration.*
import scala.language.postfixOps

class DatabaseConnector @Inject() (db: Database, databaseExecutionContext: DatabaseExecutionContext) {
  private val mapParser: RowParser[Map[String, Any]] =
    SqlParser.folder(Map.empty[String, Any]) { (map, value, meta) =>
      Right(map + (meta.column.qualified -> value))
    }

  def query(): Boolean = {
    Await.result(Future {
      db.withConnection { implicit conn =>
        SQL("Select 1").execute()
      }
    }(databaseExecutionContext), 10 seconds)
  }

  def query_with_result(query: String): List[Map[String, Any]] = {
    Await.result(Future {
      db.withConnection { implicit conn =>
        SQL(query).as(mapParser.*)
      }
    }(databaseExecutionContext), 60 seconds)
  }
}