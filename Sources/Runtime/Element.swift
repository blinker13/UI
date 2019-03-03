
public protocol Element : Encodable {

}

// MARK: -

internal extension Element {

	func render() -> Children {
		switch component?.render() {
		case .some(let all as Children): return all
		case .some(let child): return [child]
		default: return []
		}
	}
}

// MARK: -

private extension Element {

	var component:Component? {
		return self as? Component
	}
}
