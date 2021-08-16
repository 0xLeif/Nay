# Nay

*Nay not !*

## Usage

```swift
import Nay
```

## Example Code

```swift
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
```
