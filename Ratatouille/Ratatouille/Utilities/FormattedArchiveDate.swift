import Foundation

struct FormattedArchiveDate{
    static func formattedArchiveDate(for date: Date?) -> String {
        guard let date = date else {
            return "Not archived"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy 'at' h:mm:ssa"
        return "Arkivert: \(formatter.string(from: date))"
    }
}
