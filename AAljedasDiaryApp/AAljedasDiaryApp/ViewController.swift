//
//  ViewController.swift
//  AAljedasDiaryApp
//
//  Created by student on 3/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func writeMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try typeTextHere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing file")
        }
        
    }
    
    
    
    @IBAction func readMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
        } catch {
            print("Error reading file")
        }
        
    }
    
    
    
    @IBOutlet var typeTextHere: UITextView!
    
    
    
    @IBOutlet var displayTextHere: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeTextHere.text = "Start typing..."
        displayTextHere.text = ""    }


}

