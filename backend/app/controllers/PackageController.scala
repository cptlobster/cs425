package controllers

import javax.inject._
import play.api._
import play.api.libs.json._
import play.api.mvc._
import models.Package

/**
 * This controller creates `Actions` to interact with the Packages table.
 */
@Singleton
class PackageController @Inject()(val controllerComponents: ControllerComponents) extends BaseController {
  // implicit val packageFormat: OFormat[Package] = Json.format[Package]

  def get_all(): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> "SELECT * FROM packages"
    )
    Ok(return_val)
  }

  def get(id: Long): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> s"SELECT * FROM packages WHERE id = $id"
    )
    Ok(return_val)
  }

  def get_all_in_vehicle(vehicle: Long): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> s"SELECT * FROM packages WHERE vehicle = $vehicle"
    )
    Ok(return_val)
  }
}

