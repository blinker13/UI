
import XCTest
import UI

class DimensionTests: XCTestCase {

	func test_init() {
		let subject = Dimension()
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, Unit.infinity)
	}

	func test_init_all() {
		let subject = Dimension(min:1.0, max:2.0)
		XCTAssertEqual(subject.min, 1.0)
		XCTAssertEqual(subject.max, 2.0)
	}

	func test_init_min() {
		let subject = Dimension(min:1.0)
		XCTAssertEqual(subject.min, 1.0)
		XCTAssertEqual(subject.max, Unit.infinity)
	}

	func test_init_max() {
		let subject = Dimension(max:2.0)
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, 2.0)
	}

	func test_init_literal() {
		let subject:Dimension = 3.0
		XCTAssertEqual(subject.min, 3.0)
		XCTAssertEqual(subject.max, 3.0)
	}

	// MARK: - ZeroType

	func test_zero() {
		let subject = Dimension.zero
		XCTAssertEqual(subject.min, 0.0)
		XCTAssertEqual(subject.max, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Dimension.zero.isZero)
		XCTAssertFalse(Dimension().isZero)
	}

	// MARK: - CustomStringConvertible

	func test_description() {
		let subject = Dimension(min:1.0, max:2.0)
		XCTAssertEqual(subject.description, "Dimension(min:1.0, max:2.0)")
	}

	// MARK: - Operators

	func test_operator() {
		let subject:Dimension = 1.0...13.0
		XCTAssertEqual(subject.min, 1.0)
		XCTAssertEqual(subject.max, 13.0)
	}
}
