public protocol StringPattern {
    func hasMatch(in string: String) -> Bool
    func matches(in string: String) -> [StringMatch]
    func stringByReplacingMatches(in string: String, with replacementTemplate: String) -> String
    func stringByReplacingMatches(in string: String, replacementHandler: (StringMatch) -> String?) -> String
}
