module ApplicationHelper
  def show_user_name(_current_user)
    if signed_in?
      "<li class='nav-item'>
        Logged in as [<strong><%= current_user.email %></strong>]
      </li>
      <li class='nav-item'>
         #{link_to 'logout', destroy_user_session_path, class: 'nav-link text-white', method: :delete}
      </li>".html_safe
    else
      "<li class='nav-item'>
        #{link_to 'Log in / Sign up', new_user_registration_path, class: 'nav-link text-white'}
      </li>".html_safe
      end
  end
end
