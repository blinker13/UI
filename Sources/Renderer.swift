
//internal protocol Element {
//	var frame:Rect { get }
//}

internal protocol Renderer {
	func insert(_ node:Node, at index:Int)
	func update(_ node:Node)
	func remove(_ node:Node)
}
