
#if os(iOS)

import Canvas
import UIKit

public final class UIKitViewController : UIViewController {

	private let component:Component

	private lazy var renderer:Renderer = {
		return UIKitRenderer(root:self.view)
	}()

	internal lazy var scene:Scene = {
		return Scene(self.component, self.renderer)
	}()

	public init(component:Component) {
		self.component = component
		super.init(nibName:nil, bundle:nil)
	}

	public required init?(coder:NSCoder) {
		fatalError()
	}
}

public extension UIKitViewController {

	override func loadView() {
		let w = CGFloat(component.width.min)
		let h = CGFloat(component.height.min)
		let rect = CGRect(x:0.0, y:0.0, width:w, height:h)
		self.view = UIView(frame:rect)
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		updateScene()
	}
}

internal extension UIKitViewController {

	func updateScene() {
		let size = Size(quartz:view.bounds.size)
		scene.update(with:size)
	}
}

#endif
