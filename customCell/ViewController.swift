//
//  ViewController.swift
//  customCell
//
//  Created by Sebastian Hette on 23.09.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit
var car = ["Car", "Race","Win"]
var des = ["This is a demo description","Only for fun","This is another description"]
var myIndex = 0
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    //let animals = ["Panda", "Lion", "Elefant"]
    
    var filteredData = [String]()
    
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        inSearchMode = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        inSearchMode = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        inSearchMode = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        inSearchMode = false;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            
            inSearchMode = false
            
            view.endEditing(true)
            
            self.tableView.reloadData()
            
        }else {
        filteredData = car.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filteredData.count == 0){
            inSearchMode = false;
        } else {
            inSearchMode = true;
        }
            self.tableView.reloadData()}
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if inSearchMode {
            
            return filteredData.count
        }
        //return (animals.count)
        return (car.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as? ViewControllerTableViewCell {
        let text: String!
        
        if inSearchMode {
            
            text = filteredData[indexPath.row]

        
            cell.congigureCell(text: text)
        //cell.myImage.image = UIImage(named: (animals[indexPath.row] + ".jpg"))
            cell.myImage.image = UIImage(named: (car[indexPath.row]))
        
        //cell.myLabel.text = animals[indexPath.row]
            //cell?.myLabel.text = car[indexPath.row]
            cell.myLabel2.text = "Good car"
            cell.myLabel3.text = "Beautiful"
            
        }
        else {
                text = car[indexPath.row]
            cell.congigureCell(text: text)
            //cell.myImage.image = UIImage(named: (animals[indexPath.row] + ".jpg"))
            cell.myImage.image = UIImage(named: (car[indexPath.row]))
            
            //cell.myLabel.text = animals[indexPath.row]
            //cell?.myLabel.text = car[indexPath.row]
            cell.myLabel2.text = "Good car"
            cell.myLabel3.text = "Beautiful"
           
            }
            return (cell)
        }else {
            return UITableViewCell()
        }
    }
        
    
    
        
    
    /*func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            inSearchMode = false
            
            view.endEditing(true)
            
            tableView.reloadData()
            
        } else {
            
            inSearchMode = true
            
            filteredData = car.filter({$0 == searchBar.text})
    
            tableView.reloadData()
        }
    }*/
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segoui", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

