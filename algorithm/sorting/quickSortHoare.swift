private func partitionHore<Type : Comparable>(_ arr : inout [Type], low : Int, high : Int) -> Int {
    let pivot = arr[low]
    var i = low - 1 // to make pivot move at first
    var j = high + 1
    
    while true { // to find next condition { arr[j] <= pivot <= arr[i] } and swap those
        repeat { j -= 1 } while arr[j] > pivot
        repeat { i += 1 } while arr[i] < pivot
        
        if i < j {
            arr.swapAt(i, j)
        } else {
            return j    // j : position to split(partitioning)
                        // lessess | arr[j] =| equals, greaters
        }
    }
}

public func quicksortHoare<Type : Comparable>(_ arr : inout [Type], low : Int, high : Int) {
    if low < high { // condition to stop
        let p = partitionHore(&arr, low: low, high: high)
        quicksortHoare(&arr, low: low, high: p)
        quicksortHoare(&arr, low: p+1, high: high)
    }
}
