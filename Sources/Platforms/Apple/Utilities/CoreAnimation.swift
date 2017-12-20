
import QuartzCore
import Graphics

internal extension CALayer {

	func update(with node:Node) {
		masksToBounds = node.overflow.isHidden

		update(node.background)
		update(node.border)
		update(node.shadow)

//		if node.element is Drawable {
//			setNeedsDisplay()
//		}
	}
}

private extension CALayer {

	func update(_ color:Color?) {
		backgroundColor = color?.cgColor
		print(color)
	}

	func update(_ border:Border?) {
		cornerRadius = CGFloat(border?.radius ?? 0)
		borderWidth = CGFloat(border?.width ?? 0)
		borderColor = border?.color.cgColor
	}

	func update(_ shadow:Shadow?) {
		shadowColor = shadow?.color.cgColor
		shadowOffset = CGSize(width:CGFloat(shadow?.offset.x ?? 0), height:CGFloat(-(shadow?.offset.y ?? 0)))
		shadowRadius = CGFloat(shadow?.radius ?? 3)
		shadowOpacity = Float(shadow?.opacity ?? 0)
	}
}
