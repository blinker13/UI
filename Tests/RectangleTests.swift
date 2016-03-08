
import XCTest
import UI

class RectangleTests: XCTestCase {

	func test_init() {
		let subject = Rectangle()
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size, Size.zero)
	}

	func test_init_all() {
		let origin = Point(1.0, 2.0)
		let subject = Rectangle(origin:origin, width:13.0, height:4.0)
		XCTAssertEqual(subject.origin, origin)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 4.0)
	}

	func test_init_size() {
		let subject = Rectangle(width:13.0, height:8.0)
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 8.0)
	}

	func test_init_literal() {
		let subject:Rectangle = 13.0
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size.width, 13.0)
		XCTAssertEqual(subject.size.height, 13.0)
	}

	// MARK: - Shape

	func test_min() {
		XCTAssertEqual(Rectangle.zero.min, Point.zero)
		XCTAssertEqual(Rectangle(width:13.5, height:4.1).min, Point.zero)
		XCTAssertEqual(Rectangle(width:-13.5, height:-4.1).min, Point(-13.5, -4.1))
		XCTAssertEqual(Rectangle(-5.3, -3.5, 13.5, 4.1).min, Point(-5.3, -3.5))
		XCTAssertEqual(Rectangle(-5.3, -3.5, -13.5, -4.1).min, Point(-18.8, -7.6))
	}

	func test_max() {
		XCTAssertEqual(Rectangle.zero.max, Point.zero)
		XCTAssertEqual(Rectangle(width:5.3, height:3.5).max, Point(5.3, 3.5))
//		XCTAssertEqual(Rectangle(width:-13.5, height:-4.1).max, Point.zero)
//		XCTAssertEqual(Rectangle(x:-5.3, y:-3.5, width:13.5, height:4.1).max, Point(x:8.2, y:0.6))
//		XCTAssertEqual(Rectangle(x:-5.3, y:-3.5, width:-13.5, height:-4.1).max, Point(x:-18.8, y:-7.6))
	}

	// MARK: - ZeroType

	func test_zero() {
		let subject = Rectangle.zero
		XCTAssertEqual(subject.origin, Point.zero)
		XCTAssertEqual(subject.size.width, 0.0)
		XCTAssertEqual(subject.size.height, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Rectangle.zero.isZero)
		XCTAssertFalse(Rectangle(width:13.0, height:5.0).isZero)
	}

	// MARK: - CustomStringConvertible

	func test_description() {
		let origin = Point(1.0, 2.0)
		let subject = Rectangle(origin:origin, width:13.0, height:4.0)
		XCTAssertEqual(subject.description, "Rectangle(origin:(x:1.0, y:2.0), size:(width:13.0, height:4.0))")
	}
}
