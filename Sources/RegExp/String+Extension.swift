extension String {
    public func isMatching(pattern: StringPattern) -> Bool {
        return pattern.hasMatch(in: self)
    }

    public func replacing(pattern: StringPattern, handler: (StringMatch) -> String?) -> String {
        return pattern.replace(in: self, handler: handler)
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
