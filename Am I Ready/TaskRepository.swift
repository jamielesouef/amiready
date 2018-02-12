import Foundation

struct TaskResource {
  static func getTasks(forKey key: String) -> [Tasks]? {
    return nil
  }
}

class TaskRepository {

  private let sharedTasks = [
    "Brush Teeth",
    "Make Bed",
    "Open blinds",
    "Pack lunchbox"
  ]

  private let aidansTaks = [
    "Lock back door",
    "Lock front door",
    "Make sure Ryan is ready"
  ]

  private let ryansTasks = [
    "Take medicine",
    "Check mice water",
    "Check mice food"
  ]

  private(set) var tasks: [Task]

  init(for user: Users) {
    guard let existingTasks = TaskResource.getTasks(forKey: user.key) else {
      switch user {
      case .aidan : self.tasks = (sharedTasks + aidansTaks).sorted().map { Task(title: $0) }
      case .ryan : self.tasks = (sharedTasks + ryansTasks).sorted().map { Task(title: $0) }
      }
    }

    tasks = existingTasks
  }

  func toggleTask(atIndexPath indexPath: IndexPath) {
    let task = tasks[indexPath.row].toggleStatus()
    tasks[indexPath.row] = task
  }
}
