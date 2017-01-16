
import XCTest
import UI

class FloatTests : XCTestCase {

	static let accuracy = Float(0.0000001)

	func test_clamped() {
		XCTAssertEqualWithAccuracy(Float(13.051).clamped(), 1.0, accuracy:FloatTests.accuracy)
		XCTAssertEqualWithAccuracy(Float(-3.999).clamped(), 0.0, accuracy:FloatTests.accuracy)
	}

	func test_clampedWithMin() {
		XCTAssertEqualWithAccuracy(Float(-3.999).clamped(min:3.5), 3.5, accuracy:FloatTests.accuracy)
	}

	func test_clampedWithMax() {
		XCTAssertEqualWithAccuracy(Float(99.99).clamped(max:13.13), 13.13, accuracy:FloatTests.accuracy)
	}

	func test_clampedWithEqual() {
		XCTAssertEqualWithAccuracy(Float(1.0).clamped(), 1.0, accuracy:FloatTests.accuracy)
	}

//	func test_percent() {
//		XCTAssertEqual((-0.3).percent, 0.0)
//		XCTAssertEqual(0.3.percent, 0.3)
//		XCTAssertEqual(1.3.percent, 1.0)
//	}
}
