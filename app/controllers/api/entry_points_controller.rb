class Api::EntryPointsController < ActionController::API
  def index
    render json: EntryPoint.filter_by_room(params[:room_id]).select(:id, :user_id, :room_id)
  end
  def create
    current_user.entry_points.create!(entry_points_params)
    head :created
  end

  def destroy
    current_user.entry_points.find(params[:id]).destroy!
    head :ok
  end

  private

  def entry_points_params
    params.require(:entry_point).permit(:room_id)
  end
end
