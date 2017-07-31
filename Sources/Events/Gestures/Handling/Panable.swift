
public protocol Panable : Responder {
	func onBegan(_ pan:Pan)
	func onMoved(_ pan:Pan)
	func onEnded(_ pan:Pan)
}

internal extension Panable {
	var panRecognizer:Pan.Recognizer {
		return Pan.Recognizer(target:self)
	}
}
