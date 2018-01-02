
#if os(iOS)

import UIKit

internal extension Application {

	func main() {
		let count = Int(CommandLine.argc)
		let delegate = NSStringFromClass(Platform.self)
		let destination = UnsafeMutablePointer<Int8>.self
		let rawUnsafeArgv = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
		let argv = rawUnsafeArgv.bindMemory(to:destination, capacity:count)
		UIApplicationMain(CommandLine.argc, argv, nil, delegate)
	}

	func exit() {
		Darwin.exit(EXIT_SUCCESS)
	}
}

#endif
