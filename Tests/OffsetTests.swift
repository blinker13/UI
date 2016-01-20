
import XCTest
import UI

class OffsetTests: XCTestCase {

	func test_init() {
		let subject = Offset()
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_all() {
		let subject = Offset(top:1.0, left:2.0, bottom:3.0, right:4.0)
		XCTAssertEqual(subject.top, 1.0)
		XCTAssertEqual(subject.left, 2.0)
		XCTAssertEqual(subject.bottom, 3.0)
		XCTAssertEqual(subject.right, 4.0)
	}

	func test_init_hv() {
		let subject = Offset(horizontal:5.0, vertical:9.0)
		XCTAssertEqual(subject.top, 9.0)
		XCTAssertEqual(subject.left, 5.0)
		XCTAssertEqual(subject.bottom, 9.0)
		XCTAssertEqual(subject.right, 5.0)
	}

	func test_init_horizontal() {
		let subject = Offset(horizontal:5.0)
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 5.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 5.0)
	}

	func test_init_vertical() {
		let subject = Offset(vertical:9.0)
		XCTAssertEqual(subject.top, 9.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 9.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_top() {
		let subject = Offset(top:13.0)
		XCTAssertEqual(subject.top, 13.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_left() {
		let subject = Offset(left:13.0)
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 13.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_bottom() {
		let subject = Offset(bottom:13.0)
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 13.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_right() {
		let subject = Offset(right:13.0)
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 13.0)
	}

    func test_init_literal() {
        let subject:Offset = 13.0
        XCTAssertEqual(subject.top, 13.0)
        XCTAssertEqual(subject.left, 13.0)
        XCTAssertEqual(subject.bottom, 13.0)
        XCTAssertEqual(subject.right, 13.0)
    }

	// MARK: - ZeroType

	func test_zero() {
		let subject = Offset.zero
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Offset.zero.isZero)
		XCTAssertFalse(Offset(top:13.0).isZero)
	}

	// MARK: - CustomStringConvertible

	func test_description() {
		let subject = Offset(top:1.0, right:2.0, bottom:3.0, left:4.0)
		XCTAssertEqual(subject.description, "Offset(top:1.0, right:2.0, bottom:3.0, left:4.0)")
	}
}
