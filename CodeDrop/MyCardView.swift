//
//  MyCardView.swift
//  CodeDrop
//
//  Created by 신승아 on 6/15/24.
//

import SwiftUI
import SwiftData

struct MyCardView: View {
    @Environment(\.modelContext) var modelContext
    @State var isSharedPresented = false
    @State var isShowingSheet = false
    @State var showStorageView = false
    @State var showingAlert = false
    @State var sharedImage: UIImage?
    @Query private var userInfo: [RecordModel]

    var name: String {
        return userInfo.first?.name ?? ""
    }

    var likeFood: [String] {
        return userInfo.first?.likeFoods ?? []
    }

    var interest: [String] {
        return userInfo.first?.interestedThings ?? []
    }

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
                        showStorageView.toggle()
                    }
            }
            .padding()

            if name.isEmpty && interest.isEmpty && likeFood.isEmpty {
                Spacer()
                noCardView
                Spacer()
            } else {
                cardView

                Button(action: {
                    let image = cardView.asUIImage(size: CGSize(width: 363, height: 570))
                    sharedImage = image
                    isSharedPresented.toggle()
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
                .padding()
            }
        }
        .alert("정말 삭제하시겠습니까?", isPresented: $showingAlert) {
            Button("네", role: .destructive) {
                deleteRecord()
            }
            Button("아니오", role: .cancel) {}
        }
        .sheet(isPresented: $showStorageView) {
            StorageView()
        }
        .sheet(isPresented: $isSharedPresented) {
            
            if let sharedImage = sharedImage {
                ActivityViewController(activityItems: [sharedImage])
            }
//            StorageView()
        }
        .onAppear {
            print("\(name), \(likeFood), \(interest)")
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
            isShowingSheet.toggle()
        }
        .sheet(isPresented: $isShowingSheet) {
            NameAddView(isShowingSheet: $isShowingSheet)
        }
        .padding()
    }

    private var cardView: some View {
        ZStack {
            Image("myCardImage")
                .resizable()
                .scaledToFill()
                .frame(width: 353, height: 500)
                .clipped()
                .cornerRadius(12)

            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.title)
                        .bold()
                        .padding(.leading, 20)
                        .padding(.top, 20)
                        .foregroundStyle(.white)

                    Spacer()

                    Menu {
                        Button(role: .destructive, action: showAlert) {
                            Label("삭제하기", systemImage: "trash")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.title)
                            .padding(.top, 20)
                            .padding(.trailing, 20)
                            .foregroundStyle(.white)
                    }
                }

                Spacer()

                Text("관심사")
                    .bold()
                    .padding(.leading, 20)
                    .foregroundStyle(.white)

                HStack {
                    ForEach(interest, id: \.self) { tag in
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
                    ForEach(likeFood, id: \.self) { tag in
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

    func showAlert() {
        showingAlert = true
    }

    func deleteRecord() {
        if let record = userInfo.first {
            modelContext.delete(record)
        }
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
