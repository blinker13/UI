
import Canvas

public protocol Component {
	var align:Alignment { get }
	var margin:Space { get }
	var height:Size { get }
	var width:Size { get }
}
