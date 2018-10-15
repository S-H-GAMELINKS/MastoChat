class WebController < ApplicationController
  def index
    gon.api_key = ENV['API_KEY']
    gon.auth_domain = ENV['AUTH_DOMAIN']
    gon.database_url = ENV['DB_URL']
    gon.project_id = ENV['PROJECT_ID']
    gon.storage_bucket = ENV['STORAGE_BUCKET']
    gon.message_senderid = ENV['MESSAGEING_SENDER_ID']
  end
end
