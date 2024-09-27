import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var books = [BookModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Action for the Add Button to open the AddViewController
    @IBAction func addButtonClick(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addVC = storyboard.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController {
            addVC.delegate = self // Set the delegate
            self.navigationController?.pushViewController(addVC, animated: true)
        }
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    // Cell configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewControllerCell", for: indexPath)
        let book = books[indexPath.row]
        
        // Configure the cell
        cell.textLabel?.text = book.bookName
        return cell
    }
}

extension TableViewController: AddBookDelegate {
    func didAddBook(_ book: BookModel) {
        books.append(book) // Add the new book to the array
        tableView.reloadData() // Reload the table view
    }
}
