import Foundation

class TaskRepository {

  private(set) var tasks: Tasks
  private let user: Users
  private let resource: TaskResourceInjectable
  private let factory: TaskFactoryInjectable

  init(for user: Users,
       withResource resource: TaskResourceInjectable = TaskResource(),
       withFactory factory: TaskFactoryInjectable = TaskFactory()
  ) {

    self.factory = factory
    self.resource = resource
    self.user = user

    guard let existingTasks = resource.getTasks(forUser: user) else {
      tasks = factory.tasksFor(user: user)
      let _ = resource.save(tasks: tasks, forUser: user)
      return
    }

    tasks = existingTasks
  }

  func toggleTask(atIndexPath indexPath: IndexPath) {
    let task = tasks[indexPath.row].toggleStatus()
    tasks[indexPath.row] = task
    let _ = resource.save(tasks: tasks, forUser: user)
  }
}
