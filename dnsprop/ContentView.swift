//
//  ContentView.swift
//  dnsprop
//
//  Created by Michael Neal on 4/16/24.
//

import SwiftUI

struct ContentView: View {
	@State private var url = ""
	var dataCenters = ["US-East", "US-West", "Canada-East", "Canada-West", "England", "Spain", "Japan"]
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
			ForEach(dataCenters, id: \.self) { dataCenter in
				locationView(dataCenter: dataCenter, status: statusState.online, IPs: ["10.0.0.200", "10.0.0.250"])
				
			}
			locationView(dataCenter: "US-West", status: statusState.online, IPs: ["10.0.0.2", "10.0.0.3"])
			locationView(dataCenter: "Offline", status: statusState.offline, IPs: [""])
			locationView(dataCenter: "Checking", status: statusState.checking, IPs: [""])
			locationView(dataCenter: "Waiting", status: statusState.waiting, IPs: [""])
			locationView(dataCenter: "Can't Connect", status: statusState.cannotConnect, IPs: [""])


		}
		.padding()
		Spacer()
    }
}

#Preview {
    ContentView()
}
