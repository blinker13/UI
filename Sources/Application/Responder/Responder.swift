
public protocol Responder {
	var isResponsive:Bool { get }
}

// MARK: -

public extension Responder {
	var isResponsive:Bool { return true }
}

//// MARK: -
//
//internal extension Responder {
//
//	func responds(to:Action) -> Bool {
//		return false
//	}
//
//	func perform(_ action:Action) {
//
//	}
//}

