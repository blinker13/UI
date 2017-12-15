
import Styling

public final class Block : Component<Void> {

//	public typealias Updater = ()

	private let renderer:() -> Element

	public init (/*with state:State, */renderer:@escaping () -> Element) {
		self.renderer = renderer
		super.init(initial:())
//		self.state = state
	}

	public override func render() -> Element {
		return renderer()
	}
}
