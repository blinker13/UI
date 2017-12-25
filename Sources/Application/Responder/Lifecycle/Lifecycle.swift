
public protocol Lifecyle : Responder {
	func onStart()
	func onResume()
	func onPause()
	func onStop()
}

public extension Lifecyle {
	func onStart() {}
	func onResume() {}
	func onPause() {}
	func onStop() {}
}
