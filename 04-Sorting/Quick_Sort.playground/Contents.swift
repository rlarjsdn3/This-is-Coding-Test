import Foundation

var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]
let n = array.count

func quickSort(_ array: inout [Int], _ start: Int, _ end: Int) {
    if start >= end { // 원소가 1개인 경우 종료
        return
    }
    let pivot = start // 피벗은 첫 번째 원소
    var left = start + 1
    var right = end
    
    while left <= right {
        // 피벗보다 큰 데이터를 찾을 때까지 반복
        while left <= end && array[left] <= array[pivot] {
            left += 1
        }
        // 피벗보다 작은 데이터를 찾을 때까지 반복
        while right > start && array[right] >= array[pivot] {
            right -= 1
        }
        if left < right { // 엇갈리지 않았다면 작은 데이터와 큰 데이터 교체
            array.swapAt(left, right)
        }
    }
    
    // 엇갈렸다면 작은 데이터와 피벗 교체
    array.swapAt(right, pivot)

    // 분할 이후 왼쪽 부분과 오른쪽 부분에서 각각 정렬 수행
    quickSort(&array, start, right - 1)
    quickSort(&array, right + 1, end)
}

quickSort(&array, 0, n-1)
print(array)
