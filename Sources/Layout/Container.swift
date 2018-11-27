
import Geometry

public typealias Padding = Space

public protocol Container {
	var arrangement:Arrangement { get }
	var distribution:Distribution { get }
	var justify:Alignment { get }
	var padding:Padding { get }
}
