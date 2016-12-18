require "sinatra/named_route/version"

module Sinatra
  module NamedRoute
    RouteNotFound = Class.new(ArgumentError)

    def self.registered(app)
      app.helpers Helpers
      app.set :named_routes_cache, {}
      app.set :named_routes, named_routes
      app.set :name do |key|
        settings.named_routes << {
          name: key
        } unless settings.named_routes.any? { |signature| key == signature[:name] }
      end
    end

    def self.named_routes
      @named_routes ||= []
    end

    def self.route_added(verb, path, block)
      signature = named_routes.last
      signature[:pattern] = Mustermann.new(path)
    end

    module Helpers
      def uri(*args)
        return super unless args.first.is_a?(Symbol)
        fetch_uri(args.first, cache_key: args) do |key|
          signature = settings.named_routes.find { |name:, **o| key == name }
          fail RouteNotFound unless signature
          signature[:pattern].expand(args[1] || {})
        end
      end

      def fetch_uri(key, cache_key: nil)
        cache = settings.named_routes_cache
        return cache[cache_key] if cache[cache_key]
        cache[cache_key] = yield(key)
      end
    end
  end
end
