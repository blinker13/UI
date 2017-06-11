
public extension Text {

	public class Iterator : IteratorProtocol {

		private var compounds:Compound.Iterator?
		private var runs:Run.Iterator?

		internal init (with text:Text) {
			self.compounds = Compound.Iterator(with:text)
			self.runs = Run.Iterator(with:text)
		}

		public func next() -> Text.Run? {
			return compounds?.next()
				?? runs?.next()
		}
	}
}

fileprivate extension Text.Compound {

	fileprivate class Iterator : IteratorProtocol {

		private let separator:Text.Run
		private var enumerator:IndexingIterator<[Text]>
		private var iterator:Text.Iterator?

		fileprivate init? (with text:Text) {
			guard case let .compound(compound) = text else { return nil }
			self.separator = Text.Run(string:compound.separator, style:compound.style)
			self.enumerator = compound.runs.makeIterator()
		}

		fileprivate func next() -> Text.Run? {
			if let run = iterator?.next() { return run }
			guard let text = enumerator.next() else { return nil }
			if let run = nextSeparator() { return run }
			iterator = Text.Iterator(with:text)
			return iterator?.next()
		}

		private func nextSeparator() -> Text.Run? {
			if iterator == nil { return nil }
			defer { iterator = nil }
			return separator
		}
	}
}

fileprivate extension Text.Run {

	fileprivate class Iterator : IteratorProtocol {

		private var run:Text.Run?

		fileprivate init? (with text:Text) {
			guard case let .run(value) = text else { return nil }
			self.run = value
		}

		fileprivate func next() -> Text.Run? {
			defer { run = nil }
			return run
		}
	}
}
