# frozen_string_literal: true

PrmersPlugin::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here

  root to: "examples#index"

  # Example of a route that requires authentication
  # get "/secure" => "examples#secure"

  # Example of a route that requires admin privileges
  # get "/admin" => "examples#admin"

  # Example of a route that requires admin privileges
  # get "/moderator" => "examples#moderator"
end

Discourse::Application.routes.draw { mount ::PrmersPlugin::Engine, at: "prmers" }
