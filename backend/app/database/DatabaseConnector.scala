package database

import anorm._
import play.api.db.Database

import javax.inject.Inject
import scala.concurrent.Future

class DatabaseConnector @Inject() (db: Database, databaseExecutionContext: DatabaseExecutionContext) {
  def query(): Future[Boolean] = {
    Future {
      db.withConnection { implicit conn =>
        SQL("Select 1").execute()
      }
    }(databaseExecutionContext)
  }
}