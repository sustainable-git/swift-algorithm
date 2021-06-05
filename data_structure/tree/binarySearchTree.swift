public class BinarySearchTree<Type : Comparable> {
    private(set) public var value : Type
    private(set) public var parent : BinarySearchTree?
    private(set) public var left : BinarySearchTree?
    private(set) public var right : BinarySearchTree?
    
    public init(value : Type) {
        self.value = value
    }
    
    public var isRoot: Bool { return parent == nil }
    public var isLeaf : Bool { return left == nil && right == nil }
    public var isLeftChild : Bool { return parent?.left === self }
    public var isRightChild : Bool { return parent?.right === self }
    public var hasLeftChild : Bool { return self.left != nil }
    public var hasRightChild : Bool { return self.right != nil }
    public var hasAnyChild : Bool { return hasLeftChild || hasRightChild }
    public var hasBothChild : Bool { return hasLeftChild && hasRightChild }
    
    public var count : Int {
        return (left?.count ?? 0) + (right?.count ?? 0) + 1
    }
    
    public func insert(value: Type) -> Void {
        if value < self.value {
            if let left = left { // if left child exists
                left.insert(value: value)
            } else { // if left child doesn't exist
                self.left = BinarySearchTree(value: value)
                self.left!.parent = self
            }
        } else {
            if let right = right { // if right child exists
                right.insert(value: value)
            } else { // if right child doesn't exist
                self.right = BinarySearchTree(value: value)
                self.right!.parent = self
            }
        }
    }
    
    public convenience init(array : [Type]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for i in array.dropFirst() {
            insert(value: i)
        }
    }
    
    public func search(value : Type) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return self
        }
    }
    
    public func traverseInOrder(process: (Type) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
      }
    
    private func map(formula : (Type) -> Type) -> [Type] {
        var a = [Type]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
    
    public func toArray() -> [Type] {
        return map{$0}
    }
    
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func depth() -> Int { // distance between self and root
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
}

extension BinarySearchTree : CustomStringConvertible {
  public var description: String {
    var s = ""
    if let left = left { // left exists
      s += "(\(left.description)) <- "
    }
    s += "\(value)"
    if let right = right { // right exists
      s += " -> (\(right.description))"
    }
    return s
  }
}
