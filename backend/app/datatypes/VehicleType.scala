package datatypes

enum VehicleType(text: String, truck: Int, plane: Int, train: Int):
  case Truck extends VehicleType("Truck", 1, 0, 0)
  case Tandem extends VehicleType("Tandem", 2, 0, 0)
  case Plane extends VehicleType("Plane", 0, 1, 0)
  case Train extends VehicleType("Train", 0, 0, 1)