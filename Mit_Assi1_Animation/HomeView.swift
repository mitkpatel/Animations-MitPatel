//
//  HomeView.swift
//  Mit_Assi1_Animation
//
//  Created by user215540 on 2/24/22.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow,.red]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .offset(dragAmount)
            .gesture(
            DragGesture()
                .onChanged{ self.dragAmount = $0.translation}
                .onEnded{ _ in self.dragAmount = .zero}
            )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
