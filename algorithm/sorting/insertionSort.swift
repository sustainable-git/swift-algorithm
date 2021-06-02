func insertionsort(_ array : [Int]) -> [Int] {
    var sortedArray = array
    for index in 1..<sortedArray.count {
        var currentIndex = index
        let temp = sortedArray[currentIndex] // not using swaps, faster performance
        while currentIndex > 0 && sortedArray[currentIndex - 1] < temp {
            sortedArray[currentIndex] = sortedArray[currentIndex - 1]
            currentIndex -= 1
        }
        sortedArray[currentIndex] = temp
    }
    return sortedArray
}

//swap version

//func insertionSort(_ array: [Int]) -> [Int] {
//    var sortedArray = array
//    for index in 1..<sortedArray.count {
//        var currentIndex = index
//        while currentIndex > 0 && sortedArray[currentIndex - 1] < sortedArray[currentIndex] {
//            sortedArray.swapAt(currentIndex - 1, currentIndex)
//            currentIndex -= 1
//        }
//    }
//    return sortedArray
//}
