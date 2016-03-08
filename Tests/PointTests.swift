
import XCTest
import UI

class PointTests: XCTestCase {

	func test_init_all() {
		let subject = Point(1.0, 2.0)
		XCTAssertEqual(subject.x, 1.0)
		XCTAssertEqual(subject.y, 2.0)
	}

	func test_init_x() {
		let subject = Point(x:5.0)
		XCTAssertEqual(subject.x, 5.0)
		XCTAssertEqual(subject.y, 0.0)
	}

	func test_init_y() {
		let subject = Point(y:5.0)
		XCTAssertEqual(subject.x, 0.0)
		XCTAssertEqual(subject.y, 5.0)
	}

	func test_init_literal() {
		let subject:Point = 9.0
		XCTAssertEqual(subject.x, 9.0)
		XCTAssertEqual(subject.y, 9.0)
	}

	// MARK: - ZeroType

	func test_zero() {
		let subject = Point.zero
		XCTAssertEqual(subject.x, 0.0)
		XCTAssertEqual(subject.y, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Point.zero.isZero)
		XCTAssertFalse(Point(x:13.0).isZero)
	}

	// MARK: - CustomStringConvertible
	
	func test_description() {
		let subject = Point(1.0, 2.0)
		XCTAssertEqual(subject.description, "(x:1.0, y:2.0)")
	}
}
