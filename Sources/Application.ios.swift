
#if os(iOS)

import UIKit

internal extension Application {

	func main() {
		let count = Int(CommandLine.argc)
		let destination = UnsafeMutablePointer<Int8>.self
		let rawUnsafeArgv = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
		let argv = rawUnsafeArgv.bindMemory(to:destination, capacity:count)
		let delegateName = NSStringFromClass(ApplicationDelegate.self)
		UIApplicationMain(CommandLine.argc, argv, nil, delegateName)
	}
}

#endif
