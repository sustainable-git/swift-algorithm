public class TreeNode<Type> {
    public var value : Type
    
    public weak var parent : TreeNode?
    public var children = [TreeNode]()
    
    public init(value : Type) {
        self.value = value
    }
    
    public func addChild(_ child : TreeNode) {
        children.append(child)
        child.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
  public var description: String {
    var s = "\(value)"
    if !children.isEmpty {
      s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
    }
    return s
  }
}

extension TreeNode where Type: Equatable {
  func search(_ value: Type) -> TreeNode? {
    if value == self.value {
      return self
    }
    for child in children {
      if let found = child.search(value) {
        return found
      }
    }
    return nil
  }
}
