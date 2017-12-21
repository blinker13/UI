
public protocol Responder {
//	var recognizer:[Recognizer] { get }
	var isResponsive:Bool { get }
}

public extension Responder {
	var isResponsive:Bool { return true }
}
