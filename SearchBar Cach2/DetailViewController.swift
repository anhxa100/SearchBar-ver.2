//
//  DetailViewController.swift
//  SearchBar Cach2
//
//  Created by anhxa100 on 9/15/18.
//  Copyright © 2018 anhxa100. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButtonLabel: UIBarButtonItem!
    
    var indexVC: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        saveButtonLabel.isEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        saveButtonLabel.isEnabled = false
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func updateSaveButtonState () {
    let text = textField.text ?? ""
        saveButtonLabel.isEnabled = !text.isEmpty
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButtonLabel.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
