
public final class Block<State> : Component<State> {

	private let renderer:(State) -> View

	public init (with state:State, renderer:@escaping (State) -> View) {
		self.renderer = renderer
		super.init(initial:state)
	}

	public override func render() -> View {
		return renderer(current)
	}
}
