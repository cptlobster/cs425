package controllers

import javax.inject._
import play.api._
import play.api.libs.json._
import play.api.mvc._
import datatypes.{Timetable, TTEntry}

/**
 * This controller creates `Actions` to interact with the Timetable.
 */
@Singleton
class TimetableController @Inject()(val controllerComponents: ControllerComponents) extends BaseController {
  implicit val ttEntryFormat: OFormat[TTEntry] = Json.format[TTEntry]
  implicit val timetableFormat: OFormat[Timetable] = Json.format[Timetable]

}
