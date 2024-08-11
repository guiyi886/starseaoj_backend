## 一、项目规划

### 实现核心

1）权限校验

谁能提代码，谁不能提代码

**2）代码沙箱（安全沙箱）**

用户代码藏毒：写个木马文件、修改系统权限

沙箱：隔离的、安全的环境，用户的代码不会影响到沙箱之外的系统的运行

资源分配：系统的内存有限，所以要限制用户程序的占用资源。

3）判题规则

题目用例的比对，结果的验证

4）任务调度

服务器资源有限，用户要排队，按照顺序去依次执行判题，而不是直接拒绝



### 核心业务流程

![Snipaste_2024-08-10_23-42-44](photo/Snipaste_2024-08-10_23-42-44.png)

![Snipaste_2024-08-08_03-19-44](photo/Snipaste_2024-08-08_03-19-44.png)

判题服务：获取题目信息、预计的输入输出结果，返回给主业务后端：用户的答案是否正确

代码沙箱：只负责运行代码，给出结果，不管什么结果是正确的。

**实现了解耦**



### 功能模块
1. 用户模块
   1. 注册
   2. 登录
2. 题目模块
   1. 创建题目（管理员）
   2. 删除题目（管理员）
   3. 修改题目（管理员）
   4. 搜索题目（用户）
   5. 在线做题
   6. 提交题目代码
3. 判题模块
   1. 提交判题（结果是否正确与错误）
   2. 错误处理（内存溢出、安全性、超时）
   3. **自主实现代码沙箱**（安全沙箱）
   4. 开放接口（提供一个独立的新服务）



### 项目扩展思路

1. 支持多种语言
2. Remote Judge
3. 完善的评测功能：普通测评、特殊测评、交互测评、在线自测、子任务分组评测、文件IO
4. 统计分析用户判题记录
5. 权限校验



### 技术点

Java 进程控制、Java 安全管理器、部分 JVM 知识点

虚拟机（云服务器）、Docker（代码沙箱实现）

Spring Cloud 微服务 、消息队列、多种设计模式



### 架构设计

![Snipaste_2024-08-08_03-27-12](photo/Snipaste_2024-08-08_03-27-12.png)



## 二、库表设计

### 用户表

只有管理员才能发布和管理题目，普通用户只能看题

```sql
-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    unionId      varchar(256)                           null comment '微信开放平台id',
    mpOpenId     varchar(256)                           null comment '公众号openId',
    userName     varchar(256)                           null comment '用户昵称',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userProfile  varchar(512)                           null comment '用户简介',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user/admin/ban',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (unionId)
) comment '用户' collate = utf8mb4_unicode_ci;
```



### 题目表

题目标题

题目内容：存放题目的介绍、输入输出提示、描述、具体的详情

题目标签（json 数组字符串）：栈、队列、链表、简单、中等、困难

题目答案：管理员 / 用户设置的标准答案

提交数、通过题目的人数等：便于分析统计（可以考虑根据通过率自动给题目打难易度标签）

判题相关字段：judgeConfig 判题配置（json 对象）：时间限制 timeLimit、内存限制 memoryLimit

judgeCase 判题用例（json 数组）：一个输入用例和一个输出用例

```json
[
  {
    "input": "1 2",
    "output": "3 4"
  },
  {
    "input": "1 3",
    "output": "2 4"
  }
]
```

存 json 的好处：便于扩展，只需要改变对象内部的字段，而不用修改数据库表（可能会影响数据库）

存 json 的前提：1.不需要根据某个字段去倒查这条数据。2.字段含义相关，属于同一类的值。3.字段存储空间占用不能太大

其他扩展字段：通过率、判题类型

```sql
-- 题目表
create table if not exists question
(
    id         bigint auto_increment comment 'id' primary key,
    title      varchar(512)                       null comment '标题',
    content    text                               null comment '内容',
    tags       varchar(1024)                      null comment '标签列表（json 数组）',
    answer     text                               null comment '题目答案',
    submitNum  int  default 0 not null comment '题目提交数',
    acceptedNum  int  default 0 not null comment '题目通过数',
    judgeCase text null comment '判题用例（json 数组）',
    judgeConfig text null comment '判题配置（json 对象）',
    thumbNum   int      default 0                 not null comment '点赞数',
    favourNum  int      default 0                 not null comment '收藏数',
    userId     bigint                             not null comment '创建用户 id',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete   tinyint  default 0                 not null comment '是否删除',
    index idx_userId (userId)
) comment '题目' collate = utf8mb4_unicode_ci;
```



### 题目提交表

judgeInfo（json 对象）

