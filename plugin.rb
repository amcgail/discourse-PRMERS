# frozen_string_literal: true

# name: discourse-PRMERS
# about: PRMERS Plugin for Discourse
# meta_topic_id: 0
# version: 0.0.1
# authors: Alec McGail
# url: https://github.com/amcgail/discourse-PRMERS
# required_version: 2.7.0

enabled_site_setting :plugin_name_enabled

module ::MyPluginModule
  PLUGIN_NAME = "discourse-PRMERS"
end

require_relative "lib/PRMERS_plugin/engine"

after_initialize do
  # Code which should run after Rails has finished booting
end
