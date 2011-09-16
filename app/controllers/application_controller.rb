# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  
  #FAR: Linki, drzewko? http://railscasts.com/episodes/262-trees-with-ancestry
  #FAR: Posty z taga #s35blog z blipa, dodane przeze mnie
  #FAR: Parcels na hasło
  #FAR: Trackback
  #FAR: Powiadomienia sms wieczorem na telefon o zdarzeniach? Ewentualnie mail/jabber
  #FAR: Portfolio, w html
  #FAR: Szukajka na blogu
  
  #FEATURE: Błędy w komentarzu
  
  #OPTIMIZE: porzadek w helperze
  
  #FIX: Nie działa tokeninput w paczkach w ogóle
  #FIX: Po usunięciu wydarzenia facebox się nie zamyka
  #FIX: Logout nie dzioła
  
  #TEST: Post - visible
  #TEST: Post - commentable
  #TEST: Post - accessible
  #TEST: Post - without title - errors
  #TEST: Post - without content - no errors
  #TEST: Jeśli post accessible & !visible, to widoczny w bocznym panelu
  #TEST: Jeśli post !accessible to widoczny w bocznym panelu
  #TEST: Comment - without commenter - errors
  #TEST: Comment - without email - errors
  #TEST: Comment - without www - no errors
  #TEST: Comment - without content - errors
  #TEST: Comment - po kliknięciu w `Usuń`, div znika
  #TEST: Event - without name - errors
  #TEST: Event - po kliknięciu `Usuń` znika facebox i pozycja z kalendarza
  #TEST: Event - działanie przycisku dodaj event z poziomu innej subdomeny
  #TEST: Event - działanie przycisku dodaj event z poziomu tej samej subdomeny
  #TEST: Parcel - działanie przycisku dodaj event z poziomu innej subdomeny
  #TEST: Parcel - działanie przycisku dodaj event z poziomu tej samej subdomeny
  

  private

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin
  
  def authorize
    redirect_to panel_new_session_path, :notice => "Brak dostepu." unless current_admin
  end
end
