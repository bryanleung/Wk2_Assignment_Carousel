//
//  IntroViewController.swift
//  Wk2_Assignment_Carousel
//
//  Created by Bryan Leung on 2/12/15.
//  Copyright (c) 2015 Bryan Leung. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introTile1: UIImageView!
    @IBOutlet weak var introTile2: UIImageView!
    @IBOutlet weak var introTile3: UIImageView!
    @IBOutlet weak var introTile4: UIImageView!
    @IBOutlet weak var introTile5: UIImageView!
    @IBOutlet weak var introTile6: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -380, -480, -480]
    var xOffsets : [Float] = [-70, 35, 16, 10, -40, -95]
    var scales : [Float] = [1, 1.9, 1.9, 1.9, 1.9, 1.9]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view: UIView!, atIndex index : Int, offset: Float){
    }
    
    func updateViewTransformsWithOffset(offset: Float){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width:320, height:1136)
        scrollView.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        carouselTransform0()
        carouselTransform1()
        carouselTransform2()
        carouselTransform3()
        carouselTransform4()
        carouselTransform5()
    }

    func carouselTransform0()
    {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[0], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[0], r2Max: 0)
        
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[0], r2Max: 1)
        
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[0], r2Max: 0)
        
        introTile1.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        introTile1.transform = CGAffineTransformScale(introTile1.transform, CGFloat(scale), CGFloat(scale))
        introTile1.transform = CGAffineTransformRotate(introTile1.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func carouselTransform1()
    {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[1], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[1], r2Max: 0)
        
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[1], r2Max: 1)
        
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[1], r2Max: 0)
        
        introTile2.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        introTile2.transform = CGAffineTransformScale(introTile2.transform, CGFloat(scale), CGFloat(scale))
        introTile2.transform = CGAffineTransformRotate(introTile2.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func carouselTransform2()
    {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[2], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[2], r2Max: 0)
        
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[2], r2Max: 1)
        
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[2], r2Max: 0)
        
        introTile3.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        introTile3.transform = CGAffineTransformScale(introTile3.transform, CGFloat(scale), CGFloat(scale))
        introTile3.transform = CGAffineTransformRotate(introTile3.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func carouselTransform3()
    {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[3], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[3], r2Max: 0)
        
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[3], r2Max: 1)
        
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[3], r2Max: 0)
        
        introTile4.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        introTile4.transform = CGAffineTransformScale(introTile4.transform, CGFloat(scale), CGFloat(scale))
        introTile4.transform = CGAffineTransformRotate(introTile4.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func carouselTransform4()
    {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[4], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[4], r2Max: 0)
        
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[4], r2Max: 1)
        
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[4], r2Max: 0)
        
        introTile5.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        introTile5.transform = CGAffineTransformScale(introTile5.transform, CGFloat(scale), CGFloat(scale))
        introTile5.transform = CGAffineTransformRotate(introTile5.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    func carouselTransform5()
    {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[5], r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[5], r2Max: 0)
        
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[5], r2Max: 1)
        
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[5], r2Max: 0)
        
        introTile6.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        introTile6.transform = CGAffineTransformScale(introTile6.transform, CGFloat(scale), CGFloat(scale))
        introTile6.transform = CGAffineTransformRotate(introTile6.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
}
