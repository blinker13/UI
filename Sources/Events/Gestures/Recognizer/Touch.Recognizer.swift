
internal extension Touch {
	final class Recognizer : Gesture.Recognizer<Touchable> {

		override func onBegan(_ touches:Set<Touch>, with gesture:Gesture) {
			target.onBegan(touches, with:gesture)
		}

		override func onMoved(_ touches:Set<Touch>, with gesture:Gesture) {
			target.onMoved(touches, with:gesture)
		}

		override func onEnded(_ touches:Set<Touch>, with gesture:Gesture) {
			target.onEnded(touches, with:gesture)
		}

		override func onCancelled(_ touches:Set<Touch>, with gesture:Gesture) {
			target.onCancelled(touches, with:gesture)
		}
	}
}
