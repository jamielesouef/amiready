import UIKit

class NavController: UINavigationController {
  override func awakeFromNib() {
    super.awakeFromNib()
    navigationBar.tintColor = UIColor.white
    navigationBar.isTranslucent = false
    navigationBar.shadowImage = UIImage()
  }
}

