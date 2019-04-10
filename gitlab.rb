
external_url 'http://127.0.0.1'


### Email Settings
# gitlab_rails['gitlab_email_enabled'] = true
# gitlab_rails['gitlab_email_from'] = 'example@example.com'
# gitlab_rails['gitlab_email_display_name'] = 'Example'
# gitlab_rails['gitlab_email_reply_to'] = 'noreply@example.com'
# gitlab_rails['gitlab_email_subject_suffix'] = ''


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
    ## EE only
#    group_base: ''
#    admin_group: ''
#    sync_ssh_keys: false
#
#   secondary: # 'secondary' is the GitLab 'provider ID' of second LDAP server
#     label: 'LDAP'
#     host: '_your_ldap_server'
#     port: 389
#     uid: 'sAMAccountName'
#     bind_dn: '_the_full_dn_of_the_user_you_will_bind_with'
#     password: '_the_password_of_the_bind_user'
#     encryption: 'plain' # "start_tls" or "simple_tls" or "plain"
#     verify_certificates: true
#     smartcard_auth: false
#     active_directory: true
#     allow_username_or_email_login: false
#     lowercase_usernames: false
#     block_auto_created_users: false
#     base: ''
#     user_filter: ''
#     ## EE only
#     group_base: ''
#     admin_group: ''
#     sync_ssh_keys: false
EOS

