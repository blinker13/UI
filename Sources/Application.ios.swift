
#if os(iOS)

import UIKit

internal extension Application {

	func open(_ window:Window) {
		self.window = window
	}

	func main() {
		let count = Int(CommandLine.argc)
		let destination = UnsafeMutablePointer<Int8>.self
		let rawUnsafeArgv = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
		let argv = rawUnsafeArgv.bindMemory(to:destination, capacity:count)
		UIApplicationMain(CommandLine.argc, argv, nil, Apple.name)
	}

	func exit() {
		
	}
}

#endif
