public struct Edge<Type>: Equatable where Type : Equatable, Type : Hashable {
    public let from: Vertex<Type>
    public let to : Vertex<Type>
    public let weight : Double?
}

public struct Vertex<Type> : Equatable where Type : Equatable, Type : Hashable {
    public var data : Type
    public let index : Int
}

public class EdgeList<Type> where Type : Equatable, Type : Hashable {
    var vertex : Vertex<Type>
    var edges : [Edge<Type>]? = nil
    
    init(vertex: Vertex<Type>) {
        self.vertex = vertex
    }
    
    func addEdge(_ edge : Edge<Type>) {
        self.edges?.append(edge)
    }
    
}

