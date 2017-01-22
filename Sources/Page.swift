
public protocol Page : Component {

	var title:String { get }

//	func compose(with context:Context) -> Component
	func compose() -> Component

	func onStart()
	func onResume()
	func onPause()
	func onStop()
}

public extension Page {

	var title:String {
		let kind = type(of:self)
		return String(describing:kind)
	}

//	func construct(with context:Context) -> [Component] {
//		let composition = compose(with:context)
	func construct() -> [Component] {
		let composition = compose()
		return [composition]
	}

	func onStart() {}
	func onResume() {}
	func onPause() {}
	func onStop() {}
}
