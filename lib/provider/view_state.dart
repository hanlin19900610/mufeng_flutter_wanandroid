enum ViewState { idle, busy, empty, error, unAuthorized }

///用于未登录等权限不够, 需要跳转授权界面
class UnAuthorizedException implements Exception {
  const UnAuthorizedException();

  @override
  String toString() => 'UnAuthorizedException';
}