
public protocol Scrollable : Responder {
	func onBegan(_ scroll:Scroll)
	func onMoved(_ scroll:Scroll)
	func onEnded(_ scroll:Scroll)
	func onCancelled(_ scroll:Scroll)
}

internal extension Scrollable {
	var scrollRecognizer:Scroll.Recognizer {
		return Scroll.Recognizer(target:self)
	}
}
