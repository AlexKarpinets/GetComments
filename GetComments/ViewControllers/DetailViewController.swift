//
//  DetailViewController.swift
//  GetComments
//
//  Created by Karpinets Alexander on 05.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var comments: Comments!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configur()
    }
    
    private func configur() {
        nameLabel.text = comments.name
        emailLabel.text = comments.email
        bodyLabel.text = comments.body
    }
}
