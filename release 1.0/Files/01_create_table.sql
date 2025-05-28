CREATE TABLE release_test (
  id NUMBER PRIMARY KEY,
  description VARCHAR2(100),
  created_at DATE DEFAULT SYSDATE
);
