class TgMessagesController < ApplicationController
  before_action :set_tg_message, only: %i[show edit update destroy]

  # GET /tg_messages or /tg_messages.json
  def index
    @tg_messages = TgMessage.all
  end

  # GET /tg_messages/1 or /tg_messages/1.json
  def show; end

  # GET /tg_messages/new
  def new
    @tg_message = TgMessage.new
  end

  # GET /tg_messages/1/edit
  def edit; end

  # POST /tg_messages or /tg_messages.json
  def create
    @tg_message = TgMessage.new(tg_message_params)

    respond_to do |format|
      if @tg_message.save
        format.html { redirect_to tg_message_url(@tg_message), notice: "Tg message was successfully created." }
        format.json { render :show, status: :created, location: @tg_message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tg_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tg_messages/1 or /tg_messages/1.json
  def update
    respond_to do |format|
      if @tg_message.update(tg_message_params)
        format.html { redirect_to tg_message_url(@tg_message), notice: "Tg message was successfully updated." }
        format.json { render :show, status: :ok, location: @tg_message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tg_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tg_messages/1 or /tg_messages/1.json
  def destroy
    @tg_message.destroy!

    respond_to do |format|
      format.html { redirect_to tg_messages_url, notice: "Tg message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tg_message
    @tg_message = TgMessage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tg_message_params
    params.fetch(:tg_message, {})
  end
end
