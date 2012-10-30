class VerbosController < ApplicationController
  # GET /verbos
  # GET /verbos.json
  def index
    @verbos = Verbo.where("name like ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @verbos.map(&:attributes) }
    end

    # @verbos = Verbo.where("name like ?", "%#{params[:q]}%")
    # respond_to do |format|
    #   format.html
    #   format.json { render :json => @verbos.map(&:attributes) }
    # end
  end

  # GET /verbos/1
  # GET /verbos/1.json
  def show
    @verbo = Verbo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @verbo }
    end
  end

  # GET /verbos/new
  # GET /verbos/new.json
  def new
    @verbo = Verbo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @verbo }
    end
  end

  # GET /verbos/1/edit
  def edit
    @verbo = Verbo.find(params[:id])
  end

  # POST /verbos
  # POST /verbos.json
  def create
    @verbo = Verbo.new(params[:verbo])

    respond_to do |format|
      if @verbo.save
        format.html { redirect_to @verbo, notice: 'Verbo was successfully created.' }
        format.json { render json: @verbo, status: :created, location: @verbo }
      else
        format.html { render action: "new" }
        format.json { render json: @verbo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /verbos/1
  # PUT /verbos/1.json
  def update
    @verbo = Verbo.find(params[:id])

    respond_to do |format|
      if @verbo.update_attributes(params[:verbo])
        format.html { redirect_to @verbo, notice: 'Verbo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @verbo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verbos/1
  # DELETE /verbos/1.json
  def destroy
    @verbo = Verbo.find(params[:id])
    @verbo.destroy

    respond_to do |format|
      format.html { redirect_to verbos_url }
      format.json { head :no_content }
    end
  end
end
