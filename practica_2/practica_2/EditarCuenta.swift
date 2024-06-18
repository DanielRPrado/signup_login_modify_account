//
//  EditarCuenta.swift
//  practica_2
//
//  Created by Alumno-009 on 18/04/24.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class EditarCuenta: UIViewController {
    
    let usuario = Auth.auth().currentUser?.uid
    let myRef = Database.database().reference()
    
    
    
    @IBOutlet weak var nombre: UITextField!
    
    @IBOutlet weak var apellido: UITextField!
    
    @IBOutlet weak var carrera: UITextField!
    
    @IBOutlet weak var semestre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myRef.child("usuarios").child(usuario!).getData { Error, DataSnapshot in
            
            if Error == nil
            {
                self.nombre.text = DataSnapshot?.childSnapshot(forPath: "nombre").value as! String?
                self.apellido.text = DataSnapshot?.childSnapshot(forPath: "apellido").value as! String?
                self.carrera.text = DataSnapshot?.childSnapshot(forPath: "carrera").value as! String?
                self.semestre.text = DataSnapshot?.childSnapshot(forPath: "semestre").value as! String?
            }
            
        }
    }
    
    @IBAction func editarUsuario(_ sender: Any) {
        myRef.child("usuarios").child(Auth.auth().currentUser!.uid).setValue(["nombre": nombre.text, "apellido" : apellido.text, "carrera": carrera.text, "semestre": semestre.text]) {Error, DatabaseReference in
        

            if Error == nil
            {
                let alertaExito = UIAlertController(title: "Editar usuario", message: "Se edito Usuario con exito", preferredStyle: .alert)
                alertaExito.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alertaExito, animated: true)
            }
            else
            {
                let alertaExito = UIAlertController(title: "Editar usuario", message: "Error al editar datos despues de usuario y password"+(Error?.localizedDescription.description)!, preferredStyle: .alert)
                alertaExito.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alertaExito, animated: true)
            }
            
        }
        
        
    }
    
}
