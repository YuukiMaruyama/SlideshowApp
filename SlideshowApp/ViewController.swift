//
//  ViewController.swift
//  SlideshowApp
//
//  Created by まるやまゆうき on 2019/03/11.
//  Copyright © 2019 yuuki.maruyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // バンドルした画像ファイルを読み込み
    let images = [UIImage(named: "img_1.jpg"),
                  UIImage(named: "img_2.jpg"),
                  UIImage(named: "img_3.jpg")]
    var imageNumber = 0
    let imageNumberMax = 2
    let imageNumberMin = 0
    // タイマー
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Image Viewに画像を設定
        imageView.image = images[imageNumber]
        
        // Image Viewをタッチできるようにする
    }
    
    // 遷移した画面から戻ってくるとき
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    // 画像をタップした時
    @IBAction func onTapImage(_ sender: Any) {
        // スライドショーを止める
        if self.timer != nil {
            // 無効にします
            timer.invalidate()
            // 72行目の動作判定で使う
            timer = nil
            // .normal 何もしないとき
            playButton.setTitle("再生", for: .normal)
            returnButton.isEnabled = true // ボタン無効
            nextButton.isEnabled = true // ボタン無効
            }

        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "expansion", sender: imageNumber)
    }
    
    //Segueの初期化を通知するメソッドをオーバーライドする。senderにはperformSegue()で渡した値が入る。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "expansion" {
            let pictureViewController = segue.destination as! PictureViewController
            pictureViewController.pictureNumber = sender as? Int
        }
    }
    
    // 戻るボタン
    @IBAction func returnPicture(_ sender: Any) {
        imageNumber -= 1
        if imageNumber < imageNumberMin {
           imageNumber = imageNumberMax
        }
        // Image Viewに画像を設定
        imageView.image = images[imageNumber]
    }
    // 進むボタン
    @IBAction func nextPicture(_ sender: Any) {
        goNextPicture()
    }
    // 再生ボタン
    @IBAction func playSlideshow(_ sender: Any) {
        // タイマーの作成、始動
        // 再生を押した時
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            playButton.setTitle("停止", for: .normal)
            
            
            returnButton.isEnabled = false // ボタン無効
            nextButton.isEnabled = false // ボタン無効
        // 停止を押した時
        } else {
            // 無効にします
            timer.invalidate()
            // 72行目の動作判定で使う
            timer = nil
            // .normal 何もしないとき
            playButton.setTitle("再生", for: .normal)
            
            returnButton.isEnabled = true // ボタン無効
            nextButton.isEnabled = true // ボタン無効
        }
    }
    
    @objc func goNextPicture(){
        imageNumber += 1
        if imageNumber > imageNumberMax {
            imageNumber = imageNumberMin
        }
        // Image Viewに画像を設定
        imageView.image = images[imageNumber]
    }
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、2.0秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        goNextPicture()
    }
}

