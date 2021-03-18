import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func setUp(with card:Card){
        image.image = UIImage(named: card.imageName)
    }
}
