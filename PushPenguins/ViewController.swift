//
//  ViewController.swift
//  PushPenguins
//
//  Created by Software Factory iOS on 3/24/17.
//  Copyright © 2017 Software Factory. All rights reserved.
// comments
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var leftBall: UIButton!
    @IBOutlet var rightBall: UIButton!
    @IBOutlet var centerBall: UIButton!
    
    var currBall : UIButton!
    
    var restartGame = false
    var winLabel : UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if restartGame == false {
            let touch = touches.first
            let loc = touch?.location(in: self.view)
            var displacement = 0
            
            switch ( (loc?.x)! / self.view.frame.width ) { //Sets ball to be one of the three options based on x touch location
               
            case 0..<1/3:
                currBall = leftBall
            case 1/3..<2/3:
                currBall = centerBall
            case 2/3...1.0:
                currBall = rightBall
                
            default:
                print(self.view.frame.width / (loc?.x)!)
                currBall = centerBall
            }
            
            print("BEFORE: \(self.currBall.transform)")
            
            if (loc?.y)! > self.view.frame.height / 2.0 {
                displacement = -70
                if self.currBall.transform != CGAffineTransform(rotationAngle: 0) { //rotate penguin image if on opposite direction
                    self.currBall.transform = self.currBall.transform.rotated(by: CGFloat(M_PI))
                }
            }
            else{
                displacement = 70
                if self.currBall.transform == CGAffineTransform(rotationAngle: 0) { //rotate penguin image if on opposite direction
                   self.currBall.transform = self.currBall.transform.rotated(by: -CGFloat(M_PI))
                }
            }
            
            print("AFTER: \(self.currBall.transform)")
            
            UIView.animate(withDuration: 0.05, animations: {
                self.currBall.center = CGPoint(x: self.currBall.center.x, y: self.currBall.center.y + CGFloat(displacement))
            }, completion: nil)
            
            if currBall.frame.minY < 0 || currBall.frame.maxY > self.view.frame.height {
                winLabel = UILabel()
                winLabel.font = UIFont(name: "HelveticaNeue", size: 50)
                winLabel.textAlignment = .center
                winLabel.textColor = UIColor.white
                winLabel.frame = self.view.frame
                winLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                self.view.addSubview(winLabel)
                restartGame = true
                currBall.alpha = 0
                if currBall.frame.minY < 0 {
                    winLabel.text = "Player 1 won!"
                }
                else{
                    winLabel.text = "Player 2 won!"
                }
            }
        }
        else{
            restartGame = false
            leftBall.alpha = 1
            leftBall.center = CGPoint(x: leftBall.center.x, y: self.view.center.y)
            centerBall.alpha = 1
            centerBall.center = CGPoint(x: centerBall.center.x, y: self.view.center.y)
            rightBall.alpha = 1
            rightBall.center = CGPoint(x: rightBall.center.x, y: self.view.center.y)
            winLabel.removeFromSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currBall = centerBall
    }
    
    override func viewDidLayoutSubviews() {
       
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
} */
