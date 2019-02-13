
internal struct Reconciler {

//	fileprivate final class Queue : IteratorProtocol {
//
//		private var base:IndexingIterator<[Change]>
//		private var cache:Set<Change>
//
//		fileprivate init (_ kind:Change.Kind, _ elements:[Element]) {
//			let changes = elements.changed(kind)
//			self.base = changes.makeIterator()
//			self.cache = Set(changes)
//		}
//	}
//
//	internal init (old:[Node], new:[Element], handle:() -> Void) {
//		let removables = Queue(.remove, old)
//		self.inserts = Queue(.insert, new)
//		self.removes = removables
//		self.current = removables
//	}
//
//	private var current:Queue
//	private var inserts:Queue
//	private var removes:Queue
}

// MARK: -

//private extension Reconciler.Queue {
//
//	init (_ kind:Change.Kind, _ elements:[Element]) {
//		let changes = elements.changed(kind)
//		self.base = changes.makeIterator()
//		self.cache = Set(changes)
//	}
//
//	func contains(_ change:Change) -> Bool {
//		return cache.contains(change)
//	}
//
////	mutating func remove(_ change:Change) -> Change? {
////		return cache.remove(change)
////	}
//
//	mutating func next() -> Change? {
//		while let current = base.next(), contains(current) {
//			return current
//		}
//		return nil
//	}
//}
