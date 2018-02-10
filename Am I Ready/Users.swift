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

  var tasks: [Task] {
    switch self {
    case .aidan: return TaskRepository.aidan
    case .ryan: return TaskRepository.ryan
    }
  }
}
