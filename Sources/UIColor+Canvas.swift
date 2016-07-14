
import UIKit
import Canvas

internal extension UIColor {
	convenience init?(canvas color:Color?) {
		guard let quartz = color?.quartz else { return nil }
		self.init(cgColor:quartz)
	}
}
