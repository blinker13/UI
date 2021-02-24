
public protocol Scene {
	associatedtype Content
	func launch() -> Content
}
