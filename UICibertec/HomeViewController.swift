//
//  HomeViewController.swift
//  UICibertec
//
//  Created by Marcelo Stefano Velasquez Herrera on 18/07/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageTxt: UITextField!
    @IBOutlet weak var segueButton: UIButton!
    @IBOutlet weak var pushButton: UIButton!
    @IBOutlet weak var presentButton: UIButton!
    @IBOutlet weak var tableButton: UIButton!
    @IBOutlet weak var tableCustomButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupTitle()
        setupMessage()
        setupButtons()
    }
    
    func setupTitle() {
        titleLbl.text = "Ingrese un mensaje a compartir"
        titleLbl.textColor = .blue
        titleLbl.textAlignment = .center
    }
    
    func setupMessage() {
        messageTxt.placeholder = "Mensaje"
        messageTxt.keyboardType = .default
    }
    
    func setupButtons() {
        segueButton.setTitle("Ir con Segue", for: .normal)
        segueButton.backgroundColor = .systemBlue
        segueButton.tintColor = .white
        
        pushButton.setTitle("Ir con Push", for: .normal)
        pushButton.backgroundColor = .systemGreen
        pushButton.tintColor = .white
        
        presentButton.setTitle("Ir con Present", for: .normal)
        presentButton.backgroundColor = .systemOrange
        presentButton.tintColor = .white
        
        tableButton.setTitle("Mostrar table cell default", for: .normal)
        tableButton.backgroundColor = .systemRed
        tableButton.tintColor = .white
        
        tableCustomButton.setTitle("Mostrar table cell custom", for: .normal)
        tableCustomButton.backgroundColor = .systemCyan
        tableCustomButton.tintColor = .white
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSegue" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.message = messageTxt.text ?? ""
        }
    }
    
    @IBAction func didTapPushButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.message = messageTxt.text ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapPresentButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        vc.message = messageTxt.text ?? ""
        present(vc, animated: true)
    }
    
    @IBAction func didTapTableCellDefaultButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TableDefaultViewController") as! TableDefaultViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapTableCellCustomButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TableCustomViewController") as! TableCustomViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
