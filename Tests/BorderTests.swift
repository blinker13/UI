
import XCTest
import UI

class BorderTests: XCTestCase {

	func test_init() {
		let subject = Border()
		XCTAssertEqual(subject.color, Color.black)
		XCTAssertEqual(subject.radius, 0.0)
		XCTAssertEqual(subject.width, 0.0)
	}

	func test_init_color() {
		let subject = Border(color:Color.gray)
		XCTAssertEqual(subject.color, Color.gray)
		XCTAssertEqual(subject.radius, 0.0)
		XCTAssertEqual(subject.width, 0.0)
	}

	func test_init_radius() {
		let subject = Border(radius:13.0)
		XCTAssertEqual(subject.color, Color.black)
		XCTAssertEqual(subject.radius, 13.0)
		XCTAssertEqual(subject.width, 0.0)
	}

	func test_init_width() {
		let subject = Border(width:2.0)
		XCTAssertEqual(subject.color, Color.black)
		XCTAssertEqual(subject.radius, 0.0)
		XCTAssertEqual(subject.width, 2.0)
	}
}
