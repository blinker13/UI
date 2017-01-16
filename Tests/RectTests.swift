
import XCTest
import UI

class RectTests : XCTestCase {

	func test_init() {
		let subject = Rect()
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size, Size.zero)
	}

	func test_init_all() {
		let origin = Point(1.0, 2.0)
		let subject = Rect(origin:origin, width:13.0, height:4.0)
		XCTAssertEqual(subject.origin, origin)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 4.0)
	}

	func test_init_size() {
		let subject = Rect(width:13.0, height:8.0)
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 8.0)
	}

	func test_init_literal() {
		let subject:Rect = 13.0
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 13.0)
	}

	func test_min() {
		XCTAssertEqual(Rect.zero.min, Point.zero)
		XCTAssertEqual(Rect(width:13.5, height:4.1).min, Point.zero)
		XCTAssertEqual(Rect(width:-13.5, height:-4.1).min, Point(-13.5, -4.1))
//		XCTAssertEqual(Rect(-5.3, -3.5, 13.5, 4.1).min, Point(-5.3, -3.5))
//		XCTAssertEqual(Rect(-5.3, -3.5, -13.5, -4.1).min, Point(-18.8, -7.6))
	}

	func test_max() {
		XCTAssertEqual(Rect.zero.max, Point.zero)
		XCTAssertEqual(Rect(width:5.3, height:3.5).max, Point(5.3, 3.5))
		XCTAssertEqual(Rect(width:-13.5, height:-4.1).max, Point.zero)
//		XCTAssertEqual(Rect(-5.3, -3.5, 13.5, 4.1).max, Point(8.2, 0.6))
//		XCTAssertEqual(Rect(-5.3, -3.5, -13.5, -4.1).max, Point(-5.3, -3.5))
	}

	func test_zero() {
		let subject = Rect.zero
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size.width, 0.0)
		XCTAssertEqual(subject.size.height, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Rect.zero.isZero)
		XCTAssertFalse(Rect(width:13.0, height:5.0).isZero)
	}

	func test_description() {
		let origin = Point(1.0, 2.0)
		let subject = Rect(origin:origin, width:13.0, height:4.0)
		XCTAssertEqual(subject.description, "x:1.0, y:2.0, width:13.0, height:4.0")
	}
}
