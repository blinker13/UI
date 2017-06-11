
import Foundation
import CoreText

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
		attributes[kCTFontAttributeName as NSAttributedStringKey] = style.get(Text.font)
		attributes[kCTKernAttributeName as NSAttributedStringKey] = style.get(Text.kern)
		attributes[kCTForegroundColorAttributeName as NSAttributedStringKey] = style.tint?.cgColor
		attributes[kCTBackgroundColorAttributeName as NSAttributedStringKey] = style.background?.cgColor

		if let decoration = style.get(Text.strikethrough) {
//			attributes[kCTUnderlineStyleAttributeName as NSAttributedStringKey] =
			attributes[kCTUnderlineColorAttributeName as NSAttributedStringKey] = decoration.color?.cgColor
		}
		
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
