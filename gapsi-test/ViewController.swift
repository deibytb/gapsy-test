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
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.loading.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchButton(_ sender: UIButton) {
        getCoursesPublic()
    }
    
    func getCoursesPublic() {
        self.loading.isHidden = false
        loading.startAnimating()
        if searchText.text != nil {
            LiverpoolAPI().getProducts(wordSearch: searchText.text!) { (products) in
                self.products = products!
                self.loading.stopAnimating()
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

