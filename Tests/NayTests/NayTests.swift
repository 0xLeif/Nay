import XCTest
@testable import Nay

final class NayTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(!false, true)
        XCTAssertEqual(nay(false), true)
        XCTAssertEqual(false.nay, true)
        XCTAssertEqual(!(!false), false)
        XCTAssertEqual(nay(false).nay, false)
    }
    
    func testIsEmpty() {
        let emptyArray: [Int] = []
        
        XCTAssertEqual(emptyArray.isEmpty, true)
        XCTAssertEqual(!emptyArray.isEmpty, false)
        
        XCTAssertEqual(nay(emptyArray.isEmpty), false)
        XCTAssertEqual(emptyArray.isEmpty.nay, false)
        
        let populatedArray: [Int] = .init(
            repeating: .random(in: 0 ..< 100),
            count: .random(in: 1 ... 10)
        )
        
        XCTAssertEqual(populatedArray.isEmpty, false)
        XCTAssertEqual(!populatedArray.isEmpty, true)
        
        XCTAssertEqual(nay(populatedArray.isEmpty), true)
        XCTAssertEqual(populatedArray.isEmpty.nay, true)
    }
    
    func testIsPopulated() {
        let emptyArray: [Int] = []
        
        XCTAssertEqual(emptyArray.isPopulated, false)
        XCTAssertEqual(!emptyArray.isPopulated, true)
        
        XCTAssertEqual(nay(emptyArray.isPopulated), true)
        XCTAssertEqual(emptyArray.isPopulated.nay, true)
        
        let populatedArray: [Int] = .init(
            repeating: .random(in: 0 ..< 100),
            count: .random(in: 1 ... 10)
        )
        
        XCTAssertEqual(populatedArray.isPopulated, true)
        XCTAssertEqual(!populatedArray.isPopulated, false)
        
        XCTAssertEqual(nay(populatedArray.isPopulated), false)
        XCTAssertEqual(populatedArray.isPopulated.nay, false)
    }
    
    func testStaticBool() {
        XCTAssertEqual(false, .no)
        XCTAssertEqual(false, .bogus)
        XCTAssertEqual(true, .yes)
        XCTAssertEqual(true, .accurate)
    }
    
    func testAndOr() {
        let populatedArray: [Int] = .init(
            repeating: .random(in: 0 ..< 100),
            count: 11
        )
        
        // (count < 10 || count == 11) && count != 9
        XCTAssertEqual(
            populatedArray.count
                .is { $0 < 10 }
                .or(populatedArray.count.is { $0 == 11 })
                .and(populatedArray.count.isNotEqual(to: 9)),
            .yes
        )
    }
    
    func testReadme() {
        // Bool+Nay
        XCTAssertEqual(true, .yes)
        XCTAssertEqual(true, .accurate)
        XCTAssertEqual(false, .no)
        XCTAssertEqual(false, .bogus)
        
        XCTAssertEqual(nay(true), false)
        XCTAssertEqual(nay(false), true)
        
        XCTAssertEqual(true.nay, false)
        
        XCTAssertEqual(true.and(true), true && true)
        XCTAssertEqual(true.or(false), true || false)
        XCTAssertEqual(
            true.or(false).and(true),
            (true || false) && true
        )
        
        // Array+Nay
        XCTAssertEqual([].isEmpty, true)
        XCTAssertEqual([].isEmpty.nay, false)
        XCTAssertEqual([].isPopulated, false)
        XCTAssertEqual([].isPopulated.nay, true)
        
        // Equatable+Nay
        XCTAssertEqual(
            5.is { $0 > .pi },
            5 > .pi
        )
        
        XCTAssertEqual(
            5.isEqual(to: 4),
            5 == 4
        )
        
        XCTAssertEqual(
            5.isNotEqual(to: 4),
            5 != 4
        )
    }
}
