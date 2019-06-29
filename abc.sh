#!/bin/bash                        #    shell类型
#a simple shell script example
#a function
function sayhello()             
{
echo "Enter Your name:"
read name          #读取来自键盘输入的变量
echo "Hello $name"
}
echo "programme starts here..."  #主过程
sayhello
echo "programme ends."
