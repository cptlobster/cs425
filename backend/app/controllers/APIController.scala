package controllers

import javax.inject.*
import play.api.*
import play.api.libs.json.*
import play.api.mvc.*
import database.DatabaseConnector

/**
 * This controller creates an `Action` to handle HTTP requests to the
 * application's home page.
 */
@Singleton
class APIController @Inject()(val controllerComponents: ControllerComponents, db: DatabaseConnector) extends BaseController {

  /**
   * Create an Action to render an HTML page.
   *
   * The configuration in the `routes` file means that this method
   * will be called when the application receives a `GET` request with
   * a path of `/`.
   */
  def test(): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val result = db.query()
    val return_val: JsValue = Json.obj(
      "response" -> "ok",
      "result" -> result,
      "version" -> Json.obj(
       "jvm" -> System.getProperty("java.version"),
        "scala" -> scala.util.Properties.versionString
      )
    )
    Ok(return_val)
  }
}
