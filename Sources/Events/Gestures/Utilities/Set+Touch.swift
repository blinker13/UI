
internal extension Set where Element == Touch {

	subscript (digit:Touch.Digit) -> Touch? {
		return first { $0.hashValue == digit.hashValue }
	}
}
