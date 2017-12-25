
import Geometry

public protocol Touchable : Responder {
	func onBegan(_ touches:Set<Touch>, with gesture:Gesture)
	func onMoved(_ touches:Set<Touch>, with gesture:Gesture)
	func onEnded(_ touches:Set<Touch>, with gesture:Gesture)
	func onCancelled(_ touches:Set<Touch>, with gesture:Gesture)
}

// MARK: -

public struct Touch : Hashable, CustomStringConvertible {

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

// MARK: -

public extension Touch {

	static func == (left:Touch, right:Touch) -> Bool {
		return left.hashValue == right.hashValue
	}

	var description:String {
		return "Touch \(phase) in \(location)"
	}
}
