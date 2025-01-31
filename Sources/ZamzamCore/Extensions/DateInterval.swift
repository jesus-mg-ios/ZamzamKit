//
//  DateInterval.swift
//  ZamzamCore
//
//  Created by Basem Emara on 2021-04-22.
//  Copyright © 2021 Zamzam Inc. All rights reserved.
//

import Foundation.NSDateInterval

public extension DateInterval {
    /// Returns remaining progress between the date interval.
    var progress: (value: Double, remaining: TimeInterval) {
        progress(at: Date())
    }

    /// Returns remaining progress between the date interval for a specified date.
    func progress(at date: Date) -> (value: Double, remaining: TimeInterval) {
        let remaining = max(0, end.timeIntervalSince(date))

        guard duration != 0, remaining != 0 else {
            return (date >= end ? 1 : 0, remaining)
        }

        guard date >= start else {
            return (0, remaining)
        }

        return (min(remaining / duration, 1), remaining)
    }
}

public extension DateInterval {
    /// Returns dates between the range that are offset.
    /// - Parameter timeInterval: The time interval to offset the dates by.
    func stride(by timeInterval: TimeInterval) -> [Date] {
        // https://stackoverflow.com/q/68398429
        (0...Int(end.timeIntervalSince(start) / timeInterval))
            .map { start.advanced(by: TimeInterval($0) * timeInterval) }
    }
}
