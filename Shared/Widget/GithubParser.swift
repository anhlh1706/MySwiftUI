//
//  GithubParser.swift
//  MySwiftUI (iOS)
//
//  Created by Lê Hoàng Anh on 10/03/2021.
//

import Foundation

enum GithubParser {
    static func getDevelopmentDays(for username: String, completion: @escaping ([DevelopmentDay]) -> Void) {
        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
        
//        do {
//            let url = URL(string: "https://github.com/\(username)")!
//            let html = try String(contentsOf: url)
//            let doc = try SwiftSoup.parse(html)
//            let dayElements = try doc.getElementsByClass("ContributionCalendar-day")
            
//            let developmentDays = dayElements.compactMap { element -> DevelopmentDay? in
//                guard let dateString = try? element.attr("data-date"),
//                      let date = formatter.date(from: dateString),
//                      let dataCountString = try? element.attr("data-count"),
//                      let dataCount = Int(dataCountString)
//                else { return nil }
//
//                return DevelopmentDay(date: date, dataCount: dataCount)
//            }
//
//            let thisSaturday = Calendar.current.nextDate(
//                after: Date(),
//                matching: DateComponents(weekday: 7),
//                matchingPolicy: .nextTime)!
//
//            let _17WeekAgo = Calendar.current.date(
//                byAdding: .weekOfMonth,
//                value: -17,
//                to: thisSaturday)!
//
//            let last17Weeks = developmentDays.filter { $0.date > _17WeekAgo }
//
//            completion(last17Weeks)
//        } catch {
//            print(error)
//        }
    }
}
