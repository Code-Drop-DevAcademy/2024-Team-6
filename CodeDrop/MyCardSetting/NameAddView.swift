//
//  NameAddView.swift
//  CodeDrop
//
//  Created by Hyun Jaeyeon on 6/15/24.
//

import SwiftUI

class UserData {
    static var name: String = ""
    static var interested: [String] = []
    static var likeFood: [String] = []
}

struct NameAddView: View {
    
    @State var name = ""
    @State private var navigateToNext = false
    @Binding var isShowingSheet: Bool
    
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("이름을 입력해주세요", text: $name)
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
                        UserData.name = name
                        print("UserData Print: \(UserData.name), \(name)")
                    }, label: {
                        Text("다음으로")
                    })
                    .frame(width: 170, height: 56)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .background(Color.primary)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: InterestSelectView(isShowingSheet: $isShowingSheet), isActive: $navigateToNext) {
                        EmptyView()
                    }
                }
            }
            .navigationTitle("이름을 입력해주세요")
        }
    }
}
