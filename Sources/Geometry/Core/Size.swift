
public struct Size : Geometry {
	public var height:Float
	public var width:Float
}

public extension Size {

	static var infinity = Size(.infinity, .infinity)

	var isEmpty:Bool { return width.isZero || height.isZero }

	init (_ w:Float, _ h:Float) {
		(self.width, self.height) = (w, h)
	}

	init (width:Float) { self.init(width, 0) }
	init (height:Float) { self.init(0, height) }

	func inseted(by space:Space) -> Size {
		let w = width - space.right - space.left
		let h = height - space.top - space.bottom
		return Size(w, h)
	}

	mutating func inset(by space:Space) {
		self = inseted(by:space)
	}
}

extension Size : CustomPlaygroundQuickLookable {
	public var customPlaygroundQuickLook:PlaygroundQuickLook {
		return .size(
			Float64(width),
			Float64(height)
		)
	}
}

extension Size : CustomStringConvertible {
	public var description:String {
		return "width:\(width), height:\(height)"
	}
}

extension Size : Equatable {
	public static func == (left:Size, right:Size) -> Bool {
		return left.width == right.width && left.height == right.height
	}
}

extension Size : ExpressibleByFloatLiteral {
	public init (floatLiteral value:Float) {
		self.init(value, value)
	}
}

extension Size : Transformable {
	public func transformed(by transform:Transform) -> Size {
		let w = transform.a * width + transform.c * height
		let h = transform.b * width + transform.d * height
		return Size(w, h)
	}
}
