class List
  def option_list(app, user_input)
    case user_input
    when 1
      app.list_books
    when 2
      app.list_persons
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_by_person
    end
  end
end
