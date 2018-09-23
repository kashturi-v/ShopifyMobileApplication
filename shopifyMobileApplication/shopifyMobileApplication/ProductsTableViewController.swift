//
//   ProductsTableViewController.swift
//   shopifyMobileApplication
//
//   Created by Kashturi V on 2018-09-17.
//   Copyright © 2018 Kashturi V. All rights reserved.
/**  Purpose of class ProductsTableViewController
     This class is used to control the products table view
     controller. This screen is a transistion from the Tags
     screen through the segue. It receives information from
     the Tags view controller and uses this information to
     present the product and image on the screen.
 */


import UIKit
var image: UIImage!

class ProductsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = typeOfTag
         navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        performSegue(withIdentifier: "segue2", sender: typeOfTag)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfProducts[element].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productTableViewCell") as? productTableViewCell else{ return UITableViewCell() }
        cell.productlbl.text = listOfProducts[element][indexPath.row]
        cell.quantityLabel.text = "Total inventory: " + String(listOfQuantities[element][indexPath.row])
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: listOfImages[element][indexPath.row])
            if let data = data{
                image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.imgView.image = image
                    
                }
            }
        }
        return cell
        
    }
    
}




