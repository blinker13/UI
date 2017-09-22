
import Foundation
import CoreText
import Graphics
import Styling

internal extension Text {
	var attributedString:NSAttributedString {
		let string = NSMutableAttributedString()
		string.append(self)
		return string
	}
}

private extension Text.Run {
	var attributedString:NSAttributedString {
		var attributes = [NSAttributedStringKey:Any]()
//		attributes[kCTFontAttributeName as NSAttributedStringKey] = style[Text.font]
		attributes[kCTKernAttributeName as NSAttributedStringKey] = style[Text.kern]
		attributes[kCTForegroundColorAttributeName as NSAttributedStringKey] = style.tint?.cgColor
		attributes[kCTBackgroundColorAttributeName as NSAttributedStringKey] = style.background?.cgColor

//		if let decoration = style[Text.strikethrough] {
//			attributes[kCTUnderlineStyleAttributeName as NSAttributedStringKey] =
//			attributes[kCTUnderlineColorAttributeName as NSAttributedStringKey] = decoration.color?.cgColor
//		}

		return NSAttributedString(string:string, attributes:attributes)
	}
}

private extension NSMutableAttributedString {

	func append(_ text:Text) {
		text.forEach(append)
	}

	func append(run:Text.Run) {
		append(run.attributedString)
	}
}
