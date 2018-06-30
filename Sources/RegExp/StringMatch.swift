import Foundation

public struct StringMatch {
    public let string: String
    public let range: Range<String.Index>

    public init(value: String, range: Range<String.Index>) {
        self.string = value
        self.range = range
    }
}
