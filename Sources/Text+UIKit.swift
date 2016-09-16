
import Canvas
import UIKit

public extension Text {
	var quartz:NSAttributedString {
		let quartz = NSMutableAttributedString(string:string)

		print("")
		runs.forEach { quartz.setAttributes($0.nsAttributes, range:$0.nsRange) }
		print(quartz)
		print("")

		return quartz.copy() as! NSAttributedString
	}
}

private extension Text.Run {

	var nsRange:NSRange {
		let length = range.upperBound - range.lowerBound
		return NSMakeRange(range.lowerBound, length)
	}

	var nsAttributes:[String:AnyObject] {
		var quartz = [String:AnyObject]()
		quartz[NSFontAttributeName] = font?.uiFont
		quartz[NSForegroundColorAttributeName] = foreground?.uiColor
		quartz[NSParagraphStyleAttributeName] = paragraphStyle.nsParagraphStyle
		return quartz
	}
}

private extension ParagraphStyle {

	var nsParagraphStyle:NSParagraphStyle {
		let style = NSMutableParagraphStyle()
		style.alignment = alignment.nsTextAlignment
		return style.copy() as! NSParagraphStyle
	}
}

private extension Text.Alignment {
	var nsTextAlignment:NSTextAlignment {
		switch self {
			case .left: return NSTextAlignment.left
			case .center: return NSTextAlignment.center
			case .right: return NSTextAlignment.right
			case .justified: return NSTextAlignment.justified
			case .natural: return NSTextAlignment.natural
		}
	}
}
