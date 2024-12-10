# frozen_string_literal: true

# name: discourse-PRMERS
# about: PRMERS Plugin for Discourse
# version: 0.0.1
# authors: Alec McGail
# url: https://github.com/amcgail/discourse-PRMERS

enabled_site_setting :plugin_name_enabled

module ::PRMERSPlugin
  PLUGIN_NAME = "discourse-PRMERS"
end

require_relative "lib/PRMERS_plugin/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end
