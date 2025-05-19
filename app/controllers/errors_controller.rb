class ErrorsController < ApplicationController
  before_action :set_error, only: %i[ show edit update destroy ]

  # GET /errors or /errors.json
  def index
    @errors = Error.all
  end

  # GET /errors/1 or /errors/1.json
  def show
  end

  # GET /errors/new
  def new
    @error = Error.new
  end

  # GET /errors/1/edit
  def edit
  end

  # POST /errors or /errors.json
  # def create
  #   @error = Error.new(error_params)

  #   respond_to do |format|
  #     if @error.save
  #       format.html { redirect_to @error, notice: "Error was successfully created." }
  #       format.json { render :show, status: :created, location: @error }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @error.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def create
    @error = Error.new(error_params)

    if @error.save
      render json: { status: "saved" }, status: :created
    else
      render json: @error.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /errors/1 or /errors/1.json
  def update
    respond_to do |format|
      if @error.update(error_params)
        format.html { redirect_to @error, notice: "Error was successfully updated." }
        format.json { render :show, status: :ok, location: @error }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @error.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /errors/1 or /errors/1.json
  def destroy
    @error.destroy!

    respond_to do |format|
      format.html { redirect_to errors_path, status: :see_other, notice: "Error was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_error
      @error = Error.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def error_params
        # params.permit(:error_class, :message, :backtrace, :path, :method, :timestamp)
      params.expect(error: [ :error_class, :message, :backtrace, :path, :method, :timestamp ])
    end
end
