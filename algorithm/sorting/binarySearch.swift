func binarySearch<Type: Comparable>(_ a : [Type], key : Type, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound { return nil }
    else {
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound..<midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex+1..<range.upperBound)
        } else {
            return midIndex
        }
    }
}
