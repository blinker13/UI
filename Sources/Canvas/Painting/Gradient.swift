
import Geometry

public struct Gradient : Hashable {

	public enum Shading : Hashable {
		case linear(Point, Point)
		case angular(Point, Angle, Angle)
		case radial(Point, Scalar, Scalar)
	}

	public struct Stop : Hashable {
		public let color: Color
		public let location: Scalar
	}

	public let shading: Shading
	public let stops: [Stop]

	@usableFromInline internal init(shading: Shading, stops: [Stop]) {
		self.shading = shading
		self.stops = stops
	}
}

// MARK: -

extension Gradient {

	@inlinable init(linear stops: [Stop], from origin: Point, to destination: Point) {
		self.init(shading: .linear(origin, destination), stops: stops)
	}

	@inlinable init(linear colors: [Color], from origin: Point, to destination: Point) {
		self.init(shading: .linear(origin, destination), stops: []) // TODO: map colors
	}

	@inlinable init(angular stops: [Stop], origin: Point = .center, start: Angle = .zero, end: Angle = .full) {
		self.init(shading: .angular(origin, start, end), stops: stops)
	}

	@inlinable init(angular colors: [Color], origin: Point = .center, start: Angle = .zero, end: Angle = .full) {
		self.init(shading: .angular(origin, start, end), stops: []) // TODO: map colors
	}

	@inlinable init(radial stops: [Stop], origin: Point = .center, start: Scalar, end: Scalar) {
		self.init(shading: .radial(origin, start, end), stops: stops)
	}

	@inlinable init(radial colors: [Color], origin: Point = .center, start: Scalar, end: Scalar) {
		self.init(shading: .radial(origin, start, end), stops: []) // TODO: map colors
	}
}

// MARK: -

extension Gradient {

}
