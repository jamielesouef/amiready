import UIKit

class TaskHeaderCell: UITableViewCell {
  @IBOutlet private weak var titleLable: UILabel!
  @IBOutlet private weak var remainingLable: UILabel!
  @IBOutlet private weak var dateLabel: UILabel!
}

extension TaskHeaderCell: Configurable {
  func configure(with model: TaskHeaderCellViewModel?) {
    self.titleLable.text = model?.title
    self.remainingLable.text = model?.remaining
    self.dateLabel.text = model?.date
  }
}
