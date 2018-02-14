import UIKit

class TaskCell: UITableViewCell {
  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
  }
}

extension TaskCell: Configurable {
  func configure(with model: Task?) {
    if let model = model {
      self.textLabel?.text = model.title
      self.setSelected(model.complete, animated: false)
      self.accessoryType = model.complete ? .checkmark : .none
    }
  }
}
