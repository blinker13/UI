
import XCTest
import UI

class DimensionsTests : XCTestCase {

	func test_init() {
		let subject = Dimensions()
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, Float.infinity)
	}

	func test_init_all() {
		let subject = Dimensions(min:1.0, max:2.0)
		XCTAssertEqual(subject.min, 1.0)
		XCTAssertEqual(subject.max, 2.0)
	}

	func test_init_min() {
		let subject = Dimensions(min:1.0)
		XCTAssertEqual(subject.min, 1.0)
		XCTAssertEqual(subject.max, Float.infinity)
	}

	func test_init_max() {
		let subject = Dimensions(max:2.0)
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, 2.0)
	}

	func test_init_literal() {
		let subject:Dimensions = 3.0
		XCTAssertEqual(subject.min, 3.0)
		XCTAssertEqual(subject.max, 3.0)
	}

	func test_infinity() {
		let subject = Dimensions.infinity
		XCTAssertEqual(subject.max, .infinity)
	}

	func test_isInfinity() {
		XCTAssertTrue(Dimensions.infinity.isInfinite)
		XCTAssertTrue(Dimensions().isInfinite)
	}

	func test_zero() {
		let subject = Dimensions.zero
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Dimensions.zero.isZero)
		XCTAssertFalse(Dimensions().isZero)
	}

	func test_difference() {
		let subject = Dimensions(min:13, max:99)
		XCTAssertEqual(subject.difference, 86.0)
	}

	func test_isFlexible() {
		XCTAssertTrue(Dimensions(min:13, max:99).isFlexible)
		XCTAssertFalse(Dimensions(min:13, max:13).isFlexible)
	}

	func test_description() {
		let subject = Dimensions(min:1.0, max:2.0)
		XCTAssertEqual(subject.description, "1.0 ... 2.0")
	}
}
