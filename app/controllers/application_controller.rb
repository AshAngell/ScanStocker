class ApplicationController < ActionController::API
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern    not supported in API mode

  protected

  def self.serializer(klass)
    define_method(:serializer) { klass }
  end

  def serialize(resource, options = {})
    serializer.new(resource, options).serializable_hash.to_json
  end

  def attempt_save_then(resource)
    if resource.save
      yield
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
