public protocol StringPattern {
    func matches(in string: String) -> [StringMatch]
    func replace(in string: String, handler: (StringMatch) -> String?) -> String
}
