
#if os(OSX)
import AppKit
#elseif os(iOS)
import UIKit
#endif

public extension Scene {
	public final class Controller : Platform.ViewController {

		internal let content:View
		internal let scene:Scene

		internal init (with scene:Scene, content:View) {
			(self.scene, self.content) = (scene, content)
			super.init(nibName:nil, bundle:nil)
		}

		public required init? (coder:NSCoder) {
			fatalError()
		}
	}
}

// MARK: -

public extension Scene.Controller {

	convenience init (with element:Element) {
		let scene = Scene(with:element)
		self.init(with:scene)
	}

	override func loadView() {
		self.view = content
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		for node in scene.flush() {
			let changes = node.update()
			changes.forEach(content.render)
		}
	}
}

// MARK: -

internal extension Scene.Controller {

	convenience init (with scene:Scene) {
		let view = Scene.View(with:scene)
		self.init(with:scene, content:view)
	}
}
