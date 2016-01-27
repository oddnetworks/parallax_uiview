//
//  UIView+Parallax.swift
//  ParallaxView
//
//  Created by Patrick McConnell on 1/27/16.
//  Copyright © 2016 Patrick McConnell. All rights reserved.
//

import UIKit

extension UIView {
  
  func addParallaxMotionEffects(tiltValue : CGFloat = 0.25, panValue: CGFloat = 5) {
    
    var xTilt = UIInterpolatingMotionEffect()
    var yTilt = UIInterpolatingMotionEffect()
    
    var xPan = UIInterpolatingMotionEffect()
    var yPan = UIInterpolatingMotionEffect()
    
    let motionGroup = UIMotionEffectGroup()
    
    xTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.y", type: .TiltAlongHorizontalAxis)
    xTilt.minimumRelativeValue = -tiltValue
    xTilt.maximumRelativeValue = tiltValue
    
    yTilt = UIInterpolatingMotionEffect(keyPath: "layer.transform.rotation.x", type: .TiltAlongVerticalAxis)
    yTilt.minimumRelativeValue = -tiltValue
    yTilt.maximumRelativeValue = tiltValue
    
    xPan = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
    xPan.minimumRelativeValue = -panValue
    xPan.maximumRelativeValue = panValue
    
    yPan = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
    yPan.minimumRelativeValue = -panValue
    yPan.maximumRelativeValue = panValue
    
    motionGroup.motionEffects = [xTilt]
    self.addMotionEffect( motionGroup )
  }
}
