import Foundation

protocol TaskResourceInjectable {
  func getTasks(forKey key: String) -> Tasks?
}

struct TaskResource: TaskResourceInjectable {
  func getTasks(forKey key: String) -> Tasks? {
    let defaults = UserDefaults.standard

    return nil
  }
}
