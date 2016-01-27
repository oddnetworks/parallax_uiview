//
//  ParallaxView.swift
//  ParallaxView
//
//  Created by Patrick McConnell on 1/27/16.
//  Copyright © 2016 Patrick McConnell. All rights reserved.
//

import UIKit

class ParallaxView: UIView {
  
  override func canBecomeFocused() -> Bool {
    return true
  }
  
  func becomeFocusedUsingAnimationCoordinator(coordinator: UIFocusAnimationCoordinator) {
    coordinator.addCoordinatedAnimations({ () -> Void in
      self.transform = CGAffineTransformMakeScale(1.1, 1.1)
      self.layer.shadowColor = UIColor.blackColor().CGColor
      self.layer.shadowOffset = CGSizeMake(10, 10)
      self.layer.shadowOpacity = 0.2
      self.layer.shadowRadius = 5
    }) { () -> Void in
    }
  }
  
  func resignFocusUsingAnimationCoordinator(coordinator: UIFocusAnimationCoordinator) {
    coordinator.addCoordinatedAnimations({ () -> Void in
      self.transform = CGAffineTransformIdentity
      self.layer.shadowColor = nil
      self.layer.shadowOffset = CGSizeZero
    }) { () -> Void in
    }
  }
  
  override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
    super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)
    
    guard let nextFocusedView = context.nextFocusedView else { return }
    
    if nextFocusedView == self {
      self.becomeFocusedUsingAnimationCoordinator(coordinator)
      self.addParallaxMotionEffects()
    } else {
      self.resignFocusUsingAnimationCoordinator(coordinator)
      self.motionEffects = []
    }
  }
  
}
