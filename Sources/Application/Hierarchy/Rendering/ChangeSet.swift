
internal struct ChangeSet : Sequence {

	internal typealias Result = IndexingIterator<[Change]>

	internal struct Trace : Hashable {
		let scopable:Scopable
		let position:Int
		let origin:Int
	}

	private var traces:Set<Trace>
	private var changes = [Change]()
	private var origin = -1
	private var offest = 0

	internal init (with children:[Node]) {
		let iterator = children.enumerated()
		let results = iterator.map(Trace.init)
		self.traces = Set(results)
	}
}

// MARK: -

internal extension ChangeSet {

	var deletions:[Change] {
		return traces.map(removed)
	}

	func makeIterator() -> Result {
		let results = changes + deletions
		return results.makeIterator()
	}

	mutating func match(_ renderer:Renderer) -> Trace? {
		guard let scopable = renderer as? Scopable else { return nil }
		let proxy = Trace(scopable:scopable, position:0, origin:0)
		return traces.remove(proxy)
	}

	mutating func insert(_ node:Node, at index:Int) {
		let change = Change(insert:node, at:index)
		changes.append(change)
	}

	mutating func move(_ node:Node, to index:Int) {
		let change = Change(move:node, to:index)
		changes.append(change)
	}

	mutating func skip(_ index:Int) -> Bool {
		guard index == position else { return false }
		defer { offest += 1 }
		return true
	}
}

// MARK: -

private extension ChangeSet {

	var position:Int {
		return offest + changes.count
	}

	func removed(trace:Trace) -> Change {
		return Change(remove:trace.node)
	}
}

// MARK: -

internal extension ChangeSet.Trace {

	static func == (left:ChangeSet.Trace, right:ChangeSet.Trace) -> Bool {
		return left.hashValue == right.hashValue
	}

	init (offset:Int, node:Node) {
		self.scopable = node
		self.position = offset
		self.origin = offset
	}

	var hashValue:Int {
		return scopable.scope.hashValue
	}

	var node:Node {
		return scopable as! Node
	}
}
