# 이클립스 다운
https://www.eclipse.org/downloads/packages/release/2024-03/r/eclipse-ide-enterprise-java-and-web-developers
# 톰켓 다운
https://tomcat.apache.org/

# 오라클 비번 변경
<오라클 비밀 번호 바꾸기>
1. 윈도우+r  cmd
2. sqlplus 입력
3. user-name에 system as sysdba 입력
4.  Enter password : 입력 없이 엔터치기
5. show user 입력 후  enter    -> SYS뜨면 됨
6. alter user system identified by 1234;     -> 비밀번호 바뀜
7. conn system/1234 as sysdba;   -> 연결되나 확인

# 통켓 argument 추가
-Djava.library.path=C:\IPP\dbhomeXE\jdbc\lib\ojdbc11.jar

# 환경변수 설정 
### 오라클 홈 만들기 
ORACLE_HOME
C:\IPP\dbhomeXE
### 자바 홈 만들기
JAVA_HOME
C:\Program Files\Java\jdk-17
### path에 JAVA_HOME 추가하기
%JAVA_HOME%\bin
