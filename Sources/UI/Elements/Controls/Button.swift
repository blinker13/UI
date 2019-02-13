//
//import Graphics
//
//public final class Button : Component<Void> {
//
//	public let style:Style
//
//	public init (style:Style) {
//		self.style = style
//		super.init(initial:())
//	}
//
//	override open func render() -> View {
//		return View(style:style)
//	}
//}
//
//// MARK: -
//
//public extension Button {
//
//	func onBegan(_ touches:Set<Touch>, with gesture:Gesture) {
//		print(#function, "->", touches)
//	}
//
//	func onMoved(_ touches:Set<Touch>, with gesture:Gesture) {
//		print(#function, "->", touches)
//	}
//
//	func onEnded(_ touches:Set<Touch>, with gesture:Gesture) {
//		print(#function, "->", touches)
//	}
//
//	func onCancelled(_ touches:Set<Touch>, with gesture:Gesture) {
//		print(#function, "->", touches)
//	}
//}
