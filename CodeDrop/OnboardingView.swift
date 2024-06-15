//
//  OnboardingView.swift
//  CodeDrop
//
//  Created by Hyun Jaeyeon on 6/15/24.
//

import SwiftUI

struct OnboardingView: View {
    
    private var onboardingTime = 2.0
    
    @State private var isNavigate: Bool = false
    
    var body: some View {
        NavigationStack{
            Image("Splash")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            NavigationLink(
                destination: MyCardView()
                    .navigationBarHidden(true),
                isActive: $isNavigate
            ) {
                EmptyView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + onboardingTime) {
                self.isNavigate = true
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
