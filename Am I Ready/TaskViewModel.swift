import UIKit

class TasksViewModel: NSObject {
  typealias Tasks = [Task]
  private(set) var tasks: Tasks = []
  
  init(withFetcher fetcher: TaskFetcher = Fetcher()) {
    self.tasks = fetcher.getTasks()
  }
}

extension TasksViewModel: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskTableViewCell
    cell?.configure(with: tasks[indexPath.row])
    return cell.flatMap { $0 } ?? UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    <#code#>
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskTableViewCell
    cell?.toggleComplete()
  }
}

