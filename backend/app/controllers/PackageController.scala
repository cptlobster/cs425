package controllers

import javax.inject._
import play.api._
import play.api.libs.json._
import play.api.mvc._
import datatypes.{Package, PkgStat}

/**
 * This controller creates `Actions` to interact with the Packages table.
 */
@Singleton
class PackageController @Inject()(val controllerComponents: ControllerComponents) extends BaseController {
  implicit val pkgStatFormat: OFormat[PkgStat] = Json.format[PkgStat]
  implicit val packageFormat: OFormat[Package] = Json.format[Package]

}

