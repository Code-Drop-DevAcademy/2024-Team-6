//
//  StorageView.swift
//  CodeDrop
//
//  Created by 조우현 on 6/15/24.
//

import SwiftUI

struct StorageView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isThereAnyCard = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let cards = ["SampleCard1", "SampleCard2", "SampleCard3", "SampleCard4"]
    
    var body: some View {
        NavigationStack {
            if isThereAnyCard == false {
                VStack {
                    // 이 버튼을 누르면 샘플카드가 보여집니다.
                    Button {
                        isThereAnyCard.toggle()
                    } label: {
                        Image(systemName: "tray.fill")
                            .resizable()
                            .frame(width: 42, height: 34)
                            .foregroundStyle(.gray)
                            .padding()
                    }
                    Text("카드 없음")
                        .font(.title3.bold())
                    Text("공유받은 카드가 여기에 보관됩니다.")
                        .font(.subheadline)
                }
                .navigationTitle("보관함")
                .toolbar {
                    Button {
                        dismiss()
                    } label: {
                        Text("닫기")
                    }
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(cards, id: \.self) { card in
                            Image("\(card)")
                                .resizable()
                                .frame(width: 171, height: 242)
                        }
                    }
                    .padding()
                    .navigationTitle("보관함")
                }
                .toolbar {
                    Button {
                        dismiss()
                    } label: {
                        Text("닫기")
                    }
                }
            }
        }
    }
}

#Preview {
    StorageView()
}
