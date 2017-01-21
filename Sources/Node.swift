
internal final class Node {

	internal weak var parent:Node?
	internal var children:[Node] = []
	internal var component:Component
	internal var frame:Rect = .zero

	internal init (with component:Component) {
		self.component = component
	}
}

extension Node : Component {

	var alignment:Alignment { return component.alignment }
	var arrangement:Arrangement { return component.arrangement }
	var distribution:Distribution { return component.distribution }
	var justify:Alignment { return component.justify }
	var overflow:Overflow { return component.overflow }
	var height:Dimensions { return component.height }
	var width:Dimensions { return component.width }
	var padding:Padding { return component.padding }
	var margin:Margin { return component.margin }

	func construct(with context: Context) -> [Component] {
		return component.construct(with:context)
	}
}

extension Node : Hashable {

	static func == (left:Node, right:Node) -> Bool {
		return left.hashValue == right.hashValue
	}

	var hashValue:Int {
		let identifier = ObjectIdentifier(self)
		return identifier.hashValue
	}
}

//internal extension Node {
//
//}
