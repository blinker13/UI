
import XCTest
import UI

class ShadowTests: XCTestCase {

	func test_init() {
		let subject = Shadow()
		XCTAssertEqual(subject.opacity, 0.0)
		XCTAssertEqual(subject.color, Shadow.color)
		XCTAssertEqual(subject.offset, Offset.zero)
		XCTAssertEqual(subject.radius, 3.0)
	}

	func test_init_color() {
		let subject = Shadow(color:Color.gray)
		XCTAssertEqual(subject.opacity, 0.0)
		XCTAssertEqual(subject.color, Color.gray)
		XCTAssertEqual(subject.offset, Offset.zero)
		XCTAssertEqual(subject.radius, 3.0)
	}

	func test_init_offset() {
		let subject = Shadow(offset:13.0)
		XCTAssertEqual(subject.opacity, 0.0)
		XCTAssertEqual(subject.color, Shadow.color)
		XCTAssertEqual(subject.offset, 13.0)
		XCTAssertEqual(subject.radius, 3.0)
	}

	func test_init_opacity() {
		let subject = Shadow(opacity:0.6)
		XCTAssertEqual(subject.opacity, 0.6)
		XCTAssertEqual(subject.color, Shadow.color)
		XCTAssertEqual(subject.offset, Offset.zero)
		XCTAssertEqual(subject.radius, 3.0)
	}

	func test_init_radius() {
		let subject = Shadow(radius:7.0)
		XCTAssertEqual(subject.opacity, 0.0)
		XCTAssertEqual(subject.color, Shadow.color)
		XCTAssertEqual(subject.offset, Offset.zero)
		XCTAssertEqual(subject.radius, 7.0)
	}
}