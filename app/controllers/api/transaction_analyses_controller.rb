module Api
  class TransactionAnalysesController < ApplicationController
    def index
      render json: TransactionAnalysis.all
    end
  end
end