# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

%w( main gallery events articles admin admin/albums admin/articles ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end

%w( fileinput supersized supersized.shutter discussion ).each do |vendor|
  Rails.application.config.assets.precompile += ["#{vendor}.js", "#{vendor}.css"]
end

Rails.application.config.assets.precompile += %w( jquery.easing.min.js Sortable.js )
Rails.application.config.assets.precompile += %w( *.jpg *.png *.gif )