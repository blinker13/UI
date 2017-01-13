
import Geometry

public protocol Container : Component {

	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var padding:Padding { get }

	func construct() -> [Component]
}
