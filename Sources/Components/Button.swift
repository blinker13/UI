
public struct Button : Stylable, Viewable, Component {

	public typealias Handler = () -> Void

	public struct Action {

		public typealias Trigger = Touch.Action

		public let trigger:Trigger
		public let handler:Handler

		public init (on trigger:Trigger, do handler:@escaping Handler) {
			(self.trigger, self.handler) = (trigger, handler)
		}
	}

	public struct Values {
		let currentDigit:Touch.Digit?
	}

	public let actions:[Action]
	public let scope:Scope
	public let style:Style

	public init (style:Style, actions:[Action]) {
		let values = Values(currentDigit:nil)
		self.scope = Scope(with:values)
		self.actions = actions
		self.style = style
	}

	public func render(with state:State<Values>) -> [Element] {
		return []
	}
}

public extension Button {

	init (style:Style, onTap:@escaping Handler) {
		let action = Action(on:.up(.inside), do:onTap)
		self.init(style:style, actions:[action])
	}
}

private extension Button {

	var currentDigit:Touch.Digit? {
		return state.current.currentDigit
	}

	func send(_ action:Touch.Action) {
		let filteredActions = actions.filter { $0.trigger == action }
		filteredActions.forEach { $0.handler() }
		print("-->", action)
	}

	func update(_ digit:Touch.Digit?) {
		let value = Values(currentDigit:digit)
		state.set(value)
	}
}

extension Button : Touchable {

	public func onBegan(_ touches:Set<Touch>, with gesture:Gesture) {
		guard currentDigit == nil, let touch = touches.first else { return }
		send(.down(touch.count))
		update(touch.digit)
	}

	public func onMoved(_ touches:Set<Touch>, with gesture:Gesture) {
		guard let digit = currentDigit else { return }
		guard let touch = touches[digit] else { return }

		let movedDigit = touch.digit

//		switch (digit.area, movedDigit.area) {
//			case (.inside, .outside): send(.exit)
//			case (.outside, .inside): send(.enter)
//			default: send(.move(movedDigit.area))
//		}

		send(.move(.inside))
		update(movedDigit)
	}

	public func onEnded(_ touches:Set<Touch>, with gesture:Gesture) {
		guard let digit = currentDigit else { return }
		guard let touch = touches[digit] else { return }
		print(touch.description)
//		send(.up(touch.area))
		send(.up(.inside))
		update(nil)
	}

	public func onCancelled(_ touches:Set<Touch>, with gesture:Gesture) {
		guard currentDigit != nil else { return }
		send(.cancel)
		update(nil)
	}
}
