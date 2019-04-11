
external_url 'http://127.0.0.1'



gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.gmail.com"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "rodrigo.rivera@jaak-it.com"
gitlab_rails['smtp_password'] = "RyAS@nti07"
gitlab_rails['smtp_domain'] = "smtp.gmail.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
gitlab_rails['smtp_openssl_verify_mode'] = 'peer' # Can be: 'none', 'peer', 'client_once', 'fail_if_no_peer_cert', see http://api.rubyonrails.org/classes/ActionMailer/Base.html

gitlab_rails['ldap_enabled'] = true


gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
  main: # 'main' is the GitLab 'provider ID' of this LDAP server
    label: 'LDAP-JaakIT-Fiinlab'
    host: '172.17.77.99'
    port: 389
    uid: 'uid'
    bind_dn: 'cn=Manager,dc=work,dc=fiinlab,dc=local'
    password: 'F11nl4b'
    encryption: 'plain' # "start_tls" or "simple_tls" or "plain"
    verify_certificates: false
    smartcard_auth: false
    active_directory: false
    allow_username_or_email_login: false
    lowercase_usernames: false
    block_auto_created_users: false
    base: 'ou=Users,dc=work,dc=fiinlab,dc=local'
    user_filter: 'memberOf=cn=git,ou=Group,dc=work,dc=fiinlab,dc=local'
EOS

