
import Canvas

public protocol Container : Component {

	var arrangement:Arrangement { get }
	var contentAlignment:Alignment { get }
	var distribution:Distribution { get }
	var padding:Space { get }

	func construct() -> [Component]
}
