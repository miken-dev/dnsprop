//
//  locationViews.swift
//  dnsprop
//
//  Created by Michael Neal on 4/16/24.
//

import SwiftUI

enum statusState {
	case online, offline, checking, cannotConnect, waiting
}
struct locationView: View {

	var dataCenter: String
	var status: statusState
	var IPs: [String]
	var body: some View {
		HStack {
			Text("\(dataCenter):")
			Spacer()
			if status == statusState.offline {
				Image(systemName: "network.slash")
					.foregroundColor(.red)
			}
			if status == statusState.cannotConnect {
				Image(systemName: "exclamationmark.magnifyingglass")
					.foregroundColor(.red)
			}
			if status == statusState.online {
				VStack {
					ForEach (IPs, id: \.self) { ip in
						HStack {
							Spacer()
							Text(ip)
							Image(systemName: "network")
								.foregroundColor(.green)
						}
					}
				}
			}
			if status == statusState.checking {
				ProgressView()
					.controlSize(.small)
			}
		}
		.padding(5)
    }
}

#Preview {
	locationView(dataCenter: "US-West", status: statusState.waiting, IPs: ["10.0.0.1", "10.0.0.2"])
}
