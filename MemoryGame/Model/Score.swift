import Foundation

struct Score {
    var score: Int
    var date = Date()
    var formatedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"FR-fr")
        dateFormatter.dateFormat = "E d MMM Y"
        return dateFormatter.string(from: date).capitalized
    }

    init(score:Int) {
        self.score = score
    }
}
