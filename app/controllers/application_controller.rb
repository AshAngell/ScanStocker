class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def self.serializer(klass)
    define_method(:serializer) { klass }
  end

  def serialize(resource, options = {})
    serializer.new(resource, options).serializable_hash.to_json
  end
end
