
#if os(iOS)

import UIKit

public final class QuartzViewController : UIViewController {

	fileprivate let component:Component

	private lazy var renderer:Renderer = {
		return QuartzRenderer(root:self.view.layer)
	}()

	internal lazy var scene:Scene = {
		return Scene(self.component, self.renderer)
	}()

	public init (component:Component) {
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
		let rect = CGRect(x:0, y:0, width:w, height:h)
		self.view = UIView(frame:rect)
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		updateScene()
	}
}

#endif
