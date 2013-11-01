module ItemsHelper
   
   def parse_search_dates!(params)

    params[:q][:available_dates_cont] = parse_dates(params).to_yaml
   
   end

  def parse_create_dates!(params)
    params[:item][:available_dates] = parse_dates(params)
  end

  private

  def parse_dates(params)
    start_date = Date.strptime(params[:start_date], '%m/%d/%y')
    end_date = Date.strptime(params[:end_date], '%m/%d/%y')

    (start_date..end_date).to_a
  end

end
