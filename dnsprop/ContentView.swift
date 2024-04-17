//
//  ContentView.swift
//  dnsprop
//
//  Created by Michael Neal on 4/16/24.
//

import SwiftUI

struct ContentView: View {
	@State private var url = ""
	@State private var IPs = [""]
	var body: some View {
		Form {
			HStack {
				TextField("URL", text: $url)
					.padding()
					.textFieldStyle(.roundedBorder)
				Button("Submit") {
					IPs = checkDNS(url)
				}
			}
			.padding()
		}
		VStack {
			ForEach(dataCenters, id: \.self) { dataCenter in
				locationView(dataCenter: dataCenter, status: statusState.online, IPs: ["10.0.0.200", "10.0.0.250"])
				
			}
			locationView(dataCenter: "US-West", status: statusState.online, IPs: IPs)
			locationView(dataCenter: "Offline", status: statusState.offline, IPs: IPs)
			locationView(dataCenter: "Checking", status: statusState.checking, IPs: IPs)
			locationView(dataCenter: "Waiting", status: statusState.waiting, IPs: IPs)
			locationView(dataCenter: "Can't Connect", status: statusState.cannotConnect, IPs: IPs)


		}
		.padding()
		Spacer()
    }
	
	
	private func checkDNS(_ url: String) -> [String] {
	var ipList: [String] = []
	let host = CFHostCreateWithName(nil,url as CFString).takeRetainedValue()
	CFHostStartInfoResolution(host, .addresses, nil)
	var success: DarwinBoolean = false
	if let addresses = CFHostGetAddressing(host, &success)?.takeUnretainedValue() as NSArray? {
		for case let theAddress as NSData in addresses {
			var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
			if getnameinfo(theAddress.bytes.assumingMemoryBound(to: sockaddr.self), socklen_t(theAddress.length),
						   &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0 {
				ipList.append(String(cString: hostname))
			}
		}
	}
	return ipList
	}
}

#Preview {
    ContentView()
}
