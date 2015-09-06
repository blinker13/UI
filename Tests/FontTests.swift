
import XCTest
import UI

class FontTests: XCTestCase {

	func test_init() {
		let subject = Font(name:"Avenir", size:13.0)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, Font.Style.normal)
		XCTAssertEqual(subject.weight, Font.Weight.regular)
	}

	func test_init_style() {
		let subject = Font(name:"Avenir", size:13.0, style:.oblique)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, Font.Style.oblique)
		XCTAssertEqual(subject.weight, Font.Weight.regular)
	}

	func test_init_weight() {
		let subject = Font(name:"Avenir", size:13.0, weight:.heavy)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, Font.Style.normal)
		XCTAssertEqual(subject.weight, Font.Weight.heavy)
	}

	func test_init_all() {
		let subject = Font(name:"Helvetica", size:9.0, style:.italic, weight:.ultraLight)
		XCTAssertEqual(subject.name, "Helvetica")
		XCTAssertEqual(subject.size, 9.0)
		XCTAssertEqual(subject.style, Font.Style.italic)
		XCTAssertEqual(subject.weight, Font.Weight.ultraLight)
	}

	func test_description() {
		let subject = Font(name:"Avenir", size:13.0)
		XCTAssertEqual(subject.description, "Avenir regular normal - 13.0")
	}

	func test_hashValue() {
		let subject = Font(name:"Avenir", size:13.0)
		XCTAssertEqual(subject.hashValue, "Avenir regular normal - 13.0".hashValue)
	}
}
