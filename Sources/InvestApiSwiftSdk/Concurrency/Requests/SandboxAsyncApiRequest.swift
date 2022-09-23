#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public class SandboxAsyncApiRequest<Result>: AsyncApiRequest<SandboxApiClient, Result> {
    public static var getAccounts: SandboxAsyncApiRequest<[Account]> {
        .init { client in
            return try await client.user.getAccounts()
        }
    }

    public static var getUserTariff: SandboxAsyncApiRequest<UserTariff> {
        .init { client in
            return try await client.user.getUserTariff()
        }
    }

    public static var getInfo: SandboxAsyncApiRequest<UserInfo> {
        .init { client in
            return try await client.user.getInfo()
        }
    }
}
#endif
