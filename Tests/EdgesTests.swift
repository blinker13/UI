
import XCTest
import UI

class EdgesTests: XCTestCase {

	func test_init_all() {
		let subject = Edges(leading:1, trailing:2)
		XCTAssertEqual(subject.leading, 1.0)
		XCTAssertEqual(subject.trailing, 2.0)
	}

	func test_init_literal() {
		let subject:Edges = 13.0
		XCTAssertEqual(subject.leading, 13.0)
		XCTAssertEqual(subject.trailing, 13.0)
	}

	func test_infinity() {
		let subject = Edges.infinity
		XCTAssertEqual(subject.leading, .infinity)
		XCTAssertEqual(subject.trailing, .infinity)
	}

	func test_isInfinity() {
		XCTAssertTrue(Edges.infinity.isInfinite)
		XCTAssertTrue(Edges(leading:.infinity, trailing:.infinity).isInfinite)
	}

	func test_zero() {
		let subject = Edges.zero
		XCTAssertEqual(subject.leading, 0.0)
		XCTAssertEqual(subject.trailing, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Edges.zero.isZero)
		XCTAssertTrue(Edges(leading:0, trailing:0).isZero)
	}

	func test_total() {
		let subject = Edges(leading:13, trailing:99)
		XCTAssertEqual(subject.total, 112.0)
	}

	func test_description() {
		let subject = Edges(leading:13, trailing:99)
		XCTAssertEqual(subject.description, "13.0 |---| 99.0")
	}
}
