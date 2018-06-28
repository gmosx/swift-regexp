extension String {
    public func replacing(pattern: StringPattern, handler: (StringMatch) -> String?) -> String {
        return pattern.replace(in: self, handler: handler)
    }
}
