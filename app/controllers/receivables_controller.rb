class ReceivablesController < ApplicationController

  def index
    @receivables = current_user.receivables
  end

  def new
    @receivable = current_user.receivables.build
  end

  def create 
    @receivable = current_user.receivables.build(receivable_params)
     
    if @receivable.save
      redirect_to receivable_path(@receivable)
    else
       render 'new'
     end 
  end

  def show 
    @receivable = current_user.receivables.find(params[:id])
  end 

  def edit 
     @receivable = current_user.receivables.find(params[:id])
  end 

  def update 
    @receivable = current_user.receivables.find(params[:id])
    if @receivable.update(receivable_params)
       redirect_to receivables_path
    else 
      render 'edit'
    end
  end 

  def destroy 
    @receivable = current_user.receivables.find(params[:id])
    @receivable.destroy

    redirect_to receivables_path  
  end

  def email_form
    @receivable = current_user.receivables.find(params[:id])    
  end

  def sending_email
    @receivable = current_user.receivables.find(params[:id])
    UserMailer.welcome_email(@receivable,email_params[:subject], email_params[:content]).deliver
    redirect_to receivables_path
  end

  private 

  def receivable_params
    params.require(:receivable).permit(:debtor, :email, :in_debt, :total_debt)
  end 

  def email_params
    params.require(:email).permit(:subject, :content)
  end 



end
