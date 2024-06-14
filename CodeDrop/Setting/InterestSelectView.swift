//
//  InterestSelectView.swift
//  CodeDrop
//
//  Created by Hyun Jaeyeon on 6/15/24.
//

import SwiftUI

struct InterestSelectView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: FoodSelectView()) {
                Text("음식 선택뷰로 가기")
            }
            .navigationBarTitle("관심사 선택")
        }
        
    }
}

#Preview {
    InterestSelectView()
}
