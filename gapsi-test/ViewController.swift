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
        saveWordSearch(wordSearch: searchText.text!)
    }
    
    func getCoursesPublic() {
        self.loading.isHidden = false
        loading.startAnimating()
        if searchText.text != "" {
            LiverpoolAPI().getProducts(wordSearch: searchText.text!) { (products) in
                self.products = products!
                self.loading.stopAnimating()
                self.performSegue (withIdentifier: "showResult", sender: self)
            }
        } else {
            searchText.placeholder = "Ejemplo: Xbox"
            print("Escribir un término para buscar")
            self.loading.stopAnimating()
            self.loading.isHidden = true
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            if let productsViewController = segue.destination as? ProductsTableViewController {
                productsViewController.products = self.products
            }
        }
    }
    
    func saveWordSearch (wordSearch: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let word = Search(context: context)
        word.word = wordSearch
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }

}

