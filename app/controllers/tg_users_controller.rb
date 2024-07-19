class TgUsersController < ApplicationController
  before_action :set_tg_user, only: %i[show edit update destroy]

  # GET /tg_users or /tg_users.json
  def index
    @tg_users = TgUser.all
  end

  # GET /tg_users/1 or /tg_users/1.json
  def show; end

  # GET /tg_users/new
  def new
    @tg_user = TgUser.new
  end

  # GET /tg_users/1/edit
  def edit
    # @tg_user = TgUser.find(params[:id])
    # respond_to do |format|
    #   format.html { render partial: 'form', locals: { tg_user: @tg_user } }
    #   render "home/index", locals: {tg_user: @tg_user}
    # end
  end

  # POST /tg_users or /tg_users.json
  def create
    @tg_user = TgUser.new(tg_user_params)

    respond_to do |format|
      if @tg_user.save
        format.html { redirect_to tg_user_url(@tg_user), notice: "Tg user was successfully created." }
        format.json { render :show, status: :created, location: @tg_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tg_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tg_users/1 or /tg_users/1.json
  def update
    @tg_user = TgUser.find(params[:id])

    if @tg_user.update(tg_user_params)
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'User updated successfully.' }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js { render partial: 'form', locals: { tg_user: @tg_user } }
      end
    end
  end

  # DELETE /tg_users/1 or /tg_users/1.json
  def destroy
    @tg_user.destroy!

    respond_to do |format|
      format.html { redirect_to tg_users_url, notice: "Tg user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tg_user
    @tg_user = TgUser.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tg_user_params
    #params.fetch(:tg_user, {})
    params.require(:tg_user).permit(:name, :position, :tg_name)
  end
end
