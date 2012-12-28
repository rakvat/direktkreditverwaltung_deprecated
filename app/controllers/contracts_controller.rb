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
    params[:year] ||= DateTime.now.year
    @contracts = []
    if params[:contract]
      @contracts = [params[:contract]]
    elsif
      @contracts = Contract.order(:number)      
    end
    @year = params[:year].to_i

    if params[:output] && params[:output].index("latex") == 0
      if params[:output] == "latex_overview"
        render "interest_overview.latex" and return
      elsif params[:output] == "latex_letter"
        render "interest_letter.latex", :layout => "letter" and return
      end
    end

    respond_to do |format|
      format.html 
      format.json { render json: @contracts }
    end
  end

  # GET /contracts/interest_transfer_list
  def interest_transfer_list
    params[:year] ||= DateTime.now.year
    @contracts = Contract.order(:number)      
    @year = params[:year].to_i

    respond_to do |format|
      format.html 
      format.json { render json: @contracts }
    end
  end
  
  # GET /contracts/interest_average
  def interest_average
    @contracts = Contract.order(:number)      

    respond_to do |format|
      format.html 
      format.json { render json: @contracts }
    end
  end

  # GET /contracts/expiring
  def expiring
    @contracts = Contract.all
    @contracts.each do |contract|
      duration_in_month = contract.duration_month || contract.duration_years * 12
      contract.expiring = duration_in_month.months.since(contract.start)
    end

    @contracts.sort_by! {|contract| contract.expiring}

    respond_to do |format|
      format.html # expiring.html.erb
      format.json { render json: @contracts }
    end
  end
end
