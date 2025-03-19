import Foundation

var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]
let n = array.count

for i in 0..<n-1 {
    var minIndex = i // 가장 작은 원소의 인덱스
    for j in i+1..<n {
        if array[minIndex] > array[j] {
            minIndex = j
        }
    }
    array.swapAt(i, minIndex) // 스와프
}
print(array)
