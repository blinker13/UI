
import XCTest
import CoreGraphics
import UI

class SizeTests: XCTestCase {

	func test_init_all() {
		let subject = Size(13.0, 31.0)
		XCTAssertEqual(subject.width, 13.0)
		XCTAssertEqual(subject.height, 31.0)
	}

	func test_init_width() {
		let subject = Size(width:13.0)
		XCTAssertEqual(subject.width, 13.0)
		XCTAssertEqual(subject.height, 0.0)
	}

	func test_init_height() {
		let subject = Size(height:13.0)
		XCTAssertEqual(subject.width, 0.0)
		XCTAssertEqual(subject.height, 13.0)
	}

	func test_init_literal() {
		let subject:Size = 13.0
		XCTAssertEqual(subject.width, 13.0)
		XCTAssertEqual(subject.height, 13.0)
	}

	func test_infinity() {
		let subject = Size.infinity
		XCTAssertEqual(subject.width, .infinity)
		XCTAssertEqual(subject.height, .infinity)
	}

	func test_isInfinity() {
		XCTAssertTrue(Size.infinity.isInfinite)
		XCTAssertFalse(Size(width:.infinity).isInfinite)
		XCTAssertFalse(Size(height:.infinity).isInfinite)
		XCTAssertTrue(Size(.infinity, .infinity).isInfinite)
	}

	func test_zero() {
		let subject = Size.zero
		XCTAssertEqual(subject.width, 0.0)
		XCTAssertEqual(subject.height, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Size.zero.isZero)
		XCTAssertTrue(Size(0.0, 0.0).isZero)
		XCTAssertFalse(Size(13.0, 0.0).isZero)
		XCTAssertFalse(Size(0.0, 13.0).isZero)
	}

	func test_isEmpty() {
		XCTAssertTrue(Size.zero.isZero)
		XCTAssertTrue(Size(0.0, 0.0).isEmpty)
		XCTAssertTrue(Size(13.0, 0.0).isEmpty)
		XCTAssertTrue(Size(0.0, 13.0).isEmpty)
		XCTAssertFalse(Size(1.0, 1.0).isEmpty)
	}

	func test_inseted() {
		let subject = Size(13.0, 31.0)
		let space = Space(top: 1.0, left: 2.0, bottom: 3.0, right: 4.0)
		let result = subject.inseted(by:space)
		XCTAssertEqual(result.height, 27.0)
		XCTAssertEqual(result.width, 7.0)
	}

	func test_inset() {
		var subject = Size(13.0, 31.0)
		let space = Space(top: 1.0, left: 2.0, bottom: 3.0, right: 4.0)
		subject.inset(by:space)
		XCTAssertEqual(subject.height, 27.0)
		XCTAssertEqual(subject.width, 7.0)
	}

	func test_transformed() {
		let subject = Size(13.0, 31.0)
		let transform = Transform(1.0, 2.0, 3.0, 4.0, 5.0, 6.0)
		let result = subject.transformed(by:transform)
		XCTAssertEqual(result.height, 150.0)
		XCTAssertEqual(result.width, 106.0)
	}
}
