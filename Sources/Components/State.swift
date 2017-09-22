
public struct State<Value> {

	internal var scope:Scope

	internal init (with scope:Scope) {
		self.scope = scope
	}
}

public extension State {

	var current:Value {
		return scope.value as! Value
	}

	func update(with handle:(Value) -> Value) {
		guard let handler = scope.handle else { fatalError() }
		guard let current = scope.value as? Value else { fatalError() }
		handler { self.scope.value = handle(current) }
	}

	func set(_ value:Value) {
		update { _ in return value }
	}
}
