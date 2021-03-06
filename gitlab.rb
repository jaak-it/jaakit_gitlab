external_url 'http://git.live.fiinlab.local'

gitlab_rails['ldap_enabled'] = true

gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
  main: # 'main' is the GitLab 'provider ID' of this LDAP server
    label: 'LDAP-JaakIT-Fiinlab'
    host: '172.17.77.99'
    port: 389
    uid: 'uid'
    bind_dn: 'cn=Manager,dc=live,dc=fiinlab,dc=local'
    password: 'F11nl4b'
    encryption: 'plain'
    verify_certificates: false
    smartcard_auth: false
    active_directory: false
    allow_username_or_email_login: false
    lowercase_usernames: false
    block_auto_created_users: false
    base: 'ou=Users,dc=live,dc=fiinlab,dc=local'
    user_filter: 'memberOf=cn=git,ou=Group,dc=live,dc=fiinlab,dc=local'
EOS
