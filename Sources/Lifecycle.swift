
public protocol Lifecycle : Stateful {
	func onStart(with state:State<Element>)
	func onResume(with state:State<Element>)
	func onPause(with state:State<Element>)
	func onStop(with state:State<Element>)
}
