CREATE OR REPLACE PACKAGE BCrypt IS

  FUNCTION HashPassword(password IN VARCHAR2,
                        salt     IN VARCHAR2) RETURN VARCHAR2;
  FUNCTION GenerateSalt(log_rounds IN NUMBER,
                        random     IN VARCHAR2) RETURN VARCHAR2;
  FUNCTION GenerateSalt(log_rounds IN NUMBER) RETURN VARCHAR2;
  FUNCTION GenerateSalt RETURN VARCHAR2;
  FUNCTION CheckPassword(plaintext IN VARCHAR2,
                         hashed    IN VARCHAR2) RETURN BOOLEAN;

END BCrypt;
/
CREATE OR REPLACE PACKAGE BODY BCrypt IS

  FUNCTION HashPassword(password IN VARCHAR2,
                        salt     IN VARCHAR2) RETURN VARCHAR2 AS
    LANGUAGE JAVA name 'BCrypt.hashpw (java.lang.String, java.lang.String) return java.lang.String';
  --===============================================================================
  FUNCTION GenerateSalt(log_rounds IN NUMBER,
                        random     IN VARCHAR2) RETURN VARCHAR2 AS
    LANGUAGE JAVA name 'BCrypt.gensalt (int, java.security.SecureRandom) return java.lang.String';
  --===============================================================================
  FUNCTION GenerateSalt(log_rounds IN NUMBER) RETURN VARCHAR2 AS
    LANGUAGE JAVA name 'BCrypt.gensalt (int) return java.lang.String';
  --===============================================================================
  FUNCTION GenerateSalt RETURN VARCHAR2 AS
    LANGUAGE JAVA name 'BCrypt.gensalt () return java.lang.String';
  --===============================================================================
  FUNCTION CheckPassword(plaintext IN VARCHAR2,
                         hashed    IN VARCHAR2) RETURN BOOLEAN AS
    LANGUAGE JAVA name 'BCrypt.checkpw (java.lang.String, java.lang.String) return boolean';

END BCrypt;
/
