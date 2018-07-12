import Foundation

// TODO: Add firstMatch()
// TODO: Add escape()

public struct RegExp: StringPattern {
    private let nsRegExp: NSRegularExpression

    public init(_ pattern: String, options: NSRegularExpression.Options = []) {
        do {
            nsRegExp = try NSRegularExpression(pattern: pattern, options: options)
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
            // TODO: optimize here!
            var ranges: [Range<String.Index>] = []

            for i in 0..<result.numberOfRanges {
                ranges.append(Range(result.range(at: i), in: string)!)
            }
            
            let match = StringMatch(value: String(string[ranges[0]]), ranges: ranges)
            return match
        }
    }

    public func stringByReplacingMatches(in string: String, with replacementTemplate: String) -> String {
        return nsRegExp.stringByReplacingMatches(in: string, options: [], range: NSRange(string.startIndex..., in: string), withTemplate: replacementTemplate)
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
