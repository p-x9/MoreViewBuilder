//
//  main.swift
//
//
//  Created by p-x9 on 2023/01/27.
//
//

import Foundation

enum CommandError: LocalizedError {
    case invalidArguments
}

func run() throws {
    let arguments = ProcessInfo().arguments

    guard arguments.count == 3 else {
        throw CommandError.invalidArguments
    }

    let outputPath = arguments[1]
    guard let max = Int(arguments[2]) else {
        throw CommandError.invalidArguments
    }

    let outputURL = URL(fileURLWithPath: outputPath)

    let generator = Generator(outputURL: outputURL, max: max)

    try generator.generate()
}

do {
    try run()
    exit(0)
} catch {
    exit(1)
}
