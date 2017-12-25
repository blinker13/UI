
public struct Action<Target, Sender> {

	public typealias Completion = (Bool) -> Void
	public typealias Method = (Target) -> (Sender) -> Void

	internal struct Operation {

		private let action:Action
		private let completion:Completion

		init (action:Action, completion:@escaping Action.Completion) {
			self.completion = completion
			self.action = action
		}
	}

	public var timestamp:Timestamp = 0

	internal let target:Target?
	internal let sender:Sender
	internal let method:Method

	public init (send method:@escaping Method, to target:Target? = nil, from sender:Sender) {
		self.target = target
		self.sender = sender
		self.method = method
	}
}

// MARK: -

internal extension Action {

	func perform(with target:Target) {
		let action = method(target)
		action(sender)
	}
}

// MARK: -

internal extension Action.Operation {

	func run() {
		guard let target = action.target ?? next else { return completion(false) }
		defer { action.perform(with:target) }
		return completion(true)
	}
}

// MARK: -

private extension Action.Operation {

	var next:Target? {
		guard let node = action.sender as? Node else { return nil }
		let first = node.ancestors.first { $0 is Target }
		return first as? Target
	}
}
