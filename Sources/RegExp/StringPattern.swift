public protocol StringPattern {
    func hasMatch(in string: String) -> Bool
    func matches(in string: String) -> [StringMatch]
    func stringByReplacingMatches(in string: String, with replacementString: String) -> String
    func stringByReplacingMatches(in string: String, replacementHandler: (StringMatch) -> String?) -> String
}
