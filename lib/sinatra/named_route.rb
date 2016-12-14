require "sinatra/named_route/version"

module Sinatra
  module NamedRoute
    RouteNotFound = Class.new(ArgumentError)

    def self.registered(app)
      app.helpers Helpers
      app.set :named_routes, named_routes
      app.set :name do |key|
        settings.named_routes << { name: key }
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
        key = args.first
        signature = settings.named_routes.find { |name:, **o| key == name }
        fail RouteNotFound unless signature
        signature[:pattern].expand(**(args[1] || {}))
      end
    end
  end
end
