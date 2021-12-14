class MarketPortfoliosController < ApplicationController
  before_action :set_market_portfolio, only: %i[ show edit update destroy ]

  # GET /market_portfolios or /market_portfolios.json
  def index
    @market_portfolios = MarketPortfolio.all
  end

  # GET /market_portfolios/1 or /market_portfolios/1.json
  def show
  end

  # GET /market_portfolios/new
  def new
    @market_portfolio = MarketPortfolio.new
  end

  # GET /market_portfolios/1/edit
  def edit
  end

  # POST /market_portfolios or /market_portfolios.json
  def create
    @market_portfolio = MarketPortfolio.new(market_portfolio_params)

    respond_to do |format|
      if @market_portfolio.save
        format.html { redirect_to @market_portfolio, notice: "Market portfolio was successfully created." }
        format.json { render :show, status: :created, location: @market_portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @market_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /market_portfolios/1 or /market_portfolios/1.json
  def update
    respond_to do |format|
      if @market_portfolio.update(market_portfolio_params)
        format.html { redirect_to @market_portfolio, notice: "Market portfolio was successfully updated." }
        format.json { render :show, status: :ok, location: @market_portfolio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @market_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /market_portfolios/1 or /market_portfolios/1.json
  def destroy
    @market_portfolio.destroy
    respond_to do |format|
      format.html { redirect_to market_portfolios_url, notice: "Market portfolio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_portfolio
      @market_portfolio = MarketPortfolio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def market_portfolio_params
      params.require(:market_portfolio).permit(:portfolio_id, :market_id, :stocks, :revenue)
    end
end
