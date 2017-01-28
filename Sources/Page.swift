
public protocol Page : Component {

	var title:String { get }

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

	func onStart() {}
	func onResume() {}
	func onPause() {}
	func onStop() {}
}
