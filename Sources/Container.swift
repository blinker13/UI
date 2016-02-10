
import Canvas

public protocol Container : Component {

	var alignment:Alignment { get }
	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var padding:Space { get }

	func construct() -> [Component]
}
