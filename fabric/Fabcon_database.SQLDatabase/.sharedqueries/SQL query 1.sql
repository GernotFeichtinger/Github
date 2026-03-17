SELECT * 

FROM sys. fn_get_audit_file_v2( 

  'https://onelake.blob.fabric.microsoft.com/378fe09b-fc19-4948-8742-cbf73171255e/abe21b43-f608-4ca7-bc8e-fb44d9de4a78/Audit/sqldbauditlogs/', 

  DEFAULT, DEFAULT, DEFAULT, DEFAULT 

)