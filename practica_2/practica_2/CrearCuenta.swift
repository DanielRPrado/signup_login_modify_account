//
//  CrearCuenta.swift
//  practica_2
//
//  Created by Alumno-009 on 11/04/24.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CrearCuenta: UIViewController {
    let ref = Database.database().reference()
    
    @IBOutlet weak var usuario: UITextField!
    
    @IBOutlet weak var contra: UITextField!
    
    @IBOutlet weak var nombre: UITextField!
    
    
    @IBOutlet weak var apellido: UITextField!
    
    
    @IBOutlet weak var carrera: UITextField!
    
    @IBOutlet weak var semestre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func agregarUsuario(_ sender: Any) {
        Auth.auth().createUser(withEmail: usuario.text ?? "", password: contra.text ?? ""){resultado,error in
            if let _ = resultado, error == nil
            {
                
                self.ref.child("usuarios").child(Auth.auth().currentUser!.uid).setValue(["nombre": self.nombre.text, "apellido" : self.apellido.text, "carrera": self.carrera.text, "semestre": self.semestre.text]) {Error, DatabaseReference in
                

                    if Error == nil
                    {
                        let alertaExito = UIAlertController(title: "Agregar usuario", message: "Se agrego Usuario con exito", preferredStyle: .alert)
                        alertaExito.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(alertaExito, animated: true)
                    }
                    else
                    {
                        let alertaExito = UIAlertController(title: "Agregar usuario", message: "Error al agregar datos despues de usuario y password"+(error?.localizedDescription.description)!, preferredStyle: .alert)
                        alertaExito.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self.present(alertaExito, animated: true)
                    }
                    
                }
                
                
            }
            else{
                let alertaExito = UIAlertController(title: "Agregar usuario", message: "Error al agregar usuario"+(error?.localizedDescription.description)!, preferredStyle: .alert)
                alertaExito.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alertaExito, animated: true)
                
            }
        }
    }
    
}
