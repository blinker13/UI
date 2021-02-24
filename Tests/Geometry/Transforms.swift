
import XCTest
import Geometry

class Transforms : XCTestCase {

	func test_init() {
		let subject = Transform(9, 8, 7, 6, 5, 4)
		XCTAssertEqual(subject.a, 9.0)
		XCTAssertEqual(subject.b, 8.0)
		XCTAssertEqual(subject.c, 7.0)
		XCTAssertEqual(subject.d, 6.0)
		XCTAssertEqual(subject.x, 5.0)
		XCTAssertEqual(subject.y, 4.0)
	}

	func test_init_rotated() {
		let subject = Transform(rotate: .radians(13.0))
		XCTAssertEqual(subject.a, 1.0)
		XCTAssertEqual(subject.b, 0.0)
		XCTAssertEqual(subject.c, 0.0)
		XCTAssertEqual(subject.d, 1.0)
		XCTAssertEqual(subject.x, 0.0)
		XCTAssertEqual(subject.y, 0.0)
	}

	func test_init_scaled() {
		let subject = Transform(scale: .init(width: 5.0, height: 2.0))
		XCTAssertEqual(subject.a, 5.0)
		XCTAssertEqual(subject.b, 0.0)
		XCTAssertEqual(subject.c, 0.0)
		XCTAssertEqual(subject.d, 2.0)
		XCTAssertEqual(subject.x, 0.0)
		XCTAssertEqual(subject.y, 0.0)
	}

	func test_init_translated() {
		let subject = Transform(translate: .init(x: 3.0, y: 4.0))
		XCTAssertEqual(subject.a, 1.0)
		XCTAssertEqual(subject.b, 0.0)
		XCTAssertEqual(subject.c, 0.0)
		XCTAssertEqual(subject.d, 1.0)
		XCTAssertEqual(subject.x, 3.0)
		XCTAssertEqual(subject.y, 4.0)
	}

	func test_identity() {
		let subject = Transform.identity
		XCTAssertEqual(subject.a, 1.0)
		XCTAssertEqual(subject.b, 0.0)
		XCTAssertEqual(subject.c, 0.0)
		XCTAssertEqual(subject.d, 1.0)
		XCTAssertEqual(subject.x, 0.0)
		XCTAssertEqual(subject.y, 0.0)
	}

	func test_inverted() {
		let subject = Transform(1, 2, 3, 4, 5, 6).inverted
		XCTAssertEqual(subject.a, -2.0)
		XCTAssertEqual(subject.b, 1.0)
		XCTAssertEqual(subject.c, 1.5)
		XCTAssertEqual(subject.d, -0.5)
		XCTAssertEqual(subject.x, 1.0)
		XCTAssertEqual(subject.y, -2.0)
	}
}
