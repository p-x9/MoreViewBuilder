//
//  plugin.swift
//
//
//  Created by p-x9 on 2023/01/27.
//
//

import Foundation
import PackagePlugin

@main
struct PrepareInfinitieViewBuilder: BuildToolPlugin {
    func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
        let executablePath = try! context.tool(named: "prepare-more-viewbuilder-bin").path

        let outputPath = context.package.directory.appending("Sources/MoreViewBuilder/")

        return [
            .prebuildCommand(
                displayName: "Prepare More ViewBuilder",
                executable: executablePath,
                arguments: [
                    outputPath.string,
                    100
                ],
                outputFilesDirectory: outputPath
            )
        ]
    }
}
