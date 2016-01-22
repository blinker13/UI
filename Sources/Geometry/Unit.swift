
#if (arch(arm64) || arch(x86_64))
	public typealias Unit = Double
#else
	public typealias Unit = Float
#endif

extension Unit {
	public func clamp(min min:Unit = 0.0, max:Unit = 1.0) -> Unit {
		if self < min { return min }
		if self > max { return max }
		return self
	}
}
