# encoding: utf-8
require 'digest/sha1'
class User < ActiveRecord1
  # Virtual attribute for the unencrypted password
  attr_accessor :password, :password_forgotten
  attr_accessible :login, :email, :password, :password_confirmation,
                  :first_name, :last_name

  validates_presence_of     :login, :email
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :email, :case_sensitive => false
  
  before_save               :encrypt_password
  before_create             :make_activation_code 
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
#  attr_accessible :login, :email, :password, :password_confirmation

  self.class_name_rus = "пользователь"    
  self.class_name_rus_cap = "Пользователь"
  self.submit_text = "Создать учётную запись"  

  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find :first, :conditions => ['login = ? and activated_at IS NOT NULL', login] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  def forgot_password 
    self.password_forgotten = true 
    create_pw_reset_code 
  end 
  
  def reset_password
    update_attributes(:pw_reset_code => nil) 
  end 

  def self.forgot_password_notice
    "Письмо с инструкциями по<br />
     изменению пароля отправлены на<br />
     Ваш адрес электронной почты." 
  end

  def self.user_not_found_notice
    "#{class_name_rus_cap} с этим адресом<br />
     электронной почты не найден!"
  end

  def reset_password_notice; "Пароль удачно изменен." end
  
  def reset_password_page_title; "Переустановка пароля" end

  def new_user_notice
    "Спасибо за регистрацию! На Ваш адрес электронной почты
     отправлено письмо с инструкцией по активации Вашей учётной записи, после
     чего Вы сможете войти в систему."    
  end
  
  def activate_user_notice; "Регистрация закончена!" end

  def self.logout_text; "Выйти" end

  def self.login_rus; "Имя пользователя" end

  def self.email_rus; "Адрес электронной почты" end
  
  def self.last_name_rus; "Фамилия" end
  
  def self.first_name_rus; "Имя" end

  def self.password_rus; "Пароль" end
  
  def self.password_confirmation_rus; "Подтверждение пароля" end
        
  protected
  
    def create_pw_reset_code 
      self.pw_reset_code = Digest::SHA1.hexdigest("secret-#{Time.now}") 
    end 
    
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    def make_activation_code
      self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end

end
