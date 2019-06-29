awk 对文本的扫描是依行为单位， 这样就产生了一个问题怎么在扫描的开始以及结束之后的执行一些操作? 

awk BEGIN{}  是在文件开始扫描前进行的操作  END {} 是扫描结束后 进行的操作  ;一般的操作都是需要在BEGIN 设置一个初始的量

shell 换行的使用  \

eg:

awk_test.txt

1 line1 field1
2 line2 field2
3 line3 field3
4 line4 field4
5 line5 field5
6 line6 field6
7 line7 field7
8 line8 field8
9 line9 field9
10 line10 field10
11 line11 field11



awk 'BEGIN{print "地点\t";total=0;} {print $3;total = total+NR} END{printf "行数总计: %2d\n", total}' awk_test.txt




1、最简单的action 既没有pattern 有没有options
2、awk是逐行处理的。
2.1、输出整行
2.2、输出最后一列
2.3、输出倒数第二列
2.4、输出共有多少列
2.5、输出多列
2.6、添加自定义字段
3、 pattern
3.1begin 简单语法
3.2不添加输入文件
3.3begin +pattern 演示

awk是一种编程语言，其名称得自于它的创始人 Alfred Aho 、Peter Weinberger 和 Brian Kernighan 姓氏的首个字母 ，用于在linux/unix下对文本和数据进行处理。数据可以来自标准输入(stdin)、一个或多个文件，或其它命令的输出。它支持用户自定义函数和动态正则表达式等先进功能，是linux/unix下的一个强大编程工具。它在命令行中使用，但更多是作为脚本来使用。awk有很多内建的功能，比如数组、函数等，这是它和C语言的相同之处，灵活性是awk最大的优势。
尽管操作可能会很复杂，但命令的语法始终是：
awk ‘{pattern + action}’ 或者 awk ‘pattern {action}’

grep 、sed、awk被称为linux中的"三剑客"。
grep 更适合单纯的查找或匹配文本
sed 更适合编辑匹配到的文本
awk 更适合格式化文本，对文本进行较复杂格式处理
对于上述语法中的program来说，又可以细分成pattern和action，也就是说，awk的基本语法如下
awk [options] ‘Pattern{Action}’ file
从字面上理解 ，action指的就是动作，awk擅长文本格式化，并且将格式化以后的文本输出，所以awk最常用的动作就是print和printf，因为awk要把格式化完成后的文本输出啊，所以，这两个动作最常用。

1、最简单的action 既没有pattern 有没有options
echo awk >test.txt # test.txt文本中输入字符串awk
awk {print} test.txt # 打印test.txt内容
1
2


df | awk '{print $3}'
1


本例中 $3表示 输出第三列，不指定分隔符时，默认使用空格作为分隔符，细心的你一定发现了，上述信息用的空格不止有一个，而是有连续多个空格，awk自动将连续的空格理解为一个分割符了，是不是比cut命令要简单很多，这样比较简单的例子，有利于我们开始了解awk。

2、awk是逐行处理的。
逐行处理的意思就是说，当awk处理一个文本时，会一行一行进行处理，处理完当前行，再处理下一行，awk默认以"换行符"为标记，识别每一行，也就是说，awk跟我们人类一样，每次遇到"回车换行"，就认为是当前行的结束，新的一行的开始，awk会按照用户指定的分割符去分割当前行，如果没有指定分割符，默认使用空格作为分隔符。


0表示显示整行， 0 表示显示整行 ，0表示显示整行，NF表示当前行分割后的最后一列（0和 0和0和NF均为内置变量）注意，NF和NF要表达的意思是不一样的，对于awk来说， NF 和 NF 要表达的意思是不一样的，对于awk来说，NF和NF要表达的意思是不一样的，对于awk来说，NF表示最后一个字段，NF表示当前行被分隔符切开以后，一共有几个字段。也就是说，假如一行文本被空格分成了7段，那么NF的值就是7，$NF的值就是$7, 而7表示当前行的第7个字段，也就是最后一列，那么每行的倒数第二列可以写为 7表示当前行的第7个字段，也就是最后一列，那么每行的倒数第二列可以写为7表示当前行的第7个字段，也就是最后一列，那么每行的倒数第二列可以写为(NF-1)。

2.1、输出整行
awk '{print $0 }' col_print.txt 
1


注意上面的结果虽然是输出全部的文本，但并不表示$0是输出全部文本。因为awk是按行处理的，即每次输出一行，直至输出全部内容。
来看如下实例即可知道：

2.2、输出最后一列
cat col_print.txt  | awk '{print $NF }'
1


2.3、输出倒数第二列
cat col_print.txt  | awk '{print $(NF-1)}'
1


2.4、输出共有多少列
cat col_print.txt  | awk '{print  NF}'
1


2.5、输出多列
使用逗号隔开要输出的多个列，如下，一次性输出第2列和第3列


cat  col_print.txt | awk '{print $2,$3}'
1


2.6、添加自定义字段
除了输出文本中的列，我们还能够添加自己的字段，将自己的字段与文件中的列结合起来，如下做法，都是可以的。

cat col_print.txt  |awk '{ print "第一列:"$1,"第二列:"$2 }'
1

从上述实验中可以看出，awk可以灵活的通过双引号将我们指定的字符与每一列进行拼接，或者把指定的字符当做一个新列插入到原来的列中，也就是awk格式化文本能力的体现。

3、 pattern
接下来认识下一Pattern，也就是我们所说的模式先介绍AWK 包含两种特殊的模式：BEGIN 和 END。
BEGIN 模式指定了处理文本之前需要执行的操作：END 模式指定了处理完所有行之后所需要执行的操作。

3.1begin 简单语法
先创建空白文件：

touch  begin_test
awk 'BEGIN{ print "BEGIN" }' begin_test
1
2

上述例子，虽然指定了begin_test文件作为输入源，但是在开始处理test文本之前，需要先执行BEGIN模式指定的"打印"操作。

3.2不添加输入文件
awk 'BEGIN { print "BEGIN"}'
1


而上面例子中，我们并没有给定任何输入来源，awk就直接输出信息了，因为，BEGIN模式表示，在处理指定的文本之前，需要先执行BEGIN模式中指定的动作，而上述示例没有给定任何输入源，但是awk还是会先执行BEGIN模式指定的"打印"动作，打印完成后，发现并没有文本可以处理，于是就只完成了"打印 BEGIN"的操作。

3.3begin +pattern 演示
awk ‘BEGIN {print “BEGIN” ,“BEGIN” } { print $1,$2 }’ col_print.txt



3.4 END
可以看到，先处理完BEGIN 的内容，再打印文本里面的内容.
所以END模式也就一目了然了。

上述示例中返回的结果 就像一张"报表"，有"表头" 、“表内容”、 “表尾”。我们通常将变量初始化语句（如 var=0 ）以及打印文件头部的语句放入BEGIN 语句块中。在 END{} 语句块中，往往会放入打印结果等语句.

