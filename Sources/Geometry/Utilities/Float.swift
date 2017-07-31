
public extension Float {

	func clamped(min:Float = 0, max:Float = 1) -> Float {
		if self < min { return min }
		if self > max { return max }
		return self
	}
}
