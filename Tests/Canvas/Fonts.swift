
import XCTest
@testable import Canvas

class Fonts : XCTestCase {

	func test_init() {
		let subject = Font(name: "Avenir", size: 13.0, style: .normal, weight: .regular)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, .normal)
		XCTAssertEqual(subject.weight, .regular)
	}

	func test_init_style() {
		let subject = Font(name: "Avenir", size: 13.0, style: .oblique, weight: .regular)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, .oblique)
		XCTAssertEqual(subject.weight, .regular)
	}

	func test_init_weight() {
		let subject = Font(name: "Avenir", size: 13.0, style: .normal, weight: .heavy)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, .normal)
		XCTAssertEqual(subject.weight, .heavy)
	}
}
