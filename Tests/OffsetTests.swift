
import XCTest
import UI

class OffsetTests: XCTestCase {

	func test_init() {
		let subject = Offset()
		XCTAssertEqual(subject.horizontal, 0.0)
		XCTAssertEqual(subject.vertical, 0.0)
	}

	func test_init_all() {
		let subject = Offset(horizontal:1.0, vertical:2.0)
		XCTAssertEqual(subject.horizontal, 1.0)
		XCTAssertEqual(subject.vertical, 2.0)
	}

	func test_init_horizontal() {
		let subject = Offset(horizontal:5.0)
		XCTAssertEqual(subject.horizontal, 5.0)
		XCTAssertEqual(subject.vertical, 0.0)
	}

	func test_init_vertical() {
		let subject = Offset(vertical:5.0)
		XCTAssertEqual(subject.horizontal, 0.0)
		XCTAssertEqual(subject.vertical, 5.0)
	}

	func test_init_literal() {
		let subject:Offset = 9.0
		XCTAssertEqual(subject.horizontal, 9.0)
		XCTAssertEqual(subject.vertical, 9.0)
	}

	// MARK: - ZeroType

	func test_zero() {
		let subject = Offset.zero
		XCTAssertEqual(subject.horizontal, 0.0)
		XCTAssertEqual(subject.vertical, 0.0)
	}
	
	func test_isZero() {
		XCTAssertTrue(Offset.zero.isZero)
		XCTAssertFalse(Offset(horizontal:13.0).isZero)
	}
	
	// MARK: - CustomStringConvertible
	
	func test_description() {
		let subject = Offset(horizontal:1.0, vertical:2.0)
		XCTAssertEqual(subject.description, "Offset(horizontal:1.0, vertical:2.0)")
	}
}
