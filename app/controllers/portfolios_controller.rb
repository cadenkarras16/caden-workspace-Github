class PortfoliosController < ApplicationController
    def index
      @portfolio_items = Portfolio.all  
    end
    
    def new
      @portfolio_item = Portfolio.new
    end
    
      def create
     @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'We are so proud of you, your Portfolio Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def update
     @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      
      else
        format.html { render :edit }
        
      end
    end
  end
  def show
       @portfolio_item = Portfolio.find(params[:id])
  end
  
   def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'We are so proud of you, your Blog was successfully created.' }
       
      else
        format.html { render :new }
      
      end
    end
  end

end
