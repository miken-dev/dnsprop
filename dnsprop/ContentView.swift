//
//  ContentView.swift
//  dnsprop
//
//  Created by Michael Neal on 4/16/24.
//

import SwiftUI

struct ContentView: View {
	@State private var url = ""
    var body: some View {
		Form {
			HStack {
			TextField("URL", text: $url)
				.padding()
				.textFieldStyle(.roundedBorder)
				Button("Submit") {
					//Do stuff
				}
			}
			.padding()
		}
		VStack {
			locationView(dataCenter: "US-West", status: true, firstIP: "10.0.0.1", secondIP: "10.0.0.2")
			locationView(dataCenter: "US-East", status: true, firstIP: "10.0.0.1", secondIP: "10.0.0.2")
			locationView(dataCenter: "Canada-West", status: false, firstIP: "10.0.0.1")
			locationView(dataCenter: "Canada-East", status: true, firstIP: "10.0.0.1")
			
		}
		.padding()
		Spacer()
    }
}

#Preview {
    ContentView()
}
