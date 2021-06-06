public func mergeSort(_ array : [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

private func merge(_ leftPile : [Int], _ rightPile : [Int]) -> [Int] {
    var leftindex = 0
    var rightindex = 0
    
    var orderedPile = [Int]()
    orderedPile.reserveCapacity(leftPile.count + rightPile.count) // to minimize memory space
    
    while leftindex < leftPile.count && rightindex < rightPile.count { // until one of them runs out
        if leftPile[leftindex] < rightPile[rightindex] {
            orderedPile.append(leftPile[leftindex])
            leftindex += 1
        } else if leftPile[leftindex] > rightPile[rightindex] {
            orderedPile.append(rightPile[rightindex])
            rightindex += 1
        } else { // if same
            orderedPile.append(leftPile[leftindex])
            leftindex += 1
            orderedPile.append(rightPile[rightindex])
            rightindex += 1
        }
    }
    
    // append the rest
    while leftindex < leftPile.count {
        orderedPile.append(leftPile[leftindex])
        leftindex += 1
    }
    while rightindex < rightPile.count {
        orderedPile.append(rightPile[rightindex])
        rightindex += 1
    }
    
    return orderedPile
}
