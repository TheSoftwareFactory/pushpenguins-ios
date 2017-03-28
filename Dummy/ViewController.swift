//
//  ViewController.swift
//  Dummy
//
//  Created by Ramon Goncalves da Silva on 3/24/17.
//  Copyright © 2017 HSL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ball: UIView!
    
    var restartGame = false
    var winLabel : UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if restartGame == false {
            let touch = touches.first
            let loc = touch?.location(in: self.view)
            var replacement = 0
            
            if (loc?.y)! > self.view.frame.height / 2.0 {
                replacement = -20
            }
            else{
                replacement = 20
            }
            
            ball.center = CGPoint(x: ball.center.x, y: ball.center.y + CGFloat(replacement))
            
            
            if ball.frame.minY < 0 || ball.frame.maxY > self.view.frame.height {
                winLabel = UILabel()
                winLabel.font = UIFont(name: "HelveticaNeue", size: 50)
                winLabel.textAlignment = .center
                winLabel.textColor = UIColor.white
                winLabel.frame = self.view.frame
                winLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                self.view.addSubview(winLabel)
                restartGame = true
                ball.alpha = 0
                if ball.frame.minY < 0 {
                    winLabel.text = "Player 1 won!"
                }
                else{
                    winLabel.text = "Player 2 won!"
                }
            }
        }
        else{
            restartGame = false
            ball.alpha = 1
            ball.center = self.view.center
            winLabel.removeFromSuperview()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        ball.layer.cornerRadius = ball.frame.width / 2.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



/* extension UIView {
    func startRotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0
        rotation.toValue = NSNumber(value: M_PI * 2)
        rotation.duration = 2
        rotation.isCumulative = true
        rotation.repeatCount = FLT_MAX
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func stopRotate() {
        self.layer.removeAnimation(forKey: "rotationAnimation")
    }
}

*/
