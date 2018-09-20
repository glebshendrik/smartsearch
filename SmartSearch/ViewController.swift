//
//  ViewController.swift
//  SmartSearch
//
//  Created by Gleb Shendrik on 19/09/2018.
//  Copyright © 2018 Gleb Shendrik. All rights reserved.
//

import UIKit
import CoreML
import NaturalLanguage

class ViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var textName: UILabel!
    var searchName = [String]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    MARK: Predict, Model
    func validateName (str: String) {
        let url = Bundle.main.url(forResource: "names", withExtension: "mlmodelc")!
        guard let model = try? NLModel(contentsOf: url) else {
            return
        }
        let conclusion = model.predictedLabel(for: str)
        print(conclusion as Any)
        textName.text = conclusion
    }
    
    @IBAction func predictName(_ sender: Any) {
        validateName(str: inputName.text!)
    }
    
}

