//
//  FoodSelectView.swift
//  CodeDrop
//
//  Created by Hyun Jaeyeon on 6/15/24.
//

import SwiftUI

struct FoodSelectView: View {
    
    @State private var selectedFoods: [String] = []
    
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        VStack{
            SelectView(interests: ["피자", "파스타", "스테이크", "샐러드", "스시",
                                   "햄버거", "카레", "타코", "감바스", "라면",
                                   "갈비", "샌드위치", "간장게장", "초밥", "팟타이",
                                   "팬케이크", "떡볶이", "라멘", "라자냐", "치킨"
                                  ], selectedInterests: $selectedFoods)
        }
        .navigationBarTitle("좋아하는 음식을 선택하세요")
        
        HStack {
            Button(action: {
                isShowingSheet.toggle()
            }, label: {
                Text("취소")
            })
            .frame(width: 171, height: 56)
            .foregroundColor(.secondary)
            .fontWeight(.bold)
            .background(Color.secondary.opacity(0.4))
            .cornerRadius(10)
            
            Button(action: {
                UserDefaults.standard.set(selectedFoods, forKey: "foods")
            }, label: {
                Text("완료")
            })
            .frame(width: 170, height: 56)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .background(Color.primary)
            .cornerRadius(10)
        }
    }
}

//#Preview {
//    FoodSelectView()
//}
