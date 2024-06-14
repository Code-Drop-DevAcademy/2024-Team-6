//
//  StorageView.swift
//  CodeDrop
//
//  Created by 조우현 on 6/15/24.
//

import SwiftUI

// Identifiable을 준수하는 Card 구조체 정의
struct Card: Identifiable {
    let id = UUID()
    let name: String
}

struct StorageView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isThereAnyCard = false
    // 카드를 탭하면 해당 카드를 전체화면으로 보여주기 위한 프로퍼티
    @State private var selectedCard: Card? = nil

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let cards = [
        Card(name: "SampleCard1"),
        Card(name: "SampleCard2"),
        Card(name: "SampleCard3"),
        Card(name: "SampleCard4")
    ]
    
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
                        ForEach(cards) { card in
                            Image(card.name)
                                .resizable()
                                .frame(width: 170, height: 240)
                                .onTapGesture {
                                    selectedCard = card
                                }
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
                .fullScreenCover(item: $selectedCard) { card in
                    ZStack {
                        Color.black.ignoresSafeArea()
                        Image(card.name)
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                selectedCard = nil
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    StorageView()
}
