//
//  InterestSelectView.swift
//  CodeDrop
//
//  Created by Hyun Jaeyeon on 6/15/24.
//

import SwiftUI

struct SelectView: View {

    let interests: [String]
    
    let maxSelections = 3
    
    @Binding var selectedInterests: [String]
    
    var body: some View {
        NavigationStack{
            FlowLayout(items: interests, itemContent: { interest in
                InterestCapsule(interest: interest, isSelected: selectedInterests.contains(interest)) {
                    toggleInterestSelection(interest)
                    print(selectedInterests)
                }
            }
            )
            .padding()
        }
        .padding(4)
    }
    
    private func toggleInterestSelection(_ interest: String) {
        if let index = selectedInterests.firstIndex(of: interest) {
            selectedInterests.remove(at: index)
        } else if selectedInterests.count < maxSelections {
            selectedInterests.append(interest)
        }
    }
    
}

//MARK: 유동적인 레이아웃을 구현하는 뷰
struct FlowLayout<Item: Identifiable, ItemView: View>: View {
    let items: [Item]
    let itemContent: (Item) -> ItemView
    
    init(items: [Item], @ViewBuilder itemContent: @escaping (Item) -> ItemView) {
        self.items = items
        self.itemContent = itemContent
    }
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ForEach(items) { item in
                    self.itemContent(item)
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > geometry.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if item.id == self.items.last!.id {
                                width = 0
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: { _ in
                            let result = height
                            if item.id == self.items.last!.id {
                                height = 0
                            }
                            return result
                        })
                }
            }
        }
    }
}

extension String: Identifiable {
    public var id: String { self }
}

struct InterestCapsule: View {
    let interest: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: isSelected ? "checkmark" : "plus")
                .fontWeight(.semibold)
            Text(interest)
                .fontWeight(.bold)
        }
        .fontWeight(.bold)
        .padding(.horizontal, 13)
        .padding(.vertical, 8)
        .background(isSelected ? Color.orange : Color.secondary.opacity(0.3))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .onTapGesture {
            action()
        }
    }
}
