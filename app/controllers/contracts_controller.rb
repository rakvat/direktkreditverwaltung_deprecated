class ContractsController < ApplicationController
  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.order(:number)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contracts }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.json
  def new
    @contact = Contact.find(params[:contact_id])
    @contract = Contract.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
    @contact = Contact.find(@contract.contact_id)
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contact = Contact.find(params[:contact_id])
    @contract = @contact.contracts.create(params[:contract])

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Der Vertrag wurde erfolgreich erstellt' }
        format.json { render json: @contract, status: :created, location: @contract }
      else
        format.html { render action: "new" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to @contract, notice: 'Der Vertrag wurde erfolgreich aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url }
      format.json { head :no_content }
    end
  end

  # GET /contracts/interest
  def interest
    puts "path to interest"
    @contracts = []
    if params[:contract]
      @contracts = [params[:contract]]
    elsif
      @contracts = Contract.order(:number)      
    end
    @year = DateTime.now.to_date.year
    respond_to do |format|
      format.html 
      format.json { render json: @contracts }
    end
  end
end
