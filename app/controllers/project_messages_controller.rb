class ProjectMessagesController < ApplicationController

  def create
    project_id = project_message_params[:project_id]
    Project.where(id: project_id).first_or_create(id: project_id)
    @project_message = ProjectMessage.create!(project_message_params)
    render json: @project_message, status: :created
  end

  private

  def project_message_params
    params.permit(:message_id, :project_id, :key)
  end

end
