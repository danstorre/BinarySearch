import XCTest

typealias BynarySearchType = ([Int], Int) -> Int?
enum Search {
    static func binarySearch(list: [Int], item: Int) -> Int? {
        var low = 0
        var high = list.count - 1
        
        while low <= high {
            let mid = (low+high)/2
            let guess = list[mid]
            
            if guess == item {
                return mid
            }
            
            if guess > item {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        
        return nil
    }
}


final class BinarySearchTests: XCTestCase {
    func test_binarySearch_deliversIndex() {
        let samples: [(search: Int, resultIndex: Int?)] = [(search: 3, resultIndex: 1), (search: -1, resultIndex: .none)]
        let list = [1, 3, 5, 7, 9]
        samples.forEach { sample in
            let sut = makeSUT()

            let foundIndex = sut(list, sample.search)
            
            XCTAssertEqual(foundIndex, sample.resultIndex, "index should be 1 got \(String(describing: foundIndex))")
        }
    }
    
    // MARK: - helpers
    func makeSUT() -> BynarySearchType {
        Search.binarySearch(list:item:)
    }
}
