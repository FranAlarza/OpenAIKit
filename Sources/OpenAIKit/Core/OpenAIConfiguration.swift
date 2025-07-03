//
//  OpenAIConfiguration.swift
//  OpenAIKit
//
//  Created by Fran Alarza on 3/7/25.
//

import Foundation

/// Holds all configuration needed to initialize the SDK.
public struct OpenAIConfiguration {
    /// Your OpenAI API key.
    public let apiKey: String
    /// Base URL for the OpenAI API.
    public let baseURL: URL
    /// Request timeout interval (in seconds).
    public let timeout: TimeInterval

    /// Initializes the configuration.
    /// - Parameters:
    ///   - apiKey: Your OpenAI API key.
    ///   - baseURL: Base endpoint URL (default: https://api.openai.com/v1).
    ///   - timeout: Request timeout in seconds (default: 30).
    public init(
        apiKey: String,
        baseURL: URL = URL(string: "https://api.openai.com/v1")!,
        timeout: TimeInterval = 30
    ) {
        self.apiKey = apiKey
        self.baseURL = baseURL
        self.timeout = timeout
    }
}
