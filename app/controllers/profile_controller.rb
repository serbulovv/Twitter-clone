class ProfileController < ApplicationController
  def index
  end

  def update_avatar
    current_user.avatar.purge if current_user.avatar.attached?
    processed = ImageProcessing::MiniMagick.source(params["avatar"].tempfile).resize_to_limit(512, 512).convert("png")
    current_user.avatar.attach(io: processed.options[:source], filename: params["avatar"].original_filename, content_type: processed.options[:format])
  end

  def update_profile_background
    current_user.profile_background.purge if current_user.profile_background.attached?
    processed = ImageProcessing::MiniMagick.source(params["profile_background"].tempfile).resize_to_limit(512, 512).convert("png")
    current_user.profile_background.attach(io: processed.options[:source], filename: params["profile_background"].original_filename, content_type: processed.options[:format])
  end

  def update_location
    return true if params["location"].length > 30

    current_user.update(location: params["location"])
  end

  def update_bio
    return true if params["bio"].length > 150

    current_user.update(bio: params["bio"])
  end
end
