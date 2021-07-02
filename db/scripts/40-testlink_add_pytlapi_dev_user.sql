--  -----------------------------------------------------------------
--  TestLink-API-Python-client Open Source Project - http://testlink.sourceforge.net/
--  @filesource 40-testlink_add-pyTLapi_dev_user.sql
--  SQL script - create pyTLapi dev user used user testing TestLink-API-Python-cliente
--
--  Database Type: Postgres 
--
--  -----------------------------------------------------------------

--  pyTLapi account with well known api key required for api testing
--  SECURITY: never use this docker image in production, only in local development
--
INSERT INTO /*prefix*/users (login,password,role_id,email,first,last,locale,active,script_key, cookie_string)
			VALUES ('pyTLapi',MD5('pyTLapi'), 8,'pyTLapi@example.com', 'TestLink-API-Python-client','dev admin tester', 'en_GB',1,
					'48072c25257af9f477a22c97a3858337', (MD5(RANDOM()::text) || MD5('pyTLapi')) );

