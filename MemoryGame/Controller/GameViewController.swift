import UIKit

class GameViewController: UIViewController {
    var game = Game()
    @IBOutlet weak var scoreLabel: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var newGameLabel: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(alertEndGame), name: NSNotification.Name(rawValue: "endGame"), object: nil)
    }
    
    @IBAction func newGame(_ sender: Any) {
        alertNewGame()
    }
    
    func restart(){
        game.start()
        setHeader()
        collectionView.reloadData()
    }
    
    @objc func alertNewGame(){
        let alert = UIAlertController(title: "Si vous recommencez la partie, vous risquez de perdre votre progression", message: "Recommencer ?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "oui", style: .default, handler: { action in self.restart()}))
        alert.addAction(UIAlertAction(title: "non", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    @objc func alertEndGame(){
        let alert = UIAlertController(title: "Fin de la partie \n Vous avez win", message: "Rejouer ?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "oui", style: .default, handler: { action in self.restart()}))
        alert.addAction(UIAlertAction(title: "non", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
    
    func setHeader(){
        scoreLabel.title = "Score: \(game.score.score)"
        if(game.score.score != 0){
            newGameLabel.isEnabled = true
        }
        else{
            newGameLabel.isEnabled = false
        }
    }
}
extension GameViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.gameCards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCollectionViewCell
            else {
            return UICollectionViewCell()
        }
        cell.setUp(with: game.gameCards[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        game.tapCard(index: indexPath.item)
        
        collectionView.reloadData()
        setHeader()
    }
}

extension GameViewController:UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 3) - 8
        let height = width * (250 / 200)
        return CGSize(width: width, height: height)
    }
}

let imagesNames = [
    "chaman",
    "paladin",
    "druide",
    "pretre",
    "thief",
    "mage",
    "demonhunter",
    "deathKnight",
    "chasseur",
    "demoniste",
    "moine",
    "guerrier"
]
