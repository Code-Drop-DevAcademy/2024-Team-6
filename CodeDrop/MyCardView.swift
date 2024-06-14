//
//  MyCardView.swift
//  CodeDrop
//
//  Created by 신승아 on 6/15/24.
//

import SwiftUI

struct MyCardView: View {
    @State var isSharedPresented = false
    
    var body: some View {
        VStack {
            HStack {
                Text("내 카드")
                    .font(.largeTitle)
                    .bold()
                    
                Spacer()
                Image(systemName: "tray.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .onTapGesture {
                        // 보관함 버튼 클릭했을 떄
                    }
            }
            .padding()
            
            if UserDefaults.standard.name == nil || UserDefaults.standard.name == "" {
                // #1. 카드 없을 때
                Spacer()
                noCardView
                Spacer()
            } else {
               cardView
               
               Button(action: {
                   // Action for sharing the card
                   self.isSharedPresented = true
               }) {
                   HStack {
                       Image(systemName: "square.and.arrow.up")
                           .foregroundStyle(.white)
                       Text("공유하기")
                           .bold()
                           .foregroundStyle(.white)
                   }
                   .padding()
                   .frame(maxWidth: .infinity)
                   .background(.black)
                   .cornerRadius(10)
               }
               .sheet(
                   isPresented: $isSharedPresented,
                   onDismiss: { print("Dismiss") },
                   content: { ActivityViewController(activityItems: [cardView.asUIImage(size: CGSize(width: 353, height: 600))]) }
               )
               .padding()
            }
        }
    }
    
    private var noCardView: some View {
                    
        VStack(spacing: 10) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 34, height: 34)
                .foregroundStyle(.black)
                
            Text("카드 만들기")
                .font(.title2)
                .bold()
                        
            Text("약속을 위한 카드를 만들어보세요.")
                .font(.subheadline)
            }
            .onTapGesture {
                // 카드 만들기 버튼 클릭했을 때
            }
            .padding()
                
    }
    
    private var cardView: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.orange)
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(UserDefaults.standard.name ?? "")
                        .font(.title)
                        .bold()
                        .padding(.leading, 20)
                        .padding(.top, 20)
                        .foregroundStyle(.white)
                    
                    Spacer()
                        
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .padding(.top, 20)
                        .padding(.trailing, 20)
                        .foregroundStyle(.white)
                    
                }
                
                
                Spacer()
                
                Text("관심사")
                    .bold()
                    .padding(.leading, 20)
                    .foregroundStyle(.white)
                
                HStack {
                    ForEach(UserDefaults.standard.interested ?? [], id: \.self) { tag in
                        TagView(text: tag)
                    }
                }
                .padding(.bottom, 20)
                .padding(.leading, 20)
                
                Text("좋아하는 음식")
                    .bold()
                    .padding(.leading, 20)
                    .foregroundStyle(.white)
                
                HStack {
                    ForEach(UserDefaults.standard.likeFood ?? [], id: \.self) { tag in
                        TagView(text: tag)
                    }
                }
                .padding(.bottom, 20)
                .padding(.leading, 20)
            }
            
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .frame(height: 500)
    }
}

struct TagView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            .foregroundStyle(.white)
            .bold()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyCardView()
    }
}
