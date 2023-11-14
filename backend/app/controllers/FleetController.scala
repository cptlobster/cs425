package controllers

import javax.inject._
import play.api._
import play.api.libs.json._
import play.api.mvc._
import models.Vehicle

/**
 * This controller creates `Actions` to interact with the Fleet table.
 */
@Singleton
class FleetController @Inject()(val controllerComponents: ControllerComponents) extends BaseController {
  implicit val vehicleFormat: OFormat[Vehicle] = Json.format[Vehicle]

  def get_all(): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> "SELECT * FROM fleet"
    )
    Ok(return_val)
  }

  def get(id: Long): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> s"SELECT * FROM fleet WHERE id = ${id}"
    )
    Ok(return_val)
  }
}

