//
//  ViewController.swift
//  polaroid
//
//  Created by 羅承志 on 2021/5/6.
//

import UIKit
//濾鏡套件
import CoreImage.CIFilterBuiltins

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changeSizeSegmented(_ sender: UISegmentedControl) {
        // 設定寬300
        let width: CGFloat = 300
        var height: CGFloat = 0
        //設定三個尺寸選項的圖片比例
        if sender.selectedSegmentIndex == 0 {
            height = width
        } else if sender.selectedSegmentIndex == 1 {
            height = width / 3 * 4
        } else {
            height = width / 9 * 16
        }
        treeImageView.frame.size = CGSize(width: width, height: height)
    }
    
    @IBAction func filerAdjustSlider(_ sender: UISlider) {
        // 將UIImaget轉換CIImage物件
        let image = UIImage(named: "tree")
        let ciImage = CIImage(image: image!)
        // 產生製造濾鏡效果的 CIFilter 物件：呼叫 colorMonochrome() 產生單色濾鏡效果的 CIFilter
        let filter = CIFilter.colorMonochrome()
        // 設定CIFilter物件
        filter.inputImage = ciImage
        filter.color = CIColor.black
        filter.intensity = sender.value
        // 產生加濾鏡效果的圖片,並將它變成 UIImage
        if let outputCIImage = filter.outputImage {
            let filterImage = UIImage(ciImage: outputCIImage)
            treeImageView.image = filterImage
        }
    }
}
    
    


