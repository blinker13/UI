
public struct Window {
	public let scene:Scene
}

public extension Window {

//	var width: Dimensions { return scene.width }
//	var height: Dimensions { return scene.height }

	public init (with component:Component) {
		self.scene = Scene(with:component)
	}

	public init (with scene:Scene) {
		self.scene = scene
	}
}
