
#if (arch(arm64) || arch(x86_64))
	public typealias Points = Double
#else
	public typealias Points = Float
#endif

extension Points {
	public func clamp(min min:Points = 0.0, max:Points = 1.0) -> Points {
		if self < min { return min }
		if self > max { return max }
		return self
	}
}
