import Foundation

enum Element: String, CaseIterable {
    case fire, water, leaf
    
    func weakness() -> Element {
        switch self {
        case .fire:
            return .water
        case .water:
            return .leaf
        case .leaf:
            return .fire
        }
    }

    func logo() -> ElementLogo {
        switch self {
        case .fire:
            return ElementLogo(imageName: "flame.circle", color: .red)
        case .water:
            return ElementLogo(imageName: "drop.circle", color: .blue)
        case .leaf:
            return ElementLogo(imageName: "leaf.circle", color: .green)
        }
    }
}
