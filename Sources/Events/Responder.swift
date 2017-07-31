
public protocol Responder {
	var isResponsive:Bool { get }
}

public extension Responder {
	var isResponsive:Bool { return true }
}

internal extension Responder {
	var recognizer:[Recognizer] {

		let recognizer:[Recognizer?] = [
			panable?.panRecognizer,
			pinchable?.pinchRecognizer,
			scrollable?.scrollRecognizer,
			touchable?.touchRecognizer
		]

		return recognizer.flatMap { $0 }
	}
}

private extension Responder {
	var panable:Panable? { return self as? Panable }
	var pinchable:Pinchable? { return self as? Pinchable }
	var scrollable:Scrollable? { return self as? Scrollable }
	var touchable:Touchable? { return self as? Touchable }
}
