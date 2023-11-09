package datatypes

class Package(id: Long,
              dest: Long,
              stat: PkgStat,
              category: String,
              weight: Float,
              value: Float,
              vehicle: Long,
              depot: Long) {
  
}

object Package {
  def apply(id: Long, dest: Long, stat: PkgStat, category: String, weight: Float, value: Float, vehicle: Long, 
            depot: Long): Package = new Package(id, dest, stat, category, weight, value, vehicle, depot)
}
