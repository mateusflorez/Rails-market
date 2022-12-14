# frozen_string_literal: true

module Backoffice
  module AdminsHelper
    OptionsForRoles = Struct.new(:id, :description)

    def options_for_roles
      Admin.roles.map do |key, value|
        OptionsForRoles.new(key, value)
      end
    end
  end
end
