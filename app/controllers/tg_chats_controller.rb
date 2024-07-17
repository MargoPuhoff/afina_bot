class TgChatsController < ApplicationController
  before_action :set_tg_chat, only: %i[show edit update destroy]

  # GET /tg_chats or /tg_chats.json
  def index
    @tg_chats = TgChat.all
  end

  # GET /tg_chats/1 or /tg_chats/1.json
  def show; end

  # GET /tg_chats/new
  def new
    @tg_chat = TgChat.new
  end

  # GET /tg_chats/1/edit
  def edit; end

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

  def count_tg_message
    chat_id = params[:tg_id]
    period = params[:period]
    messages = TgMessage.where(tg_chat_id: chat_id)
    users = TgUser.joins(:tg_messages)
                  .where(tg_messages: { tg_chat_id: chat_id })
                  .select('tg_users.name, COUNT(tg_messages.tg_id) AS message_count')
                  .group('tg_users.tg_id')
    count_per_month = {}

    case period
    when 'all_period'
      count_tg_message = messages.count
    when 'year_period'
      start_date = Time.now.beginning_of_year
      end_date = Time.now.end_of_year
      count_per_month = messages.where(created_at: start_date..end_date).group_by_month(:created_at).count
      count_per_month = count_per_month.transform_keys { |date| I18n.l(date, format: "%B") }
    else
      count_tg_message = messages.count
    end

    user_data = users.map do |user|
      { name: user.name, message_count: user.message_count }
    end

    respond_to do |format|
      format.json { render json: { count_tg_message:, users: user_data, count_per_month: } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tg_chat
    @tg_chat = TgChat.find(params[:tg_id])
  end

  # Only allow a list of trusted parameters through.
  def tg_chat_params
    params.fetch(:tg_chat, {})
  end
end
