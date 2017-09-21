import UIKit

protocol Configurable {
  associatedtype T
  func configure(with model: T)
}

class TaskTableViewCell: UITableViewCell, Configurable {
 
  typealias T = Task
  
  @IBOutlet private weak var complete: UISwitch!
  @IBOutlet private weak var task: UILabel!
  
  
  private(set) var model: T?
  
  func configure(with model: T) {
    self.model = model
    self.complete.isOn = model.complete
    self.task.text = model.title
  }
  
  func toggleComplete() {
    guard let complete = self.model?.complete else { return }
    self.model?.complete = !complete
    self.complete.isOn = !complete
  }
  
}

