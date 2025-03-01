require "base64"

module Ai
  class ProductsController < ActionController::Base
    layout "ai"

    def show
      # Render a view that has the upload form and a turbo frame for results.
    end

    def create
      # Respond with a Turbo Stream update so the result appears on the page
      respond_to do |format|
        format.html { render partial: "ai/products/result", locals: { result: ai } }
      end
    end

    private

    def b64
      @b64 ||= Base64.strict_encode64(params[:image].read)
    end

    def client
      @client ||= OpenAI::Client.new(access_token: ENV.fetch("OPENAI_KEY", ""), log_errors: true)
    end

    def prompt
      <<~HEREDOC
        From this image determine the brand, the product the size (with the unit of size; g, L, Kg etc) and 
        return the results in a json object.  The size and the units should be seperated. The json payload 
        should use the keys: brand, product, size, and units.  If it is a pack/multipack then the size and 
        units should be in the appended to the product (for example a 12 pack of 365mL cans should include 
        `(12 x 365mL)` in the product "name"), and the size should the number in the pack and the 
        unit size should be "pack".
      HEREDOC
    end

    def messages
      [
        { "type": "text", "text": prompt },
        { "type": "image_url",
          "image_url": {
            "url": "data:image/jpeg;base64,#{b64}"
          }
        }
      ]
    end

    def ai
      @ai ||= client.chat(parameters: { model: "gpt-4o", messages: [{ role: "user", content: messages }] })
                    .dig("choices", 0, "message", "content")
                    .gsub(/```json\s*|```/, "").strip
    end
  end
end
