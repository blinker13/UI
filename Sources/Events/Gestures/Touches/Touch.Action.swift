
public extension Touch {

	public enum Action {

		public enum Location {
			case outside
			case inside
		}

		case down(Int)
		case move(Location)
		case exit
		case enter
		case up(Location)
		case cancel
	}
}

extension Touch.Action : Equatable {

	public static func == (left:Touch.Action, right:Touch.Action) -> Bool {

		switch (left, right) {
			case (let .down(l), let .down(r)): return l == r || l == 0 || r == 0
			case (let .move(l), let .move(r)): return l == r
			case (.exit, .exit): return true
			case (.enter, .enter): return true
			case (let .up(l), let .up(r)): return l == r
			case (.cancel, .cancel): return true
			default: return false
		}
	}
}
