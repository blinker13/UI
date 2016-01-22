
import XCTest
import UI

class UnitTests: XCTestCase {

	static let accuracy = Unit(0.0000001)

	// MARK: -

	func test_clamp() {
		XCTAssertEqualWithAccuracy(Unit(13.051).clamp(), 1.0, accuracy:UnitTests.accuracy)
		XCTAssertEqualWithAccuracy(Unit(-3.999).clamp(), 0.0, accuracy:UnitTests.accuracy)
	}

	func test_clampWithMin() {
		XCTAssertEqualWithAccuracy(Unit(-3.999).clamp(min:3.5), 3.5, accuracy:UnitTests.accuracy)
	}

	func test_clampWithMax() {
		XCTAssertEqualWithAccuracy(Unit(99.99).clamp(max:13.13), 13.13, accuracy:UnitTests.accuracy)
	}

	func test_clampWithEqual() {
		XCTAssertEqualWithAccuracy(Unit(1.0).clamp(), 1.0, accuracy:UnitTests.accuracy)
	}
}
