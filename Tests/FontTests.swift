
import XCTest
import UI

class FontTests: XCTestCase {

	func test_init() {
		let subject = Font(name:"Avenir", size:13.0)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, Font.Style.Normal)
		XCTAssertEqual(subject.weight, Font.Weight.Regular)
	}

	func test_init_style() {
		let subject = Font(name:"Avenir", size:13.0, style:.Oblique)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, Font.Style.Oblique)
		XCTAssertEqual(subject.weight, Font.Weight.Regular)
	}

	func test_init_weight() {
		let subject = Font(name:"Avenir", size:13.0, weight:.Heavy)
		XCTAssertEqual(subject.name, "Avenir")
		XCTAssertEqual(subject.size, 13.0)
		XCTAssertEqual(subject.style, Font.Style.Normal)
		XCTAssertEqual(subject.weight, Font.Weight.Heavy)
	}

	func test_init_all() {
		let subject = Font(name:"Helvetica", size:9.0, style:.Italic, weight:.UltraLight)
		XCTAssertEqual(subject.name, "Helvetica")
		XCTAssertEqual(subject.size, 9.0)
		XCTAssertEqual(subject.style, Font.Style.Italic)
		XCTAssertEqual(subject.weight, Font.Weight.UltraLight)
	}

	// MARK: - CustomStringConvertible

	func test_description() {
		let subject = Font(name:"Avenir", size:13.0)
		XCTAssertEqual(subject.description, "Font(\"Avenir-Normal-Regular\" 13.0)")
	}

	// MARK: - Hashable

	func test_hashValue() {
		let subject = Font(name:"Avenir", size:13.0)
		XCTAssertEqual(subject.hashValue, "Font(\"Avenir-Normal-Regular\" 13.0)".hashValue)
	}
}
