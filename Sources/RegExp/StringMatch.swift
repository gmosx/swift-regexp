import Foundation

// TODO: conside renaming `value` to `string`.

public struct StringMatch {
    public let value: String
    public let range: Range<String.Index>

    public init(value: String, range: Range<String.Index>) {
        self.value = value
        self.range = range
    }
}
