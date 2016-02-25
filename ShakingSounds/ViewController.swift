//
//  ViewController.swift
//  ShakingSounds
//
//  Created by Simranjit Kaur on 25/02/2016.
//  Copyright © 2016 Simranjit Kaur. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var soundsImage: UIImageView!
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["radiotuning","splash","steamengine"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake{
            
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            do{
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                player.play()
                soundsImage.image = UIImage(named:"\(sounds[randomNumber])"+".jpg")
            }catch{
                print("error")
            }
         
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

