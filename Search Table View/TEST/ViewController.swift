//
//  ViewController.swift
//  TEST
//
//  Created by Asfar Hussain Siddiqui iOS Lead on 9/2/19.
//  Copyright © 2019 Asfar Hussain Siddiqui iOS Lead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    
    
    var dataSource : [[Item]] = [[Item(title: "uno" , text: """
    SECTION 1, ROW 0 \n
    Esto debe venir de section 1 row 0, y para hacerlo realmente largo es necesario meter un montón de cosas irrelevantes para ver si respeta los espacios y los renglones del textView. Gracias de nada.
    """) , Item(title: "dos" , text: """
    SECTION 1, ROW 1 \n
    Esto debe venir de section 1 row 1. Una vez más es necesario asegurarse de que los márgenes y formatos de texto son respetados. De otro modo habrá que corregirlos. \n
    Aquí hay un salto de línea. A ver qué tal sale.
    """ ) , Item(title: "tres" , text: """
    SECTION 1, ROW 2 \n
    Esto debe venir de section 1 row 2. \n \n
    
    OTRO SUBTÍTULO DENTRO DE LA SECCIÓN. \n
    Se usarán 2 nuevas líneas cuando haya que añadir algún título o subtítulo dentro del textView. Por cuestiones de estética visual.
    """ ), Item(title: "cuatro" , text: """
    SECTION 1, ROW 3 \n
    Esto debe venir de section 1 row 3
    """ )] , [Item(title: "a" , text: """
    SECTION 2 ROW 0 \n
    Esto debe venir de section 2 row 0. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \n \n \n \n \n \n
    
    Aquí sigue la onda pedorra.
    """ ) , Item(title: "be" , text: "Esto debe venir de section 2 row 1" ) , Item(title: "ce" , text: "Esto debe venir de section 2 row 2" ) , Item(title: "de" , text: "Esto debe venir de section 2 row 3" ) , Item(title: "e" , text: "Esto debe venir de section 2 row 4" ) , Item(title: "efe" , text: "Esto debe venir de section 2 row 1" ) , Item(title: "ge" , text: "Esto debe venir de section 2 row 5" )]]
    
    
    var values : [[Item]] = [[]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        values = self.dataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController,
              let row = tableView.indexPathForSelectedRow?.row,
              let section = tableView.indexPathForSelectedRow?.section
        else {
            return
        }
        
        detailViewController.item = dataSource[section][row]
    }
    
    
    
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            cell.lbl.text = dataSource[indexPath.section][indexPath.row].title
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToInfo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.dataSource = values
        
        if searchText == "" {
            self.tableView.reloadData()
            return
        }
        var filteredDataSource : [[Item]] = []
        for items in dataSource {
            let filteredItems = items.filter { (item) -> Bool in
                if item.title.contains(searchText) {
                    return true
                }
                
                //                if item.title.lowercased().prefix(searchText.count) == searchText.lowercased() {
                //                    return true
                //                }
                return false
            }
            filteredDataSource.append(filteredItems)
        }
        
        
        
        self.dataSource = filteredDataSource
        tableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dataSource = values
        tableView.reloadData()
    }
    
    
    
    
}

