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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openCVVersionLabel.text = OpenCVWrapper.openCVVersionString()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GrayScaleBtn_Click(_ sender: UIButton) {
        imageView.image = OpenCVWrapper.makeGrayof(imageView.image)
    }
    
}

