
class Mechanize::HTTP::Agent

  alias_method :old_fetch, :fetch

  def request_log request
    @file ||= File.new('requests_' + Time.now.to_i.to_s, 'a+')
    @file.puts '##########'
    @file.puts(' method ' + request.method)
    @file.puts(' headers ' + request.to_hash.to_json)
    @file.puts(' path ' + request.path)
    @file.puts(' body ' + request.body) if request.method == "POST"
    @file.puts ''
  end

  def response_log response
    @file ||= File.new('requests_' + Time.now.to_i.to_s, 'a+')
    @file.puts(' code ' + response.code)
    @file.puts(' headers ' + response.to_hash.to_json)
  end

  def fetch uri, method = :get, headers = {}, params = [],
            referer = current_page, redirects = 0
    result = old_fetch(uri, method, headers, params, referer, redirects)
    @file.puts(' body ' + result.content)
    result
  end

  def shutdown
    http.shutdown
    @file.close rescue nil
  end

end