//
//  ViewController.swift
//  gapsi-test
//
//  Created by Deiby Toralva on 7/25/17.
//  Copyright © 2017 deibytb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var products = [Product]()

    @IBOutlet weak var searchText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButton(_ sender: UIButton) {
        getCoursesPublic()
        
    }
    
    func getCoursesPublic() {
        if searchText.text != nil {
            LiverpoolAPI().getProducts(wordSearch: searchText.text!) { (products) in
                self.products = products!
                self.performSegue (withIdentifier: "showResult", sender: self)
            }
        } else {
            print("Escribir un término para buscar")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let productsViewController = segue.destination as? ProductsTableViewController {
                productsViewController.products = self.products
            }
        }
    }

}

