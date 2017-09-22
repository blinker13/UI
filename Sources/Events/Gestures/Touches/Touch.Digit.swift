
import Geometry

public extension Touch {
	public struct Digit {
		public let hashValue:Int
		public let location:Point
	}
}

extension Touch.Digit : Hashable {
	public static func == (left:Touch.Digit, right:Touch.Digit) -> Bool {
		return left.hashValue == right.hashValue
	}
}
