
internal extension Gesture {

	class Recognizer<Target> : UI.Recognizer, Touchable {

		let target:Target

		init (target:Target) {
			self.target = target
		}

		func onEvent(_ event: Event) {
			guard let gesture = event as? Gesture else { return }
			if let touches = gesture[.began] { onBegan(touches, with:gesture) }
			if let touches = gesture[.moved] { onMoved(touches, with:gesture) }
			if let touches = gesture[.ended] { onEnded(touches, with:gesture) }
			if let touches = gesture[.cancelled] { onCancelled(touches, with:gesture) }
		}

		func onBegan(_ touches:Set<Touch>, with gesture:Gesture) {}
		func onMoved(_ touches:Set<Touch>, with gesture:Gesture) {}
		func onEnded(_ touches:Set<Touch>, with gesture:Gesture) {}
		func onCancelled(_ touches:Set<Touch>, with gesture:Gesture) {}
	}
}
