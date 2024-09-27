import UIKit

// Protocol definition
protocol AddBookDelegate: AnyObject {
    func didAddBook(_ book: BookModel)
}

class AddViewController: UIViewController {
    
    weak var delegate: AddBookDelegate? // Delegate property
    
    @IBOutlet weak var bookTF: UITextField!
    @IBOutlet weak var pageNumberTF: UITextField!
    @IBOutlet weak var authorTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Action when the Save button is clicked
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        guard let bookName = bookTF.text, !bookName.isEmpty,
              let authorName = authorTF.text, !authorName.isEmpty,
              let pageNumber = pageNumberTF.text, !pageNumber.isEmpty else {
            print("Invalid input")
            return
        }
        
        // Create a new book instance
        let newBook = BookModel(bookName: bookName, authorName: authorName, pageNumber: pageNumber)
        
        // Pass the new book to the delegate (TableViewController)
        delegate?.didAddBook(newBook)
        
        // Pop back to the previous view controller
        navigationController?.popViewController(animated: true)
    }
}
