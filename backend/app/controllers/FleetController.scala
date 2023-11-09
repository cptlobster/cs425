package controllers

import javax.inject._
import play.api._
import play.api.libs.json._
import play.api.mvc._
import datatypes.{Vehicle, FltStat}

/**
 * This controller creates `Actions` to interact with the Fleet table.
 */
@Singleton
class FleetController @Inject()(val controllerComponents: ControllerComponents) extends BaseController {
  implicit val fltStatFormat: OFormat[FltStat] = Json.format[FltStat]
  implicit val vehicleFormat: OFormat[Vehicle] = Json.format[Vehicle]

}

