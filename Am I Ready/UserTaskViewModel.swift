import Foundation
import RxSwift

class UserTaskViewModel {
  private var tasks = Variable<[Task]>([])
  private(set) var headerModel: TaskHeaderCellViewModel

  var taskCount: Int {
    return tasks.value.count
  }

  var remainingTasks: Int {
    return tasks.value.filter{ $0.status == .open }.count
  }

  var asObservable: Observable<[Task]> {
    return tasks.asObservable()
  }

  let user: Users

  init(withUser user: Users) {
    self.user = user
    self.tasks.value = user.tasks
    self.headerModel = TaskHeaderCellViewModel(withUser: user)
  }

  func modelFor(indexPath: IndexPath) -> Task {
    return tasks.value[indexPath.row]
  }

  func didSelectTask(atIndexPath indexPath: IndexPath) {
    let task = tasks.value[indexPath.row].toggleStatus()
    tasks.value[indexPath.row] = task
  }
}
