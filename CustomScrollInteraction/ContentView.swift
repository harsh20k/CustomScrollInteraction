//
//  ContentView.swift
//  CustomScrollInteraction
//
//  Created by harsh  on 01/03/25.
//

import SwiftUI

struct ContactSection: Identifiable {
	var id: String
	var contacts: [Contact]
	
	static func generateData() -> [ContactSection] {
		Dictionary(grouping: dummyContacts) {
			String($0.name.first ?? "A")
		}.compactMap {
			.init(id: $0.key, contacts: $0.value)
		}.sorted { $0.id < $1.id }
	}
}

struct ContentView: View {
	@State private var sections: [ContactSection] = ContactSection.generateData()
	
	// Scroll Properties
	@State private var scrollProperties: ScrollGeometry = .init(
		contentOffset: .zero,
		contentSize: .zero,
		contentInsets: .init(),
		containerSize: .zero
	)
	// Scroll phase that provides the state of the scroll,
	// WHether its active, idle, animating or decelerating.. showing the popout when the scroll is active
	@State private var scrollPhase: ScrollPhase = .idle
	@State private var scrollPosition: ScrollPosition = .init()
	// Gesture properties
	@State private var previousScrollProgress: CGFloat?
	@GestureState private var isGestureActive: Bool = false
	@State private var activeID: String = "A"
	
	var body: some View {
		NavigationStack {
			ScrollView(.vertical) {
				VStack(spacing: 12) {
					ForEach(sections) { section in
						SectionView(section)
					}
				}
				.padding(20)
			}
			.background(.gray.opacity(0.15))
			.navigationTitle("Contacts")
			.scrollIndicators(.hidden)
			.onScrollGeometryChange(for: ScrollGeometry.self) {
				$0
			} action: { oldValue, newValue in
				scrollProperties = newValue
			}
			.onScrollPhaseChange { oldPhase, newPhase in
				scrollPhase = newPhase
			}
			.scrollPosition($scrollPosition)
		}
		.overlay(alignment: .trailing) {
			CustomeScrollIndicator()
		}
    }
	
	func SectionView(_ section: ContactSection) -> some View {
		VStack(alignment: .leading, spacing: 10) {
			Text(section.id)
				.font(.largeTitle.bold())
			
			VStack(alignment: .leading, spacing: 15) {
				ForEach(section.contacts) { contact in
					Text(contact.name)
						.frame(maxWidth: .infinity, alignment: .leading)
					
					// Avoiding Divider for last item
					if contact.id != section.contacts.last?.id {
						Divider()
					}
				}
			}
		}
		.padding(15)
		.background(.background, in: .rect(cornerRadius: 10))
		.onGeometryChange(for: CGRect.self) {
			$0.frame(in: .scrollView(axis: .vertical))
		} action: { newValue in
			// At Top
			if newValue.minY >= 0 && newValue.minY < 150 {
				activeID = section.id
			}
		}

	}
	
	// Custom Scroll Indicator
	func CustomeScrollIndicator() -> some View {
		GeometryReader { geometry in
			let indicatorHeight: CGFloat = 40
			// Calculating Progress
			// Also limiting from 0-1
			let scrollProgress = max(min(scrollProperties.scrollOffsetY / scrollProperties.contentHeight,1), 0)
			// Calculating Indicator offset
			// Since the offset starts from the top
			let indicatorOffset = (geometry.size.height - indicatorHeight) * scrollProgress
			let showPopup = scrollPhase != .idle || isGestureActive
			
			ZStack(alignment: .top) {
				Capsule()
					.fill(.background.shadow(.drop(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)))
					.padding(.trailing, 5)
				
				Capsule()
					.fill(.blue.gradient)
					.frame(height: indicatorHeight)
					.padding(.trailing, 5)
					.offset(y: indicatorOffset)
					.contentShape(.rect)
					.highPriorityGesture(
						DragGesture(minimumDistance: 0, coordinateSpace: .named("INDICATORVIEW"))
							.updating($isGestureActive, body: { _VAlignment, out, _ in
								out = true
							})
							.onChanged{ value in
								if previousScrollProgress == nil {
									previousScrollProgress = scrollProgress
								}
								
								guard let previousScrollProgress else { return }
								// Calculating Drag Progress
								let dragProgress = value.translation.height / (geometry.size.height - indicatorHeight)
								let endProgress = max(min(previousScrollProgress + dragProgress, 1),0)
								
								// Scrolling content
								scrollPosition.scrollTo(y: endProgress * scrollProperties.contentHeight)
							}
					)
					.offset(y: indicatorOffset)
					.onChange(of: isGestureActive) { oldValue, newValue in
						if !newValue {
							previousScrollProgress = nil
						}
					}
			}
			.overlay(alignment: .topLeading) {
				if showPopup {
					UnevenRoundedRectangle(
						topLeadingRadius: 50,
						bottomLeadingRadius: 50,
						bottomTrailingRadius: 5,
						topTrailingRadius: 50,
						style: .continuous
					)
					.fill(.blue.gradient)
					.frame(width: 50, height: 50)
					.overlay{
						Text(activeID)
							.font(.title.bold())
							.foregroundStyle(.white)
					}
					.compositingGroup()
					.offset(x: -55, y: indicatorOffset - 10)
				}
			}
			.animation(.easeInOut(duration: 0.25), value: showPopup)
		}
		.frame(width: 13)
		.containerRelativeFrame(.vertical) { value, _ in
			value * 0.5
		}
		.coordinateSpace(.named("INDICATORVIEW"))
	}
}

extension ScrollGeometry {
	var scrollOffsetY: CGFloat {
		contentOffset.y + contentInsets.top
	}
	
	var contentHeight: CGFloat {
		contentSize.height - containerSize.height
	}
}

#Preview {
    ContentView()
}
