require "active_record/immutable/version"

module ActiveRecord
  module Immutable
    def self.included(model)
      model.before_destroy :raise_error
    end

    def readonly?
      persisted?
    end

    def touch
      raise_error
    end

    def delete
      raise_error
    end

    private

    def raise_error
      raise ActiveRecord::ReadOnlyRecord
    end
  end
end
