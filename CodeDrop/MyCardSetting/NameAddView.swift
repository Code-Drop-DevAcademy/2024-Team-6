//
//  NameAddView.swift
//  CodeDrop
//
//  Created by Hyun Jaeyeon on 6/15/24.
//

import SwiftUI

struct NameAddView: View {
    
    @State var name = ""
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
                    
                    NavigationLink(destination: InterestSelectView(isShowingSheet: $isShowingSheet)) {
                        Text("다음으로")
                    }
                    .frame(width: 170, height: 56)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .background(Color.primary)
                    .cornerRadius(10)
                    .onTapGesture {
                        UserDefaults.standard.set(name, forKey: "name")
                    }
                }
            }
            .navigationTitle("이름을 입력해주세요")
        }
    }
}
