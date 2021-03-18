import Foundation
struct Card {
    let frontName: String
    var isShown = false
    let backName = "back"
    var imageName:String{
        return isShown ? frontName : backName
    }
    static func getRandomCards() ->[Card]{
        let randomCards = cards.shuffled().prefix(6)
        return (randomCards + randomCards).shuffled()
    }
    func equals( _ card:Card) -> Bool{
        return (card.frontName == frontName)
    }
    mutating func toggleShow(){
        isShown.toggle()
    }
}
var cards = [
    Card(frontName: "chaman", isShown: false),
    Card(frontName: "demoniste", isShown: false),
    Card(frontName: "chasseur", isShown: false),
    Card(frontName: "deathKnight", isShown: false),
    Card(frontName: "demonhunter", isShown: false),
    Card(frontName: "druide", isShown: false),
    Card(frontName: "guerrier", isShown: false),
    Card(frontName: "mage", isShown: false),
    Card(frontName: "moine", isShown: false),
    Card(frontName: "paladin", isShown: false),
    Card(frontName: "pretre", isShown: false),
    Card(frontName: "thief", isShown: false),
]
