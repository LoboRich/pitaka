class LogsController < ApplicationController

  # GET /logs or /logs.json
  def index
    @logs = current_user.account.logs
  end

end
