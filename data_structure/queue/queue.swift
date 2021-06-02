public struct queue<Type> {
    fileprivate var array = [Type]()
    
    public var isEmpty : Bool {
        return array.isEmpty
    }
    
    public var count : Int {
        return array.count
    }
    
    public var front : Type? {
        return array.first
    }
    
    public mutating func enqueue(_ element : Type) -> Void {
        array.append(element)
    }
    
    public mutating func dequeue() -> Type? {
        if isEmpty == true {
            return nil
        }
        return array.removeFirst()
    }
}
