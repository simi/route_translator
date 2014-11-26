
module RouteTranslator
  module ConfigurationHelper

    def config_reset
      config_force_locale false
      config_hide_locale false
      config_generate_unlocalized_routes false
      config_generate_unnamed_unlocalized_routes false
      config_host_locales(host_locales_config_hash)
      config_force_all_localized false

      config_default_locale_settings(:en)
      Rails.application.reload_routes!
    end

    alias :setup_config :config_reset
    alias :teardown_config :config_reset

    def config_default_locale_settings(locale)
      I18n.default_locale = locale
    end

    def config_force_all_localized(boolean)
      RouteTranslator.config.force_all_localized = boolean
      Rails.application.reload_routes!
    end

    def config_force_locale(boolean)
      RouteTranslator.config.force_locale = boolean
    end

    def config_hide_locale(boolean)
      RouteTranslator.config.hide_locale = boolean
    end

    def config_generate_unlocalized_routes(boolean)
      RouteTranslator.config.generate_unlocalized_routes = boolean
    end

    def config_generate_unnamed_unlocalized_routes(boolean)
      RouteTranslator.config.generate_unnamed_unlocalized_routes = boolean
    end

    def config_host_locales(hash)
      RouteTranslator.config.host_locales = hash
    end

    def host_locales_config_hash
      if RUBY_VERSION < '1.9'
        ::ActiveSupport::OrderedHash.new
      else
        ::Hash.new
      end
    end

  end
end
