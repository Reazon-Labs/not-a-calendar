import ProjectDescription

let project = Project(
    name: "NotACalendar",
    targets: [
        .target(
            name: "NotACalendar",
            destinations: .macOS,
            product: .app,
            bundleId: "dev.tuist.NotACalendar",
            infoPlist: .default,
            sources: ["NotACalendar/Sources/**"],
            resources: ["NotACalendar/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "NotACalendarTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "dev.tuist.NotACalendarTests",
            infoPlist: .default,
            sources: ["NotACalendar/Tests/**"],
            resources: [],
            dependencies: [.target(name: "NotACalendar")]
        ),
    ]
)
