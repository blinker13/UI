
import XCTest
import Canvas
import Geometry

class Shadows : XCTestCase {

	func test_init() {
		let subject = Shadow()
		XCTAssertEqual(subject.color, .shadow)
		XCTAssertEqual(subject.offset, .zero)
		XCTAssertEqual(subject.radius, 3.0)
	}

	func test_init_color() {
		let subject = Shadow(color: .gray)
		XCTAssertEqual(subject.color, .gray)
		XCTAssertEqual(subject.offset, .zero)
		XCTAssertEqual(subject.radius, 3.0)
	}

	func test_init_offset() {
		let subject = Shadow(offset: 13.0)
		XCTAssertEqual(subject.color, .shadow)
		XCTAssertEqual(subject.offset, 13.0)
		XCTAssertEqual(subject.radius, 3.0)
	}

	func test_init_radius() {
		let subject = Shadow(radius: 7.0)
		XCTAssertEqual(subject.color, .shadow)
		XCTAssertEqual(subject.offset, .zero)
		XCTAssertEqual(subject.radius, 7.0)
	}
}
