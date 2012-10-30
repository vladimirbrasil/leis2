class ClassesController < ApplicationController
  # GET /classes
  # GET /classes.json
  def index
    @classes = Classe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classes }
    end
  end

  # GET /classes/1
  # GET /classes/1.json
  def show
    @class = Classe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @class }
    end
  end

  # GET /classes/new
  # GET /classes/new.json
  def new
    @class = Classe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @class }
    end
  end

  # GET /classes/1/edit
  def edit
    @class = Classe.find(params[:id])
  end

  # POST /classes
  # POST /classes.json
  def create
    @class = Classe.new(params[:class])

    respond_to do |format|
      if @class.save
        format.html { redirect_to @class, notice: 'Classe was successfully created.' }
        format.json { render json: @class, status: :created, location: @class }
      else
        format.html { render action: "new" }
        format.json { render json: @class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classes/1
  # PUT /classes/1.json
  def update
    @class = Classe.find(params[:id])

    respond_to do |format|
      if @class.update_attributes(params[:class])
        format.html { redirect_to @class, notice: 'Classe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classes/1
  # DELETE /classes/1.json
  def destroy
    @class = Classe.find(params[:id])
    @class.destroy

    respond_to do |format|
      format.html { redirect_to classes_url }
      format.json { head :no_content }
    end
  end
end
