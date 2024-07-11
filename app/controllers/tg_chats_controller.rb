class TgChatsController < ApplicationController
  before_action :set_tg_chat, only: %i[ show edit update destroy ]

  # GET /tg_chats or /tg_chats.json
  def index
    @tg_chats = TgChat.all
  end

  # GET /tg_chats/1 or /tg_chats/1.json
  def show
  end

  # GET /tg_chats/new
  def new
    @tg_chat = TgChat.new
  end

  # GET /tg_chats/1/edit
  def edit
  end

  # POST /tg_chats or /tg_chats.json
  def create
    @tg_chat = TgChat.new(tg_chat_params)

    respond_to do |format|
      if @tg_chat.save
        format.html { redirect_to tg_chat_url(@tg_chat), notice: "Tg chat was successfully created." }
        format.json { render :show, status: :created, location: @tg_chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tg_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tg_chats/1 or /tg_chats/1.json
  def update
    respond_to do |format|
      if @tg_chat.update(tg_chat_params)
        format.html { redirect_to tg_chat_url(@tg_chat), notice: "Tg chat was successfully updated." }
        format.json { render :show, status: :ok, location: @tg_chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tg_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tg_chats/1 or /tg_chats/1.json
  def destroy
    @tg_chat.destroy!

    respond_to do |format|
      format.html { redirect_to tg_chats_url, notice: "Tg chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tg_chat
      @tg_chat = TgChat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tg_chat_params
      params.fetch(:tg_chat, {})
    end
end
