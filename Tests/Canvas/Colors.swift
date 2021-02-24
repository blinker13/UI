
import XCTest
import Canvas
import Geometry

class Colors : XCTestCase {

	func test_initGray() {
		let subject = Color(white: 0.471)
		XCTAssert(subject.components == .monochrome(0.471))
		XCTAssert(subject.opacity == 1.0)
	}

	func test_initRGB() {
		let subject = Color(red: 0.1, green: 0.3, blue: 0.5)
		XCTAssert(subject.components == .rgb(0.1, 0.3, 0.5))
		XCTAssert(subject.opacity == 1.0)
	}

	func test_black() {
		let subject: Color = .black
		XCTAssert(subject.components == .monochrome(0.0))
		XCTAssert(subject.opacity == 1.0)
	}

	func test_gray() {
		let subject: Color = .gray
		XCTAssert(subject.components == .monochrome(0.5))
		XCTAssert(subject.opacity == 1.0)
	}

	func test_white() {
		let subject: Color = .white
		XCTAssert(subject.components == .monochrome(1.0))
		XCTAssert(subject.opacity == 1.0)
	}

	func test_clear() {
		let subject: Color = .clear
		XCTAssert(subject.components == .none)
		XCTAssert(subject.opacity == .zero)
	}

	func test_shadow() {
		let subject: Color = .shadow
		XCTAssert(subject.components == .monochrome(0.0))
		XCTAssert(subject.opacity == 0.33)
	}
}
