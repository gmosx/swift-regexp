import Foundation

extension RegExp {
    public struct Match {
        public let value: String
        public let range: NSRange // TODO: use Range<Int>

        public init(value: String, range: NSRange) {
            self.value = value
            self.range = range
        }
    }
}
