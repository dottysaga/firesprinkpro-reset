-- Run this in Supabase SQL Editor
-- Creates a simple function to log email opens via REST API

CREATE OR REPLACE FUNCTION log_email_open(
  p_contact_id text,
  p_contact_name text DEFAULT '',
  p_company text DEFAULT '',
  p_email_address text DEFAULT '',
  p_user_agent text DEFAULT '',
  p_ip_address text DEFAULT ''
)
RETURNS json
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  INSERT INTO email_opens (
    contact_id,
    contact_name,
    company,
    email_address,
    user_agent,
    ip_address
  ) VALUES (
    p_contact_id,
    p_contact_name,
    p_company,
    p_email_address,
    p_user_agent,
    p_ip_address
  );
  RETURN json_build_object('success', true);
END;
$$;

-- Allow anonymous access to this function
GRANT EXECUTE ON FUNCTION log_email_open TO anon;
