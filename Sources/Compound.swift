
public typealias Compound = [Element]

extension Array : UI.Element where Element == UI.Element {}

extension Array : Component where Element == UI.Element {
	public func render() -> Element { return self }
}
