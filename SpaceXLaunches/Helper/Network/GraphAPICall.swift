//
//  GraphAPICall.swift
//  SpaceXLaunches
//
//  Created by Adit Hasan on 10/12/21.
//

import Foundation
import Apollo

// Did this way to do it quickly
class GraphAPICall {
  static let shared = GraphAPICall()
  
  private(set) lazy var apollo: ApolloClient = {
    let client = URLSessionClient()
    let cache = InMemoryNormalizedCache()
    let store = ApolloStore(cache: cache)
    let provider = DefaultInterceptorProvider(client: client,
                                              shouldInvalidateClientOnDeinit: true,
                                              store: store)
    let url = URL(string: "https://api.spacex.land/graphql/")!
    let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                 endpointURL: url)
    return ApolloClient(networkTransport: transport, store: store)
  }()
}
