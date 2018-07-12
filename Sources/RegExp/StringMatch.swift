import Foundation

// TODO: make it more lightweight by not keeping the value?

public struct StringMatch {
    public let value: String
    public let ranges: [Range<String.Index>]

    public init(value: String, ranges: [Range<String.Index>]) {
        self.value = value
        self.ranges = ranges
    }
    
    public var range: Range<String.Index> {
        return ranges[0]
    }
}
