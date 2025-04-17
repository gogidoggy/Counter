//
//  ViewController.swift
//  Counter
//
//  Created by Deni on 15.04.2025.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var numberDecrease: UIButton!
    @IBOutlet weak var numberIncrease: UIButton!
    @IBOutlet weak var numberClear: UIButton!
    @IBOutlet weak var counterStatus: UITextView!
    
    var count = 0
    
    func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number.text = "\(count)"
        counterStatus.text = "История изменений:\n"
        // Do any additional setup after loading the view.
    }

    @IBAction func increaseFunc(_ sender: Any) {
    count += 1
    number.text = "\(count)"
    counterStatus.text += "\n[\(getCurrentDateTime())]: значение изменено на +1"
        scrollToBottom()
    }
    
    @IBAction func decreaseFunc(_ sender: Any) {
        if count > 0 {
            count -= 1
            counterStatus.text += "\n[\(getCurrentDateTime())]: значение изменено на -1"
            scrollToBottom()
        } else {
            counterStatus.text += "\n[\(getCurrentDateTime())]: попытка уменьшить значение счётчика ниже 0"
            scrollToBottom()
        }
    number.text = "\(count)"
    }
    
    @IBAction func clearFunc(_ sender: Any) {
    count = 0
    number.text = "\(count)"
    counterStatus.text += "\n[\(getCurrentDateTime())]: значение сброшено"
        scrollToBottom()
    }
    
    func scrollToBottom() {
            let range = NSRange(location: counterStatus.text.count - 1, length: 1)
        counterStatus.scrollRangeToVisible(range)
        }
    
}

