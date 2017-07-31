
internal extension Pinch {
	final class Recognizer : Gesture.Recognizer<Pinchable> {

		override func onEvent(_ event:Event) {

			guard let pinch = event as? Pinch else {
				return super.onEvent(event)
			}

			switch pinch.phase {
				case .began: target.onBegan(pinch)
				case .moved: target.onMoved(pinch)
				case .ended: target.onEnded(pinch)
			}
		}
	}
}
