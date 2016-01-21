
import XCTest
import UI

class GlyphTests: XCTestCase {

	private let font = Font(name:"Avenir", size:13.0)

	// MARK: -

	func test_init() {
		let subject = Glyph(character:"B", font:font)
		XCTAssertEqual(subject.character, "B")
		XCTAssertEqual(subject.color, Color.black)
		XCTAssertEqual(subject.font, font)
	}

	func test_init_color() {
		let subject = Glyph(character:"B", color:Color.gray, font:font)
		XCTAssertEqual(subject.character, "B")
		XCTAssertEqual(subject.color, Color.gray)
		XCTAssertEqual(subject.font, font)
	}
}
