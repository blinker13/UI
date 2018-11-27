
internal struct Action<Target, Sender> {

	internal typealias Message = (Target) -> (Sender) -> Void

	private let message:Message
	private let target:Target?
	private let sender:Sender

	internal init (send message:@escaping Message, to target:Target? = nil, from sender:Sender) {
		self.message = message
		self.sender = sender
		self.target = target
	}
}

// MARK: -

internal extension Action {

	func perform() {
		guard let target = resolve() else { return }
		let action = message(target)
		action(sender)
	}
}

// MARK: -

private extension Action {

	func resolve() -> Target? {
		if let this = target { return this }
		if let this = sender as? Target { return this }
		guard let responder = sender as? Responder else { return nil }
		let first = responder.chain.first { $0 is Target }
		return first as? Target
	}
}
