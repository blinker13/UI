
import XCTest
import UI

class ColorTests: XCTestCase {

	func test_initGray() {
		let subject = Color(white:0.471)
		XCTAssertEqualWithAccuracy(subject.red, 0.471, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.green, 0.471, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.blue, 0.471, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.alpha, 1.0, accuracy:0.0000001)
	}

	func test_initRGB() {
		let subject = Color(red:0.1, green:0.3, blue:0.5)
		XCTAssertEqualWithAccuracy(subject.red, 0.1, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.green, 0.3, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.blue, 0.5, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.alpha, 1.0, accuracy:0.0000001)
	}

	func test_black() {
		let subject = Color.black
		XCTAssertEqualWithAccuracy(subject.red, 0.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.green, 0.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.blue, 0.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.alpha, 1.0, accuracy:0.0000001)
	}

	func test_gray() {
		let subject = Color.gray
		XCTAssertEqualWithAccuracy(subject.red, 0.5, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.green, 0.5, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.blue, 0.5, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.alpha, 1.0, accuracy:0.0000001)
	}

	func test_white() {
		let subject = Color.white
		XCTAssertEqualWithAccuracy(subject.red, 1.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.green, 1.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.blue, 1.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.alpha, 1.0, accuracy:0.0000001)
	}

	func test_clear() {
		let subject = Color.clear
		XCTAssertEqualWithAccuracy(subject.red, 0.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.green, 0.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.blue, 0.0, accuracy:0.0000001)
		XCTAssertEqualWithAccuracy(subject.alpha, 0.0, accuracy:0.0000001)
	}
}
