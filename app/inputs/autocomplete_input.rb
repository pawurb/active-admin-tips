# frozen_string_literal: true

class AutocompleteInput
  include Formtastic::Inputs::Base
  include Formtastic::Inputs::Base::Stringish
  include ActionDispatch::Routing::UrlFor
  include Rails.application.routes.url_helpers

  def to_html
    input_wrapping do
      folder = template.current_organization&.media_folder_name || template.instance_variable_get(:@organization).identifier_name
      label_html << builder.template.cl_image_upload(
        object_name, method, folder: folder
      )
    end
  end

  def to_html
    Formtastic::Util.html_safe("<div> dupa</div>")
  end
end
