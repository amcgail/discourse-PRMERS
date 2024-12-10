# frozen_string_literal: true

PRMERSPlugin::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::PRMERSPlugin::Engine, at: "prmers" }
