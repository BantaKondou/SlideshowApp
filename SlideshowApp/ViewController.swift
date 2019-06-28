//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 近藤万太 on 2019/06/28.
//  Copyright © 2019 banta.kondou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var imageNumber = 0
    let imageName = [
        "img2.jpg",
        "img3.jpg",
        "img4.jpg",
    ]
    
    // 画像表示
    func displayImage() {
        // imageNumber が0より小さい場合、2として扱う
        if imageNumber < 0 {
            imageNumber = 2
        }
        // imageNumber が2より大きい場合、0として扱う
        if imageNumber > 2 {
            imageNumber = 0
        }
        // 画像を表示する
        let image = UIImage(named: imageName[imageNumber])
        imageView.image = image
    }
    
    // 一つ前の画像を表示する
    @IBAction func backButton(_ sender: Any) {
        imageNumber -= 1
        displayImage()
    }
    
    // 一つ後の画像を表示する
    @IBAction func nextButton(_ sender: Any) {
        imageNumber += 1
        displayImage()
    }
    
    var timer: Timer!
    
    @objc func onTimer(_ timer: Timer) {
        imageNumber += 1
        displayImage()
    }
    
    @IBAction func startStopButton(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、timer が存在しない場合だけ、タイマーを生成して動作させる
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            // 再生時に再生ボタンが停止ボタンに変わる
            startStopButton.setTitle("停止", for: .normal)
            // 再生時に戻るボタン、進むボタンの色を変えてタップ不可にする
            backButton.isEnabled = false
            backButton.setTitleColor(UIColor.lightGray, for: .normal)
            nextButton.isEnabled = false
            nextButton.setTitleColor(UIColor.lightGray, for: .normal)
        } else {
            // 停止時に停止ボタンが再生ボタンに変わる
            startStopButton.setTitle("再生", for: .normal)
            // 停止時に戻るボタン、進むボタンの色を戻してタップ可にする
            backButton.isEnabled = true
            backButton.setTitleColor(UIColor.init(red: 0, green: 122/255, blue: 1, alpha: 1), for: .normal)
            nextButton.isEnabled = true
            nextButton.setTitleColor(UIColor.init(red: 0, green: 122/255, blue: 1, alpha: 1), for: .normal)
            
            // タイマーを停止し、timer == nil で判断するので timer = nil にする
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // アプリを開いた時に　img2.jpg を表示する
        let image = UIImage(named: "img2.jpg")
        imageView.image = image
    }
    
    var selectedImage: UIImage?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        selectedImage = UIImage(named: imageName[imageNumber])
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        zoomViewController.imageView = self.selectedImage
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 画面遷移
    }
    
    // 画像をtapした時に ZoomViewController に遷移する
    @IBAction func onTapImage(_ sender: Any) {
        self.performSegue(withIdentifier: "zoom", sender: nil)
    }
    
}

