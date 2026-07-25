//
//  DetailViewController.swift
//  UICibertec
//
//  Created by Marcelo Stefano Velasquez Herrera on 18/07/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var message = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        messageLbl.text = message
        backButton.setTitle("Atrás", for: .normal)
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