```json
{
  "message": "程序执行信息",
  "time": 1000, // 单位为 ms
  "memory": 1000, // 单位为 kb
}
```

判题信息枚举值：

- Accepted 成功
- Wrong Answer 答案错误
- Compile Error 编译错误
- Memory Limit Exceeded 内存溢出
- Time Limit Exceeded 超时
- Presentation Error 展示错误
- Output Limit Exceeded 输出溢出
- Waiting 等待中
- Dangerous Operation 危险操作
- Runtime Error 运行错误（用户程序的问题）
- System Error 系统错误（做系统人的问题）

```sql
-- 题目提交表
create table if not exists question_submit
(
    id         bigint auto_increment comment 'id' primary key,
    language   varchar(128)                       not null comment '编程语言',
    code       text                               not null comment '用户代码',
    judgeInfo  text                               null comment '判题信息（json 对象）',
    status     int      default 0                 not null comment '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
    questionId bigint                             not null comment '题目 id',
    userId     bigint                             not null comment '创建用户 id',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete   tinyint  default 0                 not null comment '是否删除',
    index idx_questionId (questionId),
    index idx_userId (userId)
) comment '题目提交';
```



### 数据库索引

什么情况下适合加索引？如何选择给哪个字段加索引？

答：首先从业务出发，无论是单个索引、还是联合索引，都要从你实际的查询语句、字段枚举值的区分度、字段的类型考虑（where 条件指定的字段）

比如：where userId = 1 and questionId = 2

可以选择根据 userId 和 questionId 分别建立索引（若还需要分别根据这两个字段单独查询）；也可以选择给这两个字段建立联合索引（所查询的字段是绑定在一起的）。

原则上：能不用索引就不用索引；能用单个索引就别用联合 / 多个索引；不要给没区分度的字段加索引（比如性别，就男 / 女）。因为索引也是要占用空间的。



## 三、后端接口开发

### 后端开发流程

1. 根据功能设计库表

2. MyBatisX 插件自动生成对数据库基本的增删改查（entity、mapper、service），把代码从生成包中移到实际项目对应目录中。
3. 实现实体类相关的 DTO、VO、枚举类（用于接受前端请求、或者业务间传递信息），注意**数据脱敏**，比如不能返回全部信息（如密码地址答案等信息），而只能返回部分信息。

3. 编写 Controller 层，实现基本的增删改查和权限校验。

4. 给对应的 json 字段编写独立的类，以方便处理 json 字段中的某个字段，如 judgeConfig、judgeCase。

   **什么情况下要加业务前缀？什么情况下不加？比如类名取judgeCase还是QuestionJudgeCase？**

   加业务前缀的好处，防止多个表都有类似的类，产生冲突；不加的前提，因为可能这个类是多个业务之间共享的，能够复用的。

5. 校验 Controller 层的代码，看看除了要调用的方法缺失外，还有无报错。

6. 实现 Service 层的代码。

7. 编写 QuestionVO 的 json和对象的相互转换的方法。

8. 编写枚举类。

9. 利用**Swagger测试接口**。



### MyBatisX 插件代码生成

![Snipaste_2024-08-10_04-11-41](photo/Snipaste_2024-08-10_04-11-41.png)

![Snipaste_2024-08-10_04-12-28](photo/Snipaste_2024-08-10_04-12-28.png)



为了**防止**用户按照 id 顺序**爬取题目**，把 id 的生成规则改为 ASSIGN_ID （雪花算法生成）而不是从 1 开始自增，示例代码如下：

```java
/**
* id
*/
@TableId(type = IdType.ASSIGN_ID)
private Long id;
```



## 四、判题机架构

### 判题模块和代码沙箱的关系

判题模块：调用代码沙箱，把代码和输入交给代码沙箱去执行

代码沙箱：只负责接受代码和输入，返回编译运行的结果，不负责判题（可以作为独立的项目 / 服务，提供给其他的需要执行代码的项目去使用）

这两个模块**完全解耦**：

![Snipaste_2024-08-11_15-28-37](photo/Snipaste_2024-08-11_15-28-37.png)



### 性能优化点（批处理）

代码沙箱要接受和输出一组运行用例，包含题目代码、编程语言和**多个输入用例**，而不是单个输入样例。

因为每个用例单独调用一次代码沙箱，会调用多次接口、需要多次网络传输、程序要多次编译、记录程序的执行状态（重复的代码不重复编译）



### 为什么代码沙箱不使用消息队列？

因为为了使判题机模块更加通用且方便实用，发送请求调用即可使用，而不需要再去部署消息队列。



### 代码沙箱架构开发

