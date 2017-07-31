
#if os(iOS)

import UIKit

public final class AppleViewController : UIViewController {

	internal let scene:Scene

	internal lazy var renderer:Renderer = {
		return AppleRenderer(root:self.layer)
	}()

	internal init (with scene:Scene) {
		self.scene = scene
		super.init(nibName:nil, bundle:nil)
	}

	public required init?(coder:NSCoder) {
		fatalError()
	}
}

// MARK: -

public extension AppleViewController {

	// MARK: Lifecyle

	override func loadView() {
		let view = UIView(frame:.zero)
		view.isMultipleTouchEnabled = true
		self.view = view
	}

//	override func viewWillAppear(_ animated:Bool) {
//		super.viewWillAppear(animated)
//		scene.onStart()
//	}
//
//	override func viewDidAppear(_ animated:Bool) {
//		super.viewDidAppear(animated)
//		scene.onResume()
//	}
//
//	override func viewWillDisappear(_ animated:Bool) {
//		super.viewWillDisappear(animated)
//		scene.onPause()
//	}
//
//	override func viewDidDisappear(_ animated:Bool) {
//		super.viewDidDisappear(animated)
//		scene.onStop()
//	}

//	// MARK: Events
//
//	override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?) {
//		print("Began", event!)
//	}
//
//	override func touchesMoved(_ touches:Set<UITouch>, with event:UIEvent?) {
//		print("Moved", event!)
//	}
//
//	override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?) {
//		print("Ended", event!)
//	}
//
//	override func touchesCancelled(_ touches:Set<UITouch>, with event:UIEvent?) {
//		print("Cancelled", event!)
//	}

	// MARK: Layout

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		scene.update(currentSize)
	}

	public override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		scene.display(with:renderer)
	}
}

// MARK: -

private extension AppleViewController {
	var layer:CALayer { return view.layer }
}

#endif
