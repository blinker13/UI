
#if (arch(arm64) || arch(x86_64))
	public typealias Unit = Double
#else
	public typealias Unit = Float
#endif

extension Unit {

	public var percent:Unit {
		return clamp()
	}

	public func clamp(min:Unit = 0, max:Unit = 1) -> Unit {
		if self < min { return min }
		if self > max { return max }
		return self
	}
}
