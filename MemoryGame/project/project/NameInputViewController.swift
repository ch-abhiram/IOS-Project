import UIKit

class NameInputViewController: UIViewController {

    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startGameTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "startGameSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGameSegue", let destinationVC = segue.destination as? ViewController {
            
            destinationVC.player1Name = player1TextField.text?.isEmpty == false ? player1TextField.text! : "Player 1"
            destinationVC.player2Name = player2TextField.text?.isEmpty == false ? player2TextField.text! : "Player 2"
        }
    }
}
