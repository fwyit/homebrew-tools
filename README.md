
## homebrew的仓库

brew会提供一个官方的仓库，`homebrew-core`[github地址](https://github.com/Homebrew/homebrew-core)。

homebrew安装完毕后这个仓库自动加载到`/usr/local/Homerew/Library/Taps/`文件夹下，这是一个git管理的地址，意味着我们可以提交自己的pullrequest到该仓库。

重点关注一下项目下目录：
* `Formula` 命令行软件安装脚本，例如`curl.rb`是安装curl时需要的脚本。
* `Casks`   二进制类运行软件脚本，如`1password.rb`这个表示直接安装1password软件。

---
## 加入第三方仓库

此处我们以自己创建的仓库为例讲解：

#### 仓库名称

brew时以github为基础构建的ruby脚本，所有仓库都集中再github上，所有此处演示的也是构建再github上的仓库。

1.  仓库名称必须以`homebrew-anything`格式来命名，`homebrew-` 前缀是可选的，但是如果不加该前缀，必须使用整个url来安装，相当麻烦，所以务必加上此前缀。`anything`可以设置为任意自己喜欢的名字，如本项目的anything为`tools`。 
2.  创建一个Formula文件夹，用来存放安装脚本，里边的文件名称就是你在brew install 时候需要下载的软件包名。

---
## 命令

###  brew tap

##### brew tap <user/repo>

将你自己的仓库clone到本地Tap文件夹下，你可以通过brew \[un\]install来管理你的仓库中的软件的安装与卸载。当你使用brew update时，也会更新自己仓库中的包安装文件。

例如上面的我的仓库`homebrew-tools`，我的用户名是`fwyit`，则我可以使用 `brew tap fwyit/tools`来增加自己的仓库。

##### brew tap <user/repo>

通过url将其他非github的仓库添加进来，这个地址可以不是http协议，只要支持git协议即可。此处不演示。

##### brew untap user/repo

删除已增加的仓库，同时在该仓库下的软件也都能再使用。

#### brew tap-pin user/repo

将指定仓库标记为包首选搜索仓库。

#### brew tap-unpin user/repo

取消指定仓库的包首选搜索。

#### 名字重复的包

假如自己的仓库中有和homebrew-core仓库中名字相同的包，当然可以。 当使用`brew_install`命令时brew会有一个默认的搜索顺序：

```
    -   pinned taps(标记的仓库)
    -   core formulae(核心仓库)
    -   other taps(其他仓库)
```

也就是说假如我们给任何仓库一个pinned标记，homebrew会自动先搜索核心仓库，再搜索其他仓库。假如标记了某个仓库，则会先搜索标记的仓库，在搜索核心仓库，最后是其他仓库。 假如我们标记了某个仓库，例如`saka`,那当我的仓库中有curl包，core中也有curl包时，首先安装`saka`仓库中的curl。

如果你想从指定的仓库安装某个包也可以通过加上`user/repo`来执行。比如我们想安装vim，则有如下两种方式：

    brew install vim                     # 从homebrew/core安装
    brew install username/repo/vim       # 从指定仓库安装

---
## 发布自己的包

brew是以ruby脚本来执行安装，语法遵循ruby语法。

* 发布源码包地址

假设现在有一个c语言编写的获取天气命令行客户端，放在github托管，文件地址为

    https://raw.githubusercontent.com/rangaofei/SimpleWeather/master/sweather-1.1.0.tar.gz

格式最好以压缩文件格式结尾，此处只需要打包必须的文件，尽量小巧。重点关注一下最后几个字符：`sweather-1.0.7.tar.gz`

`sweather`表示包的名称，也就是我们安装好后的文件夹的名称

`1.1.0`表示版本号，此处最好与你发布的程序版本号一致， 例如我在cmake中程序版本号设置

```
    set(VERSION_MAJOR 1)
    set(VERSION_MINOR 1)
    set(VERSION_PATCH 0)
```

* 创建formula 执行命令行

```
    brew create https://raw.githubusercontent.com/rangaofei/SimpleWeather/master/sweather-1.0.7.tar.gz
```

brew会自动创建一个sweather.rb 文件，文件内容大致如下(此处我已修改了一些内容, 包括:desc，homepage，cmake依赖以及安装时改用cmake )：

```
    # Documentation: https://docs.brew.sh/Formula-Cookbook.html
    #                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
    # PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

    class Sweather < Formula
      desc "一个非常简单的获取天气客户端\n --by 换行显示"
      homepage "https://juejin.im/user/5855ebea8d6d810065a4befa/posts"
      url "https://raw.githubusercontent.com/rangaofei/SimpleWeather/master/sweather-1.0.7.tar.gz"
      sha256 "64808c700bd46d837c6b06d7965f4f99d3c91b4c2764c3d02f893b8dfb9e9aa2"

      depends_on "cmake" => :build
      # depends_on "curl"=>:run

      def install
        etc.install Dir["src/*"]
        mkdir "build" do
          system "cmake", "..", *std_cmake_args
          system "make"
          system "make", "install" # if this fails, try separate make/make install steps

        end
      end

      test do
        # `test do`会被创建在一个临时目录进行创建、运行以及删除
        #
        # 在Homebrew/homebrew-core中，此部分使用`brew test xxxx`用来进行功能验证。
        # 安装目录并不在路径中，所以需要使用全路径进行测试: `system "#{bin}/program", "do", "something"`.
        system "false"
      end
    end
```

这个文件会创建在核心仓库，也就是在`/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/`位置，只要copy我们自己仓库的位置即可,我的是`/usr/local/Homebrew/Library/Taps/fwyit/homebrew-tools/Formula/`。更改完毕后，通过git提交至自己的github即可。

```
    git add sweather.rb
    git commit -m 'add new formula sweather'
    git push origin
```

提交完毕后我们执行 `brew update`来更新仓库。 然后执行

```
    brew search sweather # 搜索包
    brew info sweather # 显示包的信息
    brew install sweather # 安装包
```

由于安装时依赖了cmake，所以会自动先下载安装cmake（我已安装好），然后下载sweather安装。 此时你就可以在命令行查看天气了：

```
    sweather -v # 查看当前版本
    sweather -setloc liangxi #设置天气地址为梁溪-无锡
    sweather -now #查看现在天气
    sweather #查看三天的天气
```

> ### 备注：
> 原谅可耻的参考[rangaofei](https://github.com/rangaofei/)童鞋[saka](https://github.com/rangaofei/homebrew-saka)库内容做了部分改编。  
> 这个库主要用于下载一些自己常用但是官方不提供的下载地址的软件。  
> 如果有其他需要更新的项目，欢迎随时提交issue....


