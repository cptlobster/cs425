package controllers

import play.api._
import play.api.libs.json._
import play.api.mvc._

import javax.inject._

import database.DatabaseConnector

/**
 * This controller creates an `Action` to handle HTTP requests to the
 * application's home page.
 */
@Singleton
class DBController @Inject()(val controllerComponents: ControllerComponents, db: DatabaseConnector) extends BaseController {

  /**
   * Create an Action to render an HTML page.
   *
   * The configuration in the `routes` file means that this method
   * will be called when the application receives a `GET` request with
   * a path of `/`.
   */
  def select(table: String): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "query" -> s"SELECT * FROM $table"
    )
    Ok(return_val)
  }

  def query(): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val query = request.body.asText.get
    val raw = db.query_with_result(query)
    Ok(raw.map().asInstanceOf[JsArray])
  }
}
