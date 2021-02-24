
import XCTest
import Geometry

class Points : XCTestCase {

	func test_init_all() {
		let subject = Point(x: 1.0, y: 2.0)
		XCTAssertEqual(subject.x, 1.0)
		XCTAssertEqual(subject.y, 2.0)
	}

	func test_init_x() {
		let subject = Point(x: 5.0)
		XCTAssertEqual(subject.x, 5.0)
		XCTAssertEqual(subject.y, .zero)
	}

	func test_init_y() {
		let subject = Point(y: 5.0)
		XCTAssertEqual(subject.x, .zero)
		XCTAssertEqual(subject.y, 5.0)
	}

	func test_init_literal() {
		let subject = Point(xy: 9.0)
		XCTAssertEqual(subject.x, 9.0)
		XCTAssertEqual(subject.y, 9.0)
	}

	func test_zero() {
		let subject = Point.zero
		XCTAssertEqual(subject.x, .zero)
		XCTAssertEqual(subject.y, .zero)
	}
}
