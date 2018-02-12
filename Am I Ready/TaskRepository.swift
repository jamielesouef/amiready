import Foundation

class TaskRepository {

  private(set) var tasks: Tasks

  init(for user: Users,
       withResrouce resource: TaskResourceInjectable = TaskResource(),
       withFactory factory: TaskFactoryInjectable = TaskFactory()
  ) {
    guard let existingTasks = resource.getTasks(forKey: user.key) else {
      tasks = factory.tasksFor(user: user)
      return
    }

    tasks = existingTasks
  }

  func toggleTask(atIndexPath indexPath: IndexPath) {
    let task = tasks[indexPath.row].toggleStatus()
    tasks[indexPath.row] = task
  }
}
