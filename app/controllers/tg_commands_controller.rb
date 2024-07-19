class TgCommandsController < ApplicationController
  before_action :set_tg_command, only: %i[show edit update destroy]

  # GET /tg_commands or /tg_commands.json
  def index
    @tg_commands = TgCommand.all
  end

  # GET /tg_commands/1 or /tg_commands/1.json
  def show; end

  # GET /tg_commands/new
  def new
    @tg_command = TgCommand.new
  end

  # GET /tg_commands/1/edit
  def edit; end

  # POST /tg_commands or /tg_commands.json
  def create
    @tg_command = TgCommand.new(tg_command_params)

    respond_to do |format|
      if @tg_command.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @tg_command }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tg_command.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tg_commands/1 or /tg_commands/1.json
  def update
    respond_to do |format|
      if @tg_command.update(tg_command_params)
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @tg_command }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tg_command.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tg_commands/1 or /tg_commands/1.json
  def destroy
    @tg_command.destroy!
    respond_to do |format|
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tg_command
    @tg_command = TgCommand.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tg_command_params
    # params.fetch(:tg_command, {})
    params.require(:tg_command).permit(:name, :description)
  end
end
