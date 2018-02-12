protocol TaskResourceInjectable {
  func getTasks(forKey key: String) -> Tasks?
}

struct TaskResource: TaskResourceInjectable {
  func getTasks(forKey key: String) -> Tasks? {
    return nil
  }
}
