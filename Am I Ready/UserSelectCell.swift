import UIKit

protocol UserSelectCellDelegate: AnyObject {
  func didSelect(user model: User?)
}


class CardView: UIView {

  var cornerRadius: CGFloat = 10
  var shadowOffsetWidth: Int = 0
  var shadowOffsetHeight: Int = Int(0.5)
  var shadowColor: UIColor? = UIColor.black
  var shadowOpacity: Float = 0.2

  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = cornerRadius
    let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
    backgroundColor = UIColor(red: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1)

    layer.masksToBounds = false
    layer.shadowColor = shadowColor?.cgColor
    layer.shadowRadius = 3
    layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
    layer.shadowOpacity = shadowOpacity
    layer.shadowPath = shadowPath.cgPath
  }

}

class UserSelectCell: UICollectionViewCell, Configurable {
  @IBOutlet private weak var cardView: CardView!
  @IBOutlet private weak var userName: UILabel!
  @IBOutlet private weak var userTasksRemaining: UILabel!

  private var model: User? {
    didSet {
      userName.text = model?.name
      userTasksRemaining.text = "0 of 7 taks complete".uppercased()
    }
  }
  weak var delegate: UserSelectCellDelegate?

  @IBAction func selectUserAction(_ sender: Any) {

  }

  @objc func didTapUser() {
    delegate?.didSelect(user: model)
  }

  func configure(with model: User?) {
    guard let model = model else {
      return
    }
    self.model = model
  }
}
