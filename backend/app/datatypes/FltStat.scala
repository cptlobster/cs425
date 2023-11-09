package datatypes

enum FltStat(text: String):
  case Parked extends FltStat("Parked")
  case Loading extends FltStat("Loading")
  case Traveling extends FltStat("Traveling")
  case Stopped extends FltStat("Stopped")