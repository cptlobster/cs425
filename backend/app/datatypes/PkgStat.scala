package datatypes

enum PkgStat(text: String):
  case Stored extends PkgStat("Stored")
  case Loading extends PkgStat("Loading")
  case Traveling extends PkgStat("Traveling")
  case Delivered extends PkgStat("Delivered")
  case Missing extends PkgStat("Missing")