1. 定义代码沙箱的接口，提高通用性

   项目代码**只调用接口而不调用具体的实现类**的原因：这样在以后如果使用其他的代码沙箱实现类时，就不用去调用代码沙箱的代码处修改名称了， 便于扩展。

   代码沙箱的请求接口中，timeLimit 可加可不加，若需要设置即时中断程序可添加。

   扩展思路：增加一个查看代码沙箱状态的接口。

   

2. 定义多种不同的代码沙箱实现。

   示例代码沙箱：仅为了跑通业务流程

   远程代码沙箱：实际调用接口的沙箱

   第三方代码沙箱：调用网上现成的代码沙箱，https://github.com/criyle/go-judge

   

3. 编写**单元测试**，验证单个代码沙箱的执行

   ```java
   @SpringBootTest
   class CodeSandboxTest {
   
       /**
        * 测试代码沙箱，使用构造器模式赋值，判断代码沙箱返回是否为空
        */
       @Test
       void executeCode() {
           CodeSandbox codeSandbox = new ExampleCodeSandbox();
           String code = "int main(){}";
           String language = QuestionSubmitLanguageEnum.JAVA.getValue();
           List<String> inputList = Arrays.asList("1 2", "3 4");
           ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                   .code(code)
                   .language(language)
                   .inputList(inputList)
                   .build();
           ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
           Assertions.assertNotNull(executeCodeResponse);
       }
   }
   ```

   当前存在**问题**：把 new 某个沙箱的代码写死了，如果后面项目要改用其他沙箱，可能要改很多地方的代码。

   

4. 使用**工厂模式优化**，根据用户传入的字符串参数（沙箱类别），来生成对应的代码沙箱实现类，**提高通用性**。

   ```java
   /**
    * @author guiyi
    * @Date 2024/8/11 下午4:30:50
    * @ClassName com.yupi.starseaoj.judge.codesandbox.CodeSandboxFactory
    * @function --> 代码沙箱工厂（根据字符串参数创建指定的代码沙箱示例）
    */
   public class CodeSandboxFactory {
       /**
        * 创建代码沙箱
        *
        * @param type
        * @return
        */
       public static CodeSandbox newInstance(String type) {
           switch (type) {
               case "example":
                   return new ExampleCodeSandbox();
               case "remote":
                   return new RemoteCodeSandbox();
               case "thirdParty":
                   return new ThirdPartyCodeSandbox();
               default:
                   return new ExampleCodeSandbox();
           }
       }
   }
   ```

   >扩展思路：如果确定代码沙箱示例不会出现线程安全问题、可复用，那么可以使用单例工厂模式

   修改单元测试验证静态工厂

    ```java
    /**
     * 测试静态工厂创建代码沙箱
     */
    @Test
    void executeCodeFactory() {
        List<String> codeSandboxTypeList = Arrays.asList("example", "remote", "thirdParty");
        for (String type : codeSandboxTypeList) {
            CodeSandbox codeSandbox = CodeSandboxFactory.newInstance(type);
            String code = "int main(){}";
            String language = QuestionSubmitLanguageEnum.JAVA.getValue();
            List<String> inputList = Arrays.asList("1 2", "3 4");
            ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
                    .code(code)
                    .language(language)
                    .inputList(inputList)
                    .build();
            ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        }
    }
    ```




5. 参数配置化，把项目中的一些可以自定义的选项或字符串，写到配置文件中。这样其他开发者只需要改配置文件，而不需要去看项目代码，就能够自定义使用项目的更多功能。

   application.yml 配置文件中指定变量：

   ```yaml
   # 代码沙箱配置
   codesandbox:
     type: example
   ```

   在 Spring 的 Bean 中通过 @Value 注解读取，:thirdParty是设置默认值为thirdParty：

   ```java
   @Value("${codesandbox.type:thirdParty}")
   private String type;
   ```



### 对象赋值优化 - 构造器模式 - Lombok Builder 注解

1. 实体类加上 @Builder 等注解：

```java
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ExecuteCodeRequest {

    private List<String> inputList;

    private String code;

    private String language;
}
```

2. 可以使用链式的方式更方便地给对象赋值：

```java
ExecuteCodeRequest executeCodeRequest = ExecuteCodeRequest.builder()
    .code(code)
    .language(language)
    .inputList(inputList)
    .build();
```







## Bug 解决

1. md文档上传到github后图片不显示

   通过分析网页点击后的url路径名知，网页会将 "photo/Snipaste_2024-08-08_03-27-12.png" 的 ’/' 识别为 %5c ，导致图片名为"photo%5cSnipaste_2024-08-08_03-27-12.png" ，故而找不到图片。

   解决方法：将 / 改为 \ 即可。

   ps. 在本地电脑时两个都可以正确识别，且默认为 / 

   

2. 

