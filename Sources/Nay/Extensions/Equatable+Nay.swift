public extension Equatable {
    func `is`(_ predicate: (Self) -> Bool) -> Bool {
        predicate(self)
    }
    
    func isEqual(to: Self) -> Bool {
        self == to
    }
    
    func isNotEqual(to: Self) -> Bool {
        self != to
    }
}
