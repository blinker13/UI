
internal extension Scene {
	subscript (digit:Touch.Digit) -> Node? {
		return responders[digit] ?? root.test(digit.location)
	}
}
