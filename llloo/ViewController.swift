//
//  ViewController.swift
//  llloo
//
//  Created by Darius Bell on 3/25/18.
//  Copyright © 2018 Darius Bell. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var X1: UILabel!
    @IBOutlet weak var X2: UILabel!
    @IBOutlet weak var X3: UILabel!
    @IBOutlet weak var X4: UILabel!
    @IBOutlet weak var X5: UILabel!
    @IBOutlet weak var textentry: UITextField!
    @IBOutlet weak var PictureToBeChanged: UIImageView!
    @IBOutlet weak var change: UILabel!
    @IBOutlet weak var resetbutton: UIButton!
    
    @IBOutlet weak var output: UILabel!
    var backgroundmusicplayer = AVAudioPlayer()
    var Phrases = ["which","there","their","about","would","these","other","words","could","write","first","water","after","where","right","think","three","years","place","sound","great","ADORE", "AGILE", "AGREE", "ALERT", "ALIVE", "ALLOW", "ALOHA", "AMAZE", "AMITY", "AMPLE", "AMPLY", "AMUSE", "ANGEL", "ARDOR", "AWARE","Taner","Sucks","Natap", "Darius","Drake"]
    var Imagesets = ["Hang_00","Hang_01","Hang_02","Hang_03","Hang_04","Hang_05","Hang_06","Hang_07"]
    var livesCheck = 1
    var phrase_check = ""
    var randomItem = ""
    var randomsongChoice = ["Titan.mp3","saxman.mp3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textentry.delegate = self
        let randomIndex = Int(arc4random_uniform(UInt32(Phrases.count)))
        randomItem = Phrases[randomIndex].uppercased()
        PictureToBeChanged.image = UIImage(named: Imagesets[1]);
        print(randomItem)
        textentry.isUserInteractionEnabled = true
        output.text = ""
        X1.text = "?"
        X2.text = "?"
        X3.text = "?"
        X4.text = "?"
        X5.text = "?"
        livesCheck = 1
        let ran = Int(arc4random_uniform(UInt32(randomsongChoice.count)))
        playBackgroundmusic(fileNamed: randomsongChoice[ran])
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
        randomItem = Phrases[randomIndex].uppercased()
        PictureToBeChanged.image = UIImage(named: Imagesets[1]);
        //print(randomItem)
        textentry.isUserInteractionEnabled = true
        output.text = ""
        X1.text = "?"
        X2.text = "?"
        X3.text = "?"
        X4.text = "?"
        X5.text = "?"
        livesCheck = 1
        resetbutton.setTitle("Start", for: .normal)
        //change.text = randomItem
        //*******
        //make sure to basic start up functionality
        //*****
    }
    @IBAction func EventTriggered(_ sender: Any) {
            resetbutton.setTitle("Reset", for: .normal)
            let text: String = textentry.text!
            var chars = [Character](text.uppercased())
            var charholder = [Character](randomItem)
            if(randomItem.contains(chars[0]))
            {
                if(charholder[0] == chars[0])
                {
                    X1.text = text.uppercased()
                }
                if(charholder[1] == chars[0])
                {
                    X2.text = text.uppercased()
                }
                if(charholder[2] == chars[0])
                {
                    X3.text = text.uppercased()
                }
                if(charholder[3] == chars[0])
                {
                    X4.text = text.uppercased()
                }
                if(charholder[4] == chars[0])
                {
                    X5.text = text.uppercased()
                }
                textentry.text = nil
                if(X1.text != "?" && X2.text != "?" && X3.text != "?" && X4.text != "?" && X5.text != "?")
                {
                    change.text = "You Win"
                    output.text = "Word: " + randomItem.uppercased()
                    
                    resetbutton.setTitle("Reset", for: .normal)
                    textentry.isUserInteractionEnabled = false
                }
            }
            else
            {
                if(livesCheck<6)
                {
                    livesCheck+=1
                    PictureToBeChanged.image = UIImage(named: Imagesets[livesCheck]);
                    textentry.text = nil
                }
                else
                {
                    change.text = "You Lose"
                    output.text = "Word: " + randomItem.uppercased()
                    resetbutton.setTitle("Reset", for: .normal)
                    textentry.isUserInteractionEnabled = false
                }
            }
        }
    func playBackgroundmusic (fileNamed: String)
    {
        let url = Bundle.main.url(forResource: fileNamed, withExtension: nil)
        guard let newUrl = url else {
            print("Could Not Find")
            return
        }
        do {
            backgroundmusicplayer = try AVAudioPlayer(contentsOf: newUrl)
            backgroundmusicplayer.numberOfLoops = -1
            backgroundmusicplayer.prepareToPlay()
            backgroundmusicplayer.play()
        }
        catch let error as NSError {
            print(error.description)
        }
    }
    

}

