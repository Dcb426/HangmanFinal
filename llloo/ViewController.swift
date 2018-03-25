//
//  ViewController.swift
//  llloo
//
//  Created by Darius Bell on 3/25/18.
//  Copyright © 2018 Darius Bell. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var X1: UILabel!
    @IBOutlet weak var X2: UILabel!
    @IBOutlet weak var X3: UILabel!
    @IBOutlet weak var X4: UILabel!
    @IBOutlet weak var X5: UILabel!
    @IBOutlet weak var textentry: UITextField!
    @IBOutlet weak var PictureToBeChanged: UIImageView!
    @IBOutlet weak var change: UILabel!
    var Phrases = ["which","there","their","about","would","these","other","words","could","write","first","water","after","where","right","think","three","years","place","sound","great"]
    var Imagesets = ["Hang_00","Hang_01","Hang_02","Hang_03","Hang_04","Hang_05","Hang_06","Hang_07"]
    var livesCheck = 1
    var phrase_check = ""
    var randomItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textentry.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        //PictureToBeChanged.image = UIImage(named: Imagesets[0]);
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textentry.resignFirstResponder()
        return true
    }
    
    @IBAction func buttonPressed(sender: AnyObject)
    {
        let randomIndex = Int(arc4random_uniform(UInt32(Phrases.count)))
        randomItem = Phrases[randomIndex]
        PictureToBeChanged.image = UIImage(named: Imagesets[1]);
        //change.text = randomItem
        //*******
        //make sure to basic start up functionality
        //*****
    }
    @IBAction func EventTriggered(_ sender: Any) {
        let text: String = textentry.text!
        var chars = [Character](text)
        var charholder = [Character](randomItem)
        if(randomItem.contains(chars[0]))
        {
            if(charholder[0] == chars[0])
            {
                X1.text = text
            }
            if(charholder[1] == chars[0])
            {
                X2.text = text
            }
            if(charholder[2] == chars[0])
            {
                X3.text = text
            }
            if(charholder[3] == chars[0])
            {
                X4.text = text
            }
            if(charholder[4] == chars[0])
            {
                X5.text = text
            }
        }
        else
        {
            livesCheck+=1
            PictureToBeChanged.image = UIImage(named: Imagesets[livesCheck]);
        }
        

    }


}

