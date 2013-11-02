module ItemsHelper
   
   def parse_search_dates!(params)

    params[:q][:dates] = parse_dates(params)
   
   end

  def parse_create_dates!(params)
    start_date = Date.strptime(params[:start_date], '%m/%d/%Y')
    end_date = Date.strptime(params[:end_date], '%m/%d/%Y')

    (start_date...end_date).to_a
  end

  private

  def parse_dates(params)
    start_date = Date.strptime(params[:start_date], '%m/%d/%Y')
    end_date = Date.strptime(params[:end_date], '%m/%d/%Y')

    (start_date...end_date)
  end

end
