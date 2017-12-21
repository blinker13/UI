
#if os(OSX)

import AppKit
import Geometry

internal extension NSEvent {

	func pointers(with node:Node, in location:Point) -> Set<Touch> {

		let pointer = Touch(
			hashValue:touchHash,
			timestamp:Timestamp(timestamp),
			location:location,
			force:Touch.Force(pressure),
			phase:touchPhase,
			count:clickCount,
			node:node
		)

		return [pointer]
	}
}

private extension NSEvent {

	var touchHash:Int {
		switch type {
			case .leftMouseDown, .leftMouseDragged, .leftMouseUp: return 1
			default: fatalError()
		}
	}

	var touchPhase:Touch.Phase {
		switch type {
			case .leftMouseDown, .rightMouseDown, .otherMouseDown: return .began
			case .leftMouseDragged, .rightMouseDragged, .otherMouseDragged: return .moved
			case .leftMouseUp, .rightMouseUp, .otherMouseUp: return .ended
			default: fatalError()
		}
	}
}

#endif
