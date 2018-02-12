import Foundation

enum Users {
  case aidan, ryan
}

extension Users {

  var displayName: String {
    switch self {
    case .aidan: return "Aidan"
    case .ryan: return "Ryan"
    }
  }

  var key: String {
    return DateUtils.getDateString() + "-" + self.displayName
  }
}
