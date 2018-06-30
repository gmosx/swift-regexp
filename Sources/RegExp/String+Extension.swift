extension String {
    public func isMatching(pattern: StringPattern) -> Bool {
        return pattern.hasMatch(in: self)
    }

    public func replacingMatches(of pattern: StringPattern, with replaceString: String) -> String {
        return pattern.stringByReplacingMatches(in: self, with: replaceString)
    }

    public func replacingMatches(of pattern: StringPattern, handler: (StringMatch) -> String?) -> String {
        return pattern.stringByReplacingMatches(in: self, replacementHandler: handler)
    }
}

infix operator =~

public func =~(string: String, pattern: StringPattern) -> Bool {
    return string.isMatching(pattern: pattern)
}

infix operator !~

public func !~(string: String, pattern: StringPattern) -> Bool {
    return !string.isMatching(pattern: pattern)
}
