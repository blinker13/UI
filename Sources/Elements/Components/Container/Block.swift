
public final class Block<State> : Component<State> {

	private let renderer:(State) -> Element

	public init (with state:State, renderer:@escaping (State) -> Element) {
		self.renderer = renderer
		super.init(initial:state)
	}

	public override func render() -> Element {
		return renderer(current)
	}
}
