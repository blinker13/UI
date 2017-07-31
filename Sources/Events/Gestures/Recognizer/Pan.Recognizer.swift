
internal extension Pan {
	final class Recognizer : Gesture.Recognizer<Panable> {

		override func onEvent(_ event: Event) {
			guard let pan = event as? Pan else {
				return super.onEvent(event)
			}

			switch pan.phase {
				case .began: target.onBegan(pan)
				case .moved: target.onMoved(pan)
				case .ended: target.onEnded(pan)
			}
		}
	}
}
