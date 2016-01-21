
import XCTest
import UI

class PointsTests: XCTestCase {

	static let accuracy = Points(0.0000001)

	// MARK: -

	func test_clamp() {
		XCTAssertEqualWithAccuracy(Points(13.051).clamp(), 1.0, accuracy:PointsTests.accuracy)
		XCTAssertEqualWithAccuracy(Points(-3.999).clamp(), 0.0, accuracy:PointsTests.accuracy)
	}

	func test_clampWithMin() {
		XCTAssertEqualWithAccuracy(Points(-3.999).clamp(min:3.5), 3.5, accuracy:PointsTests.accuracy)
	}

	func test_clampWithMax() {
		XCTAssertEqualWithAccuracy(Points(99.99).clamp(max:13.13), 13.13, accuracy:PointsTests.accuracy)
	}

	func test_clampWithEqual() {
		XCTAssertEqualWithAccuracy(Points(1.0).clamp(), 1.0, accuracy:PointsTests.accuracy)
	}
}
