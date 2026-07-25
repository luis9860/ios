//
//  TableDefaultViewController.swift
//  UICibertec
//
//  Created by Marcelo Stefano Velasquez Herrera on 22/07/26.
//

import UIKit

class TableDefaultViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var cursos = ["Swift", "UIKit", "Firebase", "Core Data"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tabla Default"
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addCourse)
        )
    }

    @objc func addCourse() {
        let alert = UIAlertController(title: "Nuevo curso", message: "Ingrese el nombre del curso",preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Ej. SwiftUI"
        }
        let agregar = UIAlertAction(title: "Agregar", style: .default) { _ in
            guard let nombre = alert.textFields?.first?.text,
                  !nombre.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            self.cursos.append(nombre)
            self.tableView.reloadData()
        }

        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alert.addAction(cancelar)
        alert.addAction(agregar)
        present(alert, animated: true)
    }

}

extension TableDefaultViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = cursos[indexPath.row]
        return cell
    }

}

extension TableDefaultViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alerta = UIAlertController(title: "Curso", message: cursos[indexPath.row], preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default))
        present(alerta, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cursos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
