//
//  TableCustomViewController.swift
//  UICibertec
//
//  Created by Marcelo Stefano Velasquez Herrera on 22/07/26.
//

import UIKit

class TableCustomViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var courses = [
        Course(name: "Swift", description: "Curso Básico", icon: "swift"),
        Course(name: "UIKit", description: "Interfaces Gráficas", icon: "iphone"),
        Course(name: "Firebase", description: "Base de Datos", icon: "cloud")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tabla Custom"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCustomTableViewCell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCourse))
    }
    
    @objc func addCourse() {
        let alert = UIAlertController(title: "Nuevo curso", message: "Ingrese el nombre del curso", preferredStyle: .alert)

        alert.addTextField { textField in
            textField.placeholder = "Ej. SwiftUI"
        }

        let agregar = UIAlertAction(title: "Agregar", style: .default) { _ in
            guard let nameCourse = alert.textFields?.first?.text,
                  !nameCourse.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            let course = Course(name: nameCourse, description: "Curso agregado por el usuario", icon: "book.fill")
            self.courses.append(course)
            self.tableView.reloadData()
        }

        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alert.addAction(cancelar)
        alert.addAction(agregar)
        present(alert, animated: true)
    }

}

extension TableCustomViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCustomTableViewCell", for: indexPath) as! TableCustomTableViewCell
        let course = courses[indexPath.row]
        cell.nameLbl.text = course.name
        cell.descriptionLbl.text = course.description
        cell.courseImg.image = UIImage(systemName: course.icon)
        return cell
    }

}

extension TableCustomViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curso = courses[indexPath.row]
        let alerta = UIAlertController(title: curso.name, message: curso.description, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default))
        present(alerta, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            courses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
