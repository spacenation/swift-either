import Foundation

public extension Either {
    func map<NewRight>(_ transform: (Right) -> NewRight) -> Either<Left, NewRight> {
        switch self {
        case .left(let left):
            return .left(left)
        case .right(let right):
            return .right(transform(right))
        }
    }
    
    func mapRight<NewRight>(_ transform: (Right) -> NewRight) -> Either<Left, NewRight> {
        self.map(transform)
    }
    
    
    func mapLeft<NewLeft>(_ transform: (Left) -> NewLeft) -> Either<NewLeft, Right> {
        switch self {
        case .left(let left):
            return .left(transform(left))
        case .right(let right):
            return .right(right)
        }
    }
    
    func mapLeftRight<NewLeft, NewRight>(_ transformLeft: (Left) -> NewLeft, _ transformRight: (Right) -> NewRight) -> Either<NewLeft, NewRight> {
        switch self {
        case .left(let left):
            return .left(transformLeft(left))
        case .right(let right):
            return .right(transformRight(right))
        }
    }
}
