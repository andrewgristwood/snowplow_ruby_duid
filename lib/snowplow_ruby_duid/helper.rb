module SnowplowRubyDuid
  # Exposes a snowplow_domain_userid method in the context
  # that will find or create a domain_userid, which will be
  # saved in the response's cookie if it does not exist
  module Helper
    def snowplow_domain_userid
      @snowplow_domain_userid ||= find_or_create_snowplow_domain_userid
    end

    def find_or_create_snowplow_domain_userid
      find_snowplow_domain_userid || create_snowplow_domain_userid
    end
    private :find_or_create_snowplow_domain_userid

    def create_snowplow_domain_userid
      request_created_at = Time.now
      domain_userid      = DomainUserid.new.to_s
      snowplow_cookie    = Cookie.new request.host, domain_userid, request_created_at

      response.set_cookie snowplow_cookie.key, snowplow_cookie.value
      domain_userid
    end
    private :create_snowplow_domain_userid

    # See: https://github.com/snowplow/snowplow/wiki/Ruby-Tracker#310-setting-the-domain-user-id-with-set_domain_user_id
    def find_snowplow_domain_userid
      snowplow_cookie = find_snowplow_cookie
      # The cookie value is in this format: domainUserId.createTs.visitCount.nowTs.lastVisitTs
      snowplow_cookie.last.split('.').first unless snowplow_cookie.nil?
    end
    private :find_snowplow_domain_userid

    def find_snowplow_cookie
      request.cookies.find { |(key, _value)| key =~ /^#{KEY_PREFIX}/ } # result will be an array containing: [key, value]
    end
    private :find_snowplow_cookie
  end
end
