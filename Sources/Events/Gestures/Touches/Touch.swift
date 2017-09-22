
import Geometry

public struct Touch {

	public typealias Force = Double

	public enum Phase {
		case began
		case moved
		case stationary
		case ended
		case cancelled
	}

	public let hashValue:Int
	public let timestamp:Timestamp
	public let location:Point
	public let force:Force
	public let phase:Phase
	public let count:Int

	internal let node:Node
}

internal extension Touch {

	var digit:Digit {
		return Digit(
			hashValue:hashValue,
			location:location
		)
	}
}

extension Touch : CustomStringConvertible {

	public var description: String {
		return "Pointer \(phase) in \(location)"
	}
}

extension Touch : Hashable {
	public static func == (left:Touch, right:Touch) -> Bool {
		return left.hashValue == right.hashValue
	}
}
