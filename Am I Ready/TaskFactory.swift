protocol TaskFactoryInjectable {
  func tasksFor(user: User) -> Tasks
}

struct TaskFactory: TaskFactoryInjectable {

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

  func tasksFor(user: User) -> Tasks {
    func toModel(task: [String]) -> Tasks {
      return (sharedTasks + task).sorted().map { Task(title: $0) }
    }

    switch user.name {
    case "Aidan" : return toModel(task: aidansTaks)
    case "Ryan" : return toModel(task: ryansTasks)
    default : ()
    }
    
    return []
  }
}
