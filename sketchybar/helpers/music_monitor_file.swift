// Compile with this command:
// swiftc music_monitor_file.swift -o music_monitor_file
import Cocoa
import Foundation

class MusicMonitor {
    let outputFile = "/tmp/music_info.txt"
    var lastInfo: [AnyHashable: Any] = [:]
    
    init() {
        DistributedNotificationCenter.default().addObserver(
            self,
            selector: #selector(musicChanged),
            name: NSNotification.Name("com.apple.Music.playerInfo"),
            object: nil
        )
        
        DistributedNotificationCenter.default().addObserver(
            self,
            selector: #selector(musicChanged),
            name: NSNotification.Name("com.apple.iTunes.playerInfo"),
            object: nil
        )
    }
    
    @objc func musicChanged(_ notification: Notification) {
        guard let info = notification.userInfo else { return }
        
        let title = info["Name" as AnyHashable] as? String ?? ""
        let artist = info["Artist" as AnyHashable] as? String ?? ""
        let album = info["Album" as AnyHashable] as? String ?? ""
        let state = info["Player State" as AnyHashable] as? String ?? ""
        
        let content = """
        title:\(title)
        artist:\(artist)
        album:\(album)
        state:\(state)
        timestamp:\(Date())
        """
        
        try? content.write(toFile: outputFile, atomically: true, encoding: .utf8)
    }
}

let monitor = MusicMonitor()
RunLoop.current.run()
