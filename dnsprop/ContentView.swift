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
			locationView(dataCenter: "US-West", status: statusState.online, IPs: ["10.0.0.2", "10.0.0.3"])
			locationView(dataCenter: "US-West", status: statusState.offline, IPs: [""])

		}
		.padding()
		Spacer()
    }
}

#Preview {
    ContentView()
}
