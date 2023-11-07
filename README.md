# InvestApiSwiftSdk

<p align="center">
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/LICENSE-MIT-green.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="https://img.shields.io/badge/swift-5.5-orange.svg" alt="Swift 5.5">
    </a>
</p>

InvestApiSwiftSdk - набор средств разработки (SDK) для [Tinkoff Invest API V2](https://github.com/Tinkoff/investAPI), gRPC-интерфейса взаимодействия с торговой платформой [Тинькофф Инвестиции](https://www.tinkoff.ru/invest/).

### Пример использования сервисов

```swift
import InvestApiSwiftSdk

let token = ProcessInfo.processInfo.environment["API_TOKEN"]
// Создаём экземпляр клиента
let client = try InvestApiClient.common(token, appName: "codes.egorbos.invest-api-swift-sdk") // Для песочницы, вместо метода common необходимо использовать метод sandbox

// Event-style
let futureAccounts = try client.user.getAccounts() // вызываем метод getAccounts() сервиса `UsersService`
futureAccounts.whenSuccess { accounts in
    let activeAccounts = accounts.filter {
        $0.type == .tinkoff && $0.status == .open
    }
    // DO SOME
}

// Async-style
let accounts = try await client.user.getAccounts() 
let activeAccounts = accounts.filter {
    $0.type == .tinkoff && $0.status == .open
}
// DO SOME
```

Синтаксический сахар 🍬

```swift
// Для сокращения кода можно использовать методы:
//    Event-style - sendRequest(_ request: CommonApiRequest<Result>) 
//    Async-style - sendRequest(_ request: CommonAsyncApiRequest<Result>)

// Event-style
let futureInstruments = try client.sendRequest(
    .findInstrument(query: "Сбер Банк", kind: .share, apiTradeAvailableFlag: true)
)
futureInstruments.whenSuccess { instruments in
    // DO SOME
}

// Async-style
let account: Account = ...
let portfolio = try await client.sendRequest(
    .getPortfolio(accountId: account.id, currency: .russianRuble)
)
// DO SOME
```

### Пример использования потоков

```swift
// Sync-style
let stream = client.marketDataStream.stream { message in
    // Обрабатываем данные
}

// Подписываемся на потоки
stream.send(
    .candles(uid: "...", action: .subscribe, interval: .oneMinute, waitingClose: true)
    .candles(uid: "...", action: .subscribe, interval: .fiveMinutes, waitingClose: false)
    .orderBook(uid: "...", action: .subscribe, depth: 1)
    .orderBook(uid: "...", action: .subscribe, depth: 20)
    .trades(uid: "...", action: .subscribe)
    .info(uid: "...", action: .subscribe)
    .lastPrice(uid: "...", action: .subscribe)
)

// Отписываемся от потоков
stream.send(
    .lastPrice(uid: "...", action: .unsubscribe)
)

// Async-style
let stream = client.marketDataStream.stream()

// Подписываемся на потоки
try await stream.send(
    .candles(uid: "...", action: .subscribe, interval: .oneMinute, waitingClose: true)
    .candles(uid: "...", action: .subscribe, interval: .fiveMinutes, waitingClose: false)
    .orderBook(uid: "...", action: .subscribe, depth: 1)
    .orderBook(uid: "...", action: .subscribe, depth: 20)
    .trades(uid: "...", action: .subscribe)
    .info(uid: "...", action: .subscribe)
    .lastPrice(uid: "...", action: .subscribe)
)

for try await message in stream {
    // Обрабатываем данные
}
```

Синтаксический сахар 🍬

```swift
// Для сокращения кода можно использовать методы:
//    Event-style - stream(_ stream: CommonStreamWrapper<Stream>, handler: @escaping (any StreamData) -> Void)
//    Async-style - stream(_ stream: CommonAsyncStreamWrapper<Stream>)

// Event-style
let stream = client.stream(.market) { message in
    // DO SOME
}
stream.send(.lastPrice(uid: "...", action: .subscribe))

// Async-style
let stream = client.stream(.market)
try await stream.send(.lastPrice(uid: "...", action: .subscribe))
for try await message in stream {
    // DO SOME
}
```

### Типы сообщений, получаемых из потоков

```swift
/// Сообщение получаемое из потока.
public protocol StreamData: Codable {
    associatedtype StreamDataType
    
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки.
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: StreamDataType { get }
}
```

> - Свойство **time** содержит время получения сообщения клиентом. 
> - Свойство **type** указывает на тип полезной нагрузки в сообщении, и может принимать следующие значения:
>   - *.subscriptionInfo* - информация о подписке на поток (данный тип сообщения с результатом, поступает от сервера в ответ на запрос подписки / отписки);
>   - *.ping* - проверка активности потока (данный тип сообщения поступает от сервера для поддержания соединения);
>   - *.data* - данные.
> - Свойство **data** хранит в себе информация о подписке, пинг, или данные на которые подписался клиент.

| Поток | Сообщение | Данные | Описание |
| :--- | :----: | :----: | :--- |
| **PortfolioStream / PortfolioAsyncStream** | `PingStreamPayload` | **type** = .ping, **data:** `Date` | Сообщение для проверки (поддержания) соединения. |
| | `OperationsStreamSubscriptionPayload` | **type** = .subscriptionInfo, **data:** [`OperationsStreamSubscriptionResult`] | Сообщение с результатами подписки на потоки `OperationsStreamService`. |
| | `PortfolioStreamPayload` | **type** = .data, **data:** `Portfolio` | Сообщение об обновлении портфеля. |
| **PositionsStream / PositionsAsyncStream** | `PingStreamPayload` | **type** = .ping, **data:** `Date` | Сообщение для проверки (поддержания) соединения. |
| | `OperationsStreamSubscriptionPayload` | **type** = .subscriptionInfo, **data:** [`OperationsStreamSubscriptionResult`] | Сообщение с результатами подписки на потоки `OperationsStreamService`. |
| | `PositionsStreamPayload` | **type** = .data, **data:** `PositionsStreamItem` | Сообщение по изменению позиций портфеля. |
| **MarketDataStream / MarketDataAsyncStream** | `PingStreamPayload` | **type** = .ping, **data:** `Date` | Сообщение для проверки (поддержания) соединения. |
| | `CandlesSubscriptionPayload` | **type** = .subscriptionInfo, **data:** `CandlesSubscriptionResult` | Сообщение с результатом подписки на свечи. |
| | `CandlePayload` | **type** = .data, **data:** `Candle` | Сообщение со свечой. |
| | `InfoSubscriptionPayload` | **type** = .subscriptionInfo, **data:** `InfoSubscriptionResult` | Сообщение с результатами подписки на потоки торговых статусов. |
| | `TradingStatusPayload` | **type** = .data, **data:** `TradingStatus` | Сообщение с информацией о торговом статусе. |
| | `LastPricesSubscriptionPayload` | **type** = .subscriptionInfo, **data:** `LastPricesSubscriptionResult` | Сообщение с результатами подписки на цены последних сделок. |
| | `LastPricePayload` | **type** = .data, **data:** `LastPrice` | Сообщение с информацией о цене последней сделки. |
| | `OrderBooksSubscriptionPayload` | **type** = .subscriptionInfo, **data:** `OrderBooksSubscriptionResult` | Сообщение с результатами подписки на стаканы. |
| | `OrderBookPayload` | **type** = .data, **data:** `OrderBook` | Сообщение с информацией о стакане. |
| | `TradesSubscriptionPayload` | **type** = .subscriptionInfo, **data:** `TradesSubscriptionResult` | Сообщение с результатами подписки на потоки обезличенных сделок. |
| | `TradePayload` | **type** = .data, **data:** `Trade` | Сообщение с информацией о сделке. |
| **OrdersStream / OrdersAsyncStream** | `PingStreamPayload` | **type** = .ping, **data:** `Date` | Сообщение для проверки (поддержания) соединения. |
| | `TradesStreamPayload` | **type** = .data, **data:** `TradeStreamItem` | Сообщение с информацией о совершенной сделке. |
---

### Пример обработки сообщений, поступающих из потоков

```swift
let stream = client.stream(.portfolio(accounts: ["..."]))

for try await message in stream {
    switch message {
        case let ping as PingStreamPayload:
            print("Ping: \(ping.data)")
            break
        case let subscription as OperationsStreamSubscriptionPayload:
            print("Subscription: \(subscription.data)")
            break
        case let portfolio as PortfolioStreamPayload:
            print("Portfolio: \(portfolio.data)")
            break
        default: break
    }
}
```

### Добавление InvestApiSwiftSdk в Ваш проект

#### Swift Package Manager

Добавьте следующую строку в раздел 'dependencies' файла `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/egorbos/invest-api-swift-sdk.git", from: "0.1.0"),
],
```

#### CocoaPods

Добавьте следующую строку в файл `Podfile`:

```text
pod 'InvestApiSwiftSdk', :git => "https://github.com/egorbos/invest-api-swift-sdk.git", :tag => "0.1.0"
```

## Совместимось

Платформа | Минимальная версия
--- | ---
macOS | 10.15 (Catalina)
iOS, iPadOS & tvOS | 13
watchOS | 6