
import XCTest
import UI

class SpaceTests : XCTestCase {

	func test_init() {
		let subject = Space()
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_all() {
		let subject = Space(top:1.0, left:2.0, bottom:3.0, right:4.0)
		XCTAssertEqual(subject.top, 1.0)
		XCTAssertEqual(subject.left, 2.0)
		XCTAssertEqual(subject.bottom, 3.0)
		XCTAssertEqual(subject.right, 4.0)
	}

	func test_init_hv() {
		let subject = Space(horizontal:5.0, vertical:9.0)
		XCTAssertEqual(subject.top, 9.0)
		XCTAssertEqual(subject.left, 5.0)
		XCTAssertEqual(subject.bottom, 9.0)
		XCTAssertEqual(subject.right, 5.0)
	}

	func test_init_horizontal() {
		let subject = Space(horizontal:5.0)
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 5.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 5.0)
	}

	func test_init_vertical() {
		let subject = Space(vertical:9.0)
		XCTAssertEqual(subject.top, 9.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 9.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_top() {
		let subject = Space(top:13.0)
		XCTAssertEqual(subject.top, 13.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_left() {
		let subject = Space(left:13.0)
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 13.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_bottom() {
		let subject = Space(bottom:13.0)
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 13.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_init_right() {
		let subject = Space(right:13.0)
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 13.0)
	}

	func test_init_literal() {
		let subject:Space = 13.0
		XCTAssertEqual(subject.top, 13.0)
		XCTAssertEqual(subject.left, 13.0)
		XCTAssertEqual(subject.bottom, 13.0)
		XCTAssertEqual(subject.right, 13.0)
	}

	func test_zero() {
		let subject = Space.zero
		XCTAssertEqual(subject.top, 0.0)
		XCTAssertEqual(subject.left, 0.0)
		XCTAssertEqual(subject.bottom, 0.0)
		XCTAssertEqual(subject.right, 0.0)
	}

	func test_isZero() {
		XCTAssertTrue(Space.zero.isZero)
		XCTAssertFalse(Space(top:13.0).isZero)
	}

	func test_description() {
		let subject = Space(top:1.0, left:4.0, bottom:3.0, right:2.0)
		XCTAssertEqual(subject.description, "top:1.0, left:4.0, bottom:3.0, right:2.0")
	}
}
