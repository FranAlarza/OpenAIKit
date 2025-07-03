//
//  OpenAIClient.swift
//  OpenAIKit
//
//  Created by Fran Alarza on 3/7/25.
//


import Foundation
import NetworkKit

/// Main client for interacting with the OpenAI API.
public final class OpenAIClient {
    private let configuration: OpenAIConfiguration
    private let httpClient: HTTPClient

    /// Initializes the client.
    /// - Parameters:
    ///   - configuration: SDK configuration (contains API key, base URL, timeout).
    ///   - httpClient: NetworkKit HTTPClient instance (defaults to a new one).
    public init(
        configuration: OpenAIConfiguration,
        httpClient: HTTPClient = HTTPClient()
    ) {
        self.configuration = configuration
        self.httpClient = httpClient
    }

    /// Sends a sequence of messages to the chat endpoint and returns the response.
    /// - Parameters:
    ///   - model: Model name (default: "gpt-4o-mini").
    ///   - messages: Array of `ChatMessage` objects.
    /// - Returns: `ChatResponse` with the model’s reply.
    public func chat(
        model: String = "gpt-4o-mini",
        messages: [ChatMessage]
    ) async throws -> ChatResponse {
        let endpoint = ChatCompletionsEndpoint(
            config: configuration,
            model: model,
            messages: messages
        )
        return try await httpClient.send(endpoint, as: ChatResponse.self)
    }
}