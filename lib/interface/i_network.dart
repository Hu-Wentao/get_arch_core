// Created by Hu Wentao.
// Email : hu.wentao@outlook.com
// Date  : 2020/6/11
// Time  : 22:17

import 'dart:async';
import 'dart:convert';
import 'i_common_interface.dart';

///
/// 网络配置
class INetConfig {
  final String scheme; // http,https,ws,wss
  final String authority; // www.google.com:80
  String get baseUrl => '$scheme://$authority';

  final Map<String, String> staticHeaders;

  INetConfig({
    this.scheme,
    this.authority,
    this.staticHeaders,
  }); // 固定都请求头
}

///
/// Http请求接口
abstract class IHttp {
  INetConfig get config;

  Future<dynamic> handleRequest(String type, String tailUrl,
      {IDto dto, Map<String, dynamic> queryParameters});

  /// get请求可以不加参数,因此[paramDto]可选
  Future<dynamic> get(String tailUrl,
          {IDto paramDto, Map<String, dynamic> queryParameters}) async =>
      await (handleRequest('GET', tailUrl, queryParameters: queryParameters));

  /// [dynamic] 表示的是原始json中的data部分
  Future<dynamic> post(String tailUrl, IDto dataDto) async =>
      await (handleRequest('POST', tailUrl, dto: dataDto));

  Future<dynamic> put(String tailUrl,
          {IDto dto, Map<String, dynamic> queryParameters}) async =>
      await (handleRequest('PUT', tailUrl, queryParameters: queryParameters));

  Future<dynamic> delete(String tailUrl,
          {IDto dto, Map<String, dynamic> queryParameters}) async =>
      await (handleRequest('DELETE', tailUrl,
          queryParameters: queryParameters));

  Future<dynamic> head(String tailUrl,
          {IDto dto, Map<String, dynamic> queryParameters}) async =>
      await (handleRequest('HEAD', tailUrl, queryParameters: queryParameters));

  Future<dynamic> patch(String tailUrl,
          {IDto dto, Map<String, dynamic> queryParameters}) async =>
      await (handleRequest('PATCH', tailUrl, queryParameters: queryParameters));
}

///
/// Socket接口
abstract class ISocket {
  INetConfig get config;

  // WebSocket 请求
  Future<ISocketController> webSocket(String tailUrl);
}

///
/// Socket控制器
abstract class ISocketController<T> {
  Stream<T> get stream;

  void addJson(Map<String, dynamic> data) => this.addRaw(jsonEncode(data));

  void addRaw(String data);

  // 使用RxDart可以将close放到stream.close()方法中
  Future<void> close({int closeCode, String closeReason});

  @Deprecated('请使用 addJson() 将在1.0.0后移除')
  void add(Map<String, dynamic> data);
}

@Deprecated('请改用[ISocketController, 将在1.0.0后移除]')
abstract class IWsController<T> extends ISocketController<T> {
  void add(Map<String, dynamic> data);
  @Deprecated('请改用[add()], 将在1.0.0后移除')
  void addToWs(Map<String, dynamic> data) => add(data);
}

///
/// WebSocket断开代码
abstract class WsCloseCode {
  /// The purpose for which the connection was established has been fulfilled.
  static const normalClosure = 1000;

  /// An endpoint is "going away", such as a server going down or a browser having
  /// navigated away from a page.
  static const goingAway = 1001;

  /// An endpoint is terminating the connection due to a protocol error.
  static const protocolError = 1002;

  /// An endpoint is terminating the connection because it has received a type of
  /// data it cannot accept.
  ///
  /// For example, an endpoint that understands only text data MAY send this if it
  /// receives a binary message).
  static const unsupportedData = 1003;

  /// No status code was present.
  ///
  /// This **must not** be set explicitly by an endpoint.
  static const noStatusReceived = 1005;

  /// The connection was closed abnormally.
  ///
  /// For example, this is used if the connection was closed without sending or
  /// receiving a Close control frame.
  ///
  /// This **must not** be set explicitly by an endpoint.
  static const abnormalClosure = 1006;

  /// An endpoint is terminating the connection because it has received data
  /// within a message that was not consistent with the type of the message.
  ///
  /// For example, the endpoint may have receieved non-UTF-8 data within a text
  /// message.
  static const invalidFramePayloadData = 1007;

  /// An endpoint is terminating the connection because it has received a message
  /// that violates its policy.
  ///
  /// This is a generic status code that can be returned when there is no other
  /// more suitable status code (such as [unsupportedData] or [messageTooBig]), or
  /// if there is a need to hide specific details about the policy.
  static const policyViolation = 1008;

  /// An endpoint is terminating the connection because it has received a message
  /// that is too big for it to process.
  static const messageTooBig = 1009;

  /// The client is terminating the connection because it expected the server to
  /// negotiate one or more extensions, but the server didn't return them in the
  /// response message of the WebSocket handshake.
  ///
  /// The list of extensions that are needed should appear in the close reason.
  /// Note that this status code is not used by the server, because it can fail
  /// the WebSocket handshake instead.
  static const missingMandatoryExtension = 1010;

  /// The server is terminating the connection because it encountered an
  /// unexpected condition that prevented it from fulfilling the request.
  static const internalServerError = 1011;

  /// The connection was closed due to a failure to perform a TLS handshake.
  ///
  /// For example, the server certificate may not have been verified.
  ///
  /// This **must not** be set explicitly by an endpoint.
  static const tlsHandshakeFailed = 1015;
}
