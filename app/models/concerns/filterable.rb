module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = where(nil) # create an anonymous scope
      filtering_params.each do |key, value|
        results = results.public_send('with_' + key, value) if value.present?
      end
      results
    end
  end
end
