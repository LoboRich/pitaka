class MarketsController < ApplicationController
  before_action :set_market, only: %i[ show edit update destroy buy sell]

  # GET /markets or /markets.json
  def index
    @markets = Market.all
    @portfolio = current_user.account.portfolio.market_portfolios
    @balance = current_user.account.wallet.balance
  end

  # GET /markets/1 or /markets/1.json
  def show
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets or /markets.json
  def create
    @market = Market.new(market_params)

    respond_to do |format|
      if @market.save
        format.html { redirect_to @market, notice: "Market was successfully created." }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /markets/1 or /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to @market, success: "Market was successfully updated." }
        format.json { render :show, status: :ok, location: @market }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1 or /markets/1.json
  def destroy
    @market.destroy
    respond_to do |format|
      format.html { redirect_to markets_url, success: "Market was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def buy
    balance = Wallet.sufficient_balance?(current_user.account.wallet, params['price'])
    stocks = Market.sufficient_supply?(@market, params['stocks'])
    if balance && stocks
      Wallet.deduct(current_user.account.wallet, params['price'])
      Market.deduct_stocks(@market, params['stocks'])
      if MarketPortfolio.duplicate?(@market.id, current_user.account.portfolio)
        market = current_user.market_portfolios.find_by(market_id: @market.id)
        market.update(stocks: market.stocks.to_f + params[:stocks].to_f, price: market.price.to_f + params[:price])
      else
        MarketPortfolio.create(portfolio_id: current_user.account.portfolio.id,market_id: @market.id, price: params[:price], stocks: params[:stocks])
      end
      redirect_to markets_url, notice: "Successfully purchased a stock."
    else
      redirect_to markets_url, notice: "Wallet balance is not enough."
    end
    
  end

  def sell
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def market_params
      params.require(:market).permit(:logo, :name, :symbol, :description, :buying_price, :selling_price, :supply, :market_cap)
    end
end
