//
//  iOSConnectivity.swift
//  Watch-Animation Watch App
//
//  Created by Evan Tanuwijaya on 10/04/25.
//

import Foundation
import WatchConnectivity

class iOSConnectivity: NSObject, WCSessionDelegate, ObservableObject{
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
    }
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func sendToiOS(data: SessionRecord){
        if session.isReachable{
            let dataToSend: [String: Any] = [
                "start": data.start,
                "end": data.end
            ]
            
            session.sendMessage(dataToSend, replyHandler: nil) { error in
                print("Error sending message: \(error.localizedDescription)")
            }
        }else{
            print("Session is not reachable")
        }
    }
    
}
