//
//  InterestSelectView.swift
//  CodeDrop
//
//  Created by Hyun Jaeyeon on 6/15/24.
//

import SwiftUI

struct InterestSelectView: View {
    
    @State var navigateToNext = false
    @State private var selectedInterests: [String] = []
    
    @Binding var isShowingSheet: Bool

    var body: some View {        
        VStack{
            SelectView(interests: ["야구", "축구", "사진", "여행", "독서", "음악", "영화", "요리", "커피", "술 한 잔", "예술", "테크놀로지", "게임", "자전거", "등산", "피트니스", "요가", "드라마", "패션", "동물"],
            selectedInterests: $selectedInterests)
            
            Text("관심사는 최대 3개까지 선택할 수 있습니다.")
                .foregroundStyle(.secondary)
                .font(.subheadline)
                .padding()
            
            Spacer()
            
            
            HStack {
                Button("취소") {
                    isShowingSheet.toggle()
                }
                .frame(width: 171, height: 56)
                .foregroundColor(.secondary)
                .fontWeight(.bold)
                .background(Color.secondary.opacity(0.4))
                .cornerRadius(10)
                
                Button(action: {
                    navigateToNext.toggle()
                    UserData.interested = selectedInterests
                }, label: {
                    Text("다음으로")
                })
                .frame(width: 170, height: 56)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .background(Color.primary)
                .cornerRadius(10)
                
                NavigationLink(destination: FoodSelectView(isShowingSheet: $isShowingSheet), isActive: $navigateToNext) {
                    EmptyView()
                }
            }
        }
        .navigationBarTitle("관심사를 선택하세요")
    }
}
