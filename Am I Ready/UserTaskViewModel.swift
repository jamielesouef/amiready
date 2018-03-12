import Foundation


class UserTaskViewModel {
  
  private var repository: TaskRepository
  private(set) var tasks:Tasks = []
  var taskCount: Int {
    return 0
  }

  var remainingTasks: Int {
    return 0
  }


  let user: User

  init(withUser user: User) {
    self.user = user
    self.repository = TaskRepository(for: user)
    self.tasks = []
  }

  func modelFor(indexPath: IndexPath) -> Task {
    return tasks[indexPath.row]
  }

  func didSelectTask(atIndexPath indexPath: IndexPath) {
    repository.toggleTask(atIndexPath: indexPath)
    tasks = repository.tasks
  }
}
