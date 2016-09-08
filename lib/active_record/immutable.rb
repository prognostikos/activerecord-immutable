require "active_record/immutable/version"

module ActiveRecord
  module Immutable
    def self.included(model)
      model.before_destroy :raise_read_only_error if model.respond_to?(:before_destroy)

      model.class_eval do
        def self.raise_read_only_error
          raise ActiveRecord::ReadOnlyRecord
        end

        def self.delete_all
          raise_read_only_error
        end

        def self.update_all(updates)
          raise_read_only_error
        end
      end
    end

    def readonly?
      changes.present? && persisted?
    end

    def touch
      raise_read_only_error
    end

    def delete
      raise_read_only_error
    end

    private

    def raise_read_only_error
      self.class.raise_read_only_error
    end
  end
end
