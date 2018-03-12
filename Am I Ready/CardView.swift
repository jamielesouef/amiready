import UIKit

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

