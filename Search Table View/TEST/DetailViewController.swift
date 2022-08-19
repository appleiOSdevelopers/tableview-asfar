//
//  DetailViewController.swift
//  TEST
//
//  Created by Asfar Hussain Siddiqui iOS Lead on 9/3/19.
//  Copyright © 2019 Asfar Hussain Siddiqui iOS Lead. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var item : Item?
    
    @IBOutlet weak var txtView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.text = item?.text
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
