//
//  CommentsTableViewController.swift
//  GetComments
//
//  Created by Karpinets Alexander on 05.10.2022.
//

import UIKit

class CommentsTableViewController: UITableViewController {
    
    var coomments: [Comments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getComments()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coomments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comment = coomments[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = comment.name
        cell.contentConfiguration = content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let comment = coomments[indexPath.row]
        detailVC.comments = comment
    }
    
    private func getComments() {
        NetworkManager.shared.getComments { comments in
            self.coomments = comments
            self.tableView.reloadData()
        }
    }
}
