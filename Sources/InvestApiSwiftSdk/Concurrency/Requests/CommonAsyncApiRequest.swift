#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public class CommonAsyncApiRequest<Result>: AsyncApiRequest<CommonApiClient, Result> {
    public static var getAccounts: CommonAsyncApiRequest<[Account]> {
        .init { client in
            return try await client.user.getAccounts()
        }
    }

    public static func getMarginAttributes(accountId id: String) -> CommonAsyncApiRequest<MarginAttributes> {
        .init { client in
            return try await client.user.getMarginAttributes(accountId: id)
        }
    }

    public static var getUserTariff: CommonAsyncApiRequest<UserTariff> {
        .init { client in
            return try await client.user.getUserTariff()
        }
    }

    public static var getInfo: CommonAsyncApiRequest<UserInfo> {
        .init { client in
            return try await client.user.getInfo()
        }
    }
}
#endif