public func quickSort<Type : Comparable>(_ arr : [Type]) -> [Type] {
    guard arr.count > 1 else { return arr }
    
    let pivot = arr[arr.count/2]
    let less = arr.filter{ $0 < pivot }
    let equal = arr.filter{ $0 == pivot }
    let greater = arr.filter{ $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}
