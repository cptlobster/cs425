package models

class Package(id: Long,
              dest: Long,
              status: String,
              category: String,
              weight: Float,
              value: Float,
              vehicle: Long,
              depot: Long) {
  
}

object Package {
  def apply(id: Long, dest: Long, status: String, category: String, weight: Float, value: Float, vehicle: Long,
            depot: Long): Package = new Package(id, dest, status, category, weight, value, vehicle, depot)
}
