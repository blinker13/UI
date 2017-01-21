
public protocol Context {

	var frame:Rect { get }
	var bounds:Rect { get }

	func update()
}
