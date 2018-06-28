public protocol StringPattern {
    func hasMatch(in string: String) -> Bool
    func matches(in string: String) -> [StringMatch]
    func replace(in string: String, handler: (StringMatch) -> String?) -> String
}
