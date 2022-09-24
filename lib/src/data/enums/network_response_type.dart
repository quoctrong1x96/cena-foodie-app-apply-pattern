// ignore_for_file: slash_for_doc_comments

enum NetworkResponseType {
  success_200,
  /**The server cannot or will not process the request, due to a client
   error */
  badRequest_400,
  /**The request requires user authentication */
  unauthorized_401,
  /**This code is reserved for future use. */
  paymentRequired_402,
  /**The server understood the request, but refuses to authorize it.
  Providing different user authentication credentials might be
  successful, but any credentials that were provided in the request are
  insufficient.  The request SHOULD NOT be repeated with the same
  credentials.

  If the request method was not HEAD and the server wishes to make
  public why the request has not been fulfilled, it SHOULD describe the */
  forbidden_403,
  /**The server has not found anything matching the effective request URI. */
  notFound_404,
  /**The method specified in the Request-Line is not allowed for the
   target resource.  */
  methodNotAllow_405,
  /** The request could not be completed due to a conflict with the current
   state of the resource.   */
  conflict_409,
  /**Server internal Error */
  serverInternalError_500,
  unknown,
}
