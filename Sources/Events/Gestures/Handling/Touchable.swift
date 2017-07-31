
public protocol Touchable : Responder {
	func onBegan(_ touches:Set<Touch>, with gesture:Gesture)
	func onMoved(_ touches:Set<Touch>, with gesture:Gesture)
	func onEnded(_ touches:Set<Touch>, with gesture:Gesture)
	func onCancelled(_ touches:Set<Touch>, with gesture:Gesture)
}

internal extension Touchable {
	var touchRecognizer:Touch.Recognizer {
		return Touch.Recognizer(target:self)
	}
}
