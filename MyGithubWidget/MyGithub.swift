//
//  MyGithub.swift
//  MyGithub
//
//  Created by Lê Hoàng Anh on 10/03/2021.
//

import WidgetKit
import SwiftUI
import Intents


struct ContributionGraphEntry: TimelineEntry {
    let date: Date
    let days: [DevelopmentDay]
}

struct Provider: TimelineProvider {

    var dummyEntry: ContributionGraphEntry {
        let now = Date()
        let days = (0..<119).map { index -> DevelopmentDay in
            let date = Calendar.current.date(
                byAdding: .day,
                value: -index,
                to: now)!

            return DevelopmentDay(date: date, dataCount: 0)
        }
        return ContributionGraphEntry(date: now, days: days)
    }

    func placeholder(in context: Context) -> ContributionGraphEntry {
        dummyEntry
    }

    func getSnapshot(in context: Context, completion: @escaping (ContributionGraphEntry) -> Void) {
        completion(dummyEntry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ContributionGraphEntry>) -> Void) {
        GithubParser.getDevelopmentDays(for: "anhlh1706") { days in
            let entry = ContributionGraphEntry(date: Date(), days: days)
            let timeline = Timeline(
                entries: [entry],
                policy: TimelineReloadPolicy.after(Calendar.current.date(byAdding: .day, value: 1, to: Date())!))

            completion(timeline)
        }
    }
}

struct WidgetEntryView: View {
    
    let entry: Provider.Entry
    
    var body: some View {
        ContributionsGraphView(days: entry.days, selectedDay: { _ in })
    }
}


@main
struct ContributionGraphWidget: Widget {
    
    private let kind = "Github_Widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
