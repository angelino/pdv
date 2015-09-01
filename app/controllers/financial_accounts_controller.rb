class FinancialAccountsController < ApplicationController
  before_action :set_financial_account, only: [:show, :edit, :update, :destroy]

  # GET /financial_accounts
  # GET /financial_accounts.json
  def index
    @financial_accounts = FinancialAccount.all
  end

  # GET /financial_accounts/1
  # GET /financial_accounts/1.json
  def show
  end

  # GET /financial_accounts/new
  def new
    @financial_account = FinancialAccount.new
  end

  # GET /financial_accounts/1/edit
  def edit
  end

  # POST /financial_accounts
  # POST /financial_accounts.json
  def create
    @financial_account = FinancialAccount.create(financial_account_params)

    respond_to do |format|
      if @financial_account.persisted?
        format.json { render :show, status: :created, location: @financial_account }
      else
        format.json { render json: @financial_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_accounts/1
  # PATCH/PUT /financial_accounts/1.json
  def update
    respond_to do |format|
      if @financial_account.update(financial_account_params)
        format.json { render :show, status: :ok, location: @financial_account }
      else
        format.json { render json: @financial_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_accounts/1
  # DELETE /financial_accounts/1.json
  def destroy
    @financial_account.destroy!
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_account
      @financial_account = FinancialAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_account_params
      params.require(:financial_account).permit(:name)
    end
end
