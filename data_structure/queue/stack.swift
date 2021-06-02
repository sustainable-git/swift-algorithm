public struct Stack<Type> {
    fileprivate var array = [Type]()

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count
    }

    public mutating func push(_ element: Type) {
        array.append(element)
    }

    public mutating func pop() -> Type? {
        return array.popLast()
    }

    public var top: Type? {
        return array.last
    }
}

