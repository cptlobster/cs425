package datatypes

class Depot(id: Long,
            city: String,
            capacity: Float,
            truck_spaces: Int,
            plane_spaces: Int,
            train_spaces: Int) {

}

object Depot {
  def apply(id: Long, city: String, capacity: Float, truck_spaces: Int, plane_spaces: Int, train_spaces: Int): Depot = {
    new Depot(id, city, capacity, truck_spaces, plane_spaces, train_spaces)
  }
}