import Foundation

// TODO: Try to make similar to DatePattern
// TODO: Add replace with string
// TODO: Add firstMatch
// TODO: add escape()

public struct RegExp: StringPattern {    
    private let nsRegExp: NSRegularExpression
    // private let options: NSRegularExpression.Options

    public init(_ pattern: String) {
        do {
            nsRegExp = try NSRegularExpression(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }

    public func hasMatch(in string: String) -> Bool {
        return nsRegExp.numberOfMatches(in: string, options: [], range: NSRange(string.startIndex..., in: string)) > 0
    }

    public func matches(in string: String) -> [StringMatch] {
        let results = nsRegExp.matches(in: string, options: [], range: NSRange(string.startIndex..., in: string))
        return results.map { result in
            let range = Range(result.range, in: string)!
            return StringMatch(value: String(string[range]), range: range)
        }
    }

    public func stringByReplacingMatches(in string: String, with replacementString: String) -> String {
        return nsRegExp.stringByReplacingMatches(in: string, options: [], range: NSRange(string.startIndex..., in: string), withTemplate: replacementString)
    }

    public func stringByReplacingMatches(in string: String, replacementHandler: (StringMatch) -> String?) -> String {
        var string = string
        
        matches(in: string).reversed().forEach { match in
            if let replacement = replacementHandler(match) {
                string = string.replacingCharacters(in: match.range, with: replacement)
            }
        }
        
        return string
    } 
}
