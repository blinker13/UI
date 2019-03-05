
public protocol Element {}

// MARK: -

public typealias Fragment = [Element]

extension Array : UI.Element where Element == UI.Element {}
