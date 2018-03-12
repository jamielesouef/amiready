import Foundation
import RxSwift

class UserTaskViewModel {
  private var tasks = Variable<[Task]>([])
  private var repository: TaskRepository

  var taskCount: Int {
    return tasks.value.count
  }

  var remainingTasks: Int {
    return tasks.value.filter{ $0.complete == false }.count
  }

  var asObservable: Observable<[Task]> {
    return tasks.asObservable()
  }

  let user: User

  init(withUser user: User) {
    self.user = user
    self.repository = TaskRepository(for: user)
    self.tasks.value = repository.tasks
  }

  func modelFor(indexPath: IndexPath) -> Task {
    return tasks.value[indexPath.row]
  }

  func didSelectTask(atIndexPath indexPath: IndexPath) {
    repository.toggleTask(atIndexPath: indexPath)
    tasks.value = repository.tasks
  }
}
