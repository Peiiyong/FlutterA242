Project File: model, view, controller, project structure

Ask ChatGPT to design the layout: update the modern and the responsive design

# INFO 
1. FlutLab : https://flutlab.io/workspace
   - 是一个在线 Flutter IDE，允许你直接在浏览器中开发、编译和运行 Flutter 应用，而无需在本地安装 Flutter SDK。

2. API
   - Apipheny: https://apipheny.io/free-api/
   - OpenLigaDB
   - weather api: https://api.data.gov.my/weather/forecast/
   - Example: https://github.com/razynfieras/razynflutterws

3. HTTP : https://pub.dev/packages/http/install
   -  添加 http 库到 Flutter 项目，用于 发送网络请求 (API 请求)。
   -  List of HTTP Status Code -> https://en.wikipedia.org/wiki/List_of_HTTP_status_codes  
   
            flutter pub add http

4. JSON(text) / XML

5. can download Adobe to handle pic
   
6. can install extension gemini
   
# LEARNING PROGRESS
1. Terminal
      -  create a new project using command prompt
        
              flutter create --org com.'package name' 'project name'
     
      -  to check the directory of the file
          
              dir

      -  open project in vs code
  
              cd unigo
              code .

2. **Loading Icon**
   - CircularProgressIndicator ：圆圈
   - RefreshProgressIndicator  ：圆形   
   - LinearProgressIndicator   :横线
   - CircularProgressIndicator.adaptive()
  
3. Navigate to **NEXT** Page
   - Navigator.push 
      - 会保留当前页面。
      - 用户可以在新页面按返回（Back）回到旧页面。
      - 🧠 就像 “打开新页面”。

   - Navigator.pushReplacement
        - 会替换掉当前页面。
        - 用户不能返回旧页面。
        - 🧠 就像 “用新页面替换当前页面”。

4. **Scrollable** widget
   - SingleChildScrollView
      - 📦 适合：一个大内容块（多个 widget 组合在一起）
      - 🔁 它不能自动生成很多 item\
      - 🔩 必须手动写好所有内容
      - 适用: 内容不是重复列表（表单、页面布局等）

   - ListView
      - 📄 适合：重复列表内容
      - 🔁 可以用 ListView.builder 来动态生成
      - ⚡ 性能更好，支持懒加载
      - 适用内容是列表（例如：新闻列表、聊天记录）
        
   - SingleChildScrollView + Column + SafeArea

5. **Card**
      - 在 Flutter 里主要是用来让内容看起来像卡片一样清晰、有层次感，就像你在 App 里看到的资讯块、产品列表、留言框那种“白底 + 阴影 + 圆角”的视觉效果。
      - Card 不带滚动效果（需要配合 ListView、Column 等使用）。
      - 可以用 InkWell 包住它加点击效果。

6.  **cosnt**
      - 当 widget（或对象）在构建时不会变，就可以加 const！
      - example:
         1. const Icon(Icons.home),
         2. const double spacing = 10.0;
         3. const TextField(controller: textController) //会有error因为有controller

7. 🚀 为什么要用 TextFormField?
   - TextFormField 支持 validator
   - 可以跟 Form 搭配，集中做验证
   - 让你的注册逻辑更干净、更规范
   -  优点：
        - 每个字段自动验证
        - 报错信息直接显示在输入框下
        - 不用你手动一个个 .text.isEmpty 去检查
   - example:
     
           final _formKey = GlobalKey<FormState>();
           Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null; // 没错就return null
                    },
                  ),
                  ...
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // 所有验证都通过
                        registerUser();
                      }
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            )

## Output:
<table>
  <tr>
    <th>T4</th>
    <th>T5</th>
    <th>T5</th>
    <th>T7</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/826c62bd-a1c3-4dfc-bf65-eb56f5c49b21" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/1f45a692-8c3d-4cfe-8a5a-4fd6c8f24992" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/bc54923a-dc3c-4eea-9e4a-0df92759ac5b" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/7caf5603-1ca3-4439-83ba-eefed38721f6" width="180" height="350"></td>
  </tr>
  <tr>
    <th>3/27</th>
    <th>4/3</th>
    <th>4/3</th>
    <th>4/10</th>
  </tr>
</table>

<table>
  <tr>
    <th>T7</th>
    <th>T7</th>
    <th>T</th>
    <th>T</th>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/b2192752-859b-4089-944b-43347bda7c0f" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/200d1a24-6d87-4f3b-9886-920c720167db" width="180" height="350"></td>
    <td><img src="" width="180" height="350"></td>
    <td><img src="" width="180" height="350"></td>
  </tr>
  <tr>
    <th>4/10</th>
    <th>4/10</th>
    <th>4/</th>
    <th>4/</th>
  </tr>
</table>
