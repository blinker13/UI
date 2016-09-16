
import Canvas
import UIKit

internal extension Font {
	var uiFont:UIFont { return UIFont(descriptor:uiFontDescriptor, size:CGFloat(size)) }
}

fileprivate extension Font {
	var uiFontDescriptor:UIFontDescriptor {
		return UIFontDescriptor(fontAttributes:uiFontAttributes)
	}

	var uiFontAttributes:[String:AnyObject] {
		var fontAttributes = [String:AnyObject]()
		fontAttributes[UIFontDescriptorFamilyAttribute] = name as AnyObject?
		fontAttributes[UIFontDescriptorFaceAttribute] = style.rawValue as AnyObject?
		fontAttributes[UIFontDescriptorTraitsAttribute] = uiFontTraits as AnyObject?
		return fontAttributes
	}

	var uiFontTraits:[String:AnyObject] {
		var fontAttributes = [String:AnyObject]()
		fontAttributes[UIFontWeightTrait] = uiFontWeight as AnyObject?
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
