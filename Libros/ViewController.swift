//
//  ViewController.swift
//  Libros
//
//  Created by Sara Fernández Menéndez on 3/6/18.
//  Copyright © 2018 Guillermo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var cajaBusqueda: UITextField!
    @IBOutlet weak var cajaResultado: UITextView!
    //8497364678
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botonLimpiar() {
        cajaBusqueda.text = ""
        cajaResultado.text = ""
    }
    
    @IBAction func enviarCodigo() {
        getLibro()
    }
    
    func getLibro(){
        let urlFija = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let url = urlFija + cajaBusqueda.text!
        let urlLibro = URL(string: url)
        do {
            let datos:Data? = try Data(contentsOf: urlLibro!)
            let texto = String(data:datos!, encoding: String.Encoding.utf8)
            cajaResultado.text = texto
        } catch {
            print("Unable to load data: \(error)")
        }
        
    }
    
}

