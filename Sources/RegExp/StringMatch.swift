import Foundation

public struct StringMatch {
    public let index: Int
    public let value: String
    public let range: Range<String.Index>

    public init(index: Int, value: String, range: Range<String.Index>) {
        self.index = index
        self.value = value
        self.range = range
    }
}
