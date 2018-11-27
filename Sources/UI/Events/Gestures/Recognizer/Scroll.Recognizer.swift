
internal extension Scroll {
	final class Recognizer : Gesture.Recognizer<Scrollable> {

		override func onEvent(_ event: Event) {
			guard let scroll = event as? Scroll else {
				return super.onEvent(event)
			}

			switch scroll.phase {
				case .began: target.onBegan(scroll)
				case .moved: target.onMoved(scroll)
				case .ended: target.onEnded(scroll)
			}
		}
	}
}
