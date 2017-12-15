
public protocol Pinchable : Responder {
	func onBegan(_ pinch:Pinch)
	func onMoved(_ pinch:Pinch)
	func onEnded(_ pinch:Pinch)
	func onCancelled(_ pinch:Pinch)
}

//internal extension Pinchable {
//	var pinchRecognizer:Pinch.Recognizer {
//		return Pinch.Recognizer(target:self)
//	}
//}

