class JsonWebToken
  class << self
      # Encodes and signs JWT Payload with expiration
  def encode(payload)
    payload.reverse_merge!(meta)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  # Decodes the JWT with the signed secret
  def decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
  end
     # Validates the payload hash for expiration and meta claims
    def valid_payload(payload)
      if expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud]
        return false
      else
        return true
      end
    end
    # Default options to be encoded in the token
  def meta
    {
      exp: 7.days.from_now.to_i,
      iss: 'issuer_name',
      aud: 'client',
    }
  end

  # Validates if the token is expired by exp parameter
  def expired(payload)
    Time.at(payload[:exp]) < Time.now
  end
end
  end
