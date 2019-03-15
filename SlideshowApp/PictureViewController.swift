//
//  PictureViewController.swift
//  SlideshowApp
//
//  Created by まるやまゆうき on 2019/03/11.
//  Copyright © 2019 yuuki.maruyama. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet weak var pictureView: UIImageView!
    // 入力された画像の番号を入れる変数
    var pictureNumber:Int!
    
    // バンドルした画像ファイルを読み込み
    let images = [UIImage(named: "img_1.jpg"),
                  UIImage(named: "img_2.jpg"),
                  UIImage(named: "img_3.jpg")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Image Viewに画像を設定
        pictureView.image = images[pictureNumber]
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
