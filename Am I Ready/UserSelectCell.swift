import UIKit

protocol UserSelectCellDelegate: AnyObject {
  func didSelect(user model: User?)
}

class UserSelectCell: UICollectionViewCell, Configurable {
  @IBOutlet private weak var cardView: CardView!
  @IBOutlet private weak var userName: UILabel!
  @IBOutlet private weak var userTasksRemaining: UILabel!
  @IBOutlet weak var detailButton: RoundButton!
  @IBOutlet weak var taskListID: UILabel!
  @IBOutlet weak var listIDLabel: UILabel!
  
  private var model: User? {
    didSet {
      userName.text = model?.name
      userTasksRemaining.text = "0 of 7 taks complete".uppercased()
    }
  }

  weak var delegate: UserSelectCellDelegate?


  @IBAction func detailButtonAction(_ sender: Any) {
    delegate?.didSelect(user: model)
  }

  func configure(with model: User?) {
    guard let model = model else {
      return
    }
    self.model = model
  }
}
