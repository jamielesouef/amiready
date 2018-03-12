import UIKit

class NavController: UINavigationController {
  override func awakeFromNib() {
    super.awakeFromNib()
    navigationBar.tintColor = UIColor.black
    navigationBar.isTranslucent = false
    navigationBar.shadowImage = UIImage()
  }
}

