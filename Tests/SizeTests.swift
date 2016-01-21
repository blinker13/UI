
import XCTest
import UI

class SizeTests: XCTestCase {

	func test_init() {
		let subject = Size()
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, Points.infinity)
	}

	func test_init_all() {
		let subject = Size(min:1.0, max:2.0)
		XCTAssertEqual(subject.min, 1.0)
		XCTAssertEqual(subject.max, 2.0)
	}

	func test_init_min() {
		let subject = Size(min:1.0)
		XCTAssertEqual(subject.min, 1.0)
		XCTAssertEqual(subject.max, Points.infinity)
	}

	func test_init_max() {
		let subject = Size(max:2.0)
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, 2.0)
	}

	func test_init_literal() {
		let subject:Size = 3.0
		XCTAssertEqual(subject.min, 3.0)
		XCTAssertEqual(subject.max, 3.0)
	}

	// MARK: - ZeroType

	func test_zero() {
		let subject = Size.zero
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Size.zero.isZero)
		XCTAssertFalse(Size().isZero)
	}

	// MARK: - CustomStringConvertible

	func test_description() {
		let subject = Size(min:1.0, max:2.0)
		XCTAssertEqual(subject.description, "Size(min:1.0, max:2.0)")
	}

	// MARK: - Operators

	func test_operator() {
		let subject:Size = 1.0...13.0
		XCTAssertEqual(subject.min, 1.0)
		XCTAssertEqual(subject.max, 13.0)
	}
}
