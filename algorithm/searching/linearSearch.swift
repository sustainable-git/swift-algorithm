public func linearSearch<Type : Comparable>(_ array : [Type], _ object : Type) -> Int? {
    for (index, value) in array.enumerated() where value == object {
        return index
    }
    return nil
}
