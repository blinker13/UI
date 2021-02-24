
import XCTest
import CoreGraphics
import Geometry

class Sizes : XCTestCase {

	func test_init_all() {
		let subject = Size(width: 13.0, height: 31.0)
		XCTAssertEqual(subject.width, 13.0)
		XCTAssertEqual(subject.height, 31.0)
	}

	func test_init_literal() {
		let subject = Size(sides: 13.0)
		XCTAssertEqual(subject.width, 13.0)
		XCTAssertEqual(subject.height, 13.0)
	}

	func test_isEmpty() {
		XCTAssertTrue(Size(width: 0.0, height: 0.0).isEmpty)
		XCTAssertTrue(Size(width: 13.0, height: 0.0).isEmpty)
		XCTAssertTrue(Size(width: 0.0, height: 13.0).isEmpty)
		XCTAssertFalse(Size(width: 1.0, height: 1.0).isEmpty)
	}

	func test_inseted() {
		let subject = Size(width: 13.0, height: 31.0)
		let space = Space(top: 1.0, left: 2.0, bottom: 3.0, right: 4.0)
		let result = subject.inseted(by:space)
		XCTAssertEqual(result.height, 27.0)
		XCTAssertEqual(result.width, 7.0)
	}
}
