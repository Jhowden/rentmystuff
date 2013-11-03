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
    if params[:start_date].match(/dd\/dd\/dddd/)
      start_date = Date.strptime(params[:start_date], '%m/%d/%Y')
    else
      start_date = Date.today
    end


    if params[:end_date].match(/dd\/dd\/dddd/)
      end_date = Date.strptime(params[:end_date], '%m/%d/%Y')
    else
      end_date = 30.days.from_now.to_date
    end

    (start_date...end_date)
  end

end
