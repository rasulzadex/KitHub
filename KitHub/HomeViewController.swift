import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup if needed
    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let tableVC = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
            self.navigationController?.pushViewController(tableVC, animated: true)
        }
    }
}
