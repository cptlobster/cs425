package controllers

import javax.inject._
import play.api._
import play.api.libs.json._
import play.api.mvc._
import models.{Timetable, TTEntry}

/**
 * This controller creates `Actions` to interact with the Timetable.
 */
@Singleton
class TimetableController @Inject()(val controllerComponents: ControllerComponents) extends BaseController {
  // implicit val ttEntryFormat: OFormat[TTEntry] = Json.format[TTEntry]
  // implicit val timetableFormat: OFormat[Timetable] = Json.format[Timetable]

  def get_all(): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> "SELECT * FROM timetable"
    )
    Ok(return_val)
  }

  def get(id: Long): Action[AnyContent] = Action { implicit request: Request[AnyContent] =>
    val return_val: JsValue = Json.obj(
      "sql" -> s"SELECT * FROM timetable WHERE id = $id"
    )
    Ok(return_val)
  }
}
