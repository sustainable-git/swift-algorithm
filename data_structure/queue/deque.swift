public struct Deque<Type> {
    private var array = [Type]()
    
    public var isEmpty : Bool { return array.isEmpty }
    public var count : Int { return array.count }
    public mutating func enqueue(_ element : Type) { array.append(element) }
    public mutating func enqueueFront(_ element : Type) { array.insert(element, at: 0) }
    
    public mutating func dequeue() -> Type? {
        if isEmpty { return nil }
        else { return array.removeFirst()}
    }
    
    public mutating func dequeueBack() -> Type? {
        return array.popLast()
    }
    
    public func peekFront() -> Type? { return array.first }
    
    public func peekLast() -> Type? { return array.last }
}
