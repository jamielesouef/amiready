import UIKit

class RoundButton: UIButton {
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = UIColor.white
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = 10
    contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
  }
}

