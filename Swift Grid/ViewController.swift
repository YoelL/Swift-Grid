//
//  ViewController.swift
//  Swift Grid
//
//  Created by Yoel Lev on 5/3/17.
//  Copyright © 2017 Yoel Lev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     let numOfCellPerRow = 15
        var cells = [String:UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupGrid()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupGrid(){
       
        let width = view.frame.width / CGFloat(numOfCellPerRow)
        
        for row in 0...30 {
        
            for col in 0...numOfCellPerRow {
                let cellview = UIView()
                cellview.backgroundColor = randomColor()
                cellview.frame = CGRect(x: CGFloat(col) * width, y: CGFloat(row) * width, width: width, height: width)
                cellview.layer.borderColor = UIColor.black.cgColor
                cellview.layer.borderWidth = 0.5
                view.addSubview(cellview)
                
                let key = "\(col)|\(row)"
                cells[key] = cellview
                
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
        
    }
    
    
    func randomColor() -> UIColor {
    
        let red     = CGFloat(drand48())
        let green   = CGFloat(drand48())
        let blue    = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    func handlePan(gesture:UIPanGestureRecognizer){
        let location = gesture.location(in: view)
        print(location)
        
         let width = view.frame.width / CGFloat(numOfCellPerRow)
        
        let col = Int(location.x / width)
        let row = Int(location.y / width)
        let key = "\(col)|\(row)"
        
        //cellView?.backgroundColor = UIColor.black
        
        guard let cellView = cells[key] else {
            return
        }
        
        view.bringSubview(toFront: cellView)
        
        UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping:1,initialSpringVelocity:1, options: .curveEaseOut, animations: { 
            cellView.layer.transform = CATransform3DMakeTranslation(3, 3, 3)
        }, completion: nil)
        
        
        
        
  
    
    }
    


}

