import Foundation

var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]
let n = array.count

for i in 1..<n {
    for j in stride(from: i, to: 0, by: -1) {
        if array[j] < array[j-1] {
            array.swapAt(j-1, j)
        } else {
            break
        }
    }
}
print(array)
