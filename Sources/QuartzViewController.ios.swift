
#if os(iOS)

import UIKit

public final class QuartzViewController : UIViewController {

	private let component:Component

	private lazy var renderer:Renderer = {
		return QuartzRenderer(root:self.view.layer)
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

public extension QuartzViewController {

	override func loadView() {
		let w = CGFloat(component.width.min)
		let h = CGFloat(component.height.min)
		let rect = CGRect(x:0.0, y:0.0, width:w, height:h)

		self.view = UIView(frame:rect)
		self.view.isMultipleTouchEnabled = true
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		updateScene()
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("--> touchesBegan", event)
	}

	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("--> touchesMoved", event)
	}

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("--> touchesEnded", event)
	}

	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("--> touchesCancelled", event)
	}
}

#endif
