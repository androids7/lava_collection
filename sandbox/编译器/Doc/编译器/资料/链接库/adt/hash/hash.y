\  U原型:int InitHash(int s, int len, int ks, int es);
功能:初始化哈希表并设置相关哈希表环境。
说明:在内存地址为s，长度位len的空间里建立一个哈希表，成功则返回哈希表长度，否则返回-1。按键字为字符串，大小为ks，es为元素大小（关键字长度+数据域长度）
注意:该函数可以对不同的地址建立哈希表，该函数隐含调用了SwitchHash函数。

原型:int SwitchHash(int s);
功能:切换当前哈希表环境。
说明:使得以下函数的操作都针对哈希表s。可以在内存中建立多个哈希表，通过该函数切换哈希表。

原型:int SearchHash(char &key[], int e);
功能:查找哈希表。
说明:找到则返回非0，否则返回0。key为按键字字符串地址，e为查找成功时返回的数据域地址。

原型:int InsertHash(char &key[], int e);
功能:插入哈希表。
说明:成功则返回非0，否则返回0，key为按键字字符串地址，e为要插入的数据域地址。

原型:int DeleteHash(char &key[]);
功能:从哈希表中删除关键字key的信息。
说明:成功则返回非0，否则返回0。

举例:
/* 命令分派表 */
#include <fptr.y>
#include <adt/hash.y>

char buf[100];//哈希表空间

void ClearCmd()
{
 printf("执行了ClearCmd函数\n");
}

void RunCmd()
{
 printf("执行了RunCmd函数\n");
}

void HelpCmd()
{
 printf("执行了HelpCmd函数\n");
}

void QuitCmd()
{
 printf("执行了QuitCmd函数\n按任意键退出...");
 getchar();
 exit(0);
}

/* 插入哈希表 */
void DefineCommand(char &key[], long funAdd)
{
 InsertHash(key, &funAdd);
}

/* 初始化并添加命令响应 */
void InitCommandTable()
{
 InitHash(buf, sizeof(buf), 10, 14);
 DefineCommand("clear", ClearCmd);
 DefineCommand("run", RunCmd);
 DefineCommand("help", HelpCmd);
 DefineCommand("quit", QuitCmd);
 DefineCommand("exit", QuitCmd);
}

/* 执行命令响应 */
void ExecuteCommand(char &key[])
{
 long funAdd;

 if (!SearchHash(key, &funAdd))
 {
  printf("未定义的命令!\n");
  return;
 }
 fptr(#attr(funAdd, 0, 0));
}

void main()
{
 char key, i;
 char s[10];

 SetScreen(1);
 InitCommandTable();
 printf("请输入命令:\n");
 for (i = 0;;)
 {
  key = getchar();
  if (key == 13)
  {
   printf("\n");
   s[i] = 0;
   if (s[0]) ExecuteCommand(s);
   i = 0;
   continue;
  }
  if (i < 9)
  {
   s[i++] = key;
   printf("%c", key);
  }
 }
}  �> 㩳              SwitchHash         	 �  58 �  58 �  58 �  58 � 
 58  F
 	 
� )89O  ?	  
�	 Q   	 3( O  (  E
 1( Q  ( Q  (89�  ?    E
 58  	 58   58   58   58
   58 ?�> 㩳              InitHash            )89�  ��?  	 �    E
 58    	 F
  +558   	 ! "58   58
   58 =  89E ��? ? ?�> �	 �  58 �  58 689�  �  � 6 鏻0c*"58;d  �  �  � ,
 *  !558 6)89�  ? 	 �)89�  ? �  
 !5 389�  �   58  /89�  ?;�  ?�> 㩳              SearchHash          �  =M 58 N  89/ 	   !
  "�? ?�> 㩳              InsertHash          )89C  ? �  =M 58 P  89_  ?   �  !	 
  "�   8? ?�> 㩳              DeleteHash         	 �  =M 58	 N  89� 	  
 �  8? ?