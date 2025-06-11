### 1、强制更新maven依赖
mvn clean install -U

### 2、检查Maven的配置
mvn help:effective-settings

### 3、清理本地的Maven仓库缓存
mvn dependency:purge-local-repository

### 4、启动Spring boot
### 4.1、方式一： 使用 Maven 命令启动（推荐）
### 在项目根目录（即包含pom.xml的目录）下，执行以下命令：
```
mvn spring-boot:run
```
### 4.2、方式二：打包后运行
### 打包项目
### 在项目根目录下执行 mvn clean package, 会在target目录下生成一个kc_maven_web-*.jar文件。
### 运行Jar包,执行：   java -jar target/kc_maven_web-*.jar
### 启动成功后
### 控制台会显示Started KcMavenWebApplication等字样，说明服务已启动。
### 默认端口为8080，可通过 http://localhost:8080 访问。

### 4.3、测试数据库的连通性
mysql -u root -pAa123789 -e "SELECT VERSION();"

### 4.4、检查数据库
mysql -u root -pAa123789 -e "SHOW DATABASES;"

### 4.5、执行数据库初始化脚本
mysql -u root -pAa123789 -e "source src/main/resources/db/init.sql"
或 Get-Content src/main/resources/db/init.sql | mysql -u root -pAa123789

### 验证数据库和表是否创建成功
mysql -u root -pAa123789 -e "USE kychen; SHOW TABLES;"

### 检查用户表的数据
mysql -u root -pAa123789 -e "USE kychen; SELECT * FROM sys_user;"

### 删除数据库的数据
mysql -u root -pAa123789 -e "DROP DATABASE IF EXISTS kychen;"

### 重新执行数据库初始化脚本
Get-Content src/main/resources/db/init.sql | mysql -u root -pAa123789


### 项目目录结构
kc_maven_web/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── org/example/kc_maven_web/
│   │   │       ├── config/         # 配置类
│   │   │       ├── controller/     # 控制器
│   │   │       ├── service/        # 服务接口
│   │   │       │   └── impl/       # 服务实现
│   │   │       ├── mapper/         # MyBatis映射接口
│   │   │       ├── entity/         # 实体类
│   │   │       ├── dto/            # 数据传输对象
│   │   │       ├── vo/             # 视图对象
│   │   │       ├── common/         # 公共类
│   │   │       └── utils/          # 工具类
│   │   └── resources/
│   │       ├── mapper/            # MyBatis XML映射文件
│   │       ├── db/                # 数据库脚本
│   │       └── application.yml    # 应用配置文件
└── pom.xml                        # Maven配置文件

### 2. 各模块详细说明
#### 2.1 配置模块 (config/)
    SecurityConfig.java: Spring Security配置，处理认证和授权
    CorsConfig.java: 跨域配置，处理跨域请求
    负责项目的各种配置，包括安全、跨域、数据库等配置
#### 2.2 控制器模块 (controller/)
    UserController.java: 用户相关接口控制器
    AuthController.java: 认证相关接口控制器
    负责处理HTTP请求，接收参数并返回响应
#### 2.3 服务模块 (service/)
    UserService.java: 用户服务接口
    impl/UserServiceImpl.java: 用户服务实现类
    负责业务逻辑处理，是核心业务层
#### 2.4 数据访问模块 (mapper/)
    UserMapper.java: 用户数据访问接口
    负责与数据库交互，执行SQL操作
#### 2.5 实体模块 (entity/)
    User.java: 用户实体类
    对应数据库表结构，使用MyBatis Plus注解
#### 2.6 数据传输对象 (dto/)
    LoginDTO.java: 登录数据传输对象
    用于接收前端请求参数
#### 2.7 视图对象 (vo/)
    用于返回给前端的数据对象
    可以包含额外的展示字段
#### 2.8 公共模块 (common/)
    Result.java: 统一响应结果类
    GlobalExceptionHandler.java: 全局异常处理器
    包含项目共用的工具类和配置
#### 2.9 工具模块 (utils/)
    JwtUtil.java: JWT工具类
    PasswordGenerator.java: 密码生成工具类
    包含各种工具类
#### 2.10 资源文件 (resources/)
    application.yml: 应用配置文件
    数据库配置
    服务器配置
    JWT配置
    MyBatis Plus配置
    db/init.sql: 数据库初始化脚本
    mapper/*.xml: MyBatis XML映射文件
#### 3. 技术栈
    Spring Boot 2.7.5: 基础框架
    Spring Security: 安全框架
    MyBatis Plus: ORM框架
    MySQL: 数据库
    JWT: 用户认证
    Lombok: 简化代码
    Maven: 项目管理
#### 4. 主要功能
    用户认证
    登录接口: /auth/callback/login
    JWT token认证
    安全控制
    跨域支持
    密码加密
    接口权限控制
#### 5. 数据流程
    前端请求 → Controller
    Controller → Service
    Service → Mapper
    Mapper → 数据库
    数据库 → Mapper → Service → Controller → 前端