
import Foundation
import CoreText

internal extension Text {
	var attributedString:NSAttributedString {
		let attributedString = NSMutableAttributedString(string:string)
		runs.forEach(attributedString.add)
		return attributedString
	}
}

private extension Text.Run {

	var _range:NSRange {
		return NSRange(location:range.location, length:range.length)
	}

	var _attributes:[String:Any] {
		var attributes = [String:Any]()
//		attributes[kCTFontAttributeName as String] = style.textFont
		attributes[kCTForegroundColorFromContextAttributeName as String] = true
		attributes[kCTForegroundColorAttributeName as String] = style.tint?.cgColor
		return attributes
	}
}

private extension NSMutableAttributedString {

	func add(run:Text.Run) {
//		addAttributes(run._attributes, range:run._range)
	}
}
