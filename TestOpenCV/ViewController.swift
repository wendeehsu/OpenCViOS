//
//  ViewController.swift
//  TestOpenCV
//
//  Created by dentall01 on 2019/3/30.
//  Copyright © 2019 wendeehsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var openCVVersionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var findCircleView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openCVVersionLabel.text = OpenCVWrapper.openCVVersionString()
        findCircleView.image = UIImage(named: "bowls")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GrayScaleBtn_Click(_ sender: UIButton) {
        imageView.image = OpenCVWrapper.makeGrayof(imageView.image)
    }
    
    @IBAction func DectectCircleBtn_Click(_ sender: UIButton) {
        findCircleView.image = OpenCVWrapper.detectCircleof(findCircleView.image)
    }
    
    let imgList = ["bowls", "cat", "greenCircle", "rings", "twoCircles"]
    var CurrentIndex = 0
    @IBAction func ChangeImg_Click(_ sender: UIButton) {
        CurrentIndex = SetIndex(index: CurrentIndex)
        findCircleView.image = UIImage(named: imgList[CurrentIndex])
    }
    
    func SetIndex(index: Int) -> Int {
        var i = index
        if(i == (imgList.count - 1))
        {
            i = 0
        }
        else
        {
            i += 1
        }
        
        return i
    }
}

