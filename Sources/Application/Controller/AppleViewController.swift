
#if os(iOS)
import UIKit
public typealias ViewController = UIViewController
#elseif os(OSX)
import AppKit
public typealias ViewController = NSViewController
#endif

public final class AppleViewController : ViewController {

	internal let scene:Scene

	internal init (with scene:Scene) {
		self.scene = scene
		super.init(nibName:nil, bundle:nil)
	}

	public convenience init (with element:Element) {
		let scene = Scene(with:element)
		self.init(with:scene)
	}

	public required init? (coder:NSCoder) {
		fatalError()
	}
}
