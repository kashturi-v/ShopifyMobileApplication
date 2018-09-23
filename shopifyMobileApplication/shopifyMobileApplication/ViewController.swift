//
//   ViewController.swift
//   shopifyMobileApplication
//
//   Created by Kashturi V on 2018-09-16.
//   Copyright © 2018 Kashturi V. All rights reserved.
/**  Purpose of class ViewController
     This class is used to control the "All Tags" table view
     controller. It parse the JSON file given in throughinput
     and uses it to save and present information on this screen.
     The information received from the JSON file is later used on
     the ProductsTableViewController as well.
 */

import Foundation
import UIKit
var listOfTags = [String]()
var listOfProducts = [[String]]()
var listOfQuantities = [[Int]]()
var typeOfTag = ""
var listOfImages = [[URL]]()
var element: Int = 3
var productType = [String]()
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tagsListCell", for: indexPath) as? tagsListCell else{ return UITableViewCell() }
        cell.tagLbl.text = listOfTags[indexPath.row]
        cell.numOfProdLbl.text = "Number of total products: " + String(listOfProducts[indexPath.row].count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        typeOfTag = listOfTags[indexPath.row]
        element = indexPath.row
        
        performSegue(withIdentifier: "segue1", sender: typeOfTag)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    final let url = URL(string: "https://shopicruit.myshopify.com/admin/products.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        downloadJSONData()
        tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func downloadJSONData (){
        guard let downloadJSONurl = url
        else
        {
            return
        } //probably can change this to a condition statement
        
        URLSession.shared.dataTask(with: downloadJSONurl) { data, urlResponse, error in
            guard let data = data, urlResponse != nil , error == nil
            else
            {
                return;
            }
            do{
                let decoder = JSONDecoder()
                let tagandProduct = try decoder.decode(Products.self, from: data)
            
                for i in 0 ..< tagandProduct.products.count{
                    
                    var tagArray = (tagandProduct.products[i].tags).components(separatedBy: ", ")
                    for j in 0 ..< tagArray.count
                    {
                        var quantity = 0;
                        if let k = listOfTags.index(of: tagArray[j])
                       {
                        
                        for x in 0 ..< tagandProduct.products[i].variants.count{
                           quantity=quantity + tagandProduct.products[i].variants[x].inventory_quantity
                        }
                        listOfQuantities[k].append(quantity)
                       
                        listOfProducts[k].append(tagandProduct.products[i].title)
                        listOfImages[k].append(tagandProduct.products[i].image.src)
                       }
                       else
                        {
                         listOfTags.append(tagArray[j])
                         listOfQuantities.append([quantity])
                         listOfProducts.append([tagandProduct.products[i].title])
                         listOfImages.append([tagandProduct.products[i].image.src])
                        }
                        quantity = 0
                       }
                       tagArray.removeAll()
                    }
                 
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                }
                
            
            catch{
                 print(error)
            }
        }.resume()
    }
    
}


