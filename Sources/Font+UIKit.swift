
import Canvas
import UIKit

internal extension Font {
	var uiFont:UIFont { return UIFont(descriptor:uiFontDescriptor, size:CGFloat(size)) }
}

private extension Font {
	var uiFontDescriptor:UIFontDescriptor {
		return UIFontDescriptor(fontAttributes:uiFontAttributes)
	}

	var uiFontAttributes:[String:AnyObject] {
		var fontAttributes = [String:AnyObject]()
		fontAttributes[UIFontDescriptorFamilyAttribute] = name
		fontAttributes[UIFontDescriptorFaceAttribute] = String(style)
		fontAttributes[UIFontDescriptorTraitsAttribute] = uiFontTraits
		return fontAttributes
	}

	var uiFontTraits:[String:AnyObject] {
		var fontAttributes = [String:AnyObject]()
		fontAttributes[UIFontWeightTrait] = uiFontWeight
		return fontAttributes
	}

	var uiFontWeight:CGFloat {
		switch weight {
		case .ultraLight: return UIFontWeightUltraLight
		case .thin: return UIFontWeightThin
		case .light: return UIFontWeightLight
		case .regular: return UIFontWeightRegular
		case .medium: return UIFontWeightMedium
		case .semibold: return UIFontWeightSemibold
		case .bold: return UIFontWeightBold
		case .heavy: return UIFontWeightHeavy
		case .black: return UIFontWeightBlack
		}
	}
}
