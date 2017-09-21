import UIKit

class TaskHeaaderCell: UITableViewCell, Configurable {
  @IBOutlet private weak var remainingTasks: UILabel!
  
  func configure(with model: String) {
    remainingTasks.text = model
  }
}
