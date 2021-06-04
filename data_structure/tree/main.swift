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
