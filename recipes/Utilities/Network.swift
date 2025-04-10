//
//  Network.swift
//  internet
//
//  Created by Atirek Pothiwala on 01/02/25.
//


import Network
import SwiftUI

class Network: ObservableObject {
    @Published var isConnected = true
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    
    func monitorInternet() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                
                debugPrint("Network Status: \(path.status)")
                if path.status == .unsatisfied {
                    debugPrint("Network Unsatisfied:", path.unsatisfiedReason)
                }

                for interface in path.availableInterfaces {
                    debugPrint("Interface:", interface.type)
                }
                
                debugPrint("Is Expensive (Cellular):", path.isExpensive)
            }
        }
        monitor.start(queue: queue)
    }
    
    func checkInternet() {
        guard let url = URL(string: "https://www.apple.com") else { return }
        var request = URLRequest(url: url)
        request.timeoutInterval = 5

        URLSession.shared.dataTask(with: request) { _, response, _ in
            DispatchQueue.main.async {
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    self.isConnected = true
                } else {
                    self.isConnected = false
                }
            }
        }.resume()
    }
    
}
