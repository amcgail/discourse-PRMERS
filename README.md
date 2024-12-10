# Overview
PRMERS uses [Discourse](https://www.discourse.org/) as its backbone.
Customization is achieved through custom plugins and templates.
But mostly through the wide array of built-in settings on Discourse (go have a look if you're an admin),
  and creative use of the existing features.

# How to use this repository
This repository is installed as a plugin.
The template is contained in a separate repository, and allows for a near-instant manipulation of CSS/HTML.
Plugins allow all kinds of database actions, automation, and customizations to the user interface.

# Managing the website
The website is managed through GitHub Actions, with deployment and management scripts and configurations stored in the `deploy` folder.

## Actions
+ `build-and-deploy` contains the *Pull code and Restart server* task. This logs into the PRMERS server, pulls the most up-to-date version of this repository, runs `after_pull.py` and `after_pull.sh`, and `./launcher rebuild app` in the discourse-docker repo.

## Architecture
The server runs nginx, with a configuration stored in `deploy/nginx.conf`.
Discourse runs in a docker container, as [recommended](https://github.com/discourse/discourse/blob/main/docs/INSTALL-cloud.md).
Email is hosted via `Brevo`, which has a limit of 300/day for free. 5000/month+ starting at $8/month.

## Plugins
This repository is itself a plugin which will be automatically installed on the PRMERS Discourse.
This means that CSS and Javascript can be easily added to the front-end, but also arbitrary changes can be made to the internals, new paths can be created which complete actions outside of Discourse's typical behavior. It's really quite powerful.

Besides this repository, here are the currently installed open-source plugins (as seen in `deploy/app.yml`):

+ [akismet](https://github.com/discourse/discourse-akismet.git)
+ [cakeday](https://github.com/discourse/discourse-cakeday.git)
+ [solved](https://github.com/discourse/discourse-solved)
+ [apple-auth](https://github.com/discourse/discourse-apple-auth)

There are other interesting plugins already developed for Discourse. Because it's often easiest to start from something which works, I'll list them here for convenience.

+ [topic-previews-sidecar](https://github.com/paviliondev/discourse-topic-previews-sidecar/) (theme component with complementary plugin, see [here](https://meta.discourse.org/t/topic-list-previews-theme-component/209973?u=merefield))
+ [solved](https://github.com/discourse/discourse-solved)
+ [saved searches](https://meta.discourse.org/t/discourse-saved-searches/67901)
+ and other [featured plugins](https://www.discourse.org/plugins)

To get started learning, here is a [guide](https://meta.discourse.org/t/how-do-you-learn-to-build-discourse-plugins/57946/8) to getting started with plugin-development generally, and a [tutorial](https://meta.discourse.org/t/learn-how-to-start-building-stuff-for-discourse-if-youre-newbie-like-myself/45954).

# Development Environment

On Windows, install WSL. Make sure to use Ubuntu 22. Both 18 and 24 failed for me.

Now follow [these](https://meta.discourse.org/t/install-discourse-on-ubuntu-or-debian-for-development/14727) instructions for Windows (in WSL) or Ubuntu, or [these](https://meta.discourse.org/t/install-discourse-on-macos-for-development/15772) for Mac.

Create a simlink between your local clone of this repository and `PRMERS-plugin` in the `plugins` folder of the discourse distribution.

Now you can start the server, which will automatically reload (most) changes from plugin development.

For the most part, the most efficient way to start building a new feature in a plugin is to emulate an existing plugin, of which there are tons.