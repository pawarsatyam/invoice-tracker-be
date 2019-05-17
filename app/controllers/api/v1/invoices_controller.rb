class Api::V1::InvoicesController < ApplicationController
 def index
   @invoices = Invoice.all
   render json: {invoices: @invoices},status: 200
 end

 def show
   invoice = Invoice.find(params[:id])
   render json: {invoice: invoice},status: 200
 end

 def create
 	invoice = Invoice.create(invoice_params)
   if invoice.save
     render json: {invoice: invoice,success: true, invoice: "Record create successfullly"}, status: 200
   else
     render json: { success: false, invoice: "#{invoice.errors.invoices}" },status: 400
   end
 end

 def update
   invoice= Invoice.find(params[:id])
   if invoice.update(invoice_params)
     render json: {invoice: invoice,success: true, invoice: "Record Update successfullly"}
   else
     render json: { success: false, error: "#{invalid.record.errors.invoices}" }
   end
 end

 def destroy 
 	invoice = Invoice.find(params[:id])
 	invoice.destroy
   render json: {invoice: "Record Delete successfullly",id: params[:id]}
 end


 private
 def invoice_params
  params.require(:invoices).permit(:amount, :date)
 end
end
