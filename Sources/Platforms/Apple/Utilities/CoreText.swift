
import Foundation
import CoreText
import Graphics

internal extension NSAttributedString {

//	init (with text:Text) {
//
//	}
}

private extension NSAttributedString {

	convenience init (with run:Text.Run) {
		var attributes = [NSAttributedStringKey:Any]()
////		attributes[kCTFontAttributeName as NSAttributedStringKey] = run.style[Text.font]
//		attributes[kCTKernAttributeName as NSAttributedStringKey] = run.style[Text.kern]
//		attributes[kCTForegroundColorAttributeName as NSAttributedStringKey] = run.style.tint?.cgColor
//		attributes[kCTBackgroundColorAttributeName as NSAttributedStringKey] = run.style.background?.cgColor
//
////		if let decoration = style[Text.strikethrough] {
////			attributes[kCTUnderlineStyleAttributeName as NSAttributedStringKey] =
////				attributes[kCTUnderlineColorAttributeName as NSAttributedStringKey] = decoration.color?.cgColor
////		}

		self.init(string:run.string, attributes:attributes)
	}
}
