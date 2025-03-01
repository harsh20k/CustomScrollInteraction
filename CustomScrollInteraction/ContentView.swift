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
	}
	
	// Custom Scroll Indicator
}

#Preview {
    ContentView()
}
