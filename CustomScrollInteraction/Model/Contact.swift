//
//  Contact.swift
//  CustomScrollInteraction
//
//  Created by harsh  on 01/03/25.
//

import SwiftUI

struct Contact: Identifiable {
	var id: String = UUID().uuidString
	let name: String
	let email: String
}

let dummyContacts: [Contact] = [
	Contact(name: "Alice Anderson", email: "alice.anderson@example.com"),
	Contact(name: "Bob Brown", email: "bob.brown@example.com"),
	Contact(name: "Charlie Carter", email: "charlie.carter@example.com"),
	Contact(name: "David Davis", email: "david.davis@example.com"),
	Contact(name: "Evelyn Evans", email: "evelyn.evans@example.com"),
	Contact(name: "Frank Foster", email: "frank.foster@example.com"),
	Contact(name: "Grace Green", email: "grace.green@example.com"),
	Contact(name: "Henry Harris", email: "henry.harris@example.com"),
	Contact(name: "Isla Irving", email: "isla.irving@example.com"),
	Contact(name: "Jack Johnson", email: "jack.johnson@example.com"),
	Contact(name: "Kelly King", email: "kelly.king@example.com"),
	Contact(name: "Liam Lewis", email: "liam.lewis@example.com"),
	Contact(name: "Mia Martinez", email: "mia.martinez@example.com"),
	Contact(name: "Noah Nelson", email: "noah.nelson@example.com"),
	Contact(name: "Olivia Owens", email: "olivia.owens@example.com"),
	Contact(name: "Paul Parker", email: "paul.parker@example.com"),
	Contact(name: "Quinn Quinn", email: "quinn.quinn@example.com"),
	Contact(name: "Rachel Reed", email: "rachel.reed@example.com"),
	Contact(name: "Samuel Scott", email: "samuel.scott@example.com"),
	Contact(name: "Tina Turner", email: "tina.turner@example.com"),
	Contact(name: "Ursula Underwood", email: "ursula.underwood@example.com"),
	Contact(name: "Victor Vega", email: "victor.vega@example.com"),
	Contact(name: "Wendy Watson", email: "wendy.watson@example.com"),
	Contact(name: "Xander Xavier", email: "xander.xavier@example.com"),
	Contact(name: "Yvonne Young", email: "yvonne.young@example.com"),
	Contact(name: "Zachary Zimmerman", email: "zachary.zimmerman@example.com"),
	Contact(name: "Aaron Adams", email: "aaron.adams@example.com"),
	Contact(name: "Bethany Brooks", email: "bethany.brooks@example.com"),
	Contact(name: "Caleb Collins", email: "caleb.collins@example.com"),
	Contact(name: "Diana Dawson", email: "diana.dawson@example.com"),
	Contact(name: "Ethan Edwards", email: "ethan.edwards@example.com"),
	Contact(name: "Fiona Fisher", email: "fiona.fisher@example.com"),
	Contact(name: "George Grant", email: "george.grant@example.com"),
	Contact(name: "Hannah Hayes", email: "hannah.hayes@example.com"),
	Contact(name: "Ian Ingram", email: "ian.ingram@example.com"),
	Contact(name: "Julia James", email: "julia.james@example.com"),
	Contact(name: "Kevin Kennedy", email: "kevin.kennedy@example.com"),
	Contact(name: "Laura Lopez", email: "laura.lopez@example.com"),
	Contact(name: "Michael Morgan", email: "michael.morgan@example.com"),
	Contact(name: "Natalie Newton", email: "natalie.newton@example.com"),
	Contact(name: "Oscar Owens", email: "oscar.owens@example.com"),
	Contact(name: "Patricia Perez", email: "patricia.perez@example.com"),
	Contact(name: "Quentin Quinn", email: "quentin.quinn@example.com"),
	Contact(name: "Rebecca Rogers", email: "rebecca.rogers@example.com"),
	Contact(name: "Steven Stewart", email: "steven.stewart@example.com"),
	Contact(name: "Teresa Thompson", email: "teresa.thompson@example.com"),
	Contact(name: "Ulysses Underwood", email: "ulysses.underwood@example.com"),
	Contact(name: "Vincent Vaughn", email: "vincent.vaughn@example.com"),
	Contact(name: "Wanda Williams", email: "wanda.williams@example.com"),
	Contact(name: "Xavier Xander", email: "xavier.xander@example.com"),
	Contact(name: "Yasmine Young", email: "yasmine.young@example.com"),
	Contact(name: "Zane Zimmerman", email: "zane.zimmerman@example.com")]

