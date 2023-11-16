package controllers

import javax.inject._
import play.api._
import play.api.libs.json._
import play.api.mvc._
import models.Depot

/**
 * This controller creates `Actions` to interact with the Depots table.
 */
@Singleton
class DepotController @Inject()(val controllerComponents: ControllerComponents) extends BaseController {
  // implicit val depotFormat: OFormat[Depot] = Json.format[Depot]

  def get_all(): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> "SELECT * FROM depots"
    )
    Ok(return_val)
  }
  def get(id: Long): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> s"SELECT * FROM depots WHERE id = $id"
    )
    Ok(return_val)
  }
}
