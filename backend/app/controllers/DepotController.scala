package controllers

import javax.inject._
import play.api._
import play.api.libs.json._
import play.api.mvc._
import datatypes.Depot

/**
 * This controller creates `Actions` to interact with the Depots table.
 */
@Singleton
class DepotController @Inject()(val controllerComponents: ControllerComponents) extends BaseController {
  implicit val depotFormat: OFormat[Depot] = Json.format[Depot]

}
