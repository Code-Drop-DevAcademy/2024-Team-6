//
//  NameAddView.swift
//  CodeDrop
//
//  Created by Hyun Jaeyeon on 6/15/24.
//

import SwiftUI

struct NameAddView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: InterestSelectView()) {
                Text("관심사 선택뷰로 가기")
            }
            .navigationBarTitle("이름 입력")
        }
        
    }
}

#Preview {
    NameAddView()
}
