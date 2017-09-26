<img src="http://file.gudi.kr/icon/icon_goodee.png" width="50" height="50"></img> [구디아카데미](http://goodee.co.kr)
# Spring
### 참조 자료 링크
> * [STS](https://spring.io/tools)
> * [mybatis](http://www.mybatis.org/mybatis-3/ko/)
> * [maven](https://maven.apache.org/)
> * [maven repository](https://mvnrepository.com/)
> * [tomcat](http://tomcat.apache.org/)
> * [mariadb](https://mariadb.org/)
> * [w3schools](https://www.w3schools.com/)

### Spring MVC - GuideLine
<img src="http://file.gudi.kr/img/SpringMVCScaffoldingBlueprint.jpg" width="100%"></img>
<img src="http://file.gudi.kr/img/mvc-flow.png" width="100%"></img>

### Spring MVC Project Create
<img src="http://file.gudi.kr/img/Spring/Spring-Legacy1.png" width="100%"></img>
<img src="http://file.gudi.kr/img/Spring/Spring-Legacy2.png" width="100%"></img>

> * [pom.xml](http://file.gudi.kr/img/Spring/pom.xml)

<pre>
  <code>
    Spring  - spring-webmvc, spring-jdbc, spring-test
    Test    - junit
    JDBC    - mariadb-java-client
    Mybatis - mybatis, mybatis-spring
    JSON    - json-lib-ext-spring
  </code>
</pre>

### JNDI - Tomcat 설정 방법 (MariaDB)
##### server.xml
1. JDBC 연결
<pre>
  <code>
    Resource 
    auth="Container" 
    defaultAutoCommit="true" 
    factory="org.apache.tomcat.jdbc.pool.DataSourceFactory" 
    type="javax.sql.DataSource" 
    initialSize="10" 
    maxActive="30" 
    maxWait="10000" 
    minIdle="30" 
    name="jdbc/name" 
    driverClassName="org.mariadb.jdbc.Driver" 
    url="jdbc:mysql://host:3306/database-name"  
    username=""
    password="" 
    validationQuery="SELECT 1"
  </code>
</pre>
  
##### context.xml
2. 프로젝트에서 사용 가능하도록 전역 변수 생성
<pre>
  <code>
   ResourceLink 
   global="jdbc/name" 
   name="jdbc/name" 
   type="javax.sql.DataSource"
  </code>
</pre>

### Spring Configuration
##### root-context.xml
1. JNDI 연결1 방법
<pre>
  <code>
   jee:jndi-lookup 
   jndi-name="jdbc/name" 
   id="dataSource" 
   expected-type="javax.sql.DataSource"
  </code>
</pre>

1. JNDI 연결2 방법
<pre>
  <code>
   bean 
   id="dataSource" 
   class="org.springframework.jndi.JndiObjectFactoryBean" 
   p:jndiName="java:/comp/env/jdbc/name" 
   p:resourceRef="true"
  </code>
</pre>

2. Mybatis 설정
<pre>
  <code>
   bean 
   id="sqlSessionFactory" 
   class="org.mybatis.spring.SqlSessionFactoryBean" 
   p:dataSource-ref="dataSource" 
   p:mapperLocations="classpath:/sql/*.xml" 
   p:typeAliasesPackage="com.java.web.bean"
  </code>
</pre>
  
3. Session 생성 (openSession)
<pre>
  <code>
   bean 
   id="sqlSession" 
   class="org.mybatis.spring.SqlSessionTemplate" 
   c:sqlSessionFactory-ref="sqlSessionFactory"
  </code>
</pre>
