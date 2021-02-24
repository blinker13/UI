
import XCTest
import Geometry

class Rectangles : XCTestCase {

	func test_init_all() {
		let origin = Point(x: 1.0, y: 2.0)
		let subject = Rectangle(origin: origin, size: .init(width: 13.0, height: 4.0))
		XCTAssertEqual(subject.origin, origin)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 4.0)
	}

	func test_init_size() {
		let subject = Rectangle(width: 13.0, height: 8.0)
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 8.0)
	}

	func test_init_literal() {
		let subject = Rectangle(sides: 13.0)
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 13.0)
	}
}
