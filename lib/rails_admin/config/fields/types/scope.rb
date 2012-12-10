require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Scope < RailsAdmin::Config::Fields::Base
          # Register field type for the type loader
          RailsAdmin::Config::Fields::Types::register(self)

          def virtual?
            true
          end

          register_instance_option :visible? do
            false
          end

          register_instance_option :filterable do
            true
          end

          register_instance_option :use_input do
            nil
          end

          register_instance_option :enum_method do
            @enum_method ||= "#{name}_enum"
          end

          register_instance_option :enum do
            bindings[:object].class.respond_to?(enum_method) ? bindings[:object].class.send(enum_method) : bindings[:object].send(enum_method)
          end

          register_instance_option :scope_arguments do
            proc { |value| [value['v']] }
          end
        end
      end
    end
  end
end