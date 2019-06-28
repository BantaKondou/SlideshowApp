//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 近藤万太 on 2019/06/28.
//  Copyright © 2019 banta.kondou. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var zoomImage: UIImageView!
    var imageView: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Viewcontroller で表示されていた画像を拡大して表示する
        zoomImage.image = self.imageView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
