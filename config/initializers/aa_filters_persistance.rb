# frozen_string_literal: true

module ActiveAdmin
  module FiltersPersistance
    extend ActiveSupport::Concern

    CLEAR_FILTERS = "clear_filters"
    FILTER        = "Filter"

    included do
      before_action :resolve_filters
    end

    private

    def resolve_filters
      session_key = "#{controller_name}_q"

      if params[:commit] == CLEAR_FILTERS
        session.delete(session_key)
      elsif (params[:q] || params[:commit] == FILTER) && action_name.inquiry.index?
        session[session_key] = params[:q]
      elsif session[session_key] && action_name.inquiry.index?
        params[:q] = session[session_key]
      end
    end
  end
end
