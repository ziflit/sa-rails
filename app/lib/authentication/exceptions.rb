module Authentication
  module Exceptions
    class SubclassMustImplementError < StandardError ; end
    class NoKeyProvidedError < StandardError ; end
    class ExpiredTokenError < StandardError ; end
    class InvalidVerificationError < StandardError ; end
  end
end
