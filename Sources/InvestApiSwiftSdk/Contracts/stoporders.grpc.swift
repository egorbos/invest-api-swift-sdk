//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: stoporders.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Сервис предназначен для работы со стоп-заявками:</br> **1**.
///выставление;</br> **2**. отмена;</br> **3**. получение списка стоп-заявок.
///
/// Usage: instantiate `Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClient`, then call methods of this protocol to make API calls.
public protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? { get }

  func postStopOrder(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>

  func getStopOrders(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>

  func cancelStopOrder(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>
}

extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol {
  public var serviceName: String {
    return "tinkoff.public.invest.api.contract.v1.StopOrdersService"
  }

  ///Метод выставления стоп-заявки.
  ///
  /// - Parameters:
  ///   - request: Request to send to PostStopOrder.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func postStopOrder(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse> {
    return self.makeUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.postStopOrder.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePostStopOrderInterceptors() ?? []
    )
  }

  ///Метод получения списка активных стоп заявок по счёту.
  ///
  /// - Parameters:
  ///   - request: Request to send to GetStopOrders.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getStopOrders(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse> {
    return self.makeUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.getStopOrders.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetStopOrdersInterceptors() ?? []
    )
  }

  ///Метод отмены стоп-заявки.
  ///
  /// - Parameters:
  ///   - request: Request to send to CancelStopOrder.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func cancelStopOrder(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse> {
    return self.makeUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.cancelStopOrder.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCancelStopOrderInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceNIOClient")
public final class Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol?
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the tinkoff.public.invest.api.contract.v1.StopOrdersService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

public struct Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceNIOClient: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the tinkoff.public.invest.api.contract.v1.StopOrdersService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Сервис предназначен для работы со стоп-заявками:</br> **1**.
///выставление;</br> **2**. отмена;</br> **3**. получение списка стоп-заявок.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? { get }

  func makePostStopOrderCall(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>

  func makeGetStopOrdersCall(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>

  func makeCancelStopOrderCall(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol {
  public static var serviceDescriptor: GRPCServiceDescriptor {
    return Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.serviceDescriptor
  }

  public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  public func makePostStopOrderCall(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse> {
    return self.makeAsyncUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.postStopOrder.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePostStopOrderInterceptors() ?? []
    )
  }

  public func makeGetStopOrdersCall(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse> {
    return self.makeAsyncUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.getStopOrders.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetStopOrdersInterceptors() ?? []
    )
  }

  public func makeCancelStopOrderCall(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse> {
    return self.makeAsyncUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.cancelStopOrder.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCancelStopOrderInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol {
  public func postStopOrder(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse {
    return try await self.performAsyncUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.postStopOrder.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePostStopOrderInterceptors() ?? []
    )
  }

  public func getStopOrders(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse {
    return try await self.performAsyncUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.getStopOrders.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetStopOrdersInterceptors() ?? []
    )
  }

  public func cancelStopOrder(
    _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse {
    return try await self.performAsyncUnaryCall(
      path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.cancelStopOrder.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCancelStopOrderInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public struct Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClient: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol {
  public var channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol?

  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

public protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'postStopOrder'.
  func makePostStopOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>]

  /// - Returns: Interceptors to use when invoking 'getStopOrders'.
  func makeGetStopOrdersInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>]

  /// - Returns: Interceptors to use when invoking 'cancelStopOrder'.
  func makeCancelStopOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>]
}

public enum Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata {
  public static let serviceDescriptor = GRPCServiceDescriptor(
    name: "StopOrdersService",
    fullName: "tinkoff.public.invest.api.contract.v1.StopOrdersService",
    methods: [
      Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.postStopOrder,
      Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.getStopOrders,
      Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.cancelStopOrder,
    ]
  )

  public enum Methods {
    public static let postStopOrder = GRPCMethodDescriptor(
      name: "PostStopOrder",
      path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/PostStopOrder",
      type: GRPCCallType.unary
    )

    public static let getStopOrders = GRPCMethodDescriptor(
      name: "GetStopOrders",
      path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/GetStopOrders",
      type: GRPCCallType.unary
    )

    public static let cancelStopOrder = GRPCMethodDescriptor(
      name: "CancelStopOrder",
      path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/CancelStopOrder",
      type: GRPCCallType.unary
    )
  }
}

