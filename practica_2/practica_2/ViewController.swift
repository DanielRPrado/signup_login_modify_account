//
//  ViewController.swift
//  practica_2
//
//  Created by Alumno-009 on 09/04/24.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var usuario: UITextField!
    
    @IBOutlet weak var contra: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barra.title = "login"
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var barra: UINavigationItem!
    
    
    @IBAction func cambiarAprincipal(_ sender: Any) {
        Auth.auth().signIn(withEmail: usuario.text ?? "", password: contra.text ?? "" ){
            Result, Error in
            
            if Error == nil{
                self.performSegue(withIdentifier: "aPrincipal", sender: self)
            }
            else{
                let alertaExito = UIAlertController(title: "Login", message: "Error iniciar sesion"+(Error?.localizedDescription.description)!, preferredStyle: .alert)
                alertaExito.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alertaExito, animated: true)
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "aPrincipal")
        {
            let principal = segue.destination as? Principal
        }
        
    }
    
    
}

