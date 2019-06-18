//
//  EventMonitor.swift
//  Quotes
//
//  Created by Will Kim on 6/19/19.
//  Copyright © 2019 Will Kim. All rights reserved.
//

import Cocoa

public class EventMonitor {
    private var monitor: Any?
    private var mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void
    
    public init(mask: NSEvent.EventTypeMask, handler:@escaping (NSEvent?) -> Void) {
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}

