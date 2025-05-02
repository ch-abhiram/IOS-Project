import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1lable: UILabel!
    @IBOutlet weak var player2lable: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    var images = [
        "image1", "image2", "image3", "image4", "image5", "image6",
        "image1", "image2", "image3", "image4", "image5", "image6",
    ]
    var click = 1
    var click1 = 0
    var click2 = 0
    var buttons = [UIButton]()
    var points1 = 0
    var points2 = 0
    var player = 1
    var totalPairs = 0
    
    // Player names (will be passed from the NameInputViewController)
    var player1Name: String = "Player 1" // Default name
    var player2Name: String = "Player 2" // Default name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        images.shuffle()
        
        // Add buttons to the array for easy reference
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        buttons.append(button6)
        buttons.append(button7)
        buttons.append(button8)
        buttons.append(button9)
        buttons.append(button10)
        buttons.append(button11)
        buttons.append(button12)
        
        // Update the labels with the player names and initial points
        player1lable.text = "\(player1Name): \(points1)"
        player2lable.text = "\(player2Name): \(points2)"
        
        
        winnerLabel.isHidden = true
    }

    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    // Action methods for the buttons
    @IBAction func btn1action(_ sender: Any) {
        handleButtonAction(button: button1, index: 0)
    }
    
    @IBAction func btn2action(_ sender: Any) {
        handleButtonAction(button: button2, index: 1)
    }
    
    @IBAction func btn3action(_ sender: Any) {
        handleButtonAction(button: button3, index: 2)
    }
    
    @IBAction func btn4action(_ sender: Any) {
        handleButtonAction(button: button4, index: 3)
    }
    
    @IBAction func btn5action(_ sender: Any) {
        handleButtonAction(button: button5, index: 4)
    }
    
    @IBAction func btn6action(_ sender: Any) {
        handleButtonAction(button: button6, index: 5)
    }
    
    @IBAction func btn7action(_ sender: Any) {
        handleButtonAction(button: button7, index: 6)
    }
    
    @IBAction func btn8action(_ sender: Any) {
        handleButtonAction(button: button8, index: 7)
    }
    
    @IBAction func btn9action(_ sender: Any) {
        handleButtonAction(button: button9, index: 8)
    }
    
    @IBAction func btn10action(_ sender: Any) {
        handleButtonAction(button: button10, index: 9)
    }
    
    @IBAction func btn11action(_ sender: Any) {
        handleButtonAction(button: button11, index: 10)
    }
    
    @IBAction func btn12action(_ sender: Any) {
        handleButtonAction(button: button12, index: 11)
    }
    
    // Helper method to handle button actions
    func handleButtonAction(button: UIButton, index: Int) {
        if click == 1 {
            button.setImage(UIImage(named: images[index]), for: .normal)
            click = 2
            click1 = index + 1
        } else if click == 2 {
            button.setImage(UIImage(named: images[index]), for: .normal)
            click = 1
            click2 = index + 1
            compare()
        }
    }
    @IBAction func restartGameTapped(_ sender: UIButton) {
            
            performSegue(withIdentifier: "restartGameSegue", sender: self)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "restartGameSegue" {
                
                points1 = 0
                points2 = 0
                totalPairs = 0
                player = 1
                winnerLabel.isHidden = true
                player1lable.text = "\(player1Name): \(points1)"
                player2lable.text = "\(player2Name): \(points2)"
                
                
            }
        }
    
    // Compare the two selected images
    func compare() {
        if images[click1-1] == images[click2-1] {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.buttons[self.click1-1].alpha = 0
                self.buttons[self.click2-1].alpha = 0
                
                if self.player == 1 {
                    self.points1 += 1
                    self.player1lable.text = "\(self.player1Name): \(self.points1)"
                } else if self.player == 2 {
                    self.points2 += 1
                    self.player2lable.text = "\(self.player2Name): \(self.points2)"
                }
                self.totalPairs += 1
                self.checkWinner()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.buttons[self.click1-1].setImage(UIImage(named: "image"), for: .normal)
                self.buttons[self.click2-1].setImage(UIImage(named: "image"), for: .normal)
                self.switchPlayer()
            }
        }
    }

    // Switch player after each turn
    func switchPlayer() {
        if player == 1 {
            player = 2
            player1lable.textColor = .gray
            player2lable.textColor = .black
        } else {
            player = 1
            player1lable.textColor = .black
            player2lable.textColor = .gray
        }
    }
    
    // Check if all pairs are matched and determine the winner
    func checkWinner() {
        if totalPairs == 6 {
            winnerLabel.isHidden = false
            winnerLabel.textColor = .green
            if points1 > points2 {
                winnerLabel.text = "\(player1Name) Wins!"
            } else if points2 > points1 {
                winnerLabel.text = "\(player2Name) Wins!"
            } else {
                winnerLabel.text = "It's a Tie!"
            }
        }
    }
}

