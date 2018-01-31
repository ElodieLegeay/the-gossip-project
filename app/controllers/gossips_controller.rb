class GossipsController < ApplicationController
 
  def index
    @gossips = Gossip.all
  end

  def show
  end

  def new
    @gossip = Gossip.new
  end

  def edit
  end

  def create
    @gossip = Gossip.new(gossip_params)
 @gossip.save
         redirect_to @gossip, notice: 'Gossip was successfully created.' 
  end

  def update
    respond_to do |format|
      if @gossip.update(gossip_params)
       redirect_to @gossip, notice: 'Gossip was successfully updated.'
      else
        render :edit
      end
    end
  end

 
  def destroy
    @gossip.destroy
      redirect_to gossips_url, notice: 'Gossip was successfully destroyed.'
  end

  private  
    def set_gossip
      @gossip = Gossip.find(params[:id])
      params.require(:gossip).permit(:anonymous_author, :content)
    end
end