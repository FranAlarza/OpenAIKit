//
//  ChatMessage.swift
//  OpenAIKit
//
//  Created by Fran Alarza on 3/7/25.
//

import Foundation
import NetworkKit

/// A chat message to send to the OpenAI API.
public struct ChatMessage: Codable {
    public let role: String
    public let content: String

    public init(role: String, content: String) {
        self.role = role
        self.content = content
    }
}

/// Internal request payload for the chat endpoint.
private struct ChatRequest: Encodable {
    let model: String
    let messages: [ChatMessage]
}

/// Response object returned by the OpenAI chat endpoint.
public struct ChatResponse: Decodable {
    public let id: String
    public let object: String
    public let created: Int
    public let choices: [Choice]
    public let usage: Usage

    public struct Choice: Decodable {
        public let index: Int
        public let message: ChatMessage
        public let finish_reason: String
    }

    public struct Usage: Decodable {
        public let prompt_tokens: Int
        public let completion_tokens: Int
        public let total_tokens: Int
    }
}

/// Defines the `/chat/completions` endpoint.
public struct ChatCompletionsEndpoint: Endpoint {
    public let config: OpenAIConfiguration
    public let model: String
    public let messages: [ChatMessage]

    public var path: String {
        "\(config.baseURL.absoluteString)/chat/completions"
    }

    public var method: HTTPMethod { .post }

    public var headers: [String: String]? {
        [
            "Authorization": "Bearer \(config.apiKey)",
            "Content-Type": "application/json"
        ]
    }

    public var body: Data? {
        let request = ChatRequest(model: model, messages: messages)
        return try? JSONEncoder().encode(request)
    }

    public var queryItems: [URLQueryItem]? { nil }
}
