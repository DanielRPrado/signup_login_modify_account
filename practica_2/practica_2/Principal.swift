//
//  Principal.swift
//  practica_2
//
//  Created by Alumno-009 on 09/04/24.
//

import UIKit
import FirebaseAuth

class Principal: UIViewController {
    
    
    @IBOutlet weak var tablaOpciones: UITableView!
    let opciones = ["editar cuenta", "salir"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaOpciones.dataSource = self
        tablaOpciones.delegate = self
    }
    
    
    
}


extension Principal : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = opciones[indexPath.row]
        return cell
    }
    
    
}

extension Principal : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0)
        {
            performSegue(withIdentifier: "aEditar", sender: self)
        }
        else
        {
            do
            {
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch {
                print("Error al hacer signOut")
            }
            
        }
    }
}
