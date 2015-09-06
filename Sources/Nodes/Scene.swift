
public final class Scene : Node {

	public override init (with element:Element) {
		#warning("element must be stateless")
		super.init(with:element)
	}
}

// MARK: -

internal extension Scene {
	#warning("min size getter")
	#warning("max size getter")
}
