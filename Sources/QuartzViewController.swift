
import AppKit
import QuartzCore

public final class QuartzViewController : NSViewController {

	private let component:Component
//
//	private var layer:CALayer {
//		let layer = CALayer()
//		layer.backgroundColor = NSColor.whiteColor().CGColor
//		layer.geometryFlipped = true
//		return layer
//	}

	private lazy var renderer:Renderer = {
		return QuartzRenderer(self.view)
	}()

	private lazy var scene:Scene = {
		return Scene(self.component, self.renderer)
	}()

	// MARK: -

	public init(component:Component) {
		self.component = component
		super.init(nibName:nil, bundle:nil)!
	}

	public required init?(coder:NSCoder) {
		fatalError()
	}
//}

// MARK: -

//extension QuartzViewController {
//	public override var preferredMinimumSize:NSSize { return NSSize(width:component.width.min, height:component.height.min) }
//	public override var preferredMaximumSize:NSSize { return NSSize(width:component.width.max, height:component.height.max) }
//}

// MARK: -

//extension QuartzViewController {

	public override func loadView() {
		let rect = NSRect(x:0.0, y:0.0, width:component.width.min, height:component.height.min)
		let view = NSView(frame:rect)
//		view.wantsLayer = true
//		view.layer = layer
		self.view = view
	}

	public override func viewWillLayout() {
		super.viewWillLayout()

		let w = Unit(view.bounds.size.width)
		let h = Unit(view.bounds.size.height)
		let size = Size(w, h)

		scene.update(size)
	}
}
