import Foundation

protocol TaskResourceInjectable {
  func getTasks(forUser user: Users) -> Tasks?
  func save(tasks: Tasks, forUser user: Users) -> Tasks?
}

struct TaskResource: TaskResourceInjectable {
  func getTasks(forUser user: Users) -> Tasks? {

    let jsonDecoder = JSONDecoder()
    guard let jsonData = UserDefaults.standard.data(forKey: user.key),
          let tasks = try? jsonDecoder.decode(Tasks.self, from: jsonData) else {
            print("Could not decode JSON data")
      return nil
    }

    return tasks
  }

  func save(tasks: Tasks, forUser user: Users) -> Tasks? {
    let jsonEncoder = JSONEncoder()

    guard let jsonData = try? jsonEncoder.encode(tasks) else {
      print("Could not encode JSON data")
      return nil
    }

    UserDefaults.standard.set(jsonData, forKey: user.key)
    return tasks

  }
}
