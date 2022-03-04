//
//  LottieView.swift
//  Mit_Assi1_Animation
//
//  Created by user215540 on 3/2/22.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    @Binding var animationInProgress: Bool
    
    func makeUIView(context: Context) -> some AnimationView {
        let view = AnimationView(name: "likeblue")
        view.frame = CGRect(x: 0, y: 0, width:200, height: 200)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.play { complete in
            if complete {
                animationInProgress = false
            }
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
