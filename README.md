# Overview
PRMERS uses [Discourse](https://www.discourse.org/) as its backbone.
Customization is achieved through custom plugins and templates.
But mostly through the wide array of built-in settings on Discourse (go have a look if you're an admin),
  and creative use of the existing features.

# How to use this repository
This repository is installed as a plugin.
The template is contained in a separate repository, and allows for a near-instant manipulation of CSS/HTML.
Plugins allow all kinds of database actions, automation, and customizations to the user interface.

# Developing the plugin
For the most part, the most efficient way to start building a new feature in a plugin is to emulate an existing plugin, of which there are tons.
The development cycle is relatively slow, requiring a ~1 minute process to restart the server.

# Managing the website
The website is managed through GitHub Actions, with deployment and management scripts stored in `/deploy/`.
