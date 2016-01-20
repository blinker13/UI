
public struct Shadow {

    public var alpha:Points
    public var color:Color
    public var space:Space
    public var radius:Points

    // MARK: -

    public init(alpha:Points = 0.0, color:Color = .shadow, space:Space = .zero, radius:Points = 3.0) {
        (self.alpha, self.color, self.space, self.radius) = (alpha, color, space, radius)
    }
}

extension Color {
    public static let shadow = Color(white:0.0, alpha:0.6)
}
