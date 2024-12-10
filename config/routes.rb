# frozen_string_literal: true

PrmersPlugin::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::PrmersPlugin::Engine, at: "prmers" }
