//
//  ModalViewController.swift
//  UICibertec
//
//  Created by Marcelo Stefano Velasquez Herrera on 18/07/26.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLbl.text = message
        closeButton.setTitle("Cerrar", for: .normal)
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true)
    }

}
