public extension Bool {
    var nay: Self {
        Nay.nay(self)
    }
    
    func and(_ bool: Self) -> Self {
        self && bool
    }
    
    func or(_ bool: Self) -> Self {
        self || bool
    }
}
