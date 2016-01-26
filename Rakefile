require "bundler/gem_tasks"

desc "Open a pry console preloaded with this library"
task console: 'console:pry'

namespace :console do

  task :pry do
    sh "bundle exec pry -I lib -r clientele-http.rb"
  end

  task :irb do
    sh "bundle exec irb -I lib -r clientele-http.rb"
  end

end

namespace :generate do

  desc "Generates classes for standard HTTP verbs"
  task :verbs do

    class String
      def unindent
        indent = min = scan(/^[ \t]*(?=\S)/).min.size rescue 0
        gsub(/^[ \t]{#{indent}}/, '')
      end
    end

    verb_info = {
      head:    [true, true],
      get:     [true, true],
      post:    [true, true],
      put:     [true, true],
      delete:  [true, true],
      patch:   [true, true],
      connect: [true, true],
      options: [true, true],
    }

    verbs = "clientele/http/verbs"
    mkdir_p verbs
    open('lib/' + verbs + ".rb", "w") do |registry|
      registry.puts "require 'clientele/http/verb'", ""
      verb_info.sort.each do |method, (request_body, response_body)|
        verb_file = verbs + "/#{method}"
        open('lib/' + verb_file + ".rb", "w") do |verb|
          registry.puts "require '#{verb_file}'"
          verb.write <<-CODE.unindent
            require "clientele/http/verb"

            module Clientele
              module HTTP
                class Verb
                  class #{method.capitalize} < Concrete

                    @method        = :#{method.upcase}
                    @request_body  = #{request_body ? "true" : "false"}
                    @response_body = #{response_body ? "true" : "false"}

                  end
                end
              end
            end
          CODE
        end
      end
    end

  end

  desc "Generates classes for standard HTTP statuses"
  task :statuses do

    class String
      def unindent
        indent = min = scan(/^[ \t]*(?=\S)/).min.size rescue 0
        gsub(/^[ \t]{#{indent}}/, '')
      end
    end

    status_info = {
      100 => "Continue",
      101 => "Switching Protocols",
      102 => "Processing",
      103 => "Checkpoint",
      200 => "OK",
      201 => "Created",
      202 => "Accepted",
      203 => "Non-Authoritative Information",
      204 => "No Content",
      205 => "Reset Content",
      206 => "Partial Content",
      207 => "Multi-Status",
      208 => "Already Reported",
      226 => "IM Used",
      300 => "Multiple Choices",
      301 => "Moved Permanently",
      302 => "Found",
      303 => "See Other",
      304 => "Not Modified",
      305 => "Use Proxy",
      306 => "Switch Proxy",
      307 => "Temporary Redirect",
      308 => "Permanent Redirect",
      400 => "Bad Request",
      401 => "Unauthorized",
      402 => "Payment Required",
      403 => "Forbidden",
      404 => "Not Found",
      405 => "Method Not Allowed",
      406 => "Not Acceptable",
      407 => "Proxy Authentication Required",
      408 => "Request Timeout",
      409 => "Conflict",
      410 => "Gone",
      411 => "Length Required",
      412 => "Precondition Failed",
      413 => "Payload Too Large",
      414 => "URI Too Long",
      415 => "Unsupported Media Type",
      416 => "Range Not Satisfiable",
      417 => "Expectation Failed",
      418 => "I'm a teapot",
      419 => "Authentication Timeout",
      421 => "Misdirected Request",
      422 => "Unprocessable Entity",
      423 => "Locked",
      424 => "Failed Dependency",
      426 => "Upgrade Required",
      428 => "Precondition Required",
      429 => "Too Many Requests",
      431 => "Request Header Fields Too Large",
      451 => "Unavailable For Legal Reasons",
      500 => "Internal Server Error",
      501 => "Not Implemented",
      502 => "Bad Gateway",
      503 => "Service Unavailable",
      504 => "Gateway Timeout",
      505 => "HTTP Version Not Supported",
      506 => "Variant Also Negotiates",
      507 => "Insufficient Storage",
      508 => "Loop Detected",
      510 => "Not Extended",
      511 => "Network Authentication Required",

      420 => "Method Failure",
      420 => "Enhance Your Calm",
      450 => "Blocked by Windows Parental Controls",
      498 => "Invalid Token",
      499 => "Token Required",
      509 => "Bandwidth Limit Exceeded",
      440 => "Login Timeout",
      449 => "Retry With",
      451 => "Redirect",
      444 => "No Response",
      495 => "SSL Certificate Error",
      496 => "SSL Certificate Required",
      497 => "HTTP Request Sent to HTTPS Port",
      499 => "Client Closed Request",
      520 => "Unknown Error",
      521 => "Web Server Is Down",
      522 => "Connection Timed Out",
      523 => "Origin Is Unreachable",
      524 => "A Timeout Occurred",
      525 => "SSL Handshake Failed",
      526 => "Invalid SSL Certificate",
    }

    statuses = "clientele/http/statuses"
    mkdir_p statuses
    open('lib/' + statuses + ".rb", "w") do |registry|
      registry.puts "require 'clientele/http/status'", ""
      status_info.sort.each do |code, description|
        status_file = statuses + "/#{code}-#{description.gsub("'", "").downcase.split(/\W+/).join('_')}"
        open('lib/' + status_file + ".rb", "w") do |status|
          registry.puts "require '#{status_file}'"
          status.write <<-CODE.unindent
            require "clientele/http/status"

            module Clientele
              module HTTP
                class Status
                  class #{description.gsub("'", "").split(/\W+/).map{|s|s[0]=s[0].capitalize; s}.join} < Concrete

                    @code = #{code}
                    @description = "#{description}"

                  end
                end
              end
            end
          CODE
        end
      end
    end

  end

  desc "Generates classes for standard HTTP headers"
  task :headers do

    class String
      def unindent
        indent = min = scan(/^[ \t]*(?=\S)/).min.size rescue 0
        gsub(/^[ \t]{#{indent}}/, '')
      end
    end

    header_info = {
      request: [
        "Accept",
        "Accept-Charset",
        "Accept-Datetime",
        "Accept-Encoding",
        "Accept-Language",
        "Authorization",
        "Cache-Control",
        "Connection",
        "Content-Length",
        "Content-MD5",
        "Content-Type",
        "Cookie",
        "Date",
        "Expect",
        "Forwarded",
        "From",
        "Host",
        "If-Match",
        "If-Modified-Since",
        "If-None-Match",
        "If-Range",
        "If-Unmodified-Since",
        "Max-Forwards",
        "Origin",
        "Pragma",
        "Proxy-Authorization",
        "Range",
        "Referer",
        "TE",
        "Upgrade",
        "User-Agent",
        "Via",
        "Warning",
      ] + [
        "X-Requested-With",
        "DNT",
        "X-Forwarded-For",
        "X-Forwarded-Host",
        "X-Forwarded-Proto",
        "Front-End-Https",
        "X-Http-Method-Override",
        "X-ATT-DeviceId",
        "X-Wap-Profile",
        "Proxy-Connection",
        "X-UIDH",
        "X-Csrf-Token",
      ],
      response: [
        "Access-Control-Allow-Origin",
        "Accept-Patch",
        "Accept-Ranges",
        "Age",
        "Allow",
        "Cache-Control",
        "Connection",
        "Content-Disposition",
        "Content-Encoding",
        "Content-Language",
        "Content-Length",
        "Content-Location",
        "Content-MD5",
        "Content-Range",
        "Content-Type",
        "Date",
        "ETag",
        "Expires",
        "Last-Modified",
        "Link",
        "Location",
        "P3P",
        "Pragma",
        "Proxy-Authenticate",
        "Public-Key-Pins",
        "Refresh",
        "Retry-After",
        "Server",
        "Set-Cookie",
        "Status",
        "Strict-Transport-Security",
        "Trailer",
        "Transfer-Encoding",
        "TSV",
        "Upgrade",
        "Vary",
        "Via",
        "Warning",
        "WWW-Authenticate",
        "X-Frame-Options",
      ] + [
        "X-XSS-Protection",
        "Content-Security-Policy",
        "X-Content-Security-Policy",
        "X-WebKit-CSP",
        "X-Content-Type-Options",
        "X-Powered-By",
        "X-UA-Compatible",
        "X-Content-Duration",
        "Upgrade-Insecure-Requests",
      ],
    }

    header_info.each do |type, names|
      types = "clientele/http/#{type}/headers"
      mkdir_p "lib/" + types
      open('lib/' + types + '.rb', "w") do |type_file|
        type_file.puts "require 'clientele/http/header'", ""
        names.sort.each do |name|
          header_file = types + "/#{name.gsub("-", "_").downcase}"
          open('lib/' + header_file + ".rb", "w") do |header|
            type_file.puts "require '#{header_file}'"
            header.write <<-CODE.unindent
              require "clientele/http/header"

              module Clientele
                module HTTP
                  class Header
                    class #{name.gsub("-", "")} < Concrete

                      @name = "#{name}"
                      @type = :#{type}

                    end
                  end
                end
              end
            CODE
          end
        end
      end
    end

  end

end
