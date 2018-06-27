import Foundation

// TODO: Introduce Pattern super-protocol?

// https://jayeshkawli.ghost.io/regular-expressions-in-swift-ios/

public struct RegExp {
    private let nsRegExp: NSRegularExpression
    // private let options: NSRegularExpression.Options

    public init(_ pattern: String) {
        do {
            nsRegExp = try NSRegularExpression(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }

    public func matches(in string: String) -> [Match] {
        let results = nsRegExp.matches(in: string, options: [], range: NSRange(string.startIndex..., in: string))
        return results.map { result in
            return Match(value: String(string[Range(result.range, in: string)!]), range: result.range)
        }
    }

    public func replace() -> String {
        return "TODO"
    } 
}
