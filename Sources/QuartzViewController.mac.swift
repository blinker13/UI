
#if os(OSX)

import AppKit

public final class QuartzViewController : NSViewController {

	private let component:Component

	private lazy var renderer:Renderer = {
		return QuartzRenderer(view:self.view)
	}()

	internal lazy var scene:Scene = {
		return Scene(self.component, self.renderer)
	}()

	public init(component:Component) {
		self.component = component
		super.init(nibName:nil, bundle:nil)!
	}

	public required init?(coder:NSCoder) {
		fatalError()
	}
}

public extension QuartzViewController {

	override var preferredMinimumSize:NSSize { return NSSize(width:component.width.min, height:component.height.min) }
	override var preferredMaximumSize:NSSize { return NSSize(width:component.width.max, height:component.height.max) }

	override func loadView() {
		let rect = NSRect(x:0, y:0, width:component.width.min, height:component.height.min)
		let view = NSView(frame:rect)
		view.wantsLayer = true
		view.layer = CALayer()
		view.layer!.isGeometryFlipped = true
		self.view = view
	}

	override func viewWillLayout() {
		super.viewWillLayout()
		updateScene()
	}
}

#endif
