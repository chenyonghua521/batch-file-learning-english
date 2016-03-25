@echo off
setlocal enabledelayedexpansion
REM color f2
mode con cols=81 lines=25
set /a correct=0
set /a error=0
set option=1
set /a anscnt=4

:main
set db=
REM set /p db=Input library file(Press "Enter" key if you haven't):
if exist test.h del /f /q test.h
set /a lines=0
if "%db%" == "" (
echo 1,口语 2,四级词组 3,四级单词
set /p sel=请选择：
set db=test.h
	if "!sel!" == "1" (
		set /a cnt=238
		echo create library file...
		echo.
		echo.
	  for /f "eol=; skip=300 delims=" %%i in (%~nx0) do (
		  set /a lines+=1
		  if !lines! lss 477 (echo %%i>>test.h) else goto :loop
    )
	) else if "!sel!" == "2" (
		set /a cnt=829
		echo create library file...
		echo.
		echo.
	  for /f "skip=800 eol=; delims=" %%i in (%~nx0) do (
		  set /a lines+=1
		  if !lines! lss 1659 (echo %%i>>test.h) else goto :loop
    )
	) else if "!sel!" == "3" (
	echo create library file...
	more /S +2500 <%0 >test.h
	set /a cnt=4614
	) else (
	echo select error!&cls&goto :main
	)
) else (
if not exist %db% echo %db% not exist& exit
)


:loop
set /a line=1
set eng=e
set ret=0
call::getRdLE line eng
if "!option!" == "0" call::CtoE %line% %eng% ret
if "!option!" == "1" call::EtoC %line% %eng% ret
if "!option!" == "2" call::CtoE_wirte %line% %eng% ret

if "!ret!" == "4" (
cd.
) else if "!ret!" == "3" (
del /f /q temp.h
del /f /q test.h
goto :eof
) else if "!ret!" == "2" (
set /a option+=1
if "!option!" == "3" set option=0
) else if "!ret!" == "1" (
set /a correct+=1
) else (
set /a error+=1
echo %eng%>>error.txt
echo 
)
call::dspE %eng%
call::dspC %line%
echo         ==============================================================
echo                         Correct:%correct%    Error:%error%
echo         ==============================================================
echo.
goto :loop
goto :eof

:EtoC
echo Question:
call::dspE %2
set /a ans=%random%%%anscnt%+1
for /l %%i in (1,1,4) do (
echo.
echo %%i.
if "%%i" == "%ans%" (
call::dspC %1
) else (
set /a l=1
set e=1
call::getRdLE l e
if "!l!" == "%1" call::getRdLE l e
call::dspC !l!
)
)
echo.
set /p input=Select(change/exit):
cls
if /i "%input%" == "exit" (
set %3=3
) else if /i "%input%" == "change" (
set %3=2
) else if "%input%" == "%ans%" (
echo CORRECT!&set %3=1
) else if not "%input%" == "%ans%" (
echo ERROR!!!&set %3=0
)
goto :eof



:CtoE
echo Question:
call::dspC %1
set /a ans=%random%%%anscnt%+1
for /l %%i in (1,1,4) do (
echo.
echo %%i.
if "%%i" == "%ans%" (
call::dspE %2
) else (
set /a l=1
set e=1
call::getRdLE l e
if "!l!" == "%1" call::getRdLE l e
call::dspE !e!
)
)
echo.
set /p input=Select(change/exit):
cls
if /i "%input%" == "exit" (
set %3=3
) else if /i "%input%" == "change" (
set %3=2
) else (
if "%input%" == "%ans%" echo CORRECT!&set %3=1
if not "%input%" == "%ans%" echo ERROR!!!&set %3=0
)
goto :eof


:CtoE_wirte
echo Question:
call::dspC %1
set input=
set /p input=Please input(change/exit):
if /i "%input%" == "exit" (
set %3=3
) else if /i "%input%" == "change" (
set %3=2
) else (
if /i "%input%" == %2 echo Wonderful！！！！！！Great！！！！！！Wonderful！！！！！！Great！！！！！！
set %3=4
)
goto :eof


:getRdLE
set /a ran=%random%
set /a ran=%ran%%%cnt%
set /a ran+=1
REM echo ran=%ran%
findstr /B /N "%ran%\. " %db%>temp.h
set /a l2=1
set e2=1
call::getLEEx l2 e2
set %1=%l2%
set %2=%e2%
goto :eof

:getLEEx
for /f "delims=: tokens=1*" %%i in (temp.h) do (
set /a %1=%%i
)
for /f "tokens=1*" %%i in (temp.h) do (
set %2="%%j"
)
goto :eof

:dspC
set /a lines=%1
for /f "skip=%lines% delims=\" %%i in (%db%) do (
echo "%%i"|findstr "[0-9][0-9]*\. ">nul && goto :eof || echo %%i
)
goto :eof

:dspE
set temp=%1
set temp=%temp:"=%
echo %temp%
goto :eof











































































































;口语228
1. It's up to you.
由你决定。
2. I envy you.
我羡慕你。
3. How can I get in touch with you?
我怎么联系上你？
4. Where can I wash my hands?
请问洗手间在哪里？
5. What's the weather like today?
今天天气如何？
6. Where are you headed?
你要到哪里去？
7. I wasn't born yesterday.
我又不是三岁小孩。
8. What do you do for relaxation?
你做什么消遣？
9. It’s a small world.
世界真小!
10. It’s my treat this time.
这次我请客！
11. The sooner the better.
越快越好。
12. When is the most convenient time for you?
你什么时间最方便？
13. Take your time.
慢慢来/别着急。
14. I'm mad about Bruce Lee.
我迷死李小龙了。
229. I'm crazy about rock music.
我对摇滚乐很着迷。
15. How do I address you?
我怎么称呼你？
16. What was your name again?
请再说一次名字好吗？
17. Would you care for a cop of coffee?
要被咖啡吗？
18. She turns me off.
她使我厌烦。
19. So far so good.
目前为止，一切都好。
20. It drives me crazy.
它把握逼疯了。
21. She never showed up.
她一直没有出现。
22. That's not like him.
那不象是他的风格。
23. I couldn't get through.
电话打不通。
24. I got sick and tired of hotels.
我讨厌旅馆。
25. Be my guest.
请便、别客气
26. Can you keep an eye on my bag?
帮我看一下包好吗？
27. Let's keep in touch.
让我们保持联系。
28. Let's call it a day.
今天就到此为止吧。
29. I couldn't help it.
我没办法。
30. Something's come up.
有点事/出事了
31. Let's get to the point.
让我们来谈要点。
32. Keep that in mind.
记住那件事。
33. That was a close call.
太危险了/千钧一发
34. I'll be looking forward to it.
我将期待这一天。
35. Chances are slim.
机会很小。
36. Far from it.
一点也不。
37. I'm behind in my work.
我工作进度落后了。
38. It's a pain in the neck.
那真是件麻烦事！
39. We're in the same boat.
我们处境相同。
40. My mouth is watering.
我在流口水了。
41. What do you recommend?
你推荐什么？
42. I ache all over.
我浑身酸痛。
43. I have a runny nose.
我流鼻涕。
44. It's out of the question.
这是不可能的。
45. Do you have any openings?
你们有空缺吗？
46. It doesn't make any difference.
没什么差别/无所谓。
47. I'm fed up with him.
我受够他了。
48. You can count on us.
你可以信赖我们。
49. It doesn't work.
坏了；不动了。
50. It's better than nothing.
总比什么都没有好。
51. Think nothing of it.
别放在心上。
52. I'm not myself today.
我今天心神不宁。
53. I have a sweet tooth.
我喜欢吃甜食。
54. I can't express myself very well in English.
我不能很好地用英语表达自己。
55. For the time being.
暂时；暂且；目前
56. This milk has gone bad.
这牛奶变质了。
57. Don't beat around the bush.
别拐弯抹角了。
58. It's up in the air.
尚未确定。
59. Math is beyond me.
我对数学无能为力。
60. It slipped my mind.
我忘了。
61. You can't please everyone.
你不可能讨好每一个人。
62. I'm working on it.
我正在努力。
63. You bet!
当然！
64. Drop me a line.
写封信给我
65. Are you pulling my leg?
你在开我玩笑吗？
66. Sooner or later.
迟早会的。
67. I'll keep my ears open.
我会留意的。
68. It isn't much.
那是微不足道的。
69. Neck and neck.
不分上下。
70. I'm feeling under the weather.
我觉得不舒服/精神不好/情绪低落。
71. Don't get me wrong.
不要误会我。
72. I'm under a lot of pressure.
我压力很大。
73. You're the boss.
听你的。
74. It doesn't make any sense.
毫无意义！
75. If I were in your shoes.
如果我是你的话。
76. What's this regarding?
这是关于哪方面的？
77. Over my dead body!
休想！
78. Can you give me a hand?
你能帮个忙吗？
79. We have thirty minutes to kill.
我们有三十分钟空闲时间。
80. Whatever you say.
随便你。
81. It'll come to me.
我会想起来的。
82. You name it.
你说出来。
83. Time will tell.
时间会证明的。
84. I will play it by ear.
我会见机行事的；到时候再说。
85. You should take advantage of it.
你应该好好利用这个机会。
86. Let's talk over coffee.
我们边喝边谈。
87. Take it easy.
轻松一点；别紧张；放松放松；再见。[这是美国人最喜欢说的话，也可作离别用语。]
88. I'm easy to please.
我很容易取悦/相处。
89. Let's give him a big hand.
让我们热烈鼓掌。
90. As far as I'm concerned.
就我而言。
91. I'm all mixed up.
我全搞混了。
92. Let's get together one of these days.
找一天聚聚。
93. He's behind the times.
他落伍了/跟不上时代了。
94. I'm pressed for time.
我时间紧迫。
95. I'm up to my ears in work.
我忙死了。
96. You can't do this to me.
你不能这么对我。
97. Just to be on the safe side.
为了安全起见。
98. I hope I didn't offend you.
希望没有冒犯你。
99. It won't take much time.
不会花很长时间的。
100. It's been a long time.
好久不见了。
101. It’s nothing.
小事情；不足挂齿。
102. It's a long story.
说来话长。
103. It's about time.
时间差不多了。
104. It's incredible.
难以置信！
105. It's hard to say.
难说。
106. I can't imagine why.
我想不通为什么。
107. That can't be.
不可能。
108. That's really something.
真了不起。
109. Are you sure?
你确信吗？
110. Are you crazy?
你疯了吗？
111. Excuse me for a moment.
失陪一会儿。
112. I mean it. I'm serious. I'm no kidding.
我是认真的。
113. I'll consider this matter.
我会考虑这件事的。
114. I'll do something about it.
我会想办法的。
115. What are you talking about?
你在说些什么？
116. I'm afraid I can't.
恐怕我不行。
117. I'm dying to see you.
我真想见你。
118. I'm flattered.
过奖了。
119. I'm not in the mood.
我没心情。
120. I'm so scared.
我怕极了。
121. I can't make it.
我去不了/我赶不上。
122. You can never tell.
不知道/谁也没把握。
123. I won't buy you story.
我不信你那一套。
124. It hurts like hell.
疼死啦！
125. It can't be helped.
无能为力。
126. Sorry to bother you.
抱歉打扰你。[事前]
230. Sorry to have bothered you.
抱歉打扰你。[事后]
127. I'm always punctual.
我总是很准时。
128. You may leave it to me.
交给我来办。
129. I wish I could.
不行。[委婉表达法]
130. What's the rush?
什么事那么匆忙？
131. What's so funny/
有什么好笑的？
132. I couldn't agree more.
我完全同意。
133. Stay out of this matter. please.
请别管这事。
134. Don't just shake you head.
别光摇头，想想办法！
135. Don't jump to conclusions.
别仓促/过早下结论。
136. That was a lousy movie.
那电影糟透了！
137. Have you thought about staying home?
是否考虑在家呆着？
138. I'll come. I give you my word.
我会来的。我向你保证。
139. I swear I'll never tell anyone.
我发誓不告诉任何人。
140. I'll make it up to you.
我会赔偿的。
141. I'm very / really / terribly / awfully / extremely sorry.
十分抱歉！
142. Forgive me for breaking my promise.
原谅我食言。
143. Let's forgive and forget.
让我们摈弃前嫌。
144. I've heard so much about you.
久仰大名！
145. Don't underestimate me.
别小看我。
146. She gives me a headache.
她让我头疼。
147. It's very annoying.
真烦人。
148. He often fails to keep his word.
他常常不遵守诺言。
149. You made me feel ashamed of myself.
你让我感到羞愧。
150. I hope it turns out all right.
我希望结果很好。
151. I can't handle this alone.
我无法单独处理这事。
152. How long will it take to have this radio fixed?
修理这收音机要多久？
153. Come to me if you're in any difficulty.
有困难来找我。
154. Who do you think you are?
你以为你是谁？
155. You're wasting you breath.
你在白费口舌。
156. It doesn't seem like that.
似乎不象是那样。
157. Don't get on my nerves.
不要搅得我心烦。
158. Everything will be fine.
一切都会很好。
159. I'll be ready in a few minutes.
再过几分钟就好了。
160. I wonder what happened to him.
我不知道他出什么事了。
161. You are just trying to save face.
你只是想挽回面子。
162. His argument doesn't hold water.
他的论点站不住脚。
163. Your face tells it all.
你的表情透露了一切。
164. The days are getting longer.
白天越来越长了。
165. You've got to do something.
你一定要想办法。 
166. I hope this will teach you a lesson.
希望这会给你一个教训。
167. I feel younger than ever.
我觉得比以前年轻。
168. It's a hard job. but I hope he can make it.
这不是件容易的差事，但我希望他能做到。
169. Don't look wise.
别自作聪明。
170. I'm afraid all my efforts were in vain.
我担心我的努力全白费了。
171. What happened to you memory?
你的记性是怎么搞的？
172. You're going too far.
你太过分了！
173. Don't bury your head in the sand.
不要逃避现实。
174. I have no other choice.
我别无选择。
175. I don't have the nerve to do it.
我没胆/勇气去做。
176. It's a matter of life and death.
事关生死。
177. Nothing works.
什么都不对劲儿。
178. Money will come and go.
钱乃身外之物。
179. He's been behind bars for almost 30 years.
他坐了将近三十年牢。
180. If I had known that. I could have helped you.
假如我早知道，我就能帮你了。[最实用的虚拟语气]
181. I couldn't care less.
我不在乎。
182. You have my word.
我保证。
183. He hit the ceiling at the news.
他听到那消息暴跳如雷/大发雷霆。
184. I don't mind staying up late.
我不在乎熬夜。
185. You're too outspoken.
你太直率了。
186. I can't afford it.
我承担/买不起。
187. I think it's a reasonable price.
我觉得这是个合理的价钱。
188. I'd like to try on these hats.
我想试试这些帽子。
189. He puts me to shame.
他使我蒙羞。
190. Every dog has his day.
凡人皆有得意时。
191. Don't give me any excuses.
不要给我任何理由。
192. Are you out of you mind?
你疯了吗？
193. He's been everywhere.
他到处都去过了。
194. What's bothering you?
什么在困扰你？
195. Who is to blame?
该怪谁？
196. There're a lot of rumors going around.
很多流言流传着。
197. I don't feel up to that.
我觉得不能胜任那工作。
198. I'm mad at myself.
我生自己的气。
199. It's raining cats and dogs.
下着倾盆大雨。
200. The sky is getting very cloudy.
天空的云越来越多了。
201. You won't get away with this.
你逃不掉惩罚的。
202. I'm tired of going to school day after day.
我厌倦每天上学。
203. Who am I supposed to see?
我应该去见谁？
204. His idea is childish.
他的想法很幼稚。
205. I need small change.
我需要零钱。
206. Don't try to brainwash me.
别想给我洗脑。
207. I don't seem to have any luck today.
我今天运气不好。
208. That reminds me.
那提醒了我。
209. What the hell are you doing?
你到底在做什么？
210. I can't seem to get to sleep.
我好象睡不着。
211. You look very serious about something.
你似乎有很严重的事。
212. I hope I'm not in the way.
我希望没有造成妨碍。
213. What are you so excited about?
什么事让你如此兴奋？
214. Tell me about you trouble.
把你的烦恼告诉我。
215. I feel much better now.
我感觉好多了。
216. I hope you will get well soon.
希望你很快会恢复。
217. She is sick in bed.
她卧病在床。
218. I have a slight fever.
我轻微发烧。
219. A fool never learns.
傻瓜永远学不会。
220. This is the schedule for tomorrow.
这是明天的日程安排。
221. How late are you open?
你们营业到多晚？
222. I'm here on business.
我来这里出差。
223. What's Hong Kong famous for?
香港以什么闻名？
224. What brings you to Beijing?
什么风把你吹到北京来的？
225. She looks blue.
她满面忧伤。
226. I just don't know what to say.
我就是不知道说什么。
227. Let's have fun tonight.
今晚让我们乐一乐。
228. Thank you for coming to see me off.
谢谢你来为我送行。
231. Don't trouble trouble until trouble troubles you.
别自找麻烦了，顺其自然吧。
232. Some of us like to have our future mapped out. others like to go with the flow.
有些人喜欢规划未来，有些人喜欢顺其自然。
233. It's best to take the world as you find it. then you won't be disappointed.
还是顺其自然最好，这样，你就不会失望了。
234. Be that as it may. I'll leave it as it is.
无论如何我们也只能听其自然。
235. Since there is nothing we can do. why not let nature take its course?
既然我们无能为力，何不顺其自然呢？
236. Your opposition won't make any difference. just let it be.
你反对也不能起什么作用，顺其自然吧。
237. We will cross the bridge until we come to it.
走一步看一步吧，顺其自然。
238. Whatever will be. will be.
万事不必苛求，顺其自然。























;四级词组
1. be able to do
能够，会
2. be about to do
刚要，即将
3. above all
首先，首要，尤其是
4. be absorbed in sth.
专心致力于…
5. be absorbed in doing sth.
专心致力于…
6. be abundant in
…富于，…丰富
7. by accident(=by chance)
偶然，碰巧 
8. in accordance with
依照，根据，与…一致
9. according toprep.
据/照…(所说、所写)；按…，视…
10. accuse sb. of sth.
控告(某人某事)
11. be accustomed to
习惯于，惯常的
12. act as
(临时)担任，充当，起…作用
13. act on
遵照…行动，奉行；作用于，影响
14. put sth. into action
付诸实施
15. put sth. out of action
使……停止工作或活动
16. take action
采取行动；开始工作
17. adapt to
适应
18. add up
加起来；说得通
19. in additionconj.
另外，加之
20. in addition to
加之；又；除…之外；并且
21. admit of
容许有，有…余地
22. be on the advance
(物价)在上涨中
23. in advance
预先，事先；在前面
24. in advance of
在…的前面；超过
25. gain an advantage over
胜过，优于
26. have an advantage over
比...更有利
27. take advantage of sth.
利用（时机、他人的弱点等）
28. afford to
(买)得起(某物)
29. agree with
同意；赞成；（与某人）意见一致
30. agree to sth.
同意某事
31. ahead of
在…前面，先于；胜过
32. go ahead
说吧，走吧，做吧(口语)，走在前面
33. aim for
瞄准；以…为目标
34. aim at
瞄准，针对；在，旨在
35. by air
通过航空途径；用无线电
36. in the air
在空中，在流行中，悬而未决
37. on the air
(用无线电，电视)播送
38. after all
毕竟，终究；虽然这样
39. at all
(用于否定句)丝毫(不)，一点(不)
40. in all
总共，一共，合计
41. all out
全力以赴，竭尽全力
42. all over
到处，遍及；结束；(相貌)非常像
43. all but
几乎，差一点；除…之外其余都
44. all right
令人满意的，不错的；(健康)良好的/行/可以
45. not at all
(用来加强 not 的语气)一点也不；根本不
46. all along
一直，始终；从一开始就
47. amount to
达到，总计；相当于，等于
48. in large amounts
大量地
49. and so on(=and so forth)
等等 
50. and so forth
等等，如此等等
51. and the like
等等，以及诸如此类
52. and that
而且
53. and then
而且，其次，于是，然后
54. and yet
可是，然而
55. one after another
一个接一个地，接连地
56. one another
彼此(指三者或三者以上)
57. answer for
对…负责；承受…之后果
58. answer back
应答
59. not any longer
不再
60. not any more(=no more)
不再
61. nothing but
除了…以外没有什么；仅仅，只不过
62. apart from
除...之外(别无)；除…之外(尚有)
63. apologize to sb. for sth.
为某事向某人道歉
64. appeal to sb. to do sth.
恳求……做……
65. apply for
提出申请(或要求等)
66. apply...to
把…应用于；涂，抹
67. apply oneself to
致力于
68. approve of
赞赏，同意；批准，通过
69. arm in arm
臂挽着臂；协同
70. under arms
持有武器，武装起来的
71. all around
四处，到处
72. arrive at
得出，做出，达到
73. arrive in
到达；抵达
74. as...as
像...一样
75. not so...as
不如…那样
76. such...as
诸如...之类的
77. so far as
(表示程度、范围)就…；尽…
78. as good as
和...几乎一样，实际上等于
79. as if
同义于as though好象，仿佛
80. as though
好像，似乎，仿佛
81. as it is
事实上，既然如此
82. as long as(=so long as)
只要，如果；既然，由于 
83. as much
也;同样多的
84. as suchin itself or in themselves
同样的，同量的
85. as toprep.
至于…；关于…
86. as well
也，又，以及，和...一样，除...之外
87. so as to
以便；为…(目的)
88. as well as
也，又，以及，和…一样，除…之外
89. aside from
除…之外(别无)；除…之外(尚有)
90. ask after
探问，问候
91. ask for
请求，向…要；寻找
92. assist in
帮助(做某事)
93. assist sb. with sth.
帮助某人做某事
94. attach to
使属于，使参加；认为有(责任等)
95. attach oneself to
依附；参加党派
96. be attached to
(变得)喜欢，依恋，对...有感情
97. attend to one's work
专心工作
98. pay attention to
注意；留心；关心
99. be available for
有效
100. on an average
平均起来，一般说来
101. up to the average
达到一般水平
102. be aware of
知道，意识到，认识到
103. right away
立即，马上，立刻
104. be at the back of sb.
支持某人
105. behind sb's back
暗中
106. put one's back into sth.
专心致志于某事
107. be back
回来
108. back and forth
来回，往返，来来往往地
109. keep one's balance
保持平衡，保持冷静
110. lose one's balance
失去平衡，跌倒
111. base oneself on
根据，基于
112. be based on
以...为基础，以...为根据
113. bear away
夺得；赢得(奖品等)
114. bear off
赢得；使离开；驶离
115. bear down
竭尽全力；(on)压倒，击败
116. bear upon
对……施加压力，有关，瞄准
117. bear up
支持，拥护；打起精神
118. bear with
宽容；耐心等待
119. beat about
四处闲逛，［航海］迎风斜驶
120. beat down
(太阳等)强烈地照射下来；打倒，平息
121. beat off
击退，打退(进攻)
122. beat up
痛打，狠揍
123. begin at
从……开始
124. begin with
以…开始，以…为起点
125. to begin with
首先，第一；起初，本来
126. in behalf of
代表...一方，作为...的发言人
127. on behalf of sb.
代表某人
128. believe in
相信…的存在，相信…的真实性
129. belong to
归……所有，属于，是……的一员
130. at best
就最乐观的一方面看，充其量
131. be at one's best
全盛时期，最好状态
132. do one's best
竭尽全力；尽某人最大的努力
133. try one's best
尽力，努力
134. make the best of
充分利用，尽量利用，善于处理(不幸等)
135. all the better
反而更（好），却更
136. had better
应该做某事；最好做某事
137. get the better of
战胜，在...中占上风
138. have the better of
战胜……，超过……
139. bill of fare
菜单
140. a bit
(作状语用)少许；一点
141. do one's bit
尽自己的一份力量
142. not a bit
一点也不
143. black and blue
(被打得)遍体鳞伤
144. black out
用墨涂掉；封锁(新闻)
145. be to blame
该受责备的，应承担责任的
146. blow off
吹掉，将(热水等)放出
147. blow out
吹熄(灯火等)
148. blow over
(云等)消散；（风暴等）平息
149. blow up
爆炸，(被)炸飞；充气；大发脾气，大怒
150. be on board
在船上
151. border on
接界，接壤；近似，接近
152. both...and
不仅…而且，…和…(两者)都
153. from the bottom of one's heart
从心底
154. at the bottom
在底端
155. be bound up in
忙于，对...有兴趣
156. be bound up with
有赖于；与…有关系
157. break away
突然离开；逃跑，脱身
158. break down
机器坏了=go wrong 身体垮了/终止谈话
159. break into
打断，突然开始；闯入
160. break in
打断谈话;训练;使驯服；通过使用使逐渐适用
161. break off
忽然停止讲话/断绝，结束/暂停工作，休息
162. break out
(战争等)爆发；使逃脱，使逃生
163. break up
打碎，粉碎；散开，驱散；终止，结束
164. catch one's breath
(因惊恐或激动)一时屏住呼吸；歇口气
165. hold one's breath
(由于激动、害怕等)不出气；屏住呼吸
166. lose one's breath
喘不过气来，呼吸困难
167. out of breath
喘不过气来，上气不接下气
168. in brief(in short;to sum up)
 简言之；以简洁的形式
169. bring down
使倒下；使下降；使受挫折
170. bring forward
提出建议=put forward/提前
171. brush up
擦亮；重新学习；复习
172. blow bubbles
吹泡泡，说空话
173. in bud
发芽
174. build up
逐步建立；增进；逐渐积聚，集结
175. the bulk of
……的大部分
176. be a burden to
对……是一个负担
177. burn away
烧着，燃完，烧掉
178. burn down
焚毁(建筑物)，把…烧成平地
179. burn out
烧光，烧毁…的内部；熄灭
180. burn up
烧掉，烧毁；烧起来，旺起来；(使)发怒
181. burst into
突然开始；闯入，非法进入
182. burst out laughing
突然笑了起来
183. burst out
突发，突然发作；喊出来
184. on business
办事，因公出差
185. but for
除…以外，倘没有，除非
186. cannot but
不得不，不会不
187. by oneself
顺便地；在途中，在路上
188. by the way
（用于转入新话题）顺便问一下，顺便说
189. by and by
不久；以后；后来
190. call for
去取(某物)；去接(某人)；要求；号召
191. call on(=call upon)
访问，拜访；号召，呼吁 
192. call upon
探访；请求(某人)做某事，号召
193. cannot help
不得不；忍不住
194. capable of
能…的，可…的；有…能力(或技能)的
195. take care
小心；照料；保管
196. in the care of
由……照应
197. take care of (everything)
好好照料(一切)
198. care for
喜欢，对…中意；对…担心；照顾，照料
199. carry away
使某人冲动而失去自制力；冲昏...的头脑
200. carry off
成功地处理或应付；拿走，夺走
201. carry on
继续，坚持下去；从事，经营
202. carry out
进行；开展；执行(计划，命令)；实现
203. in case
万一；在…情况下； 以防
204. in case of
假如，如果发生；防备
205. in no case
决不，无论如何不
206. catch up
赶上；赶上某人或某事
207. catch up with
赶上；指出…出了差错
208. stand on ceremony
客气，讲客套
209. stand upon ceremony
讲究礼节
210. by chance
偶然，碰巧，无意中
211. change hands
转手，转换所有者
212. in charge of
主管，掌管，照管
213. take charge of
负责(被)看；接管
214. give chase
追赶,追逐(in chase of)
215. check up
校对，检验，检查 (check on)
216. check in
(住宾馆时)办理登记手续，入住
217. check out
(住宾馆时)办理退房手续，结帐离开
218. cheer up
使高兴，使振奋；高兴起来，振作起来
219. cheer sb. up
使某人高兴
220. chew over
深思，细想；仔细商量
221. take one's choice
随意选择
222. under the circumstances
在这种情况下，(情况)既然如此
223. in the circumstances
在这种情况下，(情况)既然如此
224. under no circumstances
决不；无论在任何情形下都不
225. in no circumstances
决不；无论在任何情形下都不…
226. clean out
把…打扫干净
227. clean up
(把…)收拾干净；清理，清除(犯罪现象等)
228. keep clear of
不接触；避开
229. clear away
把…清除掉；(云)消失
230. clear off
消除(积雪)等障碍，把...拆掉，擦掉，清除
231. clear up
整理，收拾；解释，清除(误会等)；天气放睛
232. climb down
爬下，让步，撤回
233. close down
(工厂等)关闭，倒闭
234. close up
塞满；封闭；停止或暂停营业
235. catch a cold
伤风，感冒
236. have a cold
患着感冒
237. come about
发生；(风等)改变方向
238. come of
出身于；由…引起，是…的结果
239. come off
发生，举行；成功；脱落；成为；表现
240. come on
快点(口)，开始，到来，举行，走吧，一起去
241. come out
(日、月、星等)出现；(花)开放；出版；发表
242. come round
(非正式的)绕道而来；过访；重又来到；苏醒
243. in common
共用，共同处，公有
244. in company with
(和...)一道
245. be composed of
由...组成
246. concern oneself with
研究的对象是…
247. concern oneself in
关心，忙于
248. concern oneself about
关心，忙于
249. in concert with sb.
与……一致
250. in conclusion
最后(用在结束语中)
251. on this condition
在此条件下
252. on condition that
在...条件下，如果...
253. to be in condition
健康
254. to be out of condition
不健康
255. in conflict with
(和...)有矛盾，不一致
256. in connection with
关于，与…有关
257. come in contact with
接触，碰上
258. out of contact
推动联系，没有接触
259. on the contrary
与此相反，正相反
260. out of control
失去控制
261. get under control
反……控制住
262. turn the corner
有了转机，好转；拐弯
263. at the cost of
以…为代价，用...换来的
264. count on
依靠，料想，指望
265. count upon
指望；料想；依靠
266. count up
算出…总数，共计，把…相加
267. in course of
正在…中
268. in the course of
在…期间，在…的过程中
269. of course
当然；自然；无疑
270. under cover of
在……之掩护之下
271. cut across
绕近道穿过，对直通过；超越；遮住
272. cut off
切断；切掉；(突然)中断；阻隔，隔绝；删掉
273. cut out
切去，删去；戒除，停止服用
274. cut up
(牲口等)宰后得肉
275. be in danger of
有危险
276. be out of danger
脱离危险
277. keep sth. dark
保守秘密
278. keep sb. in the dark
把某人蒙在鼓里
279. dash off
迅速离去；迅速写(或画)
280. out of date
过时的，过期的，失效的；陈旧的
281. all the day
整天地
282. one day
(过去或将来)有一天；某一天
283. some day
(将来)总有一天，(日后)某天
284. at the present day
目前，在现代
285. in these days
当前
286. in those days
那时候
287. in the daytime
在白天，在白昼
288. a good deal of
大量(的)，许多(的)
289. a great deal of
许多(后接不保数名词)
290. deal with
对付，处理，安排；论述，涉及；做生意
291. in debt
负债；欠帐
292. out of debt
不欠债
293. declare for
表明赞成（拥护）
294. declare against
表态反对
295. be in great demand
需要很大，销路很好
296. deserve well of
应受到某人好的对待
297. go into details
详细叙述，逐一说明
298. in detail
详细地
299. die away
声音变弱，渐渐消失/停息，消失
300. die down
逐渐减弱，逐渐消失，平息
301. die out (become extinct)
消失，灭绝，不复存在
302. never say die
不要灰心
303. make a difference
区别对待；起(重要)作用；有影响
304. make no difference
没有...作用或影响
305. be in difficulty
处境困难
306. dig up
开垦(荒地等)；查出，发现
307. in the distance
在远处，远方的
308. do away with
=get rid of 废除，去掉，取消
309. do without
没有…也行，用不着，将就
310. have something to do with
和…有(点)关系
311. have nothing to do with
和...毫无关系
312. out of doors
在户外
313. double up
弯着身子；把…对折
314. in doubt
不能肯定的，可怀疑的
315. without doubt
无疑地，很可能
316. no doubt (without doubt;certainly)
无疑地，必定
317. up and down
来回，上上下下；前前后后；到处
318. draw in
(火车、汽车)到达，到站；吸收；紧缩开支
319. draw out
拉长；掏出(手帕等)
320. draw up
画出，草拟出；(使)停住，逼近
321. drop in
顺便来访，非正式访问
322. drop on
训斥，惩罚
323. drop off
入睡；(让…)下车，把…放下；下降，减少
324. dry up
(使)干涸，(使)干透；(使)枯竭
325. due to
因为；由…引起，由于
326. be on duty
值班，当班
327. be off duty
下班
328. do one's duty
尽职，尽本分
329. each other
彼此(指两者之间)
330. take it easy
不慌不忙，别紧张，放松
331. come into effect
开始生效，开始实行
332. go into effect
使生效；起作用
333. take effect
生效，起作用
334. in effect
实质上，实际上；正在实行，有效
335. in the employ of
受……的雇佣
336. pull away
(把…)开走，(使)离开
337. be regarded as
被认为
338. be attributable to
归于，归功于
339. shut out
遮住；把…挡在外面. 排斥
340. by means of
通过...手段；借用力于，用
341. set one's sights on sth.
志在……；力求
342. make a beeline for
径直走向
343. take pride in
以…自豪；对…感到得意
344. put emphasis on
强调；把重点放在，着重于
345. make up for
补偿，弥补
346. take into account
考虑进去，考虑到
347. pump up
（给自行车等）打气
348. in view of
鉴于…，考虑到…；由于
349. on the verge of
接近于，濒临于
350. for the sake of
为……起见
351. in the end
终于，最后
352. enter into
参加，开始从事，进入；成为…的一个因素
353. enter upon
开始，着手
354. even if(=even though)
即使，纵然 
355. even though
即使，虽然
356. even so
虽然如此，即使是这样
357. in the event of
如果…发生，万一
358. at all events
不管怎样，无论如何
359. every now and then
时常，不时，间或
360. for example(=for instance)
例如，比如；举例说
361. follow sb's example
以某人为榜样
362. set an example to
给……做出榜样
363. give an example to
给……做出榜样
364. except for
除…外，除去；要不是由于
365. with the exception of
除...之外
366. without excuse
无故
367. come into existence
开始成立，成立
368. to a certain extent
在一定程度上
369. to a great extent
在很大程度上
370. catch one's eye
引起...的注意
371. keep an eye on
照看，留神，密切注意
372. in the face of
面对，在…面前；不顾，即使
373. lose one's face
丢脸
374. make faces
做鬼脸；做苦脸
375. as a matter of fact
事实上，其实；事实恰恰相反
376. in fact
其实，事实上，实际上；说得准确些
377. in point of fact
实际上，事实上
378. keep faith with sb.
对……守信
379. fall back
撤退，后退
380. fall back on
求助于，转而依靠，回头再说
381. by far
(和形容词最高级连用)最最
382. far from
远离，决不，完全不
383. make one's farewells
告别
384. find fault with
挑剔，找(…的)岔子，批评
385. be at fault
有错，不知所措
386. for fear offor fear that
惟恐，以免
387. feel like doing
觉得想做…
388. a few
（表示肯定）少数，几个
389. a good few
相当多，不少
390. quite a few
还不少，有相当数目的
391. the few
少数
392. fill in
填满；填写；(for)替代
393. fill out
填好，填写；使长大
394. fill up
填补；装满
395. find outv.
找出；发现；查明
396. catch fire
着火(动作)
397. take fire
着火，开始燃烧　
398. make a fire
生火
399. in the first place
起初，本来；第一
400. at first
起初(作状语用，通常置于句首)
401. from first to last
自始至终
402. fit in
融入（群体）；装配好
403. fit sth. on
试穿（大衣等），放好（盖子）
404. fix up
修补，修理好；解决
405. one's own flesh and blood
亲人，亲骨肉
406. in flower
开着花
407. fold up
失败，倒闭
408. free from
无…的，不受…的影响
409. free of
无…的；摆脱了…的
410. make free
释放
411. set free
释放，使获得自由
412. make friends with
(与…)交朋友
413. be friends with
对…友好，与…交上朋友
414. in front of
在…前面，在…面前
415. in the front of
在……的前部
416. full ofa.
充满…
417. make fun of
取笑(某人)；开…的玩笑
418. for the future
从今以后，在今后
419. in future
从今以后，今后
420. in general
大体上，通常，一般说来
421. get to
到达，抓住问题的要害，本质
422. have got
有(用于第一、二人称单复数和第三人称复数)
423. get away
走开；逃脱；(with)做了坏事而逃脱责罚
424. get in
进入，参加；收(获)；收回；插入(话)
425. get off
(从…)下来；出发；下班；逃脱惩罚
426. get on
骑上(马、自行车等)；登上(车船等)；有进展
427. get out
(使)离开，出去；(消息等)泄露；取出
428. get over
克服(困难等)；从(疾病、失望等)中恢复过来
429. get through
完成，通过，用完，从人群中通过，接通电话
430. get up
起床；爬上；达到
431. give away
分发，赠送，颁发，背叛，出卖，暴露
432. give out
分发；用完，消耗尽；发出(光、声音等)
433. go about
着手做，处理，忙于；(with)常与…交往
434. go after (chase;try to get or win)
追求；设法得到
435. go ahead
说吧，走吧，做吧(口语)，走在前面
436. go along with
陪…一起行动；赞同，支持
437. go back on
不遵守；不履行；背叛
438. go back upon
违背，背叛
439. go down
(船)下沉，(太阳、月亮)落下；(价格)下降
440. go into
进入，参加；开始从事；调查，研究
441. go on
继续；进行；过去；(灯)亮，开始运行
442. go out
离家外出；参加社交活动；熄灭；(衣服)过时
443. go over
改变；核对；检验；察看；搜查；重复；重温
444. go through
仔细检查，详细讨论；经历；通过，被批准
445. go up
上升，上涨，增长；正在建设中；烧(炸)毁
446. go without
没有，缺乏，将就；无需，没有…也行
447. on the ground of
以…为理由
448. grow up
长大，成熟；形成，发展
449. at first hand
直接
450. hand in hand
手拉手；同时并进地，密切关联地
451. on the one hand
在一方面
452. on the other hand
同义于 on the other另一方面
453. hand down
留传下来，传给，往下传
454. hand in
交上；递上，交进
455. hand over
交出，移交，让给
456. hang about (hang round)
徘徊，闲荡
457. hang up
把…挂起来；挂断(电话)；延迟，拖延
458. head for
向...方向前进；驶向
459. head off
绕到前面去；拦住
460. hear of
获知...消息，听到...消息
461. learn by heart
记住，背诵
462. get by heart
记住，背诵
463. help oneself
(食物等)自助，自取
464. here and there
到处，各处；偶然
465. hire out
租出去；受雇
466. catch hold of
抓住某物或某人
467. get hold of
抓住；掌握；获得；找到
468. lay hold of
握住；控制住；占有
469. take hold of
握住，抓住
470. at home
在家(乡)，在国内；舒适；精通，熟悉
471. in a hurry
匆忙；立即，很快地
472. be taken ill
生病
473. fall ill
染病；病例
474. in a minute
一会儿，立刻
475. inform against sb.
告发某人
476. inquire for
询问(商店、地点等)
477. for instance
例如，比如，举例说
478. instead of
代替，而不是；不是…(而是)
479. out of a job
失业
480. out of joint
脱臼；出了问题，处于混乱状态
481. just now
才不久；现在，眼下；刚才
482. just then
正当那时
483. keep fromKeep you from
阻止，妨碍(你)
484. keep off
(使)让开，(使)不接近
485. keep on
继续(做某事)；反复
486. keep to
坚持某种习惯，遵循，靠(左右)
487. keep up
(使)继续下去，保持；使居高不下
488. keep up with
赶上...的速度，不落于...之后
489. knock down
击倒，撞倒；杀(价)，降(价)；拆除
490. knock out
把…打昏迷；(比赛中)淘汰
491. be known as
以...身份知名，是众所周知的...
492. at last
终于，最后
493. to the last
直到最后
494. later on
以后，下次(回)，后来
495. sooner or later
迟早，早晚，或迟或早
496. laugh at
嘲笑；一听到…便大笑
497. lay aside
把…放在一边，把…搁置一旁；留存
498. lay down
放下；铺设(铁路)；拟定(计划等)
499. lay off
(临时)解雇；停用，戒
500. lay out
安排，布置，设计；摆开，陈列，展示
501. leave sb. alone
不干涉某人
502. leave off
(使)停止；停下来
503. leave outleave anyone out
不包括，排除(某人)
504. at length
详尽地；最后，终于
505. let alone
听其自然，不予理睬；让其独处；更不用说
506. let down
使失望；辜负...的期望
507. let go(stop holding sth)
放开；放松
508. let off
放过，宽恕；开(枪)，放(炮等)，排放
509. let out
放走，释放；发出(声音)；泄漏
510. bring sb. to life
起死回生，盒苏醒
511. come to life
苏醒过来，开始有生气
512. look like
看上去像；好像要
513. as you like
随便
514. in line with
和…成直线，与…一致，按照
515. a little
少许(用于不可数名词之前)
516. little by little
一点一点地，逐渐地
517. before long
不久以后，很快
518. long before
在…以前很久
519. long after
很久以后
520. no longer
不再，再也不
521. look after
照料，照顾，照管；注意，关心
522. look down on(=look down upon)
轻视，看不起
523. look for
寻找，寻求；惹来，招来
524. look forward to
盼望，期待；预期，预料
525. look over
把…看一遍，把…过目；察看，参观
526. look up
(从词典中)找出，天气转变，物价上涨，仰视
527. lose face
丢面子
528. a lot
大量，许多；非常，相当=a lot of/lots of
529. a lot of
大量的，许多的 [=lots of]
530. lots of
大量的，许多的
531. in love with
与……恋爱
532. fall in love
(与…)相爱，爱上
533. make away with
携…而逃；摧毁；浪费
534. make for
走向，朝…前进；促成，有助于
535. make out
开列；书写；看出，辩认出；理解，了解
536. make up
补充(不足)；补偿；虚构；编造；组成；配制
537. a good many(=a great many)
很多，相当多
538. a great many
大量的，许多的(接可数名词)
539. mark down
记下；降低…的价格，降低…的分数
540. mark up
提高…的价格，提高…的分数
541. by some means
用某种方法
542. by all means
想一切办法，一定要，当然可以
543. by no means
根本没有，一点也不
544. in the meantime
届时，同时，在此期间
545. make up one's mind
对...下决心，下决心做...
546. mix up
混合，混淆；搞乱；搞糊涂
547. for a moment
片刻，一会儿
548. in a moment
马上，立刻；一会儿
549. more and more
越来越(多)
550. more than
多过；...以上；比...更
551. at most
最多，至多，不超过
552. make the most of
充分利用，尽量利用
553. move about
走来走去，总是搬家
554. move on
继续前进；(to)更换工作等；使走开(不停)
555. in nature
本质上；实际上
556. in the course of nature
正常地
557. far and near
远近，到处，四面八方
558. near by
在附近
559. neither...nor
(既)不…也不，(既)非…也非
560. all night long
整夜地
561. at night
天黑时；在夜里
562. in the night
在夜间
563. night and day
日以继夜地
564. a large number of
许多的
565. a good number of
许许多多
566. on occasion(=on occasions)
间或地，有时
567. once again
(或more，over)再一次
568. once more
再一次，又一次
569. once upon a time
从前(故事开头用语)
570. at once
立刻，马上；同时，一起
571. one by one
一个接一个地；一次一个地
572. not only...but also
不但…而且…
573. only just
刚刚才
574. in the open air
在户外；在野外
575. either...or
或者…或者(两个中的一个)；不论…还是…
576. whether...or
是…还是…，不管…还是…
577. or so
(表示约数)左右，上下
578. in order
按顺序；整齐，井然有序，处于良好状态
579. in order to
为了；以…为目标
580. in order that
以便，以至于；结果
581. no other than
除…外没有；只有
582. out and out
彻底地，不折不扣地
583. out of
越出…之外；从…里面；离开；由于；没有
584. on one's own
独立地，独自地
585. keep pace with
(与…)齐步前进，(与…)并驾齐驱
586. hold pace with
跟上，与…同步
587. in part
部分地，在某种程度上
588. take part in
参加…，参与…
589. pass away
消失；去世；终止
590. pass on
传递；继续；去世
591. have patience with
对……有耐心
592. pay out
付出(钱)，出钱
593. pay off
还清债，给清工资后遣散；使…得益；有报偿
594. pick on
选择(某人或某物)作受罚(受责备)的对象
595. pick out
选出，拣出
596. pick up
拣起；获得；找到；学到(尤指偶然地或无意)
597. in pieces
破碎
598. break sth. to pieces
砸得粉碎
599. have pity on sb.
怜悯某人
600. take pity on sb.
怜悯某人
601. out of place
不在应在(适当)的位置，不适合的，不适当的
602. in place of
代替，取代，交换
603. take place
发生，产生；进行，举行
604. take the place of
代替，取代
605. in plenty
丰富，充足
606. to the point
中肯；扼要；切中要害
607. point out
指出，指明；解释
608. in position
在适当的位置；在原位
609. out of position
不在适当的位置
610. possess oneself of
获得，占为已有
611. prevent...from
妨碍；防止；预防
612. in public
公开，在公开场合
613. pull down
拆掉，推掉，使身体虚弱，使价格降低
614. pull in (arrive;stop;move in)
(车)进站；(船)到岸
615. pull off
(成功地)完成；扯下，脱去
616. pull out
拔出，取出；(车、船等)驶出；(车辆)减速
617. on purpose
故意地，有意地
618. put down
写下；付（定金）；镇压，取缔；奚落
619. put in
花费，付出(时间等)；正式提出，申请
620. put off
推迟，延期；关掉；阻止，妨碍
621. put out
熄灭，消灭，关(灯)；出版，发布；生产
622. put up
举/升起，提(价)；建造，搭/支起；张贴
623. put up with
忍受，容忍(讨厌的人)
624. beyond question
毫无疑问，确定无疑
625. out of question
毫无疑问
626. at any rate
无论如何，而且，至少
627. at this rate
照这种情形，既然这样
628. rather...than
宁愿……而不
629. be reason of
由于
630. as regards
关于，至于
631. in this regard
在这点上
632. in regard to
对于；就…而论
633. with regard to
对于；就…而论
634. with relation to
有关，涉及；与…相比
635. with respect to
就…而言；在…方面
636. pay one's respect to sb.
向某人致敬
637. as a result of
由于；作为…的结果
638. in return for
作为(对…的)报答(或回报、交换)
639. ring sb. up
打电话给某人
640. ring off
挂断电话；停止讲话
641. give rise to
产生；使发生；引起，导致
642. take risks
冒险
643. run risks
冒险
644. roll in
滚滚而来，大量涌来
645. roll up
(尤指姗姗来迟地或以某种不当的方式)抵达
646. show sb. around
领某人参观
647. by rules
依照规则
648. as a rule
通常，一般(说来)
649. run outbe finished
,exhausted 结束；变得缺乏
650. run over
在…上驶过，碾过；把…很快地过一遍
651. run through
贯穿；匆匆阅读；排练；挥霍(金钱)
652. safe and sound
安然无恙
653. in safety
安全
654. with safety
安全地
655. at the same time
同时；然而，不过，但是
656. the same as
与…一致，与…相同的
657. all the same
都一样，无所谓；尽管如此，仍然
658. just the same
=all the same 仍然，还是
659. that is to say
换句话说，这就是说
660. scratch one's head
搔头
661. search out
寻找，找到
662. search into
调查
663. make a search for
搜查，寻觅
664. keep a secret
保守秘密
665. see about
负责处理(某事)；查看
666. see through
将...干到底；做完；看穿；识破
667. sell out
卖光，全部卖出；(尤指为钱财而)背叛，出卖
668. send away
撵走；开除；解雇
669. send for
派人去请…；派人去要(或取)…
670. send in
呈报；送…参加比赛
671. send off
寄出；为…送行；解雇
672. set aboutbegin to do
(sth). start (doing sth)开始
673. set on
袭击；唆使
674. set out
陈列；动身，启程；开始，着手；制定，详述
675. set upset up an appointment
安排(约见、会见)
676. settle in
在新居安顿下来；适应新环境(或新工作)
677. shake down
敲诈，勒索；彻底搜查
678. shake off
撵走，摆脱；抖落
679. in shape
处于良好(或固有)状态
680. in the shape of
呈…的形状
681. shoot down
击落，击毙；驳倒
682. be short of
缺乏，不足；达不到
683. in shortin a word
. in summary 总之，总而言之
684. shoulder to shoulder
肩并肩地，齐心协力地
685. show off
炫耀自己的能力、财富、智慧等
686. show up
使呈现，使醒目；出席，到场
687. be shut in
关进，围住
688. shut off
切断(水等)，关掉，(使)停止运转
689. shut up
使住口；住口；停止写
690. side by side
肩并肩；一起；相互支持
691. lose one's sight
丧失视力
692. at first sight
乍一看之下；第一眼就
693. catch a sight
看见
694. in sight of
看得见
695. out of sight of
在不能看见……的地方
696. ever since
此后一直，从那时起一直
697. long since
很久以前；很久以来
698. sit up
不睡觉，开夜车；坐直，坐起来
699. smell out
嗅出，凭嗅觉发现…
700. as soon asconj.
一…就…，刚...便
701. as soon as possible
尽可能早地；尽快
702. speak for
代表…讲话，为…辩护；证明，表明
703. speak out
大胆地讲，不受约束地讲
704. speak up
大声说话；开口说出来
705. in spite of
不管，不顾，尽管，虽然
706. spring back
弹回，跳回
707. spring from
出于，由...而来，由...造成
708. spring up
涌现；发生；迅速长出
709. stand by
站在旁边，袖手旁观；站在一起，支持、帮助
710. stand for
是...的缩写，代表，意味着；主张，支持
711. stand up
站起；站着；经久耐用；使人信服
712. stand up for
为…辩护；维护；坚持
713. start in
开始
714. start out
出发，动身；开始时打算，本来想要
715. start off
开始/展开(之后接不接宾语均可)
716. stay away
不在家，离开
717. stay in
不出门
718. stay out
耽着不走开
719. stay up
开夜车，很晚不睡觉; 熬夜
720. step by step
逐步地，一步一步地
721. in step
合拍，同步；与(…)一致
722. out of step
步调不一致，不协调
723. stick to
粘贴在..上，紧跟，紧随；坚持；忠于；信守
724. such as
像…那样的，诸如，例如
725. be suited for
适合于，有资格
726. be suited to(=be suited for)
适合于，有资格
727. in support of
支援；支持；拥护
728. be sure of oneself
有自信心
729. feel sure of oneself
自信，有自信心
730. make sure
弄确实，弄肯定，查明
731. to one's surprise
出乎意料地；使某人吃惊的是
732. take in
接受，吸收；包括；领会，理解；欺骗
733. take on
呈现，具有，装出；接纳，接受；承担，从事
734. take up
开始从事；把…继续下去；着手处理；占去
735. in tears
流着泪，含着泪，在哭着
736. think about
想起，想到；考虑，反复思考
737. think of
想到，记得；想一想；考虑；关心
738. through and through
完全，彻底
739. throw away
扔掉，抛弃；错过(机会)，浪费(金钱等)
740. throw off
扔掉；抛弃；随便作出；即席作成
741. throw up
放弃；呕吐；使引人注意，揭示出
742. at a time
每次；在某个时刻
743. at one time
同时，曾经，从前曾
744. at times
有时，间或 sometimes
745. from time to time
时常，有时，不时
746. in time
经过一段时间；最终；及时
747. on time
准时；不早不晚
748. together with
和；加之；连同
749. on top of
在…上面；除…之外
750. try on
试穿(衣服、鞋)；试戴(帽子)
751. try outtry out for sth
试一试看能否选上(做某事)
752. turn down
拒绝(某人或其请求、忠告等)
753. turn in
交上，上缴；交(作业、写好的文字材料)
754. turn off
关上(电灯、自来水等)；转弯；解雇；生产
755. turn on
打开(电视、收音机、灯、煤气、自来水等)
756. turn out
关掉(收音机等)；生产；制造；驱逐；结果是
757. turn toask for help or support
求助于；借助于
758. by turns
轮流，一阵...一阵...
759. in turn
依次地，轮流的；转而；反过来
760. up to
起来，从事于；直到；轮到，胜任，适于
761. up to date
现代化的，最新的，时兴的，符合最新发展的
762. make use of
利用，使用as usual跟往常一样；像平常一样
763. take a vote on
表决
764. vote through
表决通过；投票同意
765. wait on sb.
伺候
766. wait upon sb.
伺候
767. wash up
洗，洗餐具；洗手洗脸；将…冲上岸
768. watch out
当心；提防
769. watch over
看守，照管，监视
770. keep watch
守望；值班；放哨
771. be in the way
挡住去路，碍事
772. by way of
通过…的方法(或形式等)；经由
773. give way
让路，让步；让位；(情感等)失控
774. in one way or another
无论如何
775. in a way
在某种程度上，有点，在某一方面
776. wear away
磨损，磨去；消磨，流逝
777. wear off
磨损；渐渐减弱，消失
778. wear out
用坏；穿坏；使精疲力竭；耗尽；消磨(时间)
779. and...as well...
也，和
780. what about
[征求意见时用的]怎么样
781. wipe away
擦去（眼泪等）
782. wipe off
擦去
783. wipe out
擦掉，擦净；彻底摧毁，消灭
784. in a word
简言之，总之，一句话
785. in other words
换句话说，也就是说
786. be at work
在工作着
787. be out of work
失业
788. go to work
去工作，上班
789. work atput effort into
从事于，致力于
790. work out
设计；制订；安排；解决；理解(某人)的性格
791. work up
依靠努力、勤奋等逐步建立；彻底研究；调查
792. write down
写下；把…描写成
793. write off
注销；勾销；写信寄出
794. go wrong
出错，犯错误；发生故障，出毛病
795. not yet
还没有. 尚未
796. but yet
可是，然而
797. rush out
突然出现
798. connect with
连接；相通，衔接
799. glance at
浏览，(粗略地)看一下
800. know of
听说，知道为什么
801. come by
从旁边走过来；得到，获得
802. open up
打开；开办，开辟，开发；坦诚地谈话
803. be likely to
要发生的；有倾向的；可能的
804. look at
朝…看；看望，注视；看待，认为
805. tend to
往往会...；易于…；有...倾向
806. remember of
记得……，想起……
807. in the midst of
在…当中；正当…的时候
808. break one's heart
令人伤心；使人痛心
809. open one's eyes
使某人认清，了解……，长见识
810. open one's eyes to sth.
使某人认清，了解……，长见识
811. in no time
立即，立刻；马上
812. reckon on
依靠，指望
813. settle into
搬入新住所
814. pat sb. on the back
对某人表示赞许
815. cut back on
减少
816. regardless of
不理会，不管...如何
817. equal to
等于，和...相等，相当于
818. in the case of
就…来说，至于
819. strip...of...
剥夺
820. in contrast
与...形成对比，与...相反
821. rather than
而不，而不是；与其说是...不如说是
822. psych sb. up
使某人做好心理准备
823. feel important about oneself
看重自己
824. compete with
和...竞争，竞赛
825. be connected with
与…有关系
826. depend on
相信，信赖；依靠，依赖；视…而定，取决于
827. equip...with
装备有
828. focus on
聚集于；集中(注意力)于；中心；主题为
829. be capable of
(指人)有某种能力或倾向的










































;四级单词
1. abandon[2'b9nd2n]
vt.丢弃；放弃，抛弃
2. ability[2'biliti]
n.能力；能耐，本领
3. able['eibl]
a.有能力的；出色的
4. abnormal[9b'n0:m2l]
a.不正常的；变态的
5. aboard[2'b0:d]
ad.在船(车)上；上船
6. about[2'baut]
prep.关于；在…周围
7. above[2'b3v]
prep.在…上面；高于
8. abroad[2'br0:d]
ad.(在)国外；到处
9. absence['9bs2ns]
n.缺席，不在场；缺乏
10. absent['9bs2nt. 2b'sent]
a.不在场的；缺乏的
11. absolute['9bs2lu:t]
a.绝对的；纯粹的
12. absolutely['9bs2lu:tli]
ad.完全地；绝对地
13. absorb[2b's0:b]
vt.吸收；使专心
14. abstract['9bstr9kt]
a.抽象的 n.摘要
15. abundant[2'b3nd2nt]
a.丰富的；大量的
16. abuse[2'bju:z. 2'bju:s]
vt.滥用；虐待 n.滥用
17. academic[9k2'demik]
a.学院的；学术的
18. academy[2'k9d2mi]
n.私立中学；专科院校
19. accelerate[9k'sel2reit]
vt.(使)加快；促进
20. acceleration[9ksel2'rei62n]
n.加速；加速度
21. accent['9ks2nt. 9k'sent]
n.口音，腔调；重音
22. accept[2k'sept]
vt.vi.接受；同意
23. acceptable[2k'sept2bl]
a.可接受的，合意的
24. acceptance[2k'sept2ns]
n.接受，验收；承认
25. access['9kses]
n.接近；通道，入口
26. accessory[9k'ses2ri]
n.同谋，从犯；附件
27. accident['9ksid2nt]
n.意外的；事故
28. accidental[9ksi'dentl]
a.偶然的；非本质的
29. accommodate[2'k0m2deit]
vt.容纳；供应，供给
30. accommodation[2,k0m2'dei62n]
n.招待设备；预定铺位
31. accompany[2'k3mp2ni]
vt.陪伴，陪同；伴随
32. accomplish[2'k0mpli6]
vt.达到(目的)；完成
33. accord[2'k0:d]
vt.使一致；给予
34. accordance[2'k0:d2ns]
n.一致；和谐；授予
35. accordingly[2'k0:di8li]
ad.因此，所以；照着
36. account[2'kaunt]
n.记述；解释；帐目
37. accumulate[2'kju:mjuleit]
vt.积累 vi.堆积
38. accuracy['9kjur2si]
n.准确(性)；准确度
39. accurate['9kjurit]
a.准确的，正确无误的
40. accuse[2'kju:z]
vt.指责；归咎于
41. accustom[2'k3st2m]
vt.使习惯
42. accustomed[2'k3st2md]
a.惯常的；习惯的
43. ache[eik]
vi.痛；想念 n.疼痛
44. achieve[2't6i:v]
vt.完成，实现；达到
45. achievement[2't6i:vm2nt]
n.完成；成就，成绩
46. acid['9sid]
n.酸；酸的，酸性的
47. acquaintance[2'kweint2ns]
n.认识；了解；熟人
48. acquire[2'kwai2]
vt.取得；获得；学到
49. acre['eik2]
n.英亩(=6.07亩)
50. across[2'kr0s]
prep.横过；在…对面
51. act[9kt]
vi.行动；见效 n.行为
52. action['9k62n]
n.行动；作用；功能
53. active['9ktiv]
a.活跃的；积极的
54. activity[9k'tiviti]
n.活动；活力；行动
55. actor['9kt2]
n.男演员；演剧的人
56. actress['9ktris]
n.女演员
57. actual['9ktju2l]
a.实际的；现行的
58. actually['9ktju2li]
ad.实际上；竟然
59. acute[2'kju:t]
a.尖的，锐的；敏锐的
60. ad[9d]
n.广告
61. adapt[2'd9pt]
vt.使适应；改编
62. add[9d]
vt.添加，附加，掺加
63. addition[2'di62n]
n.加，加法；附加物
64. additional[2'di62nl]
a.附加的，追加的
65. address[2'dres]
n.地址；演说；谈吐
66. adequate['9dikwit]
a.足够的；可以胜任的
67. adjective['9d7iktiv]
n.形容词 a.形容词的
68. adjust[2'd73st]
vt.调整，调节；校正
69. administration[2dminis'trei62n]
n.管理；管理部门
70. admire[2d'mai2]
vt.钦佩，羡慕，赞赏
71. admission[2d'mi62n]
n.允许进入；承认
72. admit[2d'mit]
vt.承认；准许…进入
73. adopt[2'd0pt]
vt.收养；采用；采取
74. adult['9d3lt]
n.成年人 a.成年的
75. advance[2d'va:ns]
vi.前进；提高 n.进展
76. advanced[2d'va:nst]
a.先进的；高级的
77. advantage[2d'va:ntid7]
n.优点，优势；好处
78. adventure[2d'vent62]
n.冒险；惊险活动
79. adverb['9dv2:b]
n.副词
80. advertisement[2d'v2:tism2nt]
n.广告；公告；登广告
81. advice[2d'vais]
n.劝告；忠告；意见
82. advisable[2d'vaiz2bl]
n.明智的；可取的
83. advise[2d'vaiz]
vt.劝告；建议；通知
84. aeroplane['/2r2plein]
n.飞机
85. affair[2'f/2]
n.事情，事件；事务
86. affect[2'fekt]
vt.影响；感动
87. affection[2'fek62n]
n.慈爱，爱；爱慕
88. afford[2'f0:d]
vt.担负得起…；提供
89. afraid[2'freid]
a.害怕的；担心的
90. Africa['9frik2]
n.非洲
91. African['9frik2n]
a.非洲的 n.非洲人
92. after['a:ft2]
prep.在…以后；次于
93. afternoon['a:ft2'nu:n]
n.下午，午后
94. afterward['a:ft2w2d(z)]
ad.后来，以后
95. again[2'gein. 2'gen]
ad.又一次；而且
96. against[2'geinst. 2'genst]
prep.倚在；逆，对着
97. age[eid7]
n.年龄；时代 vt.变老
98. agency['eid72nsi]
n.经办；代理；代理处
99. agent['eid72nt]
n.代理人，代理商
100. aggressive[2'gresiv]
a.侵略的；好斗的
101. ago[2'g2u]
ad.以前
102. agony['9g2ni]
n.极度痛苦
103. agree[2'gri:]
vi.同意；持相同意见
104. agreement[2'gri:m2nt]
n.协定，协议；同意
105. agriculture['9grik3lt62]
n.农业，农艺；农学
106. ahead[2'hed]
ad.在前；向前；提前
107. aid[eid]
n.帮助，救护；助手
108. aim[eim]
vi.瞄准，针对；致力
109. air[/2]
n.空气；空中；外观
110. aircraft['/2kra:ft]
n.飞机，飞行器
111. airline['/2lain]
n.航空公司；航线
112. airplane['/2plein]
n.飞机
113. airport['/2p0:t]
n.机场，航空站
114. alarm[2'la:m]
n.惊恐，忧虑；警报
115. alcohol['9lk2h0l]
n.酒精，乙醇
116. alike[2'laik]
a.同样的，相同的
117. alive[2'laiv]
a.活着的；活跃的
118. all[0:l]
a.全部的 prep.全部
119. allow[2'lau]
vt.允许，准许；任
120. alloy['9l0i. 2'l0i]
n.合金；(金属的)成色
121. almost['0:lm2ust]
ad.几乎，差不多
122. alone[2'l2un]
a.单独的 ad.单独地
123. along[2'l08]
prep.沿着 ad.向前
124. aloud[2'laud]
ad.出声地，大声地
125. alphabet['9lf2bit]
n.字母表，字母系统
126. already[0:l'redi]
ad.早已，已经
127. also['0:ls2u]
ad.亦，也；而且，还
128. alter['0:lt2]
vt.改变，变更；改做
129. alternative[0:l't2:n2tiv]
n.替换物；取舍，抉择
130. although[0:l'52u]
conj.尽管，虽然
131. altitude['9ltitju:d]
n.高，高度；高处
132. altogether[0:lt2'ge52]
ad.完全；总而言之
133. aluminium[9lju'minj2m]
n.铝
134. always['0:lweiz. '0:lw2z]
ad.总是，一直；永远
135. a.m[]
(缩)上午，午前
136. amaze[2'meiz]
vt.使惊奇，使惊愕
137. ambition[9m'bi62n]
n.雄心，抱负，野心
138. ambulance['9mbjul2ns]
n.救护车；野战医院
139. America[2'merik2]
n.美洲；美国
140. American[2'merik2n]
a.美洲的 n.美国人
141. among[2'm38]
prep.在…之中
142. amongst[2'm38st]
prep在…之中(=among)
143. amount[2'maunt]
n.总数；数量；和
144. ampere['9mp/2]
n.安培
145. amplify['9mplifai]
vt.放大，增强；扩大
146. amuse[2'mju:z]
vt.逗…乐；给…娱乐
147. analyse['9n2laiz]
vt.分析，分解，解析
148. analysis[2'n9l2sis]
n.分析，分解，解析
149. ancestor['9nsist2]
n.祖宗，祖先
150. anchor['98k2]
n.锚 vi.抛锚，停泊
151. ancient['ein62nt]
a.古代的，古老的
152. and[9nd. 2nd]
conj.和，又，并，则
153. angel['eind72l]
n.天使，神差，安琪儿
154. anger['98g2]
n.怒，愤怒 vt.使发怒
155. angle['98gl]
n.角，角度
156. angry['98gri]
a.愤怒的，生气的
157. animal['9nim2l]
n.动物，兽 a.动物的
158. ankle['98kl]
n.踝，踝节部
159. announce[2'nauns]
vt.宣布，宣告，发表
160. announcer[2'nauns2]
n.宣告者；播音员
161. annoy[2'n0i]
vt.使恼怒；打搅
162. annual['9nju2l]
a.每年的 n.年报
163. another[2'n352]
a.再一个的；别的
164. answer['a:ns2]
vt.回答；响应；适应
165. ant[9nt]
n.蚂蚁
166. anticipate[9n'tisipeit]
vt.预料，预期，期望
167. anxiety[98g'zai2ti]
n.焦虑，忧虑；渴望
168. anxious['98k62s]
a.忧虑的；渴望的
169. any['eni]
a.什么，一些；任何的
170. anybody['enib0di]
prep.任何人
171. anyhow['enihau]
ad.无论如何
172. anyone['eniw3n]
pron.任何人
173. anything['eni4i8]
pron.任何事物；一切
174. anyway['eniwei]
ad.无论如何
175. anywhere['eniw/2]
ad.在什么地方
176. apart[2'pa:t]
ad.相隔；分开；除去
177. apartment[2'pa:tm2nt]
n.一套公寓房间
178. apologize[2'p0l2d7aiz]
vi.道歉，谢罪，认错
179. apology[2'p0l2d7i]
n.道歉，认错，谢罪
180. apparatus[,9p2'reit2s]
n.器械，仪器；器官
181. apparent[2'p9r2nt]
a.表面上的；明显的
182. appeal[2'pi:l]
vi.&n.呼吁；申述
183. appear[2'pi2]
vi.出现；来到；似乎
184. appearance[2'pi2r2ns]
n.出现，来到；外观
185. appetite['9pitait]
n.食欲，胃口；欲望
186. apple['9pl]
n.苹果，苹果树
187. appliance[2'plai2ns]
n.用具，器具，器械
188. applicable['9plik2bl]
a.能应用的；适当的
189. application[9pli'kei62n]
n.请求，申请；施用
190. apply[2'plai]
vt.应用，实施，使用
191. appoint[2'p0int]
vt.任命，委任；约定
192. appointment[2'p0intm2nt]
n.任命；约定，约会
193. appreciate[2'pri:6ieit]
vt.欣赏；领会；感谢
194. approach[2'pr2ut6]
vt.向…靠近 n.靠近
195. appropriate[2'pr2upriit]
a.适当的，恰当的
196. approval[2'pru:v2l]
n.赞成，同意；批准
197. approve[2'pru:v]
vt.赞成，称许；批准
198. approximate[2'pr0ksimit]
a.近似的 vt.近似
199. approximately[2'pr0ksimitli]
ad.近似地，大约
200. April['eipr2l]
n.四月
201. Arabian[2'reibj2n]
a.阿拉伯的
202. arbitrary['a:bitr2ri]
a.随心所欲的；专断的
203. architecture['a:kitekt62]
n.建筑学；建筑式样
204. area['/2ri2]
n.面积；地区；领域
205. argue['a:gju:]
vi.争论，争辩，辩论
206. argument['a:gju:m2nt]
n.争论，辩论；理由
207. arise[2'raiz]
vi.出现；由…引起
208. arithmetic[2'ri4m2tik]
n.算术，四则运算
209. arm[a:m]
n.臂；臂状物；武器
210. army['a:mi]
n.军队；陆军
211. around[2'raund]
prep.在…周围
212. arouse[2'rauz]
vt.引起，唤起；唤醒
213. arrange[2'reind7]
vt.筹备；整理；调解
214. arrangement[2'reind7m2nt]
n.整理，排列；安排
215. arrest[2'rest]
vt.逮捕，拘留；阻止
216. arrival[2'raiv2l]
n.到达；到来；到达者
217. arrive[2'raiv]
vi.到达；来临；达到
218. arrow['9r2u]
n.箭；箭状物
219. art[a:t]
n.艺术，美术；技术
220. article['a:tikl]
n.文章；条款；物品
221. artificial[a:ti'fi62l]
a.人工的；娇揉造作的
222. artist['a:tist]
n.艺术家，美术家
223. artistic[a:'tistik]
a.艺术的；艺术家的
224. as[9z. 2z]
conj.当…的时候
225. ash[96]
n.灰，灰末；骨灰
226. ashamed[2'6eimd]
a.惭愧(的)；羞耻(的)
227. Asia['ei62]
n.亚洲
228. Asian['ei62n]
a.亚洲的 n.亚洲人
229. aside[2'said]
ad.在旁边，到旁边
230. ask[a:sk]
vt.问；要求；邀请
231. asleep[2'sli:p]
a.睡着的，睡熟的
232. aspect['9spekt]
n.方面；样子，外表
233. assemble[2'sembl]
vt.集合，召集；装配
234. assembly[2'sembli]
n.集合；集会；装配
235. assess[2'ses]
vt.对(财产等)估价
236. assign[2'sain]
vt.指派；分配；指定
237. assignment[2'sainm2nt]
n.任务，指定的作业
238. assist[2'sist]
vt.援助，帮助；搀扶
239. assistant[2'sist2nt]
n.助手，助理；助教
240. associate[2's2u6ieit]
vi.交往 n.伙伴，同事
241. association[2s2usi'ei62n]
n.协会，团体；联合
242. assume[2'sju:m]
vt.假定；承担；呈现
243. assure[2'6u2]
vt.使确信；向…保证
244. astonish[2s't0ni6]
vt.使惊讶，使吃惊
245. astronaut['9st62un0:t]
n.宇宙航行员，宇航员
246. at[9t. 2t]
prep.在…里；在…时
247. athlete['94li:t]
n.运动员；田径运动员
248. Atlantic[2t'l9ntik]
a.大西洋的 n.大西洋
249. atmosphere['9tm2sfi2]
n.大气；空气；气氛
250. atmospheric[9tm2s'ferik]
a.大气的；大气层的
251. atom['9t2m]
n.原子；微粒；微量
252. atomic[2't0mik]
a.原子的；原子能的
253. attach[2't9t6]
vt.缚，系，贴；附加
254. attack[2't9k]
vt.&vi.&n.攻击，进攻
255. attain[2'tein]
vt.达到，获得，完成
256. attempt[2'tempt]
vt.尝试，试图 n.企图
257. attend[2'tend]
vt.出席；照顾，护理
258. attention[2'ten62n]
n.注意，留心；注意力
259. attentive[2'tentiv]
a.注意的；有礼貌的
260. attitude['9titju:d]
n.态度，看法；姿势
261. attract[2'tr9kt]
vt.吸引；引起，诱惑
262. attraction[2'tre9k62n]
n.吸引；吸引力；引力
263. attractive[2'tr9ktiv]
a.有吸引力的
264. attribute['9tribju:t]
vt.把…归因于 n.属性
265. audience['0:dj2ns]
n.听众，观众，读者
266. August[0:'g3st]
n.八月
267. aunt[a:nt]
n.伯母，婶母，姑母
268. aural['0r2l]
a.耳的，听觉的
269. Australia[0s'treilj2]
n.澳大利亚
270. Australian[0s'treilj2n]
a.澳大利亚的
271. author['0:42]
n.作者，作家
272. authority[0:'40riti]
n.当局，官方；权力
273. auto['0:t2u]
n.(口语)汽车
274. automatic[0:t2'm9tik]
a.自动的；机械的
275. automation[0:t2'mei62n]
n.自动，自动化
276. automobile['0:t2m2bi:l]
n.汽车，机动车
277. autumn['0:t2m]
n.秋，秋季
278. auxiliary[0:g'zilj2ri]
a.辅助的；附属的
279. available[2'veil2bl]
a.可利用的；通用的
280. avenue['9vinju:]
n.林荫道，道路；大街
281. average['9v2rid7]
n.平均数 a.平均的
282. aviation[eivi'ei62n]
n.航空，航空学
283. avoid[2'v0id]
vt.避免，躲开；撤消
284. await[2'weit]
vt.等候，期待
285. awake[2'weik]
a.醒着的 vt.唤醒
286. award[2'w0:d]
n.奖，奖品；判定
287. aware[2'w/2]
a.知道的，意识到的
288. away[2'wei]
ad.离开，远离；…去
289. awful['0:ful]
a.令人不愉快的
290. awfully['0:fuli]
ad.令人畏惧的；很
291. awkward['0:kw2d]
a.笨拙的；尴尬的
292. ax[9ks]
n.斧子
293. axis['9ksis]
n.轴，轴线；中心线
294. baby['beibi]
n.婴儿；孩子气的人
295. back[b9k]
ad.在后；回原处；回
296. background['b9kgraund]
n.背景，后景，经历
297. backward['b9kw2d]
a.向后的；倒的 ad.倒
298. bacteria[b9k'ti2ri2]
n.细菌
299. bad[b9d]
a.坏的，恶的；严重的
300. badly['b9dli]
ad.坏，差；严重地
301. badminton['b9dmint2n]
n.羽毛球
302. bag[b9g]
n.袋，包，钱包，背包
303. baggage['b9gid7]
n.行李
304. bake[beik]
vt.烤，烘，焙；烧硬
305. balance['b9l2ns]
vt.使平衡；称 n.天平
306. ball[b0:l]
n.球，球状物；舞会
307. balloon[b2'lu:n]
n.气球，玩具气球
308. banana[b2'na:n2]
n.香蕉；芭蕉属植物
309. band[b9nd]
n.乐队；带；波段
310. bang[b98]
n.巨响，枪声；猛击
311. bank[b98k]
n.银行；库；岩，堤
312. banner['b9n2]
n.旗，旗帜，横幅
313. bar[ba:]
n.酒吧间；条，杆；栅
314. barber['ba:b2]
n.理发师
315. bare[b/2]
a.赤裸的；仅仅的
316. bargain['ba:gin]
n.交易 vi.议价；成交
317. bark[ba:k]
n.吠叫声 vi.吠，叫
318. barn[ba:n]
n.谷仓；牲口棚
319. barrel['b9r2l]
n.桶；圆筒；枪管
320. barrier['b9ri2]
n.栅栏，屏障；障碍
321. base[beis]
n.基础，底层；基地
322. basic['beisik]
a.基本的，基础的
323. basically['beisik2li]
ad.基本上
324. basin['beisn]
n.盆，洗脸盆；盆地
325. basis['beisis]
n.基础，根据
326. basket['ba:skit]
n.篮，篓，筐
327. basketball['ba:skitb0:l]
n.篮球；篮球运动
328. bat[b9t]
n.球拍；短棍；蝙蝠
329. bath[ba:4]
n.浴，洗澡；浴缸
330. bathe[bei5]
vt.给…洗澡；弄湿
331. bathroom['ba:4rum]
n.浴室；盥洗室
332. battery['b9t2ri]
n.电池；一套，一组
333. battle['b9tl]
n.战役；斗争 vi.作战
334. bay[bei]
n.湾；山脉中的凹处
335. B.C.['bi: si:]
(缩)公元前
336. be[bi:]
aux.v.&vi.是，在，做
337. beach[bi:t6]
n.海滩，湖滩，河滩
338. beam[bi:m]
n.梁；横梁；束，柱
339. bean[bi:n]
n.豆，蚕豆
340. bear[b/2]
n.熊；粗鲁的人
341. bear[b/2]
vt.容忍；负担；生育
342. beard[bi2d]
n.胡须，络腮胡子
343. beast[bi:st]
n.兽，野兽；牲畜
344. beat[bi:t]
vt.&vi.打，敲；打败
345. beautiful['bju:tiful]
a.美的，美丽的
346. beauty['bju:ti]
n.美，美丽；美人
347. because[bi'k0z]
conj.由于，因为
348. become[bi'k3m]
vi.变成；成为，变得
349. bed[bed]
n.床，床位；圃；河床
350. bee[bi:]
n.蜂，密蜂；忙碌的人
351. beef[bi:f]
n.牛肉；菜牛
352. beer[bi2]
n.啤酒
353. before[bi'f0:]
prep.在…以前；向…
354. beg[beg]
vt.&vi.乞求；请求
355. beggar['beg2]
n.乞丐，穷人
356. begin[bi'gin]
vi.开始 vt.开始
357. beginner[bi'gin2]
n.初学者，生手
358. beginning[bi'gini8]
n.开始，开端；起源
359. behalf[bi'ha:f]
n.利益，维护，支持
360. behave[bi'heiv]
vi.表现，举止；运转
361. behavior[bi'heivj2]
n.行为，举止，态度
362. behind[bi'haind]
prep.在…后面
363. being['bi:i8]
n.存在；生物；生命
364. belief[bi'li:f]
n.信任，相信；信念
365. believe[bi'li:v]
vt.相信；认为
366. bell[bel]
n.钟，铃，门铃；钟声
367. belong[bi'l08]
vi.属于，附属
368. beloved[bi'l3vd]
a.为…的爱的 n.爱人
369. below[bi'l2u]
prep.在…下面(以下)
370. belt[belt]
n.带，腰带；皮带；区
371. bench[bent6]
n.长凳，条凳；工作台
372. bend[bend]
vt.使弯曲 vi.弯曲
373. beneath[bi'ni:4]
prep.在…下方
374. beneficial[beni'fi62l]
a.有利的，有益的
375. benefit['benifit]
n.利益；恩惠；津贴
376. berry['beri]
n.浆果(如草莓等)
377. beside[bi'said]
prep.在…旁边
378. besides[bi'saidz]
ad.而且prep.除…之外
379. best[best]
a.最好的；最大的
380. bet[bet]
vt.&vi.&n.打赌
381. betray[bi'trei]
vt.背叛；辜负；泄漏
382. better['bet2]
a.较好的 ad.更好地
383. between[bi'twi:n]
prep.在…中间
384. beyond[bi'j0nd]
prep.在…的那边
385. Bible['baibl]
n.基督教《圣经》
386. bicycle['baisikl]
n.自行车，脚踏车
387. big[big]
a.大的，巨大的
388. bike[baik]
n.自行车 vi.骑自行车
389. bill[bil]
n.账单；招贴；票据
390. billion['bilj2n]
num.万亿(英)
391. bind[baind]
vt.捆绑；包扎；装钉
392. biology[bai'0l2d7i]
n.生物学；生态学
393. bird[b2:d]
n.鸟，禽
394. birth[b2:4]
n.分娩，出生；出身
395. birthday['b2:4di]
n.生日，诞生的日期
396. biscuit['biskit]
n.(英)饼干；(美)软饼
397. bit[bit]
n.一点，一些，小片
398. bite[bait]
vt.咬，叮，螫；剌穿
399. bitter['bit2]
a.痛苦的；严寒的
400. bitterly['bit2li]
ad.苦苦地；悲痛地
401. black[bl9k]
a.黑色的；黑暗的
402. blackboard['bl9kb0:d]
n.黑板
403. blade[bleid]
n.刀刃，刀片；叶片
404. blame[bleim]
vt.责备，把…归咎于
405. blank[bl98k]
a.空白的 n.空白
406. blanket['bl98kit]
n.毛毯，毯子，羊毛毯
407. blast[bla:st]
n.爆炸，冲击波 vt.炸
408. blaze[bleiz]
n.火；闪光 vi.燃烧
409. bleed[bli:d]
vi.出血，流血；泌脂
410. blend[blend]
vt.&vi.&n.混和
411. bless[bles]
vt.为…祝福
412. blind[blaind]
a.瞎的；盲目的
413. block[bl0k]
n.街区 vt.堵塞，拦阻
414. blood[bl3d]
n.血，血液；血统
415. bloom[blu:m]
n.花；开花，开花期
416. blossom['bl0s2m]
n.花，开花 vi.开花
417. blow[bl2u]
vi.吹，吹动；吹响
418. blue[blu:]
a.蓝色的 n.蓝色
419. board[b0:d]
n.板 vt.上(船、车等)
420. boast[b2ust]
vi.自夸 vt.吹嘘
421. boat[b2ut]
n.小船，艇；渔船
422. body['b0di]
n.身体；主体；尸体
423. boil[b0il]
vi.沸腾；汽化vt.煮沸
424. bold[b2uld]
a.大胆的；冒失的
425. bolt[b2ult]
n.螺栓；插销 vt.闩门
426. bomb[b0m]
n.炸弹 vt.轰炸
427. bond[b0nd]
n.联结，联系；公债
428. bone[b2un]
n.骨，骨骼
429. book[buk]
n.书，书籍 vt.预定
430. boot[bu:t]
n.靴子，长统靴
431. booth[bu:5]
n.货摊；公用电话亭
432. border['b0:d2]
n.边，边缘；边界
433. bore[b0:]
vt.使厌烦；钻，挖
434. born[b0:n]
a.天生的；出生的
435. borrow['b0r2u]
vt.借，借用，借人
436. bosom['buz2m]
n.胸，胸部；内心
437. boss[b0s]
n.老板，上司 vt.指挥
438. both[b2u4]
pron.两者(都)
439. bother['b052]
vt.烦扰，迷惑 n.麻烦
440. bottle['b0tl]
n.瓶，酒瓶；一瓶
441. bottom['b0t2m]
n.底，底部，根基
442. bough[bau]
n.树枝
443. bounce[bauns]
vi.反跳，弹起；跳起
444. bound[baund]
a.一定的；有义务的
445. boundary['baund2ri]
n.分界线，办界
446. bow[bau]
n.弓；蝴蝶结；鞠躬
447. bowl[b2ul]
n.碗，钵；碗状物
448. box[b0ks]
n.箱，盒；包箱
449. box[b0ks]
vi.拳击，打拳
450. boy[b0i]
n.男孩，少年；家伙
451. brain[brein]
n.脑，脑髓；脑力
452. brake[breik]
n.闸，刹车 vi.制动
453. branch[bra:nt6]
n.树枝；分部；分科
454. brand[br9nd]
n.商品；烙印 vt.铭刻
455. brandy['br9ndi]
n.白兰地酒
456. brass[bra:s]
n.黄铜；黄铜器
457. brave[breiv]
a.勇敢的，华丽的
458. bread[bred]
n.面包；食物，粮食
459. breadth[bred5]
n.宽度，幅度；幅面
460. break[breik]
vt.打破；损坏；破坏
461. breakfast['brekf2st]
n.早饭，早餐
462. breast[brest]
n.乳房；胸脯，胸膛
463. breath[bre4]
n.气息，呼吸；气味
464. breathe[bri:5]
vi.呼吸 vt.呼吸
465. breed[bri:d]
n.品种 vt.使繁殖
466. breeze[bri:z]
n.微风，和风
467. brick[brik]
n.砖，砖块；砖状物
468. bridge[brid7]
n.桥，桥梁；桥牌
469. brief[bri:f]
a.简短的；短暂的
470. bright[brait]
a.明亮的；聪明的
471. brighten['braitn]
vt.使发光；使快活
472. brilliant['brilj2nt]
a.光辉的；卓越的
473. brim[brim]
n.边，边缘；帽沿
474. bring[bri8]
vt.带来；引出；促使
475. brisk[brisk]
a.活泼的；清新的
476. bristle[brisl]
n.短而硬的毛；鬃毛
477. Britain['brit2n]
n.不列颠，英国
478. British['briti6]
a.不列颠的，英联邦的
479. brittle['britl]
a.脆的；易损坏的
480. broad[br0:d]
a.宽的，阔的；广泛的
481. broadcast['br0:dka:st]
n.广播，播音
482. broken['br2uk2n]
a.被打碎的，骨折的
483. bronze[br0nz]
n.青铜；青铜制品
484. brood[bru:d]
n.同窝幼鸟 vt.孵(蛋)
485. brook[bruk]
n.小河，溪流
486. broom[bru:m]
n.扫帚
487. brother['br352]
n.兄弟；同事，同胞
488. brow[brau]
n.额；眉，眉毛
489. brown[braun]
n.褐色，棕色
490. bruise[bru:z]
n.青肿，伤痕；擦伤
491. brush[br36]
n.刷子，毛刷；画笔
492. brute[bru:t]
n.禽兽，畜生
493. bubble['b3bl]
n.泡 vi.冒泡，沸腾
494. bucket['b3kit]
n.水桶；吊桶；铲斗
495. bud[b3d]
n.芽，萌芽；蓓蕾
496. build[bild]
vt.建筑；建立；创立
497. building['bildi8]
n.建筑物，大楼；建筑
498. bulb[b3lb]
n.电灯泡；球状物
499. bulk[b3lk]
n.物体，容积，大批
500. bull[bul]
n.公牛；雄的象
501. bullet['bulit]
n.枪弹，子弹，弹丸
502. bunch[b3nt6]
n.束，球，串；一群
503. bundle['b3ndl]
n.捆，包，束；包袱
504. burden['b2:dn]
n.担子，重担；装载量
505. bureau['bju2r2u]
n.局，司，处；社，所
506. burn[b2:n]
vi.烧，燃烧 n.烧伤
507. burst[b2:st]
vt.使爆裂 vi.&n.爆炸
508. bury['beri]
vt.埋葬，葬；埋藏
509. bus[b3s]
n.公共汽车
510. bush[bu6]
n.灌木，灌木丛，矮树
511. business['biznis]
n.商业，生意；事务
512. busy['bizi]
a.忙的，繁忙的
513. but[b3t]
conj.但是，可是
514. butcher['but62]
n.屠夫；屠杀者
515. butter['b3t2]
n.黄油；奶油
516. butterfly['b3t2flai]
n.蝴蝶
517. button['b3tn]
n.扣子；按钮 vt.扣紧
518. buy[bai]
vt.买，购买 vi.买
519. by[bai]
prep.在…旁；被，由
520. cabbage['k9bid7]
n.洋白菜，卷心菜
521. cabin['k9bin]
n.小屋；船舱，机舱
522. cabinet['k9binit]
n.橱，柜；内阁
523. cable['keibl]
n.缆，索；电缆；电报
524. cafe['k9fei. k2'fei]
n.咖啡馆；小餐厅
525. cafeteria[k9fi'ti2ri2]
n.自助食堂
526. cage[keid7]
n.笼；鸟笼，囚笼
527. cake[keik]
n.饼，糕，蛋糕
528. calculate['k9lkjuleit]
vt.计算；估计；计划
529. calculation[k9lkju'lei62n]
n.计算，计算结果
530. calculator['k9lkjuleit2]
n.计算器，计算者
531. calendar['k9lind2]
n.日历，历书；历法
532. call[k0:l]
vt.把…叫做；叫，喊
533. calm[ka:m]
a.静的，平静的
534. camel['k9m2l]
n.骆驼
535. camera['k9m2r2]
n.照相机，摄影机
536. camp[k9mp]
n.野营，营地，兵营
537. campaign[k9m'pein]
n.战役；运动
538. campus['k9mp2s]
n.校园，学校场地
539. can[k9n]
aux.v.能，会，可能
540. can[k9n]
n.罐头，听头；容器
541. Canada['k9n2d2]
n.加拿大
542. Canadian[k2'neidj2n]
a.加拿大的
543. canal[k2'n9l]
n.运河；沟渠；管
544. cancel['k9ns2l]
vt.取消，撤消；删去
545. cancer['k9ns2]
n.癌，癌症，肿瘤
546. candidate['k9ndidit]
n.候选人；投考者
547. candle['k9ndl]
n.蜡烛；烛形物；烛光
548. candy['k9ndi]
n.糖果；砂糖结晶
549. cannon['k9n2n]
n.大炮，火炮；榴弹炮
550. canoe[k2'nu:]
n.独木舟，皮艇，划子
551. canteen[k9n'ti:n]
n.小卖部；临时餐室
552. canvas['k9nv2s]
n.粗帆布；一块油画布
553. cap[k9p]
n.帽子，便帽；帽状物
554. capable['keip2bl]
a.有能力的，有才能的
555. capacity[k2'p9siti]
n.容量；能力；能量
556. capital['k9pitl]
n.资本，资金；首都
557. captain['k9ptin]
n.陆军上尉；队长
558. captive['k9ptiv]
n.俘虏，被监禁的人
559. capture['k9pt62]
vt.捕获，俘获；夺得
560. car[ka:]
n.汽车，小汽车，轿车
561. carbon['ka:b2n]
n.碳
562. card[ka:d]
n.卡，卡片，名片
563. care[k/2]
vi.关心，介意 n.小心
564. career[k2'ri2]
n.生涯，职业，经历
565. careful['k/2ful]
a.仔细的；细致的
566. careless['k/2lis]
a.粗心的，漫不经心的
567. cargo['ka:g2u]
n.船货，货物
568. carpenter['ka:pint2]
n.木工，木匠
569. carpet['ka:pit]
n.地毯，毡毯，毛毯
570. carriage['k9rid7]
n.客车厢；四轮马车
571. carrier['k9ri2]
n.运输工具；运载工具
572. carrot['k9r2t]
n.胡罗卜
573. carry['k9ri]
vt.携带；运载；传送
574. cart[ka:t]
n.二轮运货马车
575. carve[ka:v]
vt.刻，雕刻；切开
576. case[keis]
n.情况；事实；病例
577. case[keis]
n.箱(子)，盒(子)，套
578. cash[k96]
n.现金，现款
579. cassette[ka:'set]
n.盒式录音带；盒子
580. cast[ka:st]
vt.投，扔，抛；浇铸
581. castle['ka:sl]
n.城堡；巨大建筑物
582. casual['k97ju2l]
a.偶然的；随便的
583. cat[k9t]
n.猫，猫科，猫皮
584. catalog['k9t2l0g]
n.目录，目录册
585. catch[k9t6]
vt.捉住；赶上；领会
586. cathedral[k2'4i:dr2l]
n.总教堂；大教堂
587. cattle['k9tl]
n.牛；牲口，家畜
588. cause[k0:z]
n.原因，理由；事业
589. cave[keiv]
n.山洞，洞穴，窑洞
590. cease[si:s]
vi.&vi.&n.停止，停息
591. ceiling['si:li8]
n.天花板，顶蓬
592. celebrate['selibreit]
vt.庆祝；歌颂，赞美
593. cell[sel]
n.细胞；小房间
594. cellar['sel2]
n.地窑，地下室
595. cement[si'ment]
n.水泥；胶泥 vt.粘结
596. cent[sent]
n.分；分币；百
597. centigrade['sentigreid]
a.百分度的
598. centimetre['sentimi:t2]
n.公分，厘米
599. central['sentr2l]
a.中心的；主要的
600. centre['sent2]
n.中心；中枢 vt.集中
601. century['sent6uri]
n.世纪，百年
602. ceremony['serim2ni]
n.典礼，仪式；礼节
603. certain['s2:t2n]
a.确实的；肯定的
604. certainly['s2:t2nli]
ad.一定，必定；当然
605. certainty['s2:tnti]
n.必然；肯定
606. certificate[s2'tifikit]
n.证书，证件，执照
607. chain[t6ein]
n.链，链条，项圈
608. chair[t6/2]
n.椅子；主席
609. chairman['t6/2m2n]
n.主席；议长，会长
610. chalk[t60:k]
n.白垩；粉笔
611. challenge['t69l2nd7]
n.挑战；要求，需要
612. chamber['t6eimb2]
n.会议室；房间；腔
613. champion['t69mpj2n]
n.冠军，得胜者
614. chance[t6a:ns]
n.机会，机遇；可能性
615. change[t6eind7]
n.改变，变化；零钱
616. channel['t69nl]
n.海峡；渠道；频道
617. chapter['t69pt2]
n.章，回，篇
618. character['k9rikt2]
n.性格；特性；角色
619. characteristic[k9rikt2'ristik]
a.特有的 n.特性
620. charge[t6a:d7]
vt.索价；控告 n.费用
621. charity['t69riti]
n.施舍；慈善事业
622. charming['t6a:mi8]
a.迷人的，可爱的
623. chart[t6a:t]
n.图，图表；海图
624. chase[t6eis]
n.追逐，追赶，追求
625. cheap[t6i:p]
a.廉价的；劣质的
626. cheat[t6i:t]
vt.骗取；哄 vi.行骗
627. check[t6ek]
vt.检查；制止 n.检查
628. cheek[t6i:k]
n.面颊，脸蛋
629. cheer[t6i2]
vt.使振作；欢呼
630. cheerful['t6i2ful]
a.快乐的，愉快的
631. cheese[t6i:z]
n.乳酪，干酪
632. chemical['kemikl]
a.化学的 n.化学制品
633. chemist['kemist]
n.化学家；药剂师
634. chemistry['kemistri]
n.化学
635. cheque[t6ek]
n.支票
636. cherry['t6eri]
n.樱桃；樱桃树
637. chess[t6es]
n.棋；国际象棋
638. chest[t6est]
n.胸腔，胸膛；箱子
639. chew[t6u:]
vt.咀嚼，嚼碎
640. chicken['t6ikin]
n.小鸡，小鸟；鸡肉
641. chief[t6i:f]
a.主要的；首席的
642. child[t6aild]
n.小孩，儿童；儿子
643. childhood['t6aildhud]
n.童年，幼年；早期
644. childish['t6aildi6]
a.孩子的；幼稚的
645. chill[t6il]
vt.使变冷 n.寒冷
646. chimney['t6imni]
n.烟囱，烟筒；玻璃罩
647. chin[t6in]
n.颏，下巴
648. China['t6ain2]
n.中国
649. china['t6ain2]
n.瓷器，瓷料
650. Chinese['t6ai'ni:z]
a.中国的 n.中国人
651. chocolate['t60k2lit]
n.巧克力；巧克力糖
652. choice[t60is]
n.选择，抉择
653. choke[t62uk]
vt.使窒息；塞满
654. choose[t6u:z]
vt.选择，挑选；情愿
655. chop[t60p]
vt.砍，劈；切细vi.砍
656. Christian['kristi2n]
n.基督教徒；信徒
657. Christmas['krism2s]
n.圣诞节
658. church[t62:t6]
n.教堂，礼拜堂；教会
659. cigarette[sig2'ret]
n.香烟，纸烟，卷烟
660. cinema['sinim2]
n.电影院；电影，影片
661. circle['s2:kl]
n.圆，圆周；圈子
662. circuit['s2:kit]
n.电路；环行；巡行
663. circular['s2:kjul2]
a.圆的；循环的
664. circulate['s2:kjuleit]
vt.使循环 vi.循环
665. circumference[s2'k3mf2r2ns]
n.圆周，周长，圆周线
666. circumstance['s2:k2mst2ns]
n.情况，条件；境遇
667. citizen['sitizn]
n.公民；市民，居民
668. city['siti]
n.城市，都市
669. civil['sivl]
a.公民的；文职的
670. civilization[sivilai'zei62n]
n.文明，文化；开化
671. civilize['sivilaiz]
vt.使文明；教育
672. claim[kleim]
vt.声称，主张；索取
673. clap[kl9p]
vi.拍手 vt.拍，轻拍
674. clarify['kl9rifai]
vt.澄清，阐明
675. clasp[kla:sp]
n.扣子，钩子；别针
676. class[kla:s]
n.班，班级；阶级
677. classical['kl9sik2l]
a.古典的；经典的
678. classification[kl9sifi'kei62n]
n.分类；分级；分类法
679. classify['kl9sifai]
vt.把…分类
680. classmate['kla:smeit]
n.同班同学
681. classroom['kla:srum]
n.教室，课堂
682. claw[kl0:]
n.爪，脚爪，螯
683. clay[klei]
n.粘土，泥土；肉体
684. clean[kli:n]
a.清洁的；纯洁的
685. clear[kli2]
a.清晰的 vt.清除
686. clearly['kli2li]
ad.明白地，清晰地
687. clerk[kla:k. kl2:k]
n.店员；办事员，职员
688. clever['klev2]
a.聪明的；机敏的
689. cliff[klif]
n.悬崖，峭壁
690. climate['klaimit]
n.气候；风土，地带
691. climb[klaim]
vi.攀登，爬 vt.爬
692. cloak[kl2uk]
n.斗篷；覆盖(物)
693. clock[kl0k]
n.钟，仪表
694. close[kl2uz. kl2us]
vt.关，闭；结束
695. closely['kl2usli]
ad.紧密地，接近地
696. cloth[kl0:4]
n.布；衣料；桌布
697. clothe[kl2u5]
vt.给…穿衣服
698. clothes[kl2u5z]
n.衣服，服装；被褥
699. clothing['kl2u5i8]
n.衣服，被褥
700. cloud[klaud]
n.云；云状物；阴影
701. cloudy[klaudi]
a.多云的；云一般的
702. club[kl3b]
n.俱乐部，夜总会
703. clue[klu:]
n.线索，暗示，提示
704. clumsy['kl3mzi]
a.笨拙的；愚笨的
705. coach[k2ut6]
n.长途公共汽车
706. coal[k2ul]
n.煤，煤块
707. coarse[k0:s]
a.粗的，粗糙的
708. coast[k2ust]
n.海岸，海滨(地区)
709. coat[k2ut]
n.外套，上衣；表皮
710. cock[k0k]
n.公鸡；雄禽；旋塞
711. code[k2ud]
n.准则；法典；代码
712. coffee['k0fi]
n.咖啡，咖啡茶
713. coil[k0il]
n.(一)卷；线圈 vt.卷
714. coin[k0in]
n.硬币；铸造(硬币)
715. cold[k2uld]
a.冷的；冷淡的 n.冷
716. collapse[k2'l9ps]
vi.倒坍；崩溃，瓦解
717. collar['k0l2]
n.衣领，项圈
718. colleague['k0li:g]
n.同事，同僚
719. collect[k2'lekt]
vt.收集 vi.收款
720. collection[k2'lek62n]
n.搜集，收集；收藏品
721. collective[k2'lektiv]
a.集体的；集合性的
722. college['k0lid7]
n.学院；大学
723. collision[k2'li7(2)n]
n.碰撞；冲突
724. colonel['k2:nl]
n.陆军上校；中校
725. colony['k0l2ni]
n.殖民地；侨居地
726. color['k3l2]
n.颜色，彩色；颜料
727. column['k0l2m]
n.柱，支柱，圆柱
728. comb[k2um]
n.梳子 vt.梳理
729. combination[k0mbi'nei62n]
n.结合，联合；化合
730. combine[k2m'bain]
vt.使结合；兼有
731. come[k3m]
vi.来，来到；出现
732. comfort['k3mf2t]
n.舒适；安慰 vt.安慰
733. comfortable['k3mf2t2bl]
a.舒适的，安慰的
734. command[k2'ma:nd]
vt.命令，指挥；控制
735. commander[k2'ma:nd2]
n.司令官，指挥员
736. comment['k0ment]
n.评论，意见；注释
737. commerce['k0m2(:)s]
n.商业，贸易；社交
738. commercial[k2'm2:62l]
a.商业的；商品化的
739. commission[k2'mi62n]
n.委任状；委员会
740. commit[k2'mit]
vt.犯(错误);干(坏事)
741. committee[k2'miti]
n.委员会；全体委员
742. common['k0m2n]
a.普通的；共同的
743. commonly['k0m2nli]
ad.普通地，一般地
744. communicate[k2'mju:nikeit]
vi.通讯；传达；传播
745. communication[k2'mju:nikei62n]
n.通讯；传达；交通
746. communism['k0mjuniz2m]
n.共产主义
747. communist['k0mjunist]
n.共产党员
748. community[k2'mju:niti]
n.社区；社会；公社
749. companion[k2m'p9ni2n]
n.同伴；共事者；伴侣
750. company['k3mp2ni]
n.公司，商号；同伴
751. comparative[k2m'p9r2tiv]
a.比较的，相对的
752. compare[k2m'p/2]
vt.比较，对照；比作
753. comparison[k2m'p9risn]
n.比较，对照；比似
754. compass['k3mp2s]
n.罗盘，指南针；圆规
755. compel[k2m'pel]
vt.强迫，迫使屈服
756. compete[k2m'pi:t]
vi.比赛；竞争；对抗
757. competent['k0mpit2nt]
a.有能力的；应该做的
758. competition[k0mp2'ti62n]
n.竞争，比赛
759. compile[k2m'pail]
vt.编辑，编制，搜集
760. complain[k2m'plein]
vi.抱怨，拆苦；控告
761. complaint[k2m'pleint]
n.抱怨；怨言；控告
762. complete[k2m'pli:t]
a.完整的；完成的
763. completely[k2m'pli:tli]
ad.十分，完全地
764. complex['k0mpleks]
a.结合的；复杂的
765. complicate['k0mplikeit]
vt.使复杂；使陷入
766. complicated['k0mplikeitid]
a.复杂的，难懂的
767. component[k2m'p2un2nt]
n.组成部分；分；组件
768. compose[k2m'p2uz]
vt.组成，构成；创作
769. composition[k0mp2'zi62n]
n.构成；作品；写作
770. compound['k0mpaund. k2m'paund]
n.化合物；复合词
771. comprehension[k0mpri'hen62n]
n.理解，理解力；领悟
772. comprehensive[k0mpri'hensiv]
a.广泛的；理解的
773. compress[k2m'pres]
vt.压紧，压缩
774. comprise[k2m'praiz]
vt.包含，包括；构成
775. compromise['k0mpr2maiz]
n.妥协，和解
776. compute[k2m'pju:t]
vt.计算，估计，估算
777. computer[k2m'pju:t2]
n.计算机，电脑
778. comrade['k0mrid]
n.同志，亲密的同伴
779. conceal[k2n'si:l]
vt.把…隐藏起来
780. concentrate['k0ns2ntreit]
vt.集中；聚集；浓缩
781. concentration[k0ns2n'trei62n]
n.集中；专注；浓缩
782. concept['k0nsept]
n.概念，观念，设想
783. concern[k2n's2:n]
n.关心，挂念；关系
784. concerning[k2n's2:ni8]
prep.关于
785. concert['k0ns2t]
n.音乐会，演奏会
786. conclude[k2n'klu:d]
vt.推断出；结束
787. conclusion[k2n'klu:72n]
n.结论，推论；结尾
788. concrete['k0nkri:t]
n.混凝土；具体物
789. condemn[k2n'dem]
vt.谴责，指责；判刑
790. condense[k2n'dens]
vt.压缩，使缩短
791. condition[k2n'di62n]
n.状况，状态；环境
792. conduct['k0nd2kt. k2n'd3kt]
n.举止，行为；指导
793. conductor[k2n'd3kt2]
n.售票员；(乐队)指挥
794. conference['k0nf2r2ns]
n.会议，讨论会
795. confess[k2n'fes]
vt.供认，承认；坦白
796. confidence['k0nfid2ns]
n.信任；信赖；信心
797. confident['k0nfid2nt]
n.确信的，自信的
798. confine[k2n'fain]
vt.限制；禁闭
799. confirm[k2n'f2:m]
vt.证实，肯定；批准
800. conflict['k0nflikt. k2n'flikt]
n.争论；冲突；斗争
801. confuse[k2n'fju:z]
vt.使混乱，混淆
802. confusion[k2n'fju:72n]
n.混乱；骚乱；混淆
803. congratulate[k2n'gr9tjuleit]
vt.祝贺，向…道喜
804. congratulation[k2ngr9tju'lei62n]
n.祝贺；祝贺词
805. congress['k08gres]
n.大会；国会，议会
806. conjunction[k2n'd738k62n]
n.接合，连接；连接词
807. connect[k2'nekt]
vt.连接，连结；联系
808. connection[k2'nek62n]
n.连接，联系；连贯性
809. conquer['k08k2]
vt.征服，战胜；破除
810. conquest['k08kwest]
n.攻取，征服；克服
811. conscience['k0n62ns]
n.良心，道德心
812. conscious['k0n62s]
a.意识到的；有意的
813. consciousness['k0n62snis]
n.意识，觉悟；知觉
814. consent[k2n'sent]
n.同意，赞成 vi.同意
815. consequence['k0nsikw2ns]
n.结果，后果
816. consequently['k0nsikw2ntli]
ad.因此，因而，所以
817. conservation[k0ns2(:)'vei62n]
n.保存，保护；守恒
818. conservative[k2n's2:v2tiv]
a.保守的 n.保守的人
819. consider[k2n'sid2]
vt.认为；考虑；关心
820. considerable[k2n'sid2r2bl]
a.相当大的；重要的
821. considerate[k2n'sid2rit]
a.考虑周到的；体谅的
822. consideration[k2nsid2'rei62n]
n.考虑，思考；体贴
823. consist[k2n'sist]
vi.由…组成；在于
824. consistent[k2n'sist2nt]
a.坚持的，一贯的
825. constant['k0nst2nt]
a.经常的；永恒的
826. constitution[k0nsti'tju:62n]
n.章程；体质；构造
827. construct[k2n'str3kt]
vt.建造；建设；构筑
828. construction[k2n'str3k62n]
n.建造；建筑；建筑物
829. consult[k2n's3lt]
vt.请教，查阅
830. consume[k2n'sju:m]
vt.消耗，消费；消灭
831. consumption[k2n's3mp62n]
n.消耗量；消耗
832. contact['k0nt9kt. k2n't9kt]
vt.使接触；与…联系
833. contain[k2n'tein]
vt.包含，容纳；等于
834. container[k2n'tein2]
n.容器；集装箱
835. contemporary[k2n'temp2r2ri]
a.当代的，同时代的
836. contempt[k2n'tempt]
n.轻蔑；藐视；受辱
837. content['k0ntent. k2n'tent]
n.内容，目录；容量
838. content['k0ntent. k2n'tent]
a.满意的，满足的
839. contest[k2n'test. 'k0ntest]
vt.争夺，争取；辩驳
840. continent['k0ntin2nt]
n.大陆；陆地；洲
841. continual[k2n'tinju2l]
a.不断的；连续的
842. continue[k2n'tinju(:)]
vt.继续，连续；延伸
843. continuous[k2n'tinju2s]
a.连续不断的，持续的
844. contract['k0ntr9kt. k2n'tr9kt]
n.契约，合同；婚约
845. contradiction[k0ntr2'dik62n]
n.矛盾，不一致；否认
846. contrary['k0ntr2ri]
a.相反的 n.相反
847. contrast['k0ntr9st. k2n'tr9st]
n.对比，对照，悬殊
848. contribute[k2n'tribju(:)t]
vt.捐献，捐助；投稿
849. control[k2n'tr2ul]
vt.控制，克制 n.控制
850. convenience[k2n'vi:nj2ns]
n.便利，方便；厕所
851. convenient[k2n'vi:nj2nt]
a.便利的；近便的
852. convention[k2n'ven62n]
n.习俗，惯例；公约
853. conventional[k2n'ven62nl]
a.普通的；习惯的
854. conversation[k0nv2'sei62n]
n.会话，非正式会谈
855. conversely['k0nv2:sli]
ad.相反地
856. conversion[k2n'v2:62n]
n.转变，转化；改变
857. convert[k2n'v2:t. 'k0nv2:t]
vt.使转变；使改变
858. convey[k2n'vei]
vt.传送；运送；传播
859. convince[k2n'vins]
vt.使确信，使信服
860. cook[kuk]
vt.烹调，煮 vt.烧菜
861. cool[ku:l]
a.凉的，冷静的
862. cooperate[k2u'0p2reit]
vi.合作，协作；配合
863. coordinate[k2u'0dinit]
vt.使协调，调节
864. cope[k2up]
vi.对付，应付
865. copper['k0p2]
n.铜；铜币，铜制器
866. copy['k0pi]
n.抄件 vt.抄写，复制
867. cord[k0:d]
n.细绳，粗线，索
868. cordial['k0:dj2l]
a.真诚的，诚恳的
869. core[k0:]
n.果实的心，核心
870. corn[k0:n]
n.谷物；(英)小麦
871. corner['k0:n2]
n.角；犄角；边远地区
872. corporation[k0:p2'rei62n]
n.公司，企业；社团
873. correct[k2'rekt]
a.正确的 vt.纠正
874. correction[k2'rek62n]
n.改正，纠正，修改
875. correspond[k0ris'p0nd]
vi.相符合；相当
876. correspondent[k0ris'p0nd2nt]
n.通信者；通讯员
877. corresponding[k0ris'p0ndi8]
a.相应的；符合的
878. corridor['k0rid0:]
n.走廊，回廊，通路
879. cost[k0st]
n.价格，代价；成本
880. costly['k0stli]
a.昂贵的；价值高的
881. cottage['k0tid7]
n.村舍，小屋
882. cotton['k0tn]
n.棉；棉线；棉布
883. cough[k0f]
vi.咳，咳嗽 n.咳嗽
884. could[kud. k2d]
aux.v.(can的过去式)
885. council['kaunsil]
n.理事会，委员会
886. count[kaunt]
vt.计算 vi.数，计数
887. counter['kaunt2]
n.柜台；计数器
888. country['k3ntri]
n.国家，国土；农村
889. countryside['k3ntrisaid]
n.乡下，农村
890. county['kaunti]
n.英国的郡，美国的县
891. couple['k3pl]
n.夫妇；(一)对；几个
892. courage['k3rid7]
n.勇气，胆量，胆识
893. course[k0:s]
n.课程；过程；一道菜
894. court[k0:t]
n.法院，法庭；庭院
895. cousin['k3zn]
n.堂(或表)兄弟(姐妹)
896. cover['k3v2]
vt.盖，包括 n.盖子
897. cow[kau]
n.母牛，奶牛；母兽
898. coward['kau2d]
n.懦夫；胆怯者
899. crack[kr9k]
n.裂缝，裂纹 vi.爆裂
900. craft[kra:ft]
n.工艺；手艺，行业
901. crane[krein]
n.起重机，摄影升降机
902. crash[kr96]
vi.碰撞，坠落 n.碰撞
903. crawl[kr0:l]
vi.爬，爬行
904. crazy['kreizi]
a.疯狂的，荒唐的
905. cream[kri:m]
n.奶油，乳脂；奶油色
906. create[kri(:)'eit]
vt.创造；引起，产生
907. creative[kri(:)'eitiv]
a.创造性的，创作的
908. creature['kri:t62]
n.生物，动物，家畜
909. credit['kredit]
n.信用贷款；信用
910. creep[kri:p]
vi.爬行；缓慢地行进
911. crew[kru:]
n.全体船员
912. cricket['krikit]
n.板球；蟋蟀
913. crime[kraim]
n.罪，罪行；犯罪
914. criminal['kriminl]
n.犯人，罪犯，刑事犯
915. cripple['kripl]
n.跛子；残废的人
916. crisis['kraisis]
n.危机；存亡之际
917. critic['kritik]
n.批评家，爱挑剔的人
918. critical['kritik2l]
a.决定性的；批评的
919. criticism['kritisiz2m]
n.批评；批判；评论
920. criticize['kritisaiz]
vt.批评；评论；非难
921. crop[kr0p]
n.农作物，庄稼；一熟
922. cross[kr0s]
vt.穿过；使交叉
923. crow[kr2u]
n.鸦，乌鸦 vi.啼
924. crowd[kraud]
n.群；大众；一伙人
925. crown[kraun]
n.王冠，冕；花冠
926. crude[kru:d]
a.简陋的；天然的
927. cruel['kru2l]
a.残忍的，残酷的
928. crush[kr36]
vt.压碎，碾碎；镇压
929. crust[kr3st]
n.面包皮；硬外皮
930. cry[krai]
vi.哭，哭泣；叫喊
931. crystal['kristl]
n.水晶，结晶体；晶粒
932. cube[kju:b]
n.立方形；立方
933. cubic['kju:bik]
a.立方形的；立方的
934. cucumber['kju:k3mb2]
n.黄瓜
935. cultivate['k3ltiveit]
vt.耕；种植；培养
936. culture['k3lt62]
n.文化，文明；教养
937. cunning['k3ni8]
a.狡猾的，狡诈的
938. cup[k3p]
n.杯子；(一)杯；奖杯
939. cupboard['k3b2d]
n.碗柜，碗碟橱；食橱
940. cure[kju2]
vt.医治；消除 n.治愈
941. curiosity[kju2ri'0siti]
n.好奇，好奇心；珍品
942. curious['kju2ri2s]
a.好奇的；稀奇古怪的
943. curl[k2:l]
n.卷毛；螺旋 vi.卷曲
944. current['k3r2nt]
a.当前的；通用的
945. curse[k2:s]
n.诅咒，咒骂；天谴
946. curtain['k2:tn]
n.帘，窗帘；幕(布)
947. curve[k2:v]
n.曲线；弯 vt.弄弯
948. cushion['ku62n]
n.垫子，坐垫，靠垫
949. custom['k3st2m]
n.习惯，风俗；海关
950. customer['k3st2m2]
n.顾客，主顾
951. cut[k3t]
vt.切，割，剪；减少
952. cycle['saikl]
n自行车，循环
953. daily['deili]
a.每日的 n.日报
954. dairy['d/2ri]
n.牛奶场；乳制品
955. dam[d9m]
n.水坝，水堤；障碍物
956. damage['d9mid7]
vt.损害，毁坏 n.损害
957. damp[d9mp]
a.潮湿的，有湿气的
958. dance[da:ns]
vi.跳舞；摇晃 n.舞
959. danger['deind72]
n.危险；危险事物
960. dangerous['deind7r2s]
a.危险的，不安全的
961. dare[d/2]
vt.&aux.v.敢；竟敢
962. daring['d/2ri8]
a.大胆的，勇敢的
963. dark[da:k]
a.暗的；黑色的
964. darling['da:li8]
n.亲爱的人；宠儿
965. dash[d96]
vt.使猛撞；溅 n.猛冲
966. data['deit2]
n.数据; 资料
967. date['deit]
n.日期 vt.注…日期
968. daughter['d0:t2]
n.女儿
969. dawn[d0:n]
n.黎明；开端 vi.破晓
970. day[dei]
n.(一)天，白昼，白天
971. daylight['deilait]
n.白昼，日光；黎明
972. dead[ded]
a.死的，无生命的
973. deadly['dedli]
a.致命的，死一般的
974. deaf[def]
a.聋的；不愿听的
975. deal[di:l]
n.买卖；待遇 vt.给予
976. dear[di2]
a.亲爱的 int.啊
977. death[de4]
n.死，死亡；灭亡
978. debate[di'beit]
n.&vi.争论，辩论
979. debt[det]
n.债，债务，欠债
980. decade['dekeid]
n.十年，十年期
981. decay[di'kei]
vi.腐烂；衰败 n.腐烂
982. deceit[di'si:t]
n.欺骗，欺诈
983. deceive[di'si:v]
vt.欺骗，蒙蔽，行骗
984. December[di'semb2]
n.十二月
985. decent['di:snt]
a.正派的；体面的
986. decide[di'said]
vt.决定，决心；解决
987. decision[di'si72n]
n.决定，决心；果断
988. deck[dek]
n.甲板；舱面；层面
989. declare[di'kl/2]
vt.断言；声明；表明
990. decorate['dek2reit]
vt.装饰，装璜，修饰
991. decrease[di'kri:s. 'di:kri:s]
vi.&n.减少，减少
992. deduce[di'dju:s]
vt.演绎，推论，推断
993. deed[di:d]
n.行为；功绩；契约
994. deep[di:p]
a.深的；纵深的
995. deepen['di:p2n]
vt.加深 vi.深化
996. deer[di2]
n.鹿
997. defeat[di'fi:t]
vt.战胜，击败；挫败
998. defect[di'fekt]
n.缺点，缺陷，欠缺
999. defence[di'fens]
n.防御；防务；辩护
1000. defend[di'fend]
vt.保卫，防守
1001. define[di'fain]
vt.给…下定义；限定
1002. definite['definit]
a.明确的；肯定的
1003. definitely['definitli]
ad.一定地，明确地
1004. definition[defi'ni62n]
n.定义，释义；定界
1005. degree[di'gri:]
n.程度；度；学位
1006. delay[di'lei]
vt.推迟；耽搁；延误
1007. delete[di'li:t]
vt.删除；擦掉
1008. delegation[deli'gei62n]
n.代表团
1009. delicate['delikit]
a.纤细的；易碎的
1010. delicious[di'li62s]
a.美味的，怡人的
1011. delight[di'lait]
n.快乐 vt.使高兴
1012. deliver[di'liv2]
vt.投递，送交；发表
1013. delivery[di'liv2ri]
n.投递；交付；分娩
1014. demand[di'ma:nd]
vt.要求；需要；询问
1015. democracy[di'm0kr2si]
n.民主，民主制
1016. democratic[dem2'kr9tik]
a.民主的，民主政体的
1017. demonstrate['dem2nstreit]
vt.说明；论证；表露
1018. dense[dens]
a.密集的；浓厚的
1019. density['densiti]
n.密集，稠密；密度
1020. deny[di'nai]
vt.否定；拒绝相信
1021. depart[di'pa:t]
vi.离开，起程；出发
1022. department[di'pa:tm2nt]
n.部，司，局，处，系
1023. departure[di'pa:t62]
n.离开，出发，起程
1024. depend[di'pend]
vi.依靠，依赖；相信
1025. dependent[di'pend2nt]
a.依靠的，依赖的
1026. deposit[di'p0zit]
vt.使沉淀；存放
1027. depress[di'pres]
vt.使沮丧；按下
1028. depth[dep4]
n.深度；深厚；深处
1029. derive[di'raiv]
vt.取得 vi.起源
1030. descend[di'send]
vi.下来，下降；下倾
1031. describe[dis'kraib]
vt.形容；描写，描绘
1032. description[dis'krip62n]
n.描写，形容；种类
1033. desert['dez2t. di'z2:t]
n.沙漠 vt.离弃；擅离
1034. deserve[di'z2:v]
vt.应受，值得
1035. design[di'zain]
vt.设计 n.设计；图样
1036. desirable[di'zai2r2bl]
a.值得相望的；可取的
1037. desire[di'zai2]
vt.相望；要求 n.愿望
1038. desk[desk]
n.书桌，办公桌
1039. despair[dis'p/2]
n.绝望 vi.绝望
1040. desperate['desp2rit]
a.拼死的；绝望的
1041. despise[dis'paiz]
vt.鄙视，蔑视
1042. despite[dis'pait]
prep.不管，不顾
1043. destination[desti'nei62n]
n.目的地，终点；目标
1044. destroy[dis'tr0i]
vt.破坏；消灭；打破
1045. destruction[dis'tr3k62n]
n.破坏，毁灭，消灭
1046. detail['di:teil]
n.细节；枝节；零件
1047. detect[di'tekt]
vt.察觉，发觉；侦察
1048. detection[di'tek62n]
n.察觉，发觉；侦察
1049. determination[dit2:mi'nei62n]
n.决心；决定；确定
1050. determine[di't2:min]
vt.决定；查明；决心
1051. develop[di'vel2p]
vt.发展；形成；开发
1052. development[di'vel2pm2nt]
n.发展；开发；生长
1053. device[di'vais]
n.器械，装置；设计
1054. devil['devl]
n.魔鬼，恶魔
1055. devise[di'vaiz]
vt.设计，发明
1056. devote[di'v2ut]
vt.将…奉献，致力于
1057. dew[dju:]
n.露，露水
1058. diagram['dai2gr9m]
n.图解，图表，简图
1059. dial['dai2l]
n.钟面；拨号盘 vt.拨
1060. dialect['dai2lekt]
n.方言，土语，地方话
1061. dialog['dai2l0g]
n.对话，对白
1062. diameter[dai'9mit2]
n.直径
1063. diamond['dai2m2nd]
n.金钢石，钻石；菱形
1064. diary['dai2ri]
n.日记，日记簿
1065. dictate[dik'teit]
vt.&vi.口授；命令
1066. dictation[dik'tei62n]
n.口授笔录，听写
1067. dictionary['dik62n2ri]
n.词典，字典
1068. die[dai]
vi.死，死亡；灭亡
1069. differ['dif2]
vi.不同，相异
1070. difference['difr2ns]
n.差别；差；分歧
1071. different['difr2nt]
a.差异的；各种的
1072. difficult['difik2lt]
a.困难的；难对付的
1073. difficulty['difik2lti]
a.困难；难事；困境
1074. dig[dig]
vt.掘，挖；采掘
1075. digest[di'd7est. 'daid7est]
vt.消化；领会 n.文摘
1076. digital['did7itl]
a.数字的，计数的
1077. diligent['dilid72nt]
a.勤勉的，勤奋的
1078. dim[dim]
a.昏暗的；朦胧的
1079. dimension[di'men62n]
n.尺寸，尺度；面积
1080. dinner['din2]
n.正餐，主餐；宴会
1081. dip[dip]
vt.浸，蘸 vi.浸一浸
1082. direct[di'rekt]
a.直接的；直率的
1083. direction[di'rek62n]
n.方向，方位；指导
1084. directly[di'rektli]
ad.直接地；立即
1085. director[di'rekt2]
n.指导者；理事；导演
1086. dirt[d2:t]
n.尘，土；污物，污垢
1087. dirty['d2:ti]
a.脏的；下流的
1088. disable[dis'eibl]
vt.使无能，使伤残
1089. disadvantage[dis2d'va:ntid7]
n.不利，不利地位
1090. disagree[dis2'gri:]
vi.有分歧；不一致
1091. disappear[dis2'pi2]
vi.不见，失踪；消失
1092. disappoint[dis2'p0int]
vt.使失望，使受挫折
1093. disaster[di'za:st2]
n.灾难，灾祸；天灾
1094. disk[disk]
n.圆盘，唱片；磁盘
1095. discard[dis'ka:d]
vt.丢弃，抛弃，遗弃
1096. discharge[dis't6a:d7]
vt.释放；排出 n.释放
1097. discipline['disiplin]
n.纪律；训练 vt.训练
1098. disclose[dis'kl2uz]
vt.揭开，揭发；透露
1099. discourage[dis'k3rid7]
vt.使泄气，使灰心
1100. discover[dis'k3v2]
vt.发现；暴露，显示
1101. discovery[dis'k3v2ri]
n.发现；被发现的事物
1102. discuss[dis'k3s]
vt.讨论，谈论；论述
1103. discussion[dis'k362n]
n.讨论，谈论；论述
1104. disease[di'zi:z]
n.病，疾病；病害
1105. disguise[dis'gaiz]
vi.隐瞒，掩埋 n.假装
1106. disgust[dis'g3st]
n.厌恶，憎恶
1107. dish[di6]
n.碟，盘子；菜肴
1108. dishonour[dis'0n2]
n.不光彩；丢脸的人
1109. dislike[dis'laik]
vt.&n.不喜爱，厌恶
1110. dismiss[dis'mis]
vt.不再考虑；解雇
1111. disorder[dis'0:d2]
n.混乱，杂乱；骚乱
1112. display[dis'plei]
vt.陈列，展览；显示
1113. disposal[dis'p2uz2l]
n.丢掉，处理，销毁
1114. dispose[dis'p2uz]
vi.去掉，丢掉；销毁
1115. displease[dis'pli:z]
vt.使不愉快，使生气
1116. dispute[dis'pju:t]
vi.争论，争执 n.争论
1117. dissatisfy[dis's9tisfai]
vi.使不满，使不平
1118. dissolve[di'z0lv]
vt.使溶解；解散
1119. distance['dist2ns]
n.距离，间距；远处
1120. distant['dist2nt]
a.在远处的，疏远的
1121. distinct[dis'ti8kt]
a.与其他不同的
1122. distinction[dis'ti8k62n]
n.差别，不同，区分
1123. distinguish[dis'ti8gwi6]
vt.区别，辨别，认别
1124. distress[dis'tres]
n.忧虑，悲伤；不幸
1125. distribute[dis'tribju:t]
vt.分发，分送；分布
1126. distribution[distri'bju:62n]
n.分发，分配；分布
1127. district['distrikt]
n.区；地区，区域
1128. disturb[dis't2:b]
vt.打扰，扰乱；弄乱
1129. ditch[dit6]
n.沟，沟渠，渠道
1130. dive[daiv]
vi.跳水；潜水；俯冲
1131. diverse[dai'v2:s]
a.不一样的，相异的
1132. divide[di'vaid]
vt.分；分配；分开
1133. division[di'vi72n]
n.分，分配；除法
1134. divorce[di'v0:s]
n.离婚，离异 vi.离婚
1135. do[du:. du]
aux.v. vt.做，干，办
1136. dock[d0k]
n.船坞；码头；船厂
1137. doctor['d0kt2]
n.医生，医师；博士
1138. document['d0kjum2nt]
n.公文，文件；证件
1139. dog[d0g]
n.狗，犬，犬科动物
1140. dollar['d0l2]
n.元(货币单位)
1141. domestic[d2'mestik]
a.本国的；家庭的
1142. donkey['d08ki]
n.驴；笨蛋
1143. door[d0:]
n.门，通道；一家
1144. dorm[d0:m]
n.宿舍
1145. dormitory['d0:mitri]
n.集体寝室；宿舍
1146. dose[d2us]
n.剂量，用量；一剂
1147. dot[d0t]
n.点，圆点 vt.打点于
1148. double['d3bl]
a.两倍的；双的
1149. doubt[daut]
n.怀疑；疑虑 vt.怀疑
1150. doubtful['dautful]
a.难以预测的；怀疑的
1151. doubtless['dautlis]
ad.无疑地；很可能
1152. down[daun]
ad.向下，在下面
1153. downstairs['daun'st/2z]
ad.在楼下 a.楼下的
1154. downward['daunw2d]
a.向下的 ad.向下地
1155. dozen['d3zn]
n.一打，十二个
1156. draft[dra:ft]
n.草稿；汇票 vt.起草
1157. drag[dr9g]
vt.拖，拉；拖曳
1158. dragon['dr9g2n]
n.龙；凶暴的人
1159. drain[drein]
vt.排去；放水 n.耗竭
1160. drama['dra:m2]
n.一出戏剧，剧本
1161. dramatic[dr2'm9tik]
a.引人注目的，戏剧的
1162. draw[dr0:]
vt.画，划；拖；拨出
1163. drawer[dr0:]
n.抽屉
1164. drawing['dr0:i8]
n.图画，素描；绘图
1165. dread[dred]
n.畏惧；恐怖 vt.惧怕
1166. dream[dri:m]
n.梦；梦想 vi.做梦
1167. dress[dres]
n.女服，童装；服装
1168. drift[drift]
vi.漂流，漂泊 n.漂流
1169. drill[dril]
n.钻头；操练 vi.钻孔
1170. drink[dri8k]
vt.饮 vi.喝 n.饮料
1171. drip[drip]
vi.滴下；漏水 n.水滴
1172. drive[draiv]
vt.驾驶；打入；驱
1173. driver['draiv2]
n.驾驶员，司机
1174. drop[dr0p]
vt.使落下；降低
1175. drought[draut]
n.旱灾，干旱
1176. drown[draun]
vi.淹死，溺死
1177. drug[dr3g]
n.药，药物，药材
1178. drum[dr3m]
n.鼓；鼓状物，圆桶
1179. drunk[dr38k]
a.醉的；陶醉的
1180. dry[drai]
a.干的，干燥的
1181. duck[d3k]
n.鸭，雌鸭；鸭肉
1182. due[dju:]
a.预期的；应给的
1183. dull[d3l]
a.枯燥的；不鲜明的
1184. dumb[d3m]
a.哑的；无言的
1185. dump[d3mp]
vt.倾卸，倾倒；倾销
1186. durable['dju2r2bl]
a.耐久的，耐用的
1187. duration[dju2'rei62n]
n.持续，持久
1188. during['dju2ri8]
prep.在…期间
1189. dusk[d3sk]
n.薄暮，黄昏，幽暗
1190. dust[d3st]
n.尘土，灰尘
1191. duty['dju:ti]
n.职责；责任；税
1192. dwelling['dweli8]
n.住处，寓所
1193. dye[dai]
vt.染 n.染料；染色
1194. dying['daii8]
a.垂死的；临终的
1195. dynamic[dai'n9mik]
a.有活力的；动力的
1196. each[i:t6]
pron.各，各自 a.各
1197. eager['i:g2]
a.渴望的，热切的
1198. eagle['i:gl]
n.鹰
1199. ear[i2]
n.耳朵；听力，听觉
1200. early['2:li]
ad.早 a.早的，早期的
1201. earn[2:n]
vt.赚得，挣得；获得
1202. earnest['2:nist]
a.认真的，诚恳的
1203. earth[2:4]
n.地球；陆地，地面
1204. earthquake['2:4kweik]
n.地震；大震荡
1205. ease[i:z]
n.容易，舒适 vt.缓和
1206. easily['i:zili]
ad.容易地；舒适的
1207. east[i:st]
n.东；东部 ad.在东方
1208. eastern['i:st2n]
a.东方的；朝东的
1209. easy['i:zi]
a.容易的；安逸的
1210. eat[i:t]
vt.吃，喝 vi.吃饭
1211. echo['ek2u]
n.回声，反响 vi.重复
1212. economic[i:k2'n0mik]
a.经济的，经济学的
1213. economical[i:k2'n0mik2l]
a.节约的；经济学的
1214. economy[i(:)'k0n2mi]
n.经济；节约，节省
1215. edge[ed7]
n.边缘，边；刀口
1216. edition[i'di62n]
n.版，版本，版次
1217. editor['edit2]
n.编辑，编者，校订者
1218. educate['edju(:)keit]
vt.教育；培养；训练
1219. education[edju:'kei62n]
n.教育；训导；教育学
1220. effect[i'fekt]
n.结果；效果，效力
1221. effective[i'fektiv]
a.有效的；有影响的
1222. efficiency[i'fi62nsi]
n.效率；功效，效能
1223. efficient[i'fi62nt]
a.效率高的，有能力的
1224. effort['ef2t]
n.努力；努力的成果
1225. egg[eg]
n.蛋，鸡蛋，卵
1226. eight[eit]
num.八，八个，第八
1227. eighteen['ei'ti:n]
num.十八，十八个
1228. eighth[eit4]
num.第八 n.八分之一
1229. eighty['eiti]
num.八十，八十个
1230. either['ai52. 'i:52]
pron.(两者)任何一个
1231. elaborate[i'l9b2rit]
a.复杂的；精心制作的
1232. elastic[i'l9stik]
n.松紧带 a.有弹性的
1233. elbow['elb2u]
n.肘，肘部；弯管
1234. elder['eld2]
a.年龄较大的 n.长者
1235. elect[i'lekt]
vt.选举，推选；选择
1236. election[i'lek62n]
n.选举，选择权；当选
1237. electric[i'lektrik]
a.电的，电动的
1238. electrical[i'lektrik2l]
a.电的，电气科学的
1239. electricity[ilek'trisiti]
n.电，电学；电流
1240. electron[i'lektr0n]
n.电子
1241. electronic[ilek'tr0nik]
a.电子的
1242. electronics[ilek'tr0niks]
n.电子学
1243. element['elim2nt]
n.成分；要素；元素
1244. elementary[eli'ment2ri]
a.基本的；初级的
1245. elephant['elif2nt]
n.象
1246. elevator['eliveit2]
n.电梯；升降机
1247. eleven[i'levn]
num.十一，十一个
1248. eleventh[i'levn4]
num.第十一(个)
1249. eliminate[i'limineit]
vt.消灭，消除，排除
1250. elimination[ilimi'nei62n]
n.消灭，排除，消除
1251. else[els]
ad.其它，另外 a.别的
1252. elsewhere[els'w/2]
ad.在别处，向别处
1253. embarrass[im'b9r2s]
vt.使窘迫，使为难
1254. embrace[im'breis]
vt.拥抱；包括；包围
1255. emerge[i'm2:d7]
vi.出现，涌现；冒出
1256. emergency[i'm2:d72nsi]
n.紧急情况，突然事件
1257. emit[i'mit]
vt.散发；发射；发表
1258. emotion[i'm2u62n]
n.情感，感情；激动
1259. emotional[i'm2u62nl]
a.感情的，情绪的
1260. emperor['emp2r2]
n.皇帝
1261. emphasis['emf2sis]
n.强调，重点，重要性
1262. emphasize['emf2saiz]
vt.强调，着重
1263. empire['empai2]
n.帝国
1264. employ[im'pl0i]
vi.雇用；用；使忙于
1265. employee[empl0i'i:]
n.受雇者，雇员，雇工
1266. employer[im'pl0i2]
n.雇佣者，雇主
1267. employment[im'pl0im2nt]
n.工业；雇用；使用
1268. empty['empti]
a.空的；空洞的
1269. enable[i'neibl]
vt.使能够，使可能
1270. enclose[in'kl2uz]
vt.围住，圈起；附上
1271. encounter[in'kaunt2]
vt.遭遇，遇到 n.遭遇
1272. encourage[in'k3rid7]
vt.鼓励，支持，助长
1273. end[end]
n.末端；目标 vt.结束
1274. ending['endi8]
n.结尾，结局；死亡
1275. endless['endlis]
a.无止境的
1276. endure[in'dju2]
vt.忍受；容忍
1277. enemy['enimi]
n.敌人；仇敌；敌兵
1278. energy['en2d7i]
n.活力；精力；能
1279. enforce[in'f0:s]
vt.实施，执行；强制
1280. engage[in'geid7]
vt.使从事于；聘用
1281. engine['end7in]
n.发动机，引擎；机车
1282. engineer[end7i'ni2]
n.工程师，技师
1283. engineering[end7i'ni2ri8]
n.工程，工程学
1284. England['i8gl2nd]
n.英格兰；英国
1285. English['i8gli6]
n.英语 a.英国人的
1286. Englishman['i8gli6m2n]
n.英国男子
1287. enjoy[in'd70i]
vt.享受；欣赏，喜爱
1288. enlarge[in'la:d7]
vt.扩大，扩展；放大
1289. enormous[i'n0:m2s]
a.巨大的，庞大的
1290. enough[i'n3f]
a.足够的 ad.足够地
1291. ensure[in'6u2]
vt.保证；保护；赋予
1292. enter['ent2]
vt.走进，进入；参加
1293. entertain[ent2'tein]
vt.使欢乐；招待
1294. enthusiasm[in'4ju:zi9z2m]
n.热情，热心，热忱
1295. enthusiastic[in4ju:zi'9stik]
a.热情的，热心的
1296. entire[in'tai2]
a.全部的，整个的
1297. entitle[in'taitl]
vt.给…权利(或资格)
1298. entrance['entr2ns]
n.入口，门口；进入
1299. entry['entri]
n.入口处；登记；进入
1300. envelope['env2l2up]
n.信封；封套；封皮
1301. environment[in'vai2r2nm2nt]
n.环境，外界；围绕
1302. envy['envi]
vt.&n.妒忌；羡慕
1303. equal['i:kw2l]
a.相等的；平等的
1304. equality[i(:)'kw0liti]
n.等同，平等；相等
1305. equation[i'kwei62n]
n.方程(式)；等式
1306. equip[i'kwip]
vt.装备，配备
1307. equipment[i'kwipm2nt]
n.装备，设备，配备
1308. equivalent[i'kwiv2l2nt]
a.相等的；等量的
1309. era['i2r2]
n.时代，年代；纪元
1310. erect[i'rekt]
vt.建造；使竖立
1311. error['er2]
n.错误，谬误；差错
1312. escape[is'keip]
vi.逃跑；逸出 n.逃跑
1313. especially[is'pe62li]
ad.特别，尤其，格外
1314. essay['esei]
n.短文，散文，小品文
1315. essential[i'sen62l]
a.必要的，本质的
1316. establish[is't9bli6]
vt.建立，设立；确立
1317. establishment[is't9bli6m2nt]
n.建立，设立，确立
1318. estimate['estimit. 'estimeit]
vt.估计，评价 n.估计
1319. Europe['ju2r2p]
n.欧洲
1320. European[ju2r2'pi:2n]
a.欧洲的 n.欧洲人
1321. evaluate[i'v9ljueit]
vt.评价，估…的价
1322. evaporate[i'v9p2reit]
vt.使蒸发 vi.蒸发
1323. eve[i:v]
n.前夜，前夕，前一刻
1324. even['i:v2n]
ad.甚至；甚至更，还
1325. even['i:v2n]
a.均匀的；平的
1326. evening['i:vni8]
n.傍晚，黄昏，晚上
1327. event[i'vent]
n.事件，大事；事变
1328. eventually[i'ventju2li]
ad.终于；最后
1329. ever['ev2]
ad.在任何时候；曾经
1330. every['evri]
a.每一的；每隔…的
1331. everybody['evrib0di]
pron.每人，人人
1332. everyday['evridei]
a.每天的，日常的
1333. everyone['evriw3n]
pron.每人，人人
1334. everything['evri4i8]
pron.每件事，事事
1335. everywhere['evriw/2]
ad.到处，处处
1336. evidence['evid2ns]
n.根据；证据，证人
1337. evident['evid2nt]
a.明显的，明白的
1338. evil['i:vl]
n.邪恶；祸害 a.坏的
1339. evolution[i:v2'lju:62n]
n.进化，演化；发展
1340. evolve[i'v0lv]
vt.使进化；使发展
1341. exact[ig'z9kt]
a.确切的；精确的
1342. exactly[ig'z9ktli]
ad.确切地；恰恰正是
1343. exaggerate[ig'z9d72reit]
vt.&vi.夸大，夸张
1344. exam[ig'z9m]
n.考试；检查，细查
1345. examination[igz9mi'nei62n]
n.考试；检查，细查
1346. examine[ig'z9min]
vt.检查，仔细观察
1347. example[ig'za:mpl]
n.例子，实例；模范
1348. exceed[ik'si:d]
vt.超过，胜过；超出
1349. exceedingly[ik'si:di8li]
ad.极端地，非常
1350. excellent['eks2l2nt]
a.优秀的，杰出的
1351. except[ik'sept]
prep.除…之外
1352. exception[ik'sep62n]
n.例外，除外
1353. excess[ik'ses. 'ekses]
n.超越；过量；过度
1354. excessive[ik'sesiv]
a.过多的，极度的
1355. exchange[iks't6eind7]
vt.交换；交流 n.交换
1356. excite[ik'sait]
vt.使激动；引起
1357. exciting[ik'saiti8]
a.令人兴奋的
1358. exclaim[iks'kleim]
vi.呼喊；惊叫
1359. exclude[iks'klu:d]
vt.把…排除在外
1360. exclusively[iks'klu:sivli]
ad.专门地
1361. excursion[iks'k2:62n]
n.远足；短途旅行
1362. excuse[iks'kju:z. iks'kju:s]
vt.原谅；免除 n.借口
1363. execute['eksikju:t]
vt.将…处死；实施
1364. executive[ig'zekjutiv]
a.执行的 n.执行者
1365. exercise['eks2saiz]
n.锻炼，训练 vi.练习
1366. exert[ig'z2:t]
vt.尽(力)，运用
1367. exhaust[ig'z0:st]
vt.使筋疲力尽；用尽
1368. exhibit[ig'zibit]
vt.显示；陈列，展览
1369. exhibition[eksi'bi62n]
n.展览，陈列；展览会
1370. exist[ig'zist]
vi.存在；生存，生活
1371. existence[ig'zist2ns]
n.存在，实在；生存
1372. exit['eksit]
n.出口；退场 vi.退出
1373. expand[iks'p9nd]
vt.扩大；使膨胀
1374. expansion[iks'p9n62n]
n.扩大，扩充；扩张
1375. expect[iks'pekt]
vt.预料，预期；等待
1376. expectation[ekspek'tei62n]
n.期待，期望，预期
1377. expense[iks'pens]
n.花费，消费；费用
1378. expensive[iks'pensiv]
a.昂贵的，花钱多的
1379. experience[iks'pi2ri2ns]
n.经验，感受；经历
1380. experiment[iks'perim2nt]
n.实验；试验
1381. experimental[iksperi'mentl]
a.实验的，试验的
1382. expert['eksp2:t]
n.专家 a.熟练的
1383. explain[iks'plein]
vt.解释；为…辩解
1384. explanation[ekspl2'nei62n]
n.解释，说明；辩解
1385. explode[iks'pl2ud]
vt.使爆炸 vi.爆炸
1386. exploit['ekspl0it. iks'pl0it]
vt.剥削；利用；开拓
1387. explore[iks'pl0:]
vt.&vi.探险，探索
1388. explosion[iks'pl2u72n]
n.爆炸，爆发，炸裂
1389. explosive[iks'pl2usiv]
n.炸药 a.爆炸的
1390. export[eks'p0:t. 'eksp0:t]
vt.输出，出口；运走
1391. expose[iks'p2uz]
vt.使暴露；揭露
1392. exposure[iks'p2u72]
n.暴露；揭露；曝光
1393. express[iks'pres]
vt.表示 n.快车，快递
1394. expression[iks'pre62n]
n.词句；表达；表情
1395. extend[iks'tend]
vt.延长；扩大；致
1396. extension[iks'ten62n]
n.延长部分；伸展
1397. extensive[iks'tensiv]
a.广阔的；广泛的
1398. extent[iks'tent]
n.广度；范围；程度
1399. exterior[eks'ti2ri2]
a.外部的；对外的
1400. external[eks't2:nl]
a.外部的，外面的
1401. extra['ekstr2]
a.额外的 ad.特别地
1402. extraordinary[iks'tr0:din2ri]
a.非同寻常的，特别的
1403. extreme[iks'tri:m]
a.极度的；尽头的
1404. extremely[iks'tri:mli]
ad.极端，极其，非常
1405. eye[ai]
n.眼睛；眼力；鉴赏力
1406. eyesight['aisait]
n.视力，目力
1407. fable['feibl]
n.寓言；虚构的故事
1408. fabric['f9brik]
n.织物，纺织品；结构
1409. face[feis]
n.脸；表面；外表
1410. facility[f2'siliti]
n.设备；容易；便利
1411. fact[f9kt]
n.事实；实际，实情
1412. factor['f9kt2]
n.因素；因子，系数
1413. factory['f9kt2ri]
n.工厂，制造厂
1414. faculty['f9k2lti]
n.才能，能力；系，科
1415. fade[feid]
vi.褪色；逐渐消失
1416. Fahrenheit['f9r2nhait]
n.华氏温度计
1417. fail[feil]
vi.失败；失灵；不能
1418. failure['feilj2]
n.失败；失败的人
1419. faint[feint]
a.微弱的；虚弱的
1420. fair[f/2]
a.公平的；相当的
1421. fair[f/2]
n.定期集市；博览会
1422. fairly['f/2li]
ad.相当；公平地
1423. faith[fei4]
n.信任，信心；信仰
1424. faithful['fei4ful]
a.忠诚的；如实的
1425. fall[f0:l]
vi.落下；跌倒；陷落
1426. false[f0:ls]
a.不真实的；伪造的
1427. fame[feim]
n.名声，名望
1428. familiar[f2'milj2]
a.熟悉的；冒昧的
1429. family['f9mili]
n.家，家庭；家族
1430. famine['f9min]
n.饥荒；严重的缺乏
1431. famous['feim2s]
a.著名的，出名的
1432. fan[f9n]
n.(运动等)狂热爱好者
1433. fan[f9n]
n.扇子，风扇 vt.扇
1434. fancy['f9nsi]
n.想象力；设想；爱好
1435. far[fa:]
a.远的 ad.远，遥远
1436. fare[f/2]
n.车费，船费，票价
1437. farewell['f/2'wel]
int.再会 n.告别
1438. farm[fa:m]
n.农场，农庄；饲养场
1439. farmer['fa:m2]
n.农民，农夫；农场主
1440. farther['fa:52]
ad.更远地 a.更远的
1441. fashion['f962n]
n.样子，方式；风尚
1442. fashionable['f962n2bl]
a.流行的，时髦的
1443. fast[fa:st]
a.快的；偏快的 ad.快
1444. fasten['fa:sn]
vt.扎牢，扣住
1445. fatal['feitl]
a.致命的；命运的
1446. fate[feit]
n.命运，天数
1447. father['fa:52]
n.父亲；神父；创始人
1448. father-in-law['fa:52inl0:]
n.岳父；公公
1449. fatigue[f2'ti:g]
n.疲劳，劳累
1450. fault[f0:lt]
n.缺点；过失；故障
1451. faulty['f0:lti]
a.有错误的，有缺点的
1452. favour['feiv2]
n.好感；赞同；恩惠
1453. favourable['feiv2r2bl]
a.有利的；赞成的
1454. favourite['feiv2rit]
a.特别受喜爱的
1455. fear[fi2]
n.害怕；担心 vt.害怕
1456. fearful['fi2ful]
a.害怕的，可怕的
1457. feasible['fi:z2bl]
a.可行的；可能的
1458. feast[fi:st]
n.盛宴，筵席；节日
1459. feather['fe52]
n.羽毛；翎毛；羽状物
1460. feature['fi:t62]
n.特征，特色；面貌
1461. February['febru2ri]
n.二月
1462. federal['fed2r2l]
a.联邦的；联盟的
1463. fee[fi:]
n.费，酬金；赏金
1464. feeble['fi:bl]
a.虚弱的；微弱的
1465. feed[fi:d]
vt.喂(养) vi.吃饲料
1466. feedback['fi:db9k]
n.回授，反馈，反应
1467. feel[fi:l]
vi.有知觉 vt.触，摸
1468. feeling['fi:li8]
n.感情；感觉，知觉
1469. fellow['fel2u]
n.人，家伙；伙伴
1470. female['fi:meil]
n.雌性的动物；女子
1471. fence[fens]
n.栅栏
1472. fertile['f2:tail]
a.肥沃的；多产的
1473. fertilizer['f2:tilaiz2]
n.肥料
1474. festival['fest2v2l]
n.节日；音乐节
1475. fetch[fet6]
vt.拿来；请来，接去
1476. fever['fi:v2]
n.发热，发烧；狂热
1477. few[fju:]
a.很少的；少数的
1478. fibre['faib2]
n.纤维，纤维质
1479. fiction['fik62n]
n.小说；虚构，杜撰
1480. field[fi:ld]
n.田野；田；运动场
1481. fierce[fi2s]
a.凶猛的，狂热的
1482. fifteen['fif'ti:n]
num.十五；十五个
1483. fifth[fif4]
num.第五 n.五分之一
1484. fifty['fifti]
num.五十，五十个
1485. fight[fait]
vi.打(仗)；斗争
1486. figure['fig2]
n.数字；外形；人物
1487. file[fail]
n.档案 vt.把…归档
1488. fill[fil]
vt.装满，盛满；占满
1489. film[film]
n.影片；胶卷；薄层
1490. filter['filt2]
vt.过滤 n.滤纸
1491. final['fainl]
a.最后的；决定性的
1492. finally['fain2li]
ad.最后；不可更改的
1493. finance[fai'n9ns. fi-]
n.财政，金融；财源
1494. financial[fai'n9n62l. fi-]
a.财政的，金融的
1495. find[faind]
vt.找到；发觉；找出
1496. finding[faindi8]
n.发现；调查的结果
1497. fine[fain]
a.美好的；纤细的
1498. fine[fain]
n.罚金，罚款
1499. finger['fi8g2]
n.手指；指状物
1500. finish['fini6]
vt.完成，结束 n.结束
1501. fire['fai2]
n.火；火灾 vi.开火
1502. fireman['fai2m2n]
n.消防队员；司炉工
1503. firm[f2:m]
n.商行，商号，公司
1504. first[f2:st]
num.第一 ad.最初
1505. fish[fi6]
n.鱼，鱼肉 vi.钓鱼
1506. fisherman['fi62m2n]
n.渔民，渔夫，打鱼人
1507. fist[fist]
n.拳(头)
1508. fit[fit]
vt.适合；安装vi.适合
1509. five[faiv]
num.五，五个，第五
1510. fix[fiks]
vt.使固定；决定
1511. flag[fl9g]
n.旗，旗帜；旗舰旗
1512. flame[fleim]
n.火焰；光辉；热情
1513. flare[fl/2]
vi.闪耀 vt.使闪亮
1514. flash[fl96]
n.闪光 vi.闪，闪烁
1515. flat[fl9t]
a.平的，扁平的
1516. flat[fl9t]
n.一套房间；单元住宅
1517. flavour['fleiv2]
n.味，味道；风味
1518. fleet[fli:t]
n.舰队；船队，机群
1519. flesh[fle6]
n.肉，肌肉；肉体
1520. flexible['fleks2bl]
a.易弯曲的；灵活的
1521. flight[flait]
n.航班；飞行；逃跑
1522. float[fl2ut]
vi.漂浮 vt.使漂浮
1523. flock[fl0k]
n.羊群，群；大量
1524. flood[fl3d]
n.洪水 vt.淹没
1525. floor[fl0:]
n.地板；楼层
1526. flour['flau2]
n.面粉，粉；粉状物质
1527. flourish['fl3ri6]
vi.繁荣，茂盛，兴旺
1528. flow[fl2u]
vi.流动；飘垂；涨潮
1529. flower['flau2]
n.花，花卉；开花
1530. flu[flu:]
n.流行性感冒
1531. fluent['flu(:)2nt]
a.流利的，流畅的
1532. fluid['flu(:)id]
n.流体，液体
1533. flush[fl36]
vi.奔流；(脸)发红
1534. fly[flai]
n.蝇，苍蝇 vi.飞行
1535. focus['f2uk2s]
vi.聚焦，注视 n.焦点
1536. fog[f0g]
n.雾；烟雾，尘雾
1537. fold[f2uld]
vt.折叠；合拢 n.褶
1538. folk[f2ulk]
n.人们，家属，亲属
1539. follow['f0l2u]
vt.跟随；结果是
1540. following['f0l2ui8]
a.接着的；下列的
1541. fond[f0nd]
a.喜爱的；溺爱的
1542. food[fu:d]
n.食物，食品，养料
1543. fool[fu:l]
n.蠢人，傻子 vt.欺骗
1544. foolish['fu:li6]
a.愚蠢的；鲁莽的
1545. foot[fut]
n.脚；最下部；英尺
1546. football['futb0:l]
n.足球比赛；足球
1547. footstep['futstep]
n.脚步；脚步声；足迹
1548. for[f0:. f2]
prep.为；给；因为
1549. forbid[f2'bid]
vt.禁止，不许；阻止
1550. force[f0:s]
vt.强迫 n.力，力量
1551. forecast['f0:ka:st]
n.预测，预报 vt.预示
1552. forehead['f0rid. 'f0:hed]
n.额头，前部
1553. foreign['f0rin]
a.外国的；外来的
1554. foreigner['f0rin2]
n.外国人
1555. foremost['f0:m2ust]
a.最初的；第一流的
1556. forest['f0rist]
n.森林；森林地带
1557. forever[f2'rev2]
ad.永远，总是，老是
1558. forget[f2'get]
vt.忘记，遗忘
1559. forgive[f2'giv]
vt.原谅，饶恕，宽恕
1560. fork[f0:k]
n.餐叉；叉；分叉
1561. form[f0:m]
n.形式；形状 vt.形成
1562. formal['f0:m2l]
a.正式的；礼仪上的
1563. formation[f0:'mei62n]
n.形成；构成；形成物
1564. former['f0:m2]
a.在前的 n.前者
1565. formula['f0:mjul2]
n.公式，式
1566. forth[f0:4]
ad.向前；向外，往外
1567. fortnight['f0:tnait]
n.两星期，十四天
1568. fortunate['f0:t62nit]
a.幸运的，侥幸的
1569. fortunately['f0:t62nitli]
ad.幸运地，幸亏
1570. fortune['f0:t62n]
n.命运，运气；财产
1571. forty['f0:ti]
num.四十，第四十
1572. forward['f0:w2d]
ad.向前；今后，往后
1573. found[faund]
vt.创立，创办；建立
1574. foundation[faun'dei62n]
n.基础；地基；基金
1575. fountain['fauntin]
n.泉水，喷泉；源泉
1576. four[f0:]
num.四，四个，第四
1577. fourteen['f0:'ti:n]
num.十四，第十四
1578. fourth[f0:4]
num.第四，四分之一
1579. fox[f0ks]
n.狐狸；狡猾的人
1580. fraction['fr9k62n]
n.小部分；片断；分数
1581. fragment['fr9gm2nt]
n.碎片，破片，碎块
1582. frame[freim]
n.框架，框子；构架
1583. framework['freimw2:k]
n.框架，构架，结构
1584. France['fra:ns]
n.法国，法兰西
1585. frank[fr98k]
a.坦白的，直率的
1586. free[fri:]
a.自由的；空闲的
1587. freedom['fri:d2m]
n.自由；自主
1588. freely['fri:li]
ad.自由地；直率地
1589. freeze[fri:z]
vi.冻；结冻vt.使结冰
1590. freight[freit]
n.货运；货物；运费
1591. French[frent6]
a.法国的 n.法国人
1592. frequency['fri:kw2nsi]
n.屡次；次数；频率
1593. frequent['fri:kw2nt]
a.时常发生的；经常的
1594. frequently['fri:kw2ntli]
ad.时常，常常
1595. fresh[fre6]
a.新的；新鲜的
1596. friction['frik62n]
n.摩擦，摩擦力
1597. Friday['fraidi]
n.星期五
1598. fridge[frid7]
n.电冰箱
1599. friend[frend]
n.朋友，友人
1600. friendly['frendli]
a.友好的，友谊的
1601. friendship['frend6ip]
n.友谊，友好
1602. frighten['fraitn]
vt.使惊恐，吓唬
1603. frog[fr0g]
n.蛙
1604. from[fr0m. fr2m. frm]
prep.从…来；离开
1605. front[fr3nt]
a.前面的 n.前部
1606. frontier['fr3ntj2]
n.边境；边疆；新领域
1607. frost[fr0st]
n.冰冻，严寒；霜
1608. frown[fraun]
vi.皱眉，蹙额
1609. fruit[fru:t]
n.水果；果实；成果
1610. fruitful['fru:tful]
a.多产的；肥沃的
1611. fry[frai]
vt.油煎，油炸，油炒
1612. fuel[fju2l]
n.燃料 vt.给…加燃料
1613. fulfil[ful'fil]
vt.履行；满足；完成
1614. full[ful]
a.满的；完全的
1615. fun[f3n]
n.乐趣，娱乐；玩笑
1616. function['f38k62n]
n.功能；职务；函数
1617. fund[f3nd]
n.资金；基金；存款
1618. fundamental[f3nd2'mentl]
a.基础的，基本的
1619. funeral['fju:n2r2l]
n.葬礼，丧礼，丧葬
1620. funny['f3ni]
a.古怪的；滑稽的
1621. fur[f2:]
n.软毛；毛皮，裘皮
1622. furious['fju2ri2s]
a.狂怒的；狂暴的
1623. furnace['f2:nis]
n.炉子，熔炉；鼓风炉
1624. furnish['f2:ni6]
vt.供应，提供；装备
1625. furniture['f2:nit62]
n.家具；装置，设备
1626. further['f2:52]
ad.更远地 a.更远的
1627. furthermore['f2:52'm0:]
ad.而且，此外
1628. future['fju:t62]
n.将来，未来；前途
1629. gain[gein]
vt.获得；增加 n.增进
1630. gallery['g9l2ri]
n.长廊，游廊；画廊
1631. gallon['g9l2n]
n.加仑
1632. game[geim]
n.游戏；比赛；猎物
1633. gang[g98]
n.一帮，一伙
1634. gap[g9p]
n.缺口；间隔；差距
1635. garage['g9ra:7]
n.车库；加油站
1636. garbage['ga:bid7]
n.垃圾，污物，废料
1637. garden['ga:dn]
n.花园，菜园；公园
1638. gardener['ga:dn2]
n.园丁，花匠
1639. gas[g9s]
n.煤气；气体；汽油
1640. gaseous['geizj2s]
a.气体的，气态的
1641. gasoline['g9s2li:n]
n.(美)汽油
1642. gasp[ga:sp]
vi.气喘，喘息
1643. gate[geit]
n.大门；篱笆门
1644. gather['g952]
vi.聚集；集合vt.收集
1645. gauge[geid7]
vt.量，测量 n.量器
1646. gay[gei]
a.快乐的；鲜明的
1647. gaze[geiz]
vi.凝视，盯，注视
1648. general['d7en2r2l]
a.总的；一般的n.将军
1649. generally['d7en2r2li]
ad.一般地；通常地
1650. generate['d7en2reit]
vt.发生；引起；生殖
1651. generation[d7en2'rei62n]
n.一代，一代人；产生
1652. generator['d7en2reit2]
n.发电机；发生者
1653. generous['d7en2r2s]
a.慷慨的；宽厚的
1654. genius['d7i:nj2s]
n.天才，天赋，天资
1655. gentle['d7entl]
a.和蔼的；轻柔的
1656. gentleman['d7entlm2n]
n.绅士；有教养的人
1657. gently['d7entli]
ad.有礼貌地；柔和地
1658. genuine['d7enjuin]
a.真的；真正的
1659. geography[d7i'0gr2fi]
n.地理，地理学
1660. geometry[d7i'0mitri]
n.几何，几何学
1661. germ[d72:m]
n.微生物，细菌，幼芽
1662. German['d72:m2n]
a.德国的 n.德国人
1663. Germany['d72:m2ni]
n.德意志，德国
1664. gesture['d7est62]
n.姿势，手势；姿态
1665. get[get]
vi.变得，成为；到达
1666. ghost[g2ust]
n.鬼，灵魂；鬼魂
1667. giant['d7ai2nt]
n.巨人；巨物
1668. gift[gift]
n.礼物，赠品；天赋
1669. girl[g2:l]
n.女孩子，姑娘；女儿
1670. give[giv]
vt.做，作；送给
1671. glad[gl9d]
a.高兴的；乐意的
1672. glance[gla:ns]
vi.看一下 n.一瞥
1673. glare[gl/2]
vi.瞪眼 n.瞪眼
1674. glass[gla:s]
n.玻璃；玻璃杯
1675. glide[glaid]
vi.滑动；消逝 n.滑行
1676. glimpse[glimps]
vt.瞥见 n.一瞥，一看
1677. glitter['glit2]
vi.闪闪发光 n.闪光
1678. globe[gl2ub]
n.地球，世界；地界仪
1679. gloomy['glu:mi]
a.黑暗的；令人沮丧的
1680. glorious['gl0:ri2s]
a.光荣的；壮丽的
1681. glory['gl0:ri]
n.光荣；荣誉的事
1682. glove[gl3v]
n.手套
1683. glow[gl2u]
n.白热光 vi.发白热光
1684. glue[glu:]
n.胶，胶水 vt.胶合
1685. go[g2u]
vi.去；走；变为
1686. goal[g2ul]
n.球门；得分；目的
1687. goat[g2ut]
n.山羊
1688. God[g0d]
n.神，神像；上帝
1689. gold[g2uld]
n.金；钱财 a.金制的
1690. golden['g2uld2n]
a.金色的；极好的
1691. golf[g0lf]
n.高尔夫球
1692. good[gud]
a.好的；有本事的
1693. goodbye[]
int.再见，再会
1694. goodness['gudnis]
n.优良，德性，仁慈
1695. goods[gudz]
n.货物，商品
1696. goose[gu:s]
n.鹅，雌鹅
1697. govern['g3v2n]
vt.统治，治理；支配
1698. government['g3v2nm2nt]
n.政府；治理；政治
1699. governor['g3v2n2]
n.州长；主管人员
1700. gown['gaun]
n.长袍，长外衣
1701. grace[greis]
n.优美，文雅；雅致
1702. graceful['greisful]
a.优美的，优雅的
1703. gracious['grei62s]
a.有礼貌的；仁慈的
1704. grade[greid]
vt.给…分等级 n.等级
1705. gradual['gr9dju2l]
a.逐渐的；渐进的
1706. gradually['gr9dju2li]
ad.逐渐地，逐步地
1707. graduate['gr9djueit]
n.毕业生 vi.大学毕业
1708. grain['grein]
n.谷物，谷粒；颗粒
1709. gramme[gr9m]
n.克(重量单位)
1710. grammar['gr9m2]
n.语法；语法书
1711. grammatical[gr2'm9tik2l]
a.语法上的
1712. grand[gr9nd]
a.宏伟的；重大的
1713. granddaughter['gr9ndd0:t2]
n.孙女，外孙女
1714. grandfather['gr9ndfa:52]
n.祖父；外祖父
1715. grandmother['gr9ndm352]
n.祖母，外祖母
1716. grandson['gr9nds3n]
n.孙子，外孙子
1717. grant[gra:nt]
n.授给物 vt.授予
1718. grape[greip]
n.葡萄；葡萄藤
1719. graph[gr9f]
n.(曲线)图，图表
1720. grasp[gra:sp]
vt.抓紧；掌握 n.抓
1721. grass[gra:s]
n.草；牧草；草地
1722. grateful['greitful]
a.感激的；令人愉快的
1723. gratitude['gr9titju:d]
a.感激，感谢，感恩
1724. grave[greiv]
n.坟墓 a.严重的
1725. gravity['gr9viti]
n.重力，引力；严重性
1726. gray[grei]
a.灰色的 n.灰色
1727. great[greit]
a.大的；伟大的
1728. greatly['greitli]
ad.大大地，非常
1729. greedy['gri:di]
a.贪吃的；贪婪的
1730. Greek[gri:k]
a.希腊的 n.希腊人
1731. green[gri:n]
a.绿色的 n.绿色
1732. greenhouse['gri:nhaus]
n.温室，玻璃暖房
1733. greet[gri:t]
vt.问候，招呼；反应
1734. greeting['gri:ti8]
n.问候，招呼，致敬
1735. grey[grei]
a.灰色的 n.灰色
1736. grieve[gri:v]
vt.使悲痛 vi.悲痛
1737. grind[graind]
vt.磨(碎)；磨快
1738. grip[grip]
vt.握紧，抓牢 n.紧握
1739. groan[gr2un]
vi.哼，呻吟 n.呻吟
1740. grocer['gr2us2]
n.食品商；杂货商
1741. grocery['gr2us2ri]
n.食品杂货店
1742. gross[gr2us]
a.总的；严重的
1743. ground[graund]
n.地；场地；根据
1744. group[gru:p]
n.小组，群 vi.聚集
1745. grow[gr2u]
vi.生长；变得；增长
1746. growth[gr2u4]
n.增长；增长量；生长
1747. guarantee[g9r2n'ti:]
n.保证；担保物
1748. guard[ga:d]
vt.守卫；看守 n.卫兵
1749. guess[ges]
vt.&vi.&n.猜测，推测
1750. guest[gest]
n.客人，宾客；旅客
1751. guidance['gaid2ns]
n.引导，指导，领导
1752. guide[gaid]
n.导游者 vt.给…导游
1753. guilty['gilti]
a.内疚的；有罪的
1754. gulf[g3lf]
n.海湾
1755. gum[g3m]
n.口香糖；树胶
1756. gun[g3n]
n.枪，炮，手枪
1757. gunpowder['g3npaud2]
n.黑色火药；有烟火药
1758. gymnasium[d7im'neizj2m]
n.体育馆，健身房
1759. habit['h9bit]
n.习惯；习性
1760. habitual[h2'bit6u2l]
a.习惯性的，惯常的
1761. hair[h/2]
n.头发，毛发；毛
1762. haircut['h/2k3t]
n.理发
1763. half[ha:f]
n.半，一半 a.一半的
1764. hall[h0:l]
n.门厅；过道；会堂
1765. halt[h0:lt]
vi.停止；立定 n.停住
1766. hamburger['h9mb2:g2]
n.汉堡包，牛肉饼
1767. hammer['h9m2]
n.锤，榔头 vt.锤击
1768. hand[h9nd]
n.手；人手；指针
1769. handful[h9ndful]
n.一把；少数，一小撮
1770. handkerchief['h98k2t6if]
n.手帕
1771. handle['h9ndl]
n.柄，把手 vt.拿，触
1772. handsome['h9nds2m]
a.英俊的；相当大的
1773. handwriting['h9ndraiti8]
n.笔迹，手迹，书法
1774. handy['h9ndi]
a.手边的；便于使用的
1775. hang[h98]
vt.挂，悬；吊死
1776. happen['h9p2n]
vi.发生；碰巧，恰好
1777. happiness['h9pinis]
n.幸福，幸运；快乐
1778. happy['h9pi]
a.快乐的；幸福的
1779. harbour['ha:b2]
n.海港，港口 vt.庇护
1780. hard['ha:d]
a.硬的；困难的
1781. harden['ha:dn]
vt.使变硬 vi.变硬
1782. hardly['ha:dli]
ad.几乎不，简直不
1783. hardship['ha:d6ip]
n.艰难，困苦
1784. hardware['ha:dw/2]
n.五金器具；硬件
1785. hare[h/2]
n.野兔
1786. harm[ha:m]
n.伤害，损害 vt.损害
1787. harmful['ha:mful]
a.有害的
1788. harmony['ha:m2ni]
n.调合，协调，和谐
1789. harness['ha:nis]
vt.治理 n.马具，挽具
1790. harsh[ha:6]
a.严厉的；刺耳的
1791. harvest['ha:vist]
n.收获，收成 vt.收割
1792. haste[heist]
n.急速，急忙；草率
1793. hasten['heisn]
vt.催促 vi.赶紧
1794. hasty['heisti]
a.急速的；仓促的
1795. hat[h9t]
n.帽子(一般指有边的)
1796. hatch[h9t6]
vt.孵出 vi.(蛋)孵化
1797. hate[heit]
vt.恨，憎恨；不喜欢
1798. hateful['heitful]
a.可恨的，可恶的
1799. hatred['heitrid]
n.憎恶，憎恨，仇恨
1800. have[h9v. h2v]
v.aux.已经 vt.有；吃
1801. hawk[h0:k]
n.鹰，隼
1802. hay[hei]
n.干草
1803. hazard['h9z2d]
n.危险；公害
1804. he[hi:]
pron.(主格)他
1805. head[hed]
n.头；上端 vt.率领
1806. headache['hedeik]
n.头痛；头痛的事
1807. heading['hedi8]
n.标题，题词，题名
1808. headline['hedlain]
n.大字标题；新闻提要
1809. headmaster['hed'ma:st2]
n.校长
1810. headquarters['hed'kw0:t2z]
n.司令部；总部
1811. heal[hi:l]
vt.治愈；使和解
1812. health[hel4]
n.健康，健康状况
1813. healthy['hel4i]
a.健康的；有益健康的
1814. heap[hi:p]
n.(一)堆；大量
1815. hear[hi2]
vt.听见；审讯；听说
1816. heart[ha:t]
n.心，内心；勇气
1817. heat[hi:t]
n.热，炎热 vi.变热
1818. heating['hi:ti8]
n.加热，供暖
1819. heaven['hevn]
n.天堂；天，天空
1820. heavily['hevili]
ad.重重地；大量地
1821. heavy['hevi]
a.重的；大的；充满的
1822. hedge[hed7]
n.篱笆，树篱；障碍物
1823. heel[hi:l]
n.脚后跟，踵，后跟
1824. height[hait]
n.高，高度；高处
1825. heir[/2]
n.后嗣，继承人
1826. helicopter['helik0pt2]
n.直升机
1827. hell[hel]
n.地狱；极大的痛苦
1828. hello['h2'l2u]
int.喂
1829. helmet['helmit]
n.头盔，钢盔
1830. help[help]
vt.帮助；援助 n.帮手
1831. helpful['helpful]
a.给予帮助的；有用的
1832. helpless['helplis]
a.无助的；无能的
1833. hen[hen]
n.母鸡，雌禽
1834. hence[hens]
ad.因此，所以；今后
1835. her[h2:. h2]
pron.(宾格)她；她的
1836. herd[h2:d]
n.兽群，牧群 vt.放牧
1837. here[hi2]
ad.这里；向这里
1838. hero['hi2r2u]
n.男主角；英雄；勇士
1839. heroic[hi'r2uik]
a.英雄的；英勇的
1840. heroine['her2uin]
n.女主角；女英雄
1841. hers[h2:z]
pron.她的(所有物)
1842. herself[h2:'self]
pron.她自己；她亲自
1843. hesitate['heziteit]
vi.犹豫，踌躇；含糊
1844. hi[hai]
ini.嗨(表示问候等)
1845. hide[haid]
vt.把…藏起来；隐瞒
1846. high[hai]
a.高的；高级的 ad.高
1847. highly['haili]
ad.高度地，很，非常
1848. highway['haiwei]
n.公路；大路
1849. hill[hil]
n.小山，山岗；丘陵
1850. hillside['hil'said]
n.(小山)山腰，山坡
1851. him[him]
pron.(宾格)他
1852. himself[him'self]
pron.他自己；他亲自
1853. hint[hint]
n.暗示，示意；建议
1854. hire['hai2]
vt.租借 n.租用，雇用
1855. his[his]
pron.他的，他的东西
1856. historical[his't0rik2l]
a.历史的，有关历史的
1857. history['hist2ri]
n.历史；个人经历
1858. hit[hit]
vt.打；碰撞 n.击
1859. hobby['h0bi]
n.业余爱好，癖好
1860. hold[h2uld]
vt.拿住；掌握；拥有
1861. hole[h2ul]
n.洞；孔眼，裂开处
1862. holiday['h0l2di]
n.假日，节日；假期
1863. hollow['h0l2u]
a.空的；空洞的
1864. holy['h2uli]
a.神圣的；圣洁的
1865. home[h2um]
n.家；家乡 a.家庭的
1866. honest['0nist]
a.诚实的；可敬的
1867. honesty['0nisti]
n.诚实，正直
1868. honey['h3ni]
n.蜜，蜂蜜；甜，甜蜜
1869. honeymoon['h3nimu:n]
n.蜜月
1870. honour['0n2]
n.光荣；尊敬，敬意
1871. honourable['0n2r2bl]
a.诚实的；光荣的
1872. hook[huk]
n.钩，挂钩 vt.钩住
1873. hope[h2up]
n.&vt.&vi.希望
1874. hopeful['h2upful]
a.有希望的
1875. hopeless['h2uplis]
a.没有希望的，绝望的
1876. horizon[h2'raizn]
n.地平线；眼界，见识
1877. horizontal[h0ri'z0ntl]
a.地平的；水平的
1878. horn[h0:n]
n.号角；警报器；角
1879. horror['h0r2]
n.恐怖；战栗；憎恶
1880. horse[h0:s]
n.马；马科动物
1881. horsepower['h0:spau2]
n.马力
1882. hospital['h0spitl]
n.医院
1883. host[h2ust]
n.主人；东道主
1884. hostess['h2ustis]
n.女主人；空姐
1885. hostile['h0stail]
a.敌方的；不友善的
1886. hot[h0t]
a.热的；刺激的；辣的
1887. hotel[h2u'tel]
n.旅馆
1888. hour['au2]
n.小时；时间，时刻
1889. house[haus]
n.房屋，住宅；商号
1890. household['haush2uld]
n.家庭，户；家务
1891. housewife['hauswaif]
n.家庭主妇
1892. how[hau]
ad.怎么；怎样；多少
1893. however[hau'ev2]
ad.然而；不管怎样
1894. huge[hju:d7]
a.巨大的，庞大的
1895. human['hju:m2n]
a.人的，人类的 n.人
1896. humble['h3mbl]
a.谦逊的；地位低下的
1897. humid['hju:mid]
a.湿的，湿气重的
1898. humorous['hju:m2r2s]
a.富于幽默的，诙谐的
1899. humour['hju:m2]
n.幽默，诙谐，幽默感
1900. hundred['h3ndrid]
num.百，百个 n.许多
1901. hunger['h38g2]
n.饿，饥饿；渴望
1902. hungry['h38gri]
a.饥饿的；渴望的
1903. hunt[h3nt]
n.打猎；搜寻 vt.追猎
1904. hurry['h3ri]
vi.赶紧 vt.催促
1905. hurt[h2:t]
vt.使受伤；使痛心
1906. husband['h3zb2nd]
n.丈夫
1907. hut[h3t]
n.小屋，棚屋
1908. hydrogen['haidrid72n]
n.氢
1909. I[ai]
pron.(主格)我
1910. ice[ais]
n.冰，冰块 vt.冰镇
1911. ice-cream['ais'kri:m]
n.冰淇淋
1912. idea[ai'di2]
n.想法；思想；意见
1913. ideal[ai'di2l]
a.理想的；观念的
1914. identical[ai'dentik2l]
a.完全相同的；同一的
1915. identify[ai'dentifai]
vt.认出，识别，鉴定
1916. idiom['idi2m]
n.习语，成语
1917. idle['aidl]
a.空闲的；懒散的
1918. i.e.['ai'i:](=that is)
那就是，即
1919. if[if]
conj.假如，如果
1920. ignorant['ign2r2nt]
a.不知道的；无知的
1921. ignore[ig'n0:]
vt.不顾，不理，忽视
1922. ill[il]
a.有病的；坏的 ad.坏
1923. illegal[i'li:g2l]
a.不合法的，非法的
1924. illness['ilnis]
n.病，疾病
1925. illustrate['il2streit]
vt.(用图等)说明
1926. illustration[il2s'trei62n]
n.说明，图解；例证
1927. image['imid7]
n.像；形象；映象
1928. imaginary[i'm9d7in2ri]
a.想象中的，假想的
1929. imagination[im9d7i'nei62n]
n.想象；想象力；空想
1930. imagine[i'm9d7in]
vt.想象，设想；料想
1931. imitate['imiteit]
vt.模仿，仿效；仿制
1932. immediate[i'mi:dj2t]
a.立即的；直接的
1933. immediately[i'mi:dj2tli]
ad.立即；直接地
1934. immense[i'mens]
a.巨大的；极好的
1935. immigrant['imigr2nt]
n.移民 a.移民的
1936. impact['imp9kt]
n.影响，作用；冲击
1937. impatient[im'pei62nt]
a.不耐烦的，急躁的
1938. implication[impli'kei62n]
n.含义，暗示，暗指
1939. imply[im'plai]
vt.暗示，意指
1940. import[im'p0:t 'imp0:t]
vt.&n.输入，进口
1941. importance[im'p0:t2ns]
n.重要；重要性
1942. important[im'p0:t2nt]
a.重要的；有势力的
1943. impose[im'p2uz]
vt.把…强加；征(税)
1944. impossible[im'p0s2bl]
a.不可能的，办不到的
1945. impress[im'pres. 'impres]
vt.给…深刻印象
1946. impression[im'pre62n]
n.印；印象；印记
1947. impressive[im'presiv]
a.给人印象深刻的
1948. imprison[im'prizn]
vt.关押，监禁；限制
1949. improve[im'pru:v]
vt.使更好 vi.改善
1950. improvement[im'pru:vm2nt]
n.改进，改善；改进处
1951. in[in]
prep.在…里ad.进，入
1952. inch[int6]
n.英寸
1953. incident['insid2nt]
n.发生的事；事件
1954. incline[in'klain]
n.斜坡 vt.使倾斜
1955. include[in'klu:d]
vt.包括，包含
1956. income['ink3m]
n.收入；收益；进款
1957. incorrect[ink2'rekt]
a.不正确的，错误的
1958. increase[in'kri:s. 'inkri:s]
vt.&vi.&n.增加
1959. increasingly[in'kri:si8li]
ad.日益，越来越多地
1960. indeed[in'di:d]
ad.真正地；确实
1961. indefinite[in'definit]
a.不明确的；不定的
1962. independence[indi'pend2ns]
n.独立，自主，自立
1963. independent[indi'pend2nt]
a.独立的；自主的
1964. index['indeks]
n.索引；指数；指标
1965. India['indi2]
n.印度
1966. Indian['indi2n]
a.印度的 n.印度人
1967. indicate['indikeit]
vt.标示，表示；表明
1968. indication[indi'kei62n]
n.指示；表示；表明
1969. indifferent[in'difr2nt]
a.冷漠的；不积极的
1970. indignant[in'dign2nt]
a.愤慨的，义愤的
1971. indirect[indi'rekt]
a.间接的；不坦率的
1972. indispensable[indis'pens2bl]
a.必不可少的，必需的
1973. individual[indi'vidju2l]
a.个别的；独特的
1974. indoors[in'd0:z]
ad.在室内，在屋里
1975. industrial[in'd3stri2l]
a.工业的；产业的
1976. industrialize[in'd3stri2laiz]
vt.使工业化
1977. industry['ind2stri]
n.工业，产业；勤劳
1978. inefficient[ini'fi62nt]
a.效率低的，无能的
1979. inevitable[in'evit2bl]
a.不可避免的，必然的
1980. inexpensive[iniks'pensiv]
a.花费不多的，廉价的
1981. infant['inf2nt]
n.婴儿 a.婴儿的
1982. infect[in'fekt]
vt.传染；感染
1983. infer[in'f2:]
vt.推论，推断；猜想
1984. inferior[in'fi2ri2]
a.下等的；劣等的
1985. infinite['infinit]
a.无限的；无数的
1986. influence['influ2ns]
n.影响；势力 vt.影响
1987. influential[influ'en62l]
a.有影响的；有权势的
1988. inform[in'f0:m]
vt.通知，向…报告
1989. information[inf2'mei62n]
n.消息，信息；通知
1990. inhabit[in'h9bit]
vt.居住于，栖息于
1991. inhabitant[in'h9bit2nt]
n.居民，住户
1992. inherit[in'herit]
vt.继承(传统等)
1993. initial[i'ni62l]
a.最初的；词首的
1994. injection[in'd7ek62n]
n.注射，注入；充满
1995. injure['ind72]
vt.伤害，损害，损伤
1996. injury['ind72ri]
n.损害，伤害；受伤处
1997. ink[i8k]
n.墨水，油墨
1998. inn[in]
n.小旅店；小酒店
1999. inner['in2]
a.内部的；内心的
2000. innocent['in2snt]
a.清白的，幼稚的
2001. input['input]
n.输入；投入的资金
2002. inquire[in'kwai2]
vt.打听，询问；调查
2003. inquiry[in'kwai2ri]
n.询问，打听；调查
2004. insect['insekt]
n.昆虫，虫
2005. insert[in's2:t. 'ins2:t]
vt.插入; 嵌入; 登载
2006. inside[in'said]
prep.在…里面 n.内部
2007. insist[in'sist]
vi.坚持；坚持要求
2008. inspect[in'spekt]
vt.检查，审查；检阅
2009. inspection[in'spek62n]
n.检查，审查；检阅
2010. inspire[in'spai2]
vt.鼓舞；给…以灵感
2011. install[in'st0:l]
vt.安装，设置
2012. installation[inst2'lei62n]
n.安装；装置；设施
2013. instance['inst2ns]
n.例子，实例，事例
2014. instant['inst2nt]
n.瞬间 a.立即的
2015. instantly['inst2ntli]
ad.立即，即刻
2016. instead[in'sted]
ad.代替，顶替；反而
2017. instinct['insti8kt]
n.本能；直觉；生性
2018. institute['institju:t]
n.研究所；学院
2019. institution[insti'tju:62n]
n.协会；制度，习俗
2020. instruct[in'str3kt]
vt.教；指示；通知
2021. instruction[in'str3k62n]
n.命令；教学；教训
2022. instrument['instrum2nt]
n.仪器；工具；乐器
2023. insufficient[ins2'fi62nt]
a.不足的；不适当的
2024. insult['ins3lt. in's3lt]
vt.&n.侮辱，凌辱
2025. insurance[in'6u2r2ns]
n.保险；保险费
2026. insure[in'6u2]
vt.给…保险；确保
2027. intellectual[inti'lektju2l]
n.知识分子 a.智力的
2028. intelligence[in'telid72ns]
n.智力；理解力；情报
2029. intelligent[in'telid72nt]
a.聪明的；理智的
2030. intend[in'tend]
vt.想要，打算；意指
2031. intense[in'tens]
a.强烈的；紧张的
2032. intensity[in'tensiti]
n.强烈，剧烈；强度
2033. intensive[in'tensiv]
a.加强的；精耕细作的
2034. intention[in'ten62n]
n.意图，意向，目的
2035. intentional[in'ten62nl]
a.故意的，有意识的
2036. interaction[int2'r9k62n]
n.相互作用；干扰
2037. interest['intrist]
n.兴趣；利益；利息
2038. interesting['intristi8]
a.有趣的，引人入胜的
2039. interfere[int2'fi2]
vi.干涉，干预；妨碍
2040. interference[int2'fi2r2ns]
n.干涉，干预；阻碍
2041. interior[in'ti2ri2]
a.内的；内地的n.内部
2042. intermediate[int2'mi:dj2t]
a.中间的；中级的
2043. internal[in't2:nl]
a.内的；国内的
2044. international[int2(:)'n962nl]
a.国际的，世界(性)的
2045. interpret[in't2:prit]
vt.解释，说明；口译
2046. interpretation[int2:pri'tei62n]
n.解释；口译
2047. interpreter[in't2:prit2]
n.译员，口译者
2048. interrupt[int2'r3pt]
vt.打断，打扰；中止
2049. interruption[int2'r3p62n]
n.中断，打断；障碍物
2050. interval['int2v2l]
n.间隔；休息；间距
2051. interview['int2vju:]
n.接见；会见；面谈
2052. intimate['intimit]
a.亲密的；个人的
2053. into['intu. 'int2]
prep.进，入；进入到
2054. introduce['intr2'dju:s]
vt.介绍；引进，传入
2055. introduction[intr2'd3k62n]
n.介绍；引进；引言
2056. invade[in'veid]
vt.入侵，侵略；侵袭
2057. invasion[in'vei72n]
n.入侵，侵略；侵犯
2058. invent[in'vent]
vt.发明，创造；捏造
2059. invention[in'ven62n]
n.发明，创造；捏造
2060. inventor[in'vent2]
n.发明者；发明家
2061. invest[in'vest]
vt.投资；投入
2062. investigate[in'vestigeit]
vt.&vi.调查
2063. investigation[investi'gei62n]
n.调查，调查研究
2064. investment[in'vestm2nt]
n.投资，投资额，投入
2065. invisible[in'viz2bl]
a.看不见的，无形的
2066. invitation[invi'tei62n]
n.邀请，招待；请柬
2067. invite[in'vait]
vt.邀请，聘请；招待
2068. involve[in'v0lv]
vt.使卷入；牵涉
2069. inward['inw2d]
a.里面的 ad.向内
2070. iron['ai2n]
n.铁；烙铁 vt.烫(衣)
2071. irregular[i'regjul2]
a.不规则的；不整齐的
2072. island['ail2nd]
n.岛，岛屿
2073. isolate['ais2leit]
vt.使隔离，使孤立
2074. issue['i6u:]
n.问题；发行 vt.发行
2075. it[it]
pron.这，那，它
2076. Italian[i't9lj2n]
a.意大利的n.意大利人
2077. item['ait2m]
n.条，条款；一条
2078. its[its]
pron.它的
2079. itself[it'self]
pron.它自己；自身
2080. jacket['d79kit]
n.短上衣，茄克衫
2081. jail[d7eil]
n.监狱 vi.监禁
2082. jam[d79m]
n.果酱
2083. jam[d79m]
vt.使塞满；使堵塞
2084. January['d79nju2ri]
n.一月
2085. Japan[d72'p9n]
n.日本，日本国
2086. Japanese[d79p2'ni:z]
a.日本的 n.日本人
2087. jar[d7a:]
n.罐子，坛子，广口瓶
2088. jaw[d70:]
n.颌，颚
2089. jazz[d79z]
n.爵士音乐，爵士舞曲
2090. jealous['d7el2s]
a.妒忌的；猜疑的
2091. jet[d7et]
n.喷气式飞机；喷嘴
2092. jewel['d7u:2l]
n.宝石；宝石饰物
2093. jewish['d7u(:)i6]
a.犹太人的
2094. job[d70b]
n.职业；工作；零活
2095. join[d70in]
vt.参加；连接
2096. joint[d70int]
n.接头，接缝；关节
2097. joke[d72uk]
n.笑话 vi.说笑话
2098. jolly['d70li]
a.快活的；令人高兴的
2099. journal['d72:nl]
n.日报，杂志；日志
2100. journalist['d72:n2list]
n.记者，新闻工作者
2101. journey['d72:ni]
n.旅行，旅程 n.旅行
2102. joy[d70i]
n.欢乐，喜悦；乐事
2103. joyful['d70iful]
a.十分喜悦的，快乐的
2104. judge[d73d7]
n.法官；裁判员
2105. judgement['d73d7m2nt]
n.意见；审判；判断
2106. juice[d7u:s]
n.(水果等)汁，液
2107. July[d7u:'lai]
n.七月
2108. jump[d73mp]
vi.跳；暴涨 vt.跳过
2109. June[d7u:n]
n.六月
2110. jungle['d738gl]
n.丛林，密林，莽丛
2111. junior['d7u:nj2]
a.年少的 n.晚辈
2112. jury['d7u2ri]
n.陪审团；评奖团
2113. just[d73st]
ad.刚才；只是；正好
2114. justice['d73stis]
n.正义，公正；司法
2115. justify['d73stifai]
vt.证明…是正当的
2116. keen[ki:n]
a.热心的；激烈的
2117. keep[ki:p]
vi.保持；坚持
2118. keeper['ki:p2]
n.看护人；饲养员
2119. kettle['ketl]
n.水壶，水锅
2120. key[ki:]
n.钥匙；键；答案
2121. keyboard['kib0:d]
n.键盘
2122. kick[kik]
vi.&vt.&n.踢
2123. kid[kid]
n.小孩，儿童，少年
2124. kill[kil]
vi.杀死；扼杀；消磨
2125. kilogram['kil2gr9m]
n.千克，公斤
2126. kilometer['kil2mi:t2]
n.千米，公里
2127. kind[kaind]
n.种类
2128. kind[kaind]
a.友好的；和蔼的
2129. kindness['kaindnis]
n.仁慈，好意
2130. king[ki8]
n.国王，君主
2131. kingdom['ki8d2m]
n.王国；领域，界
2132. kiss[kis]
vt.吻 vi.接吻 n.吻
2133. kitchen['kit6in]
n.厨房，灶间
2134. kite[kait]
n.风筝
2135. knee[ni:]
n.膝，膝盖，膝关节
2136. kneel[ni:l]
vi.跪，跪下，跪着
2137. knife[naif]
n.小刀，刀，餐刀
2138. knit[nit]
vt.把…编结 vi.编织
2139. knob[n0b]
n.门把，拉手；旋纽
2140. knock[n0k]
vi.&vt.&n.敲，击，打
2141. knot[n0t]
n.(绳的)结，(树的)节
2142. know[n2u]
vt.知道；认识；通晓
2143. knowledge['n0lid7]
n.知识，学识；知道
2144. lab[l9b]
n.实验室，研究室
2145. label['leibl]
n.标签；标记，符号
2146. laboratory[l2'b0r2tri]
n.实验室，研究室
2147. labour['leib2]
n.劳动；工作；劳工
2148. lace[leis]
n.鞋带，系带；花边
2149. lack[l9k]
vi.&vi.&n.缺乏，不足
2150. ladder['l9d2]
n.梯子，梯状物
2151. lady['leidi]
n.女士，夫人；贵妇人
2152. lag[l9g]
vi.走得慢 n.落后
2153. lake[leik]
n.湖
2154. lamb[l9m]
n.羔羊，小羊；羔羊肉
2155. lame[leim]
a.跛的；瘸的，残废的
2156. lamp[l9mp]
n.灯
2157. land[l9nd]
n.陆地；土地 vi.上岸
2158. landing['l9ndi8]
n.上岸，登陆，着陆
2159. landlady['l9ndleidi]
n.女房东；女地主
2160. landlord['l9ndl0:d]
n.地主；房东，店主
2161. lane[lein]
n.(乡间)小路；跑道
2162. language['l98gwid7]
n.语言，语言课程
2163. lantern['l9nt2n]
n.提灯，灯笼
2164. lap[l9p]
n.膝部；一圈
2165. large[la:d7]
a.大的；巨大的
2166. largely['la:d7li]
ad.大部分；大量地
2167. laser['leiz2]
n.激光
2168. last[la:st]
a.最后的 ad.最后
2169. last[la:st]
vi.持续，持久；耐久
2170. late[leit]
a.迟的 ad.迟，晚
2171. lately['leitli]
ad.最近，不久前
2172. later['leit2]
ad.后来；过一会儿
2173. Latin['l9tin]
a.拉丁的 n.拉丁语
2174. latter['l9t2]
a.(两者中)后者的
2175. laugh[la:f]
vi.笑，发笑 n.笑
2176. laughter[la:ft2]
n.笑，笑声
2177. launch[l0:nt6]
vt.发射，投射；发动
2178. laundry['l0:ndri]
n.洗衣房，洗衣店
2179. lavatory['l9v2t2ri]
n.盥洗室，厕所
2180. law[l0:]
n.法律，法令；法则
2181. lawn[l0:n]
n.草地，草坪，草场
2182. lawyer['l0:j2]
n.律师；法学家
2183. lay[lei]
vt.置放；铺设；设置
2184. layer['lei2]
n.层，层次；铺设者
2185. layout['leiaut]
n.布局，安排，设计
2186. lazy['leizi]
a.懒惰的，懒散的
2187. lead[li:d]
vt.为…带路；领导
2188. lead[li:d]
n.铅，铅制品
2189. leader['li:d2]
n.领袖，领导人；首领
2190. leadership['li:d26ip]
n.领导
2191. leading['li:di8]
a.指导的；最主要的
2192. leaf[li:f]
n.叶，叶子
2193. league[li:g]
n.同盟，联盟；联合会
2194. leak[li:k]
vi.漏；泄露 n.漏洞
2195. lean[li:n]
vi.倾斜，屈身；靠
2196. leap[li:p]
vi.跳，跃 n.跳跃
2197. learn[l2:n]
vi.&vt.学，学习
2198. learned['l2:nid]
a.有学问的；学术上的
2199. learning['l2:ni8]
n.学习；学问，知识
2200. least[li:st]
a.最少的 ad.最少
2201. leather['le52]
n.皮革；皮革制品
2202. leave[li:v]
vi.离去 vt.离开
2203. lecture['lekt62]
n.&vi.演讲，讲课
2204. left[left]
a.左边的 ad.在左边
2205. leg[leg]
n.腿，腿部
2206. legal['li:gl]
a.法律的；合法的
2207. legend['led72nd]
n.传说，传奇
2208. leisure['le72]
n.空闲时间；悠闲
2209. lemon['lem2n]
n.柠檬，柠檬树
2210. lend[lend]
vt.把…借给，贷(款)
2211. length[le84]
n.长，长度；一段
2212. lens[lenz]
n.透镜，镜片；镜头
2213. less[les]
a.更少的 ad.更少地
2214. lessen['lesn]
vt.减少，减轻；缩小
2215. lesson['lesn]
n.功课，课；课程
2216. lest[lest]
conj.惟恐，以免
2217. let[let]
vt.允许，让；使
2218. letter['let2]
n.信；证书；字母
2219. level['levl]
n.水平面 a.水平的
2220. lever['li:v2]
n.杆，杠杆；控制杆
2221. liable['lai2bl]
a.易于…的；可能的
2222. liar['lai2]
n.说谎的人
2223. liberal['lib2r2l]
a.心胸宽大的；慷慨的
2224. liberate['lib2reit]
vt.解放；释放
2225. liberation[lib2'rei62n]
n.解放
2226. liberty['lib2ti]
n.自由；释放；许可
2227. librarian[lai'br/2ri2n]
n.图书馆馆长
2228. library['laibr2ri]
n.图书馆；藏书
2229. license['lais2ns]
n.许可；执照 vt.准许
2230. lick[lik]
vt.舔；舔吃
2231. lid[lid]
n.盖子，盖，囊盖
2232. lie[lai]
vi.躺，平放；位于
2233. lie[lai]
vi.说谎，欺骗 n.谎话
2234. lieutenant[lef'ten2nt]
n.陆军中尉；副职官员
2235. life[laif]
n.生命；一生；寿命
2236. lifetime['laiftaim]
n.一生，终身
2237. lift[lift]
vt.提起，提高 n.电梯
2238. light[lait]
n.光，光线；灯，光源
2239. light[lait]
a.轻的，少量的
2240. lighten['laitn]
vt.照亮，使明亮
2241. lightly['laitli]
ad.轻轻地，轻松地
2242. lightning['laitni8]
n.闪电，闪电放电
2243. like[laik]
vt.喜欢；喜爱；希望
2244. like[laik]
prep.像，如；像要
2245. likely['laikli]
a.可能的 ad.很可能
2246. likewise['laikwaiz]
ad.同样地；也，又
2247. limb[lim]
n.肢，臂，翼；树枝
2248. lime[laim]
n.石灰
2249. limit['limit]
n.限度；限制；范围
2250. limitation[limi'tei62n]
n.限制；限度，局限
2251. limited['limitid]
a.有限的
2252. line[lain]
n.线；排；路线；线条
2253. linen['linin]
n.亚麻布；亚麻织物
2254. liner['lain2]
n.班船，班机
2255. link[li8k]
vt.有环连接 n.环
2256. lion['lai2n]
n.狮子；勇猛的人
2257. lip[lip]
n.嘴唇
2258. liquid['likwid]
n.液体 a.液体的
2259. liquor['lik2]
n.酒；溶液，液剂
2260. list[list]
n.表，目录 n.列举
2261. listen['lisn]
vi.听，留神听；听从
2262. listener['lisn2]
n.听者，听众之一
2263. liter['li:t2]
n.升(容量单位)
2264. literary['lit2r2ri]
a.文学(上)的
2265. literature['lit2rit62]
n.文学；文献
2266. little['litl]
a.小的；少；幼小的
2267. live[liv laiv]
vi.居住；活 a.活的
2268. lively['laivli]
a.活泼的；逼真的
2269. liver['liv2]
n.肝；肝脏
2270. living['livi8]
a.活的 n.生活，生计
2271. living-room['livi8'ru:m]
n.起居室
2272. load[l2ud]
vt.装；装满 n.负载
2273. loaf[l2uf]
n.一条面包，一个面包
2274. loan[l2un]
n.贷款；暂借 vt.借出
2275. local['l2uk2l]
a.地方的；局部的
2276. locate[l2u'keit]
vt.探明，找出，查出
2277. location[l2u'kei62n]
n.位置，场所
2278. lock[l0k]
n.锁 vt.锁上，锁住
2279. locomotive['l2uk2m2utiv]
n.火车头，机车
2280. lodge[l0d7]
vi.暂住，借宿，投宿
2281. log[l0g]
n.原木，木料
2282. logic['l0d7ik]
n.逻辑，推理；逻辑性
2283. logical['l0d7ik2l]
a.逻辑的；符合逻辑的
2284. lonely['l2unli]
a.孤独的；荒凉的
2285. long[l08]
a.长的；远的 ad.长久
2286. long[l08]
vi.渴望，极想念
2287. look[luk]
vi.看，显得 n.看
2288. loop[lu:p]
n.圈，环，环孔
2289. loose[lu:s]
a.松的；宽松的
2290. loosen['lu:sn]
vt.解开；使松驰
2291. lord[l0:d]
n.贵族；上帝，基督
2292. lorry['l0ri]
n.运货汽车，卡车
2293. lose[lu:z]
vt.失去；迷失；输掉
2294. loss[l0s]
n.遗失；损失；失败
2295. lot[l0t]
n.许多，大量；签，阄
2296. loud[laud]
a.响亮的；吵闹的
2297. loudspeaker['laud'spi:k2]
n.扬声器，喇叭
2298. love[l3v]
vt.爱，喜欢 n.爱
2299. lovely['l3vli]
a.可爱的；令人愉快的
2300. lover[l3v2]
n.爱好者；情人；情侣
2301. low[l2u]
a.低的，矮的；低下的
2302. lower['l2u2]
a.较低的 vt.放下
2303. loyal['l0i2l]
a.忠诚的，忠心的
2304. loyalty['l0i2lti]
n.忠诚，忠心
2305. luck[l3k]
n.运气；好运，幸运
2306. lucky['l3ki]
a.幸运的；吉祥的
2307. luggage['l3gid7]
n.行李；皮箱，皮包
2308. lumber['l3mb2]
n.木材；木料；制材
2309. lump[l3mp]
n.团，块；肿块
2310. lunch[l3nt6]
n.午餐，(美)便餐
2311. lung[l38]
n.肺脏，肺
2312. luxury['l3k62ri]
n.奢侈，奢华；奢侈品
2313. machine[m2'6i:n]
n.机器；机械
2314. mad[m9d]
a.发疯的；恼火的
2315. madam['m9d2m]
n.夫人，女士，太太
2316. magazine[m9g2'zi:n]
n.杂志，期刊
2317. magic['m9d7ik]
n.魔法，巫术；戏法
2318. magnet['m9gnit]
n.磁铁，磁石，磁体
2319. magnetic[m9g'netik]
a.磁的，有吸引力的
2320. magnificent[m9g'nifisnt]
n.壮丽的；华丽的
2321. maid[meid]
n.女佣，女仆；少女
2322. mail[meil]
n.邮件 vt.邮寄
2323. main[mein]
a.主要的，最重要的
2324. mainly['meinli]
ad.主要地，大体上
2325. mainland['meinl9nd]
n.大陆
2326. maintain[mein'tein]
vt.维持；赡养；维修
2327. maintenance['meintin2ns]
n.维持，保持；维修
2328. major['meid72]
a.较大的 n.专业
2329. majority[m2'd70riti]
n.多数，大多数
2330. make[meik]
vt.使；做，制造
2331. male[meil]
a.男的，雄的 n.男子
2332. man[m9n]
n.男人；人；人类
2333. manage['m9nid7]
vt.管理；设法；对付
2334. management['m9nid7m2nt]
n.管理；经营，处理
2335. manager['m9nid72]
n.经理，管理人
2336. mankind[m9n'kaind]
n.人类
2337. manly['m9nli]
a.男子气概的，果断的
2338. manner['m9n2]
n.方式；态度；礼貌
2339. manual['m9nju2l]
a.体力的 n.手册
2340. manufacture[m9nju'f9kt62]
vt.制造 n.制造；产品
2341. manufacturer[m9nju'f9kt62r2]
n.制造商；制造厂
2342. many['meni]
a.许多的 pron.许多人
2343. map[m9p]
n.地图；图；天体图
2344. marble['ma:bl]
n.大理石
2345. March[ma:t6]
n.三月
2346. march[ma:t6]
vi.行军；游行示威
2347. margin['ma:d7in]
n.页边的空白；边缘
2348. marine[m2'ri:n]
a.海的；海上的
2349. mark[ma:k]
n.斑点；记号 vt.标明
2350. market['ma:kit]
n.市场；集市；销路
2351. marriage['m9rid7]
n.结婚，婚姻；婚礼
2352. married['m9rid]
a.已婚的；婚姻的
2353. marry['m9ri]
vt.娶，嫁 vi.结婚
2354. marvelous['ma:vil2s]
a.奇迹般的；了不起的
2355. Marxisim[]
n.马克思主义
2356. Marxist['ma:ksist]
a.马克思主义的
2357. mask[ma:sk]
n.面具；伪装 vt.掩饰
2358. mass[m9s]
n.众多；团；群众
2359. master['ma:st2]
n.主人；能手；硕士
2360. masterpiece['ma:st2pi:s]
n.杰作，名著
2361. mat[m9t]
n.席子；草席；垫子
2362. match[m9t6]
n.比赛，竞赛；对手
2363. match[m9t6]
n.(一根)火柴
2364. mate[meit]
n.伙伴，同事；配偶
2365. material[m2'ti2ri2l]
n.材料；素材a.物质的
2366. materialism[m2'ti2ri2liz2m]
n.唯物主义
2367. mathematical[m94i'm9tik2l]
a.数学的，数学上的
2368. mathematics[m94i'm9tiks]
n.数学
2369. maths[m94s]
n.(英)数学
2370. matter['m9t2]
n.事情；物质 vi.要紧
2371. mature[m2'tju2]
a.成熟的 vt.使成熟
2372. maximum['m9ksim2m]
n.最大量 a.最大的
2373. May[mei]
n.五月
2374. may[mei]
v.aux.可能；可以，祝
2375. maybe['meibi:]
ad.大概，或许；也许
2376. mayor['m/2]
n.市长
2377. me[mi:. mi]
pron.(宾格)我
2378. meadow['med2u]
n.草地，牧草地
2379. meal[mi:l]
n.膳食，一餐
2380. mean[mi:n]
vt.作…解释；意指
2381. mean[mi:n]
a.自私的；吝啬的
2382. mean[mi:n]
a.平均的 n.平均值
2383. meaning['mi:ni8]
n.意义，意思；意图
2384. means[mi:nz]
n.方法，手段，工具
2385. meantime['mi:n'taim]
n.其时，其间 ad.当时
2386. meanwhile['mi:n'wail]
ad.同时，当时
2387. measurable['me72r2bl]
a.可测量的
2388. measure['me72]
vt.量，测量 n.分量
2389. measurement['me72m2nt]
n.衡量，测量；尺寸
2390. meat[mi:t]
n.肉
2391. mechanic[mi'k9nik]
n.技工，机械，机修工
2392. mechanical[mi'k9nik2l]
a.机械的；力学的
2393. mechanically[mi'k9nik2li]
ad.机械地
2394. mechanics[mi'k9niks]
n.力学；技术性细节
2395. medal['medl]
n.奖章，勋章，纪念章
2396. medical['medik2l]
a.医学的；内科的
2397. medicine['medisin]
n.内服药；医学
2398. Mediterranean[medit2'reinj2n]
n.地中海 a.地中海的
2399. medium['mi:dj2m]
n.媒质；中间a.中等的
2400. meet[mi:t]
vt.遇见 vi.相遇
2401. meeting[mi:ti8]
n.聚集，会合，会见
2402. melon['mel2n]
n.瓜，甜瓜
2403. melt[melt]
vi.融化 vt.使融化
2404. member['memb2]
n.成员，会员
2405. memorial[mi'm0:ri2l]
a.纪念的；记忆的
2406. memory['mem2ri]
n.记忆；回忆；存储
2407. mend[mend]
vt.修理，修补，缝补
2408. mental['mentl]
a.智力的；精神的
2409. mention['men62n]
vt.&n.提及，说起
2410. menu['menju:]
n.菜单；饭菜，菜肴
2411. merchant['m2:t62nt]
n.商人；零售商
2412. mercury['m2:kjuri]
n.水银，汞
2413. Mercury['m2:kjuri]
n.水星
2414. mercy['m2:si]
n.仁慈，慈悲，恩惠
2415. mere[mi2]
a.仅仅的；纯粹的
2416. merely['mi2li]
ad.仅仅，只不过
2417. merit['merit]
n.长处，优点；功过
2418. merry['meri]
a.欢乐的，愉快的
2419. mess[mes]
n.混乱，混杂，肮脏
2420. message['mesid7]
n.信息，消息；启示
2421. messenger['mesind72]
n.送信者，信使
2422. metal['metl]
n.金属，金属制品
2423. meter['mi:t2]
n.计量器，计，表
2424. method['me42d]
n.方法，办法；教学法
2425. metre['mi:t2]
n.米，公尺
2426. metric['metrik]
a.公制的，米制的
2427. microcomputer[maikr2uk2m'pju:t2]
n.微型计算机，微机
2428. microphone['maikr2f2un]
n.话筒，麦克风
2429. microscope['maikr2sk2up]
n.显微镜
2430. midday['middei]
n.正午，中午
2431. middle['midl]
n.中部 a.中部的
2432. midnight['midnait]
n.午夜，子夜，夜半
2433. midst['midst]
n.中部，中间，当中
2434. might[mait]
v.aux.可能，会，也许
2435. might[mait]
n.力量，威力，能力
2436. mild[maild]
a.和缓的；温柔的
2437. mile[mail]
n.英里
2438. military['milit2ri]
a.军事的；军人的
2439. milk[milk]
n.乳，牛奶 vt.挤(奶)
2440. mill[mil]
n.磨坊；制造厂
2441. millimetre['milimi:t2]
n.毫米
2442. million['milj2n]
num.百万 n.许多
2443. mind[maind]
n.头脑；理智；记忆
2444. mine[main]
pron.我的
2445. mine[main]
n.矿，矿山；地雷
2446. miner['main2]
n.矿工
2447. mineral['min2r2l]
n.矿物 a.矿物的
2448. minimum['minim2m]
n.最小量 a.最小的
2449. minister['minist2]
n.部长，大臣；公使
2450. ministry['ministri]
n.(政府的)部
2451. minor['main2]
a.较小的；较次要的
2452. minority[mai'n0riti]
n.少数；少数民族
2453. minus['main2s]
a.负的 prep.减(去)
2454. minute['minit. mai'nju:t]
n.分，分钟；一会儿
2455. minute['minit. mai'nju:t]
a.微细的；详细的
2456. miracle['mir2kl]
n.奇迹，令人惊奇的人
2457. mirror['mir2]
n.镜子 vt.反映，反射
2458. miserable['miz2r2bl]
a.痛苦的，悲惨的
2459. mislead[mis'li:d]
vt.使误入岐途
2460. miss[mis]
n.小姐
2461. miss[mis]
vt.未看到；惦念
2462. missile['misail]
n.发射物；导弹
2463. missing['misi8]
a.缺掉的，失去的
2464. mission['mi62n]
n.使命，任务；使团
2465. mist[mist]
n.薄雾
2466. mistake[mis'teik]
n.错误 vi.误解，弄错
2467. Mister['mist2]
n.先生
2468. mistress['mistris]
n.女主人；夫人
2469. misunderstand[mis3nd2'st9nd]
vt.误解，误会，曲解
2470. mix[miks]
vt.使混合，混淆
2471. mixture['mikst62]
n.混合；混合物
2472. moan[m2un]
n.呻吟声 vi.呻吟
2473. mobile['m2ubail]
a.运动的；流动的
2474. mode[m2ud]
n.方式，样式
2475. model['m0dl]
n.模型；模式；模特儿
2476. moderate['m0d2rit]
a.温和的；有节制的
2477. modern['m0d2n]
a.现代的，近代的
2478. modest['m0dist]
a.有节制的；谦虚的
2479. modify['m0difai]
vt.更改，修改；修饰
2480. moist[m0ist]
a.湿润的；多雨的
2481. moisture['m0ist62]
n.潮湿，湿气；温度
2482. molecule['m0likju:l]
n.分子，克分子
2483. moment['m2um2nt]
n.片刻，瞬间，时刻
2484. Monday['m3ndi]
n.星期一
2485. money['m3ni]
n.货币；金钱，财富
2486. monitor['m0nit2]
n.班长；监视器
2487. monkey['m38ki]
n.猴子，猿
2488. month[m3n4]
n.月，月份
2489. monthly['m3n4li]
a.每月的 ad.每月
2490. monument['m0njum2nt]
n.纪念碑；纪念馆
2491. mood[mu:d]
n.心情，情绪；语气
2492. moon[mu:n]
n.月球，月亮；卫星
2493. moral['m0r2l]
a.道德的；合乎道德的
2494. more[m0:]
a.更多的 ad.更
2495. moreover[m0:'r2uv2]
ad.再者，加之，此外
2496. morning['m0:ni8]
n.早晨，上午
2497. mortal['m0:tl]
a.终有一死的；致死的
2498. mosquito[m2s'ki:t2u]
n.蚊子
2499. most[m2ust]
a.最多的 ad.最，很
2500. mostly['m2ustli]
ad.主要的，大部分
2501. mother['m352]
n.母亲，妈妈
2502. motion['m2u62n]
n.运动；手势；提议
2503. motivate['m2utiveit]
vt.促动；激励，激发
2504. motive['m2utiv]
n.动机，目的
2505. motor['m2ut2]
n.发动机；机动车
2506. mould[m2uld]
n.模子，模型 vt.浇铸
2507. mount[maunt]
vt.登上，爬上 n.…山
2508. mountain['mauntin]
n.山，山岳；山脉
2509. mourn[m0:n]
vi.哀痛，哀悼
2510. mouse[maus]
n.鼠，耗子
2511. mouth[mau4]
n.嘴，口，口腔
2512. mouthful['mau4ful]
n.满口，一口，少量
2513. move[mu:v]
vt.移动；感动 n.动
2514. movement['mu:vm2nt]
n.动作，活动；移动
2515. movie['mu:vi]
n.电影；电影院
2516. much[m3t6]
ad.非常，很 a.许多的
2517. mud[m3d]
n.软泥，泥浆
2518. muddy['m3di]
a.多泥的，泥泞的
2519. mug[m3g]
n.大杯
2520. multiple['m3ltipl]
a.复合的；并联的
2521. multiply['m3ltiplai]
vt.使增加；乘
2522. murder['m2:d2]
n.&vi.谋杀，凶杀
2523. murderer['m2:d2r2]
n.杀人犯，凶手
2524. muscle['m3sl]
n.肌肉，肌；体力
2525. museum[mju:'zi2m]
n.博物馆；展览馆
2526. mushroom['m36rum]
n.蘑菇，菌类植物
2527. music['mju:zik]
n.音乐，乐曲，乐谱
2528. musical['mju:zik2l]
a.音乐的；和谐的
2529. musician[mju:'zi62n]
n.音乐家；作曲家
2530. must[m3st]
v.aux.必须；必然要
2531. mute[mju:t]
a.缄默的 n.哑巴
2532. mutter['m3t2]
vi.轻声低语；抱怨
2533. mutton['m3tn]
n.羊肉
2534. mutual['mju:tju2l]
a.相互的；共同的
2535. my[mai]
pron.我的
2536. myself[mai'self]
pron.我自己；我亲自
2537. mysterious[mis'ti2ri2s]
a.神秘的；难以理解的
2538. mystery['mist2ri]
n.神秘；神秘的事物
2539. nail[neil]
n.钉；指甲 vt.钉
2540. naked['neikid]
a.裸体的；无遮敝的
2541. name['neim]
n.名字；名誉 vt.说出
2542. namely['neimli]
ad.即，也就是
2543. nap[n9p]
n.小睡，打盹，瞌睡
2544. narrow['n9r2u]
a.狭的，狭窄的
2545. nasty['na:sti]
a.龌龊的；淫猥的
2546. nation['nei62n]
n.民族；国家
2547. national['n962nl]
a.民族的；国家的
2548. nationality[n962'n9liti]
n.国籍；民族，族
2549. native['neitiv]
a.本土的 n.本地人
2550. natural['n9t62r2l]
a.自然界的；天然的
2551. naturally['n9t62r2li]
ad.自然地；天然地
2552. nature['neit62]
n.大自然；本性；性质
2553. naughty['n0:ti]
a.顽皮的，淘气的
2554. naval['neiv2l]
n.海军的，军舰的
2555. navigation[n9vi'gei62n]
n.航行；航海术；导航
2556. navy['neivi]
n.海军
2557. near[ni2]
ad.近，接近 a.近的
2558. nearby['ni2bai]
a.附近的 ad.在附近
2559. nearly['ni2li]
ad.差不多；密切地
2560. neat[ni:t]
a.整洁的；熟练的
2561. necessarily['nesis2rili]
ad.必然，必定
2562. necessary['nesis2ri]
a.必要的；必然的
2563. necessity[ni'sesiti]
n.必要性；必然性
2564. neck[nek]
n.颈，脖子
2565. necklace['neklis]
n.项链，项圈
2566. need[ni:d]
vt.需要 v.aux.需要
2567. needle['ni:dl]
n.针，缝补，编织针
2568. needless['ni:dlis]
a.不需要的
2569. negative['neg2tiv]
a.否定的；消极的
2570. neglect[ni'glekt]
vt.忽视，忽略；疏忽
2571. Negro['ni:gr2u]
n.黑人
2572. neighbour['neib2]
n.邻居，邻国，邻人
2573. neighbourhood['neib2hud]
n.邻居关系；邻近
2574. neither['nai52. 'ni:52]
a.(两者)都不的
2575. nephew['nevju:]
n.侄子，外甥
2576. nerve[n2:v]
n.神经；勇敢，胆量
2577. nervous['n2:v2s]
a.神经的；易激动的
2578. nest[nest]
n.巢，窝，穴
2579. net[net]
n.网，网状物；通信网
2580. network['netw2:k]
n.网状物；网络
2581. neutral['nju:tr2l]
a.中立的；中性的
2582. never['nev2]
ad.永不，决不；不
2583. nevertheless[nev252les]
conj.然而 ad.仍然
2584. new[nju:]
a.新的；新近出现的
2585. newly['nju:li]
ad.新近，最近
2586. news[nju:z]
n.新闻，消息
2587. newspaper['nju:zpeip2]
n.报纸，报
2588. next[nekst]
a.紧接的；贴近的
2589. nice['nais]
a.美好的，令人愉快的
2590. niece[ni:s]
n.侄女，外甥女
2591. night[nait]
n.夜，夜间
2592. nine[nain]
num.九，九个
2593. nineteen['nain'ti:n]
num.十九，十九个
2594. ninety['nainti]
num.九十，九十个
2595. ninth[nain4]
num.第九；九分之一
2596. nitrogen['naitrid72n]
n.氮
2597. no[n2u]
ad.不；并不 a.没有
2598. noble['n2ubl]
a.贵族的；高尚的
2599. nobody['n2ub2di]
pron.谁也不；无人
2600. nod[n0d]
vt.点(头)；点头表示
2601. noise[n0iz]
n.喧闹声；响声；噪声
2602. noisy['n0izi]
a.嘈杂的；喧闹的
2603. none[n3n]
pron.没有人 ad.毫不
2604. nonsense['n0ns2ns]
n.胡说，废话
2605. noon[nu:n]
n.正午，中午
2606. nor[n0:]
conj.也不；不
2607. normal['n0:ml]
a.正常的，普通的
2608. normally['n0:m2li]
ad.通常，正常地
2609. north[n0:4]
n.北，北方 a.北方的
2610. northeast['n0:4'i:st]
n.东北 a.位于东北的
2611. northern['n0:52n]
a.北方的，北部的
2612. northwest['n0:4'west]
n.西北 a.位于西北的
2613. nose[n2uz]
n.鼻子；突出部分
2614. not[n0t]
ad.不，没有
2615. note[n2ut]
n.笔记；便条；注释
2616. notebook['n2utbuk]
n.笔记本，期票簿
2617. nothing['n34i8]
n.没有东西 ad.毫不
2618. notice['n2utis]
vt.注意 n.通知；注意
2619. noticeable['n2utis2bl]
a.显而易见的；重要的
2620. noun[naun]
n.名词
2621. novel['n0v2l]
n.小说 a.新的
2622. November[n2u'vemb2]
n.十一月
2623. now[nau]
ad.现在；立刻；于是
2624. nowadays['nau2deiz]
ad.现今，现在
2625. nowhere['n2uhw/2]
ad.任何地方都不
2626. nuclear['nju:kli2]
a.原子核的；核心的
2627. nucleus['nju:kli2s]
n.核，核心；(原子)核
2628. nuisance['nju:sns]
n.讨厌的东西
2629. number['n3mb2]
n.数，数字；号码
2630. numerous['nju:m2r2s]
a.为数众多的；许多
2631. nurse[n2:s]
n.保姆；护士 vt.看护
2632. nursery['n2:s2ri]
n.托儿所；苗圃
2633. nut[n3t]
n.坚果，干果；螺母
2634. nylon['nail2n]
n.尼龙，耐纶
2635. oak[2uk]
n.栎属植物；栎木
2636. oar[0:]
n.浆，橹
2637. obey[2'bei]
vt.顺从 vi.服从
2638. object['0bd7ikt 2b'd7ekt]
n.物，物体；目的
2639. object['0bd7ikt 2b'd7ekt]
vi.反对；抱反感
2640. objection[2b'd7ek62n]
n.反对，异议；不喜欢
2641. objective[0b'd7ektiv]
a.客观的；无偏见的
2642. oblige[2'blaid7]
vt.迫使；施恩惠于
2643. observation[0bz2:'vei62n]
n.注意；观察；观察力
2644. observe[2b'z2:v]
vt.遵守；看到；说
2645. observer[2b'z2:v2]
n.观察员，观测者
2646. obstacle['0bst2kl]
n.障碍，障碍物，妨害
2647. obtain[2b'tein]
vt.获得，得到，买到
2648. obvious['0bvi2s]
a.明显的，显而易见的
2649. obviously['0bvi2sli]
ad.明显地，显然地
2650. occasion[2'kei72n]
n.场合，时刻；时机
2651. occasional[2'kei72n2l]
a.偶然的；临时的
2652. occasionally[2'kei72n2li]
ad.偶然；非经常地
2653. occupation[0kju'pei62nl]
n.占领，占据；职业
2654. occupy['0kjup2ai]
vt.占领；占，占有
2655. occur[2'k2:]
vi.发生；出现，存在
2656. occurrence[2'k3r2ns]
n.发生，出现；事件
2657. ocean['2u62n]
n.海洋；洋
2658. Oceania[2u6i'einj2]
n.大洋洲
2659. o'clock[2'kl0k]
ad.…点钟
2660. October[0k't2ub2]
n.十月
2661. odd[0d]
a.奇数的；单只的
2662. odour['2ud2]
n.气味，香气；味道
2663. of[0v. 2v]
prep.…的；由于
2664. off[0:f]
ad.(离)开；(停)止
2665. offend[2'fend]
vt.冒犯 vi.犯过错
2666. offer['0f2]
vt.提供；提出 n.提供
2667. office['0fis]
n.办公室；处，局，社
2668. officer['0fis2]
n.官员；干事；军官
2669. official[2'fi62l]
a.官员的；官方的
2670. often['0:fn]
ad.经常，常常
2671. oh[2u]
int.嗬，哦，唉呀
2672. oil[0il]
n.油；石油 vt.加油于
2673. okay['2u'kei]
(缩作OK)a.&ad.对，好
2674. old[2uld]
a.老的；…岁的
2675. omit[2u'mit]
vt.省略，省去；遗漏
2676. on[0n]
prep.在…上；在…旁
2677. once[w3ns]
ad.一次；曾经 n.一次
2678. one[w3n]
num.一 pron.一个人
2679. oneself[w3n'self]
pron.自己；亲自
2680. onion['3nj2n]
n.洋葱，洋葱头
2681. only['2unli]
ad.只，仅仅 a.唯一的
2682. onto['0ntu]
prep.到…上
2683. open['2up2n]
a.开的；开放的 vt.开
2684. opening['2up2ni8]
a.开始的 n.开始
2685. opera['0p2r2]
n.歌剧
2686. operate['0p2reit]
vi.操作；施行手术
2687. operation[0p2'rei62n]
n.操作；手术；运算
2688. operational[0p2'rei62nl]
a.操作上的；可使用的
2689. operator['0p2reit2]
n.操作人员，接线员
2690. opinion[2'pinj2n]
n.意见，看法，主张
2691. opponent[2'p2un2nt]
n.对手，敌手；对抗者
2692. opportunity[0p2'tju:niti]
n.机会，良机
2693. oppose[2'p2uz]
vt.反对；反抗
2694. opposite['0p2zit]
a.对面的 n.对立物
2695. oppress[2'pres]
vt.压迫，压制；压抑
2696. optical['0ptik2l]
a.眼的；光学的
2697. optimistic[0ptimistik]
a.乐观的；乐观主义的
2698. option['0p62n]
n.选择，选择权
2699. optional['0p62nl]
a.可以任意选择的
2700. or[0:. 2]
conj.或，或者；即
2701. oral['0:r2l]
a.口头的；口的
2702. orange['0rind7]
n.橙(树)；柑(树)
2703. orbit['0:bit]
n.运行轨道 vt.环绕
2704. orchestra['0:kistr2]
n.管弦乐队
2705. order['0:d2]
n.次序；整齐 vt.命令
2706. orderly['0:d2li]
a.整洁的；有秩序的
2707. ordinary['0:din2ri]
a.平常的；平凡的
2708. ore[0:]
n.矿，矿石，矿砂
2709. organ['0:g2n]
n.器官；机构；管风琴
2710. organic[0:'g9nik]
a.有机体的；器官的
2711. organism['0:g2niz2m]
n.生物体；有机体
2712. organization[0:g2nai'zei62n]
n.组织；团体，机构
2713. organize['0:g2naiz]
vt.组织，编组
2714. oriental[0ri'entl]
a.东方的；东方国家的
2715. origin['0rid7in]
n.起源，由来；出身
2716. original[2'rid72n2l]
a.最初的；新颖的
2717. ornament['0:n2m2nt. '0:n2ment]
n.装饰物；装饰
2718. orphan['0:f2n]
n.孤儿
2719. other['352]
a.另外的；其余的
2720. otherwise['352waiz]
ad.另外；要不然
2721. ought[0:t]
v.aux.应当，应该
2722. ounce[auns]
n.盎司，英两
2723. our['au2]
pron.我们的
2724. ours['au2z]
pron.我们的
2725. ourselves[au2'selvz]
pron.我们自己
2726. out[aut]
ad.出，在外；现出来
2727. outcome['autk2m]
n.结果，后果，成果
2728. outdoor['autd0:]
a.户外的，室外的
2729. outdoors['aut'd0:z]
ad.在户外，在野外
2730. outer['aut2]
a.外部的，外面的
2731. outlet['aut-let]
n.出口，出路；排遣
2732. outline['aut-lain]
n.轮廓；略图；大纲
2733. outlook['aut-luk]
n.观点，看法；展望
2734. output['autput]
n.产量；输出量；输出
2735. outset['aut-set]
n.开始，开端
2736. outside['aut'said]
n.外部；外表a.外部的
2737. outskirt['autsk2:t]
n.外边，郊区
2738. outstanding[aut'st9ndi8]
a.突出的，杰出的
2739. outward['autw2d]
a.外面的；向外的
2740. outwards['autw2dz]
ad.向外，往海外
2741. oven['3vn]
n.炉，灶；烘箱
2742. over['2uv2]
prep.在…上方；超过
2743. overall['2uv2r0:l]
n.工装裤 a.全面的
2744. overcoat['2uv2k2ut]
n.外衣，大衣
2745. overcome[2uv2'k3m]
vt.战胜，克服
2746. overhead['2uv2'hed. '2uv2hed]
a.在头顶上的；架空的
2747. overlook[2uv2'luk]
vt.眺望；看漏；放任
2748. overnight['2uv2nait]
ad.一夜；突然
2749. overseas['2uve'si:z]
ad.海外 a.在海外的
2750. overtake[2uv2'teik]
vt.追上，赶上；压倒
2751. overtime['2uv2taim]
a.超时的，加班的
2752. owe[2u]
vt.欠；应把…归功于
2753. owl[aul]
n.猫头鹰，枭
2754. own[2un]
a.自己的 vt.有，拥有
2755. owner['2un2]
n.物主，所有人
2756. ownership['2un26ip]
n.所有(权)，所有制
2757. ox[0ks]
n.牛；公牛，阉牛
2758. pace[peis]
n.步，步速 vi.踱步
2759. pacific[p2'sifik]
a.和平的 n.太平洋
2760. pack[p9k]
vt.捆扎；挤满 n.包
2761. package['p9kid7]
n.包裹，包，捆
2762. packet['p9kit]
n.小包(裹)，小捆
2763. pad[p9d]
n.垫；本子 vt.填塞
2764. page[peid7]
n.页
2765. pail[peil]
n.桶，提桶
2766. pain[pein]
n.痛，疼痛；辛苦
2767. painful['peinful]
a.使痛的；费力的
2768. paint[peint]
vt.画；油漆 vi.绘画
2769. painter['peint2]
n.漆工，画家，绘画者
2770. painting['peinti8]
n.油画；绘画；着色
2771. pair[p/2]
n.一对 vi.成对，配对
2772. palace['p9lis]
n.宫，宫殿
2773. pale[peil]
a.苍白的；浅的
2774. palm[pa:m]
n.手掌，手心；掌状物
2775. pan[p9n]
n.平底锅，盘子
2776. panda['p9nd2]
n.小猫熊；猫熊
2777. pane[pein]
n.窗格玻璃
2778. panel['p9nl]
n.专门小组；面，板
2779. pant[p9nt]
n.气喘；心跳
2780. paper['peip2]
n.纸；官方文件；文章
2781. parade[p2'reid]
n.游行；检阅 vi.游行
2782. paradise['p9r2dais]
n.伊甸乐园；天堂
2783. paragraph['p9r2gra:f]
n.(文章的)段，节
2784. parallel['p9r2lel]
a.平行的；相同的
2785. parcel['pa:sl]
n.包裹，小包，邮包
2786. pardon['pa:dn]
n.原谅；赦免 vt.原谅
2787. parent['p/2r2nt]
n.父亲，母亲，双亲
2788. park[pa:k]
n.公园；停车场
2789. parliament['pa:l2m2nt]
n.议会，国会
2790. part[pa:t]
n.一部分；零件；本份
2791. partial['pa:62l]
a.部分的；不公平的
2792. partially['pa:62li]
ad.部分地
2793. participate[pa:'tisipeit]
vi.参与，参加；分享
2794. particle['pa:tikl]
n.粒子，微粒
2795. particular[p2'tikjul2]
a.特殊的；特定的
2796. particularly[p2'tikjul2li]
ad.特别，尤其，格外
2797. partly['pa:tli]
ad.部分地，不完全地
2798. partner['pa:tn2]
n.伙伴；搭挡；配偶
2799. party['pa:ti]
n.党，党派；聚会
2800. pass[pa:s]
vt.经过；通过；度过
2801. passage['p9sid7]
n.通过；通路，通道
2802. passenger['p9sind72]
n.乘客，旅客，过路人
2803. passion['p962n]
n.激情，热情；爱好
2804. passive['p9siv]
a.被动的；消极的
2805. passport['pa:sp0:t]
n.护照
2806. past[past]
a.过去的 n.过去
2807. paste[peist]
n.糊，酱；浆湖
2808. pastime['pa:staim]
n.消遣，娱乐
2809. pat[p9t]
n.&vt.&n.轻拍
2810. patch[p9t6]
n.补钉；碎片 vt.补缀
2811. path[pa:4]
n.路，小道；道路
2812. patience['pei62ns]
n.忍耐，容忍，耐心
2813. patient['pei62nt]
a.忍耐的 n.病人
2814. pattern['p9t2n]
n.型，式样，模，模型
2815. pause[p0:z]
n.&vi.中止，暂停
2816. pave[peiv]
vt.铺，筑(路等)
2817. pavement['peivm2nt]
n.(英)人行道
2818. paw[p0:]
n.脚爪，爪子
2819. pay[pei]
vt.支付；付给；给予
2820. payment['peim2nt]
n.支付，支付的款项
2821. pea[pi:]
n.豌豆；豌豆属植物
2822. peace[pi:s]
n.和平；和睦；平静
2823. peaceful['pi:sful]
a.和平的；安静的
2824. peach[pi:t6]
n.桃子，桃树
2825. peak[pi:k]
n.山顶，巅 a.最高的
2826. pear[p/2]
n.梨子，梨树
2827. pearl[p2:l]
n.珍珠；珍珠母
2828. peasant['pez2nt]
n.农民
2829. pebble['pebl]
n.卵石，细砾
2830. peculiar[pi'kju:lj2]
a.特有的；特别的
2831. peel[pi:l]
vt.剥(皮)，削(皮)
2832. peep[pi:p]
vi.(从缝隙中)偷看
2833. pen[pen]
n.钢笔，自来水笔
2834. pencil['pensl]
n.铅笔
2835. penetrate['penitreit]
vt.穿过 vi.穿入
2836. peninsula[pi'ninsjul2]
n.半岛
2837. penny['peni]
n.(英)便士；(美)分
2838. pension['pen62n]
n.抚恤金，年金
2839. people['pi:pl]
n.人民，民族；人
2840. pepper['pep2]
n.胡椒，胡椒粉
2841. per[p2:]
prep.每
2842. perceive[p2'si:v]
vt.察觉，发觉；理解
2843. percent[p2'sent]
n.百分之…
2844. percentage[p2'sentid7]
n.百分比，百分率
2845. perfect['p2:fikt. 'p2:fekt]
a.完美的；完全的
2846. perfectly['p2:fiktli]
ad.很，完全
2847. perform[p2'f0:m]
vt.履行，执行；演出
2848. performance[p2'f0:m2ns]
n.履行；演出；行为
2849. perfume['p2:fju:m. p2:'fju:m]
n.香味，芳香；香料
2850. perhaps[p2'h9ps]
ad.也许，可能，多半
2851. period['pi2ri2d]
n.时期；学时；句号
2852. permanent['p2:m2n2nt]
a.永久的，持久的
2853. permanently['p2:m2n2ntli]
ad.永久地，持久地
2854. permission[p2(:)'mi62n]
n.允许，许可，同意
2855. permit[p2:'mit. 'p2:mit]
vt.允许 n.执照
2856. persist[p2:'sist]
vi.坚持，固执；持续
2857. person['p2:sn]
n.人；人身；本人
2858. personal['p2:s2nl]
a.个人的；本人的
2859. personnel[p2:s2'nel]
n.全体人员，全体职员
2860. perspective[p2:'spektiv]
n.透视；远景；观点
2861. persuade[p2:'sweid]
vt.说服 vi.被说服
2862. pessimistic[pesi'mistik]
a.悲观的；厌世的
2863. pet[pet]
n.爱畜；宠儿a.宠爱的
2864. petrol['petr2l]
n.(英)汽油
2865. petroleum[pi'tr2ulj2m]
n.石油
2866. phase[feiz]
n.阶段；方面；相位
2867. phenomenon[fi'n0min2n]
n.现象
2868. philosopher[fi'l0s2f2]
n.哲学家
2869. philosophy[fi'l0s2fi]
n.哲学；哲理；人生观
2870. phone[f2un]
n.电话，电话机；耳机
2871. photograph['f2ut2gra:f]
n.照片，相片
2872. photographic[f2ut2'gr9fik]
a.摄影的，摄影用的
2873. phrase[freiz]
n.短语；习惯用语
2874. physical['fizik2l]
a.物质的；物理的
2875. physician[fi'zi62n]
n.医生，内科医生
2876. physicist['fizisist]
n.物理学家
2877. physics['fiziks]
n.物理学
2878. piano[pi'9n2u]
n.钢琴
2879. pick[pik]
n.镐，鹤嘴锄
2880. pick[pik]
vt.拾，摘 vi.采摘
2881. picnic['piknik]
n.郊游，野餐 vi.野餐
2882. picture['pikt62]
n.画，图片 vt.画
2883. pie[pai]
n.(西点)馅饼
2884. piece[pi:s]
n.碎片，块 vt.拼合
2885. pierce[pi2s]
vt.剌穿 vi.穿入
2886. pig[pig]
n.猪，小猪，野猪
2887. pigeon[pid7in]
n.鸽子
2888. pile[pail]
n.堆 vt.堆叠，累积
2889. pill[pil]
n.药丸，丸剂
2890. pillar['pil2]
n.柱，柱子；栋梁
2891. pillow['pil2u]
n.枕头
2892. pilot['pail2t]
n.领航员；飞行员
2893. pin[pin]
n.针，饰针 n.别住
2894. pinch[pint6]
vt.捏，拧，掐掉
2895. pine[pain]
n.松树，松木
2896. pink[pi8k]
n.粉红色 a.粉红色的
2897. pint[paint]
n.品脱
2898. pioneer[pai2'ni2]
n.拓荒者；先驱者
2899. pipe[paip]
n.管子，导管；烟斗
2900. pipeline['paiplain]
n.管道，管线
2901. pistol['pistl]
n.手枪
2902. pit[pit]
n.坑，地坑；煤矿
2903. pitch[pit6]
n.沥青
2904. pitch[pit6]
vt.投，掷 vi.投掷
2905. pity['piti]
n.怜悯；遗憾 vt.同情
2906. place[pleis]
n.地方，地点；住所
2907. plain[plein]
n.平原 a.清楚的
2908. plan[pl9n]
n.&vt.计划，打算
2909. plane[plein]
n.平面；飞机
2910. planet['pl9nit]
n.行星
2911. plant[pla:nt]
n.植物；工厂 vt.栽种
2912. plantation[pl9n'tei62n]
n.种植园；栽植
2913. plaster['pla:st2]
n.灰泥；硬膏；熟石膏
2914. plastic['pl9stik]
a.可塑的 n.塑料
2915. plate[pleit]
n.板，片，盘 vt.电镀
2916. platform['pl9tf0:m]
n.平台；站台；讲台
2917. play[plei]
vi.玩，游戏；演奏
2918. player['plei2]
n.游戏的人；比赛者
2919. playground['pleigraund]
n.操场，运动场
2920. pleasant['pleznt]
a.令人愉快的，舒适的
2921. please[pli:z]
vt.使高兴，请vi.满意
2922. pleasure['ple72]
n.愉快，快乐；乐事
2923. plentiful['plentiful]
a.丰富的，富裕的
2924. plenty['plenti]
n.丰富，充足，大量
2925. plot[pl0t]
n.小块土地 vt.密谋
2926. plough[plau]
n.犁 vt.&vi.犁，耕
2927. pluck[pl3k]
vt.采，摘；拉下 n.拉
2928. plug[pl3g]
n.塞子；插头 vt.塞
2929. plunge[pl3nd7]
vt.使投入；使陷入
2930. plural['plu2r2l]
a.复数的 n.复数
2931. plus[pl3s]
prep.加，加上 a.正的
2932. P.M.[pi:'em]
n.下午，午后
2933. pocket['p0kit]
n.衣袋 n.袖珍的
2934. poem['p2uim]
n.诗，韵文，诗体文
2935. poet[p2uit]
n.诗人
2936. poetry['p2uitri]
n.诗，诗歌，诗作
2937. point[p0int]
n.点；要点；细目；分
2938. poison['p0izn]
n.毒，毒药 vt.毒害
2939. poisonous['p0izn2s]
a.有毒的，有害的
2940. pole[p2ul]
n.杆，柱
2941. pole[p2ul]
n.极(点)，磁极，电极
2942. police[p2'li:s]
n.警察；警察当局
2943. policeman[p2'li:sm2n]
n.警察
2944. policy['p0lisi]
n.政策，方针
2945. polish['p0li6]
vt.磨光；使优美
2946. polite[p2'lait]
a.有礼貌的；有教养的
2947. political[p2'litik2l]
a.政治的，政治上的
2948. politician[p0li'ti62n]
n.政治家；政客
2949. politics['p0litiks]
n.政治，政治学；政纲
2950. pollute[p2'lju:t]
vt.弄脏，污染，沾污
2951. pollution[p2'lu:62n]
n.污染
2952. pond[p0nd]
n.池塘
2953. pool[pu:l]
n.水塘，游泳池，水池
2954. pool[pu:l]
n.共用物 vt.共有
2955. poor[pu2]
a.贫穷的；贫乏的
2956. pop[p0p]
n.流行音乐，流行歌曲
2957. pop[p0p]
n.砰的一声，爆破声
2958. popular['p0pjul2]
a.民众的；流行的
2959. population[p0pju'lei62n]
n.人口；全体居民
2960. porch[p0:t6]
n.门廊，入口处
2961. pork[p0:k]
n.猪肉
2962. porridge['p0rid7]
n.粥，麦片粥
2963. port[p0:t]
n.港，港口
2964. portable['p0:t2bl]
a.轻便的；手提的
2965. porter['p0:t2]
n.搬运工人
2966. portion['p0:62n]
n.一部分；一分
2967. portrait['p0:trit]
n.消像，画像
2968. Portuguese[p0:tju'gi:z]
n.葡萄牙人；葡萄牙语
2969. position[p2'zi62n]
n.位置；职位；姿势
2970. positive['p0z2tiv]
a.确定的；积极的
2971. possess['p2'zes]
vt.占用，拥有(财产)
2972. possession[p2'ze62n]
n.有，所有；占有物
2973. possibility[p0s2'biliti]
n.可能；可能的事
2974. possible['p0s2bl]
a.可能的；可能存在的
2975. possibly['p0s2bli]
ad.可能地；也许
2976. post[p2ust]
n.柱，桩，杆 vt.贴出
2977. post[p2ust]
n.邮政，邮寄；邮件
2978. post[p2ust]
n.岗位，哨所；职位
2979. postage['p2ustid7]
n.邮费，邮资
2980. postman['p2ustm2n]
n.邮递员
2981. postpone[p2ust'p2un]
vt.延迟，推迟，延缓
2982. pot[p0t]
n.锅，壶，罐，盆
2983. potato[p2u'teit2u]
n.马铃薯，土豆
2984. potential[p2'ten62l]
a.潜在的 n.潜力
2985. pound[paund]
n.磅；英磅
2986. pound[paund]
vt.捣碎；舂烂；猛击
2987. pour[p0:]
vt.灌，倒 vi.倾泻
2988. poverty['p0v2ti]
n.贫穷，贫困
2989. powder['paud2]
n.粉末；药粉；火药
2990. power['pau2]
n.能力；力；权；幂
2991. powerful['pau2ful]
a.强有力的；有权威的
2992. practical['pr9ktik2l]
a.实践的；实用的
2993. practically['pr9ktik2li]
ad.实际上；几乎
2994. practice['pr9ktis]
n.实践；练习；业务
2995. practise['pr9ktis]
vt.练习，实习，训练
2996. praise[preiz]
n.赞扬，赞美 vi.赞扬
2997. pray[prei]
vt.&vi.请求；祈祷
2998. prayer['pr/2]
n.祈祷，祈求
2999. precaution[pri'k0:62n]
n.预防；警惕
3000. preceding[pri(:)'si:di8]
a.在前的；在先的
3001. precious['pre62s]
a.珍贵的，宝贵的
3002. precise[pri'sais]
a.精确的，准确的
3003. precision[pri'si72n]
n.精确，精密，精密度
3004. predict[pri'dikt]
v.预言，预告，预测
3005. preface['prefis]
n.序言，前言，引语
3006. prefer[pri'f2:]
vt.宁可，宁愿
3007. preferable['pref2r2bl]
a.更可取的，更好的
3008. preference['pref2r2ns]
n.偏爱，优先；优先权
3009. prejudice['pred7udis]
n.偏见，成见
3010. preliminary[pri'limin2ri]
a.预备的，初步的
3011. premier['premj2]
n.总理，首相
3012. preparation[prep2'rei62n]
n.准备，预备；制备
3013. prepare[pri'p/2]
vt.&vi.准备，预备
3014. preposition[prep2'zi62n]
n.前置词，介词
3015. prescribe[pris'kraib]
vt.命令；处(方)
3016. presence['prezns]
n.出席，到场；在
3017. present['preznt]
a.现在的 n.目前
3018. present['preznt]
vt.赠送; 介绍; 提出
3019. present['preznt]
n.礼物，赠送物
3020. presently['prez2ntli]
ad.一会儿；目前
3021. preserve[pri'z2:v]
vt.保护；保存；腌渍
3022. president['prezid2nt]
n.总统；校长；会长
3023. press[pres]
vt.压，按，揿；催促
3024. pressure['pre62]
n.压力；压力；压，按
3025. pretend[pri'tend]
vt.假托，借口vi.假装
3026. pretty['priti]
a.漂亮的，标致的
3027. prevail[pri'veil]
vi.胜，优胜；流行
3028. prevent[pri'vent]
vt.预防，防止；阻止
3029. previous['pri:vj2s]
a.先的；前的 ad.在前
3030. previously['pri:vj2sli]
ad.先前，预先
3031. price[prais]
n.价格，价钱；代价
3032. pride[praid]
n.骄傲；自豪 vt.自夸
3033. priest[pri:st]
n.教士，牧师，神父
3034. primarily['praim2rili]
ad.首先；主要地
3035. primary['praim2ri]
a.最初的；基本的
3036. prime[praim]
a.首要的 n.春，青春
3037. primitive['primitiv]
a.原始的；粗糙的
3038. prince['prins]
n.王子，亲王
3039. princess[prin'ses]
n.公主，王妃
3040. principal['prins2p2l]
a.主要的 n.负责人
3041. principle['prins2pl]
n.原则，原理；主义
3042. print[print]
vt.印刷 n.印刷；正片
3043. prior['prai2]
a.在先的；优先的
3044. prison['prizn]
n.监狱，监禁
3045. prisoner['prizn2]
n.囚犯
3046. private['praivit]
a.私人的；私下的
3047. privilege['privilid7]
n.特权，优惠
3048. prize[praiz]
n.奖赏，奖金 vt.珍视
3049. probability[pr0b2'biliti]
n.可能性；概率
3050. probable['pr0b2bl]
a.或有的；大概的
3051. probably['pr0b2bli]
ad.或许，大概
3052. problem['pr0bl2m]
n.问题；习题，问题
3053. procedure[pr2'si:d72]
n.程序；手续；过程
3054. proceed[pr2'si:d]
vi.进行；继续进行
3055. process['pr2uses]
n.过程；工序 vt.加工
3056. procession[pr2'se62n]
n.队伍，行列
3057. proclaim[pr2'kleim]
vt.宣告，宣布；表明
3058. produce[pr2'dju:s. 'pr0dju:s]
vt.生产；产生；展现
3059. product['pr0d2kt]
n.产品，产物；(乘)积
3060. production[pr2'd3k62n]
n.生产；产品；总产量
3061. productive[pr2'd3ktiv]
a.生产的；丰饶的
3062. profession[pr2'fe62n]
n.职业
3063. professional[pr2'fe62nl]
a.职业的 n.专业人员
3064. professor[pr2'fes2]
n.教授
3065. profit['pr0fit]
n.益处；利润 vi.得益
3066. program['pr2ugr9m]
n.节目单；大纲；程序
3067. progress['pr2ugres. pr2'gres]
n.前进，进展；进步
3068. progressive[pr2'gresiv]
a.进步的；向前进的
3069. prohibit[pr2'hibit]
vt.禁止，阻止
3070. project[pr2'd7ekt. 'pr0d7ekt]
n.方案，工程 vi.伸出
3071. prominent['pr0min2nt]
a.实起的；突出的
3072. promise['pr0mis]
n.诺言；指望 vt.允诺
3073. promising['pr0misi8]
a.有希望的；有前途的
3074. promote[pr2'm2ut]
vt.促进，发扬；提升
3075. prompt[pr0mpt]
a.及时的 vt.敦促
3076. pronoun['pr2unaun]
n.代名词
3077. pronounce[pr2'nauns]
vt.发…的音；宣布
3078. pronunciation[pr2n3nsi'ei62n]
n.发音，发音法
3079. proof[pru:f]
n.证据；证明；校样
3080. proper['pr0p2]
a.适合的；合乎体统的
3081. properly['pr0p2li]
ad.适当地；彻底地
3082. property['pr0p2ti]
n.财产，资产；性质
3083. proportion[pr2'p0:62n]
n.比，比率，部分
3084. proportional[pr2'p0:62nl]
a.比例的；相称的
3085. proposal[pr2'p2uz2l]
n.提议，建议；求婚
3086. propose[pr2'p2uz]
vt.提议 vi.求婚
3087. prospect['pr0spekt. pr2s'pekt]
n.展望；前景，前程
3088. prosperity[pr0s'periti]
n.繁荣；昌盛，兴旺
3089. prosperous['pr0sp2r2s]
a.繁荣的，昌盛的
3090. protect[pr2'tekt]
vt.保护，保卫，警戒
3091. protection[pr2'tek62n]
n.保护，警戒
3092. protective[pr2'tektiv]
a.保护的，防护的
3093. protein['pr2uti:n]
n.蛋白质，朊
3094. protest[pr2'test. 'pr2utest]
vt.&vi.&n.抗议
3095. proud[praud]
a.骄傲的；自豪的
3096. prove[pru:v]
vt.证明 vi.结果是
3097. provide[pr2'vaid]
vt.提供；装备，供给
3098. provided[pr2'vaidid]
conj.以…为条件
3099. province['pr0vins]
n.省；领域，部门
3100. provision[pr2'vi72n]
n.供应；预备；存粮
3101. psychological[saik2'l0d7ik2l]
a.心理的，心理学的
3102. public['p3blik]
a.公众的 n.公众
3103. publication[p3bli'kei62n]
n.公布；出版；出版物
3104. publish['p3bli6]
vt.公布；发表；出版
3105. pudding['pudi8]
n.布丁
3106. puff[p3f]
n.(一)喷，(一)吹
3107. pull[pul]
vt.拉，拖；拉，拉力
3108. pulse[p3ls]
n.脉搏；脉冲，脉动
3109. pump[p3mp]
n.泵 vt.用抽机抽
3110. punch[p3nt6]
vt.冲出 n.冲压机
3111. punch[p3nt6]
vt.用拳猛击 n.拳打
3112. punctual['p38ktju2l]
a.严守时刻的；准时的
3113. punish['p3ni6]
vt.罚，惩罚，处罚
3114. punishment['p3ni6m2nt]
n.罚，惩罚，处罚
3115. pupil['pju:pl]
n.学生，小学生
3116. pupil['pju:pl]
n.瞳孔
3117. puppet['p3pit]
n.木偶，玩偶；傀儡
3118. purchase['p2:t62s]
n.买，购买 vt.买
3119. pure[pju2]
a.纯粹的；纯洁的
3120. purely['pju2li]
ad.纯粹地，完全地
3121. purify['pju2rifai]
vt.使纯净，使洁净
3122. purity['pju2riti]
n.纯净；纯洁；纯度
3123. purple['p2:pl]
n.紫色 a.紫的
3124. purpose['p2:p2s]
n.目的；意图；效果
3125. purse[p2:s]
n.钱包，小钱袋，手袋
3126. pursue[p2'sju:]
vt.追赶，追踪；进行
3127. pursuit[p2'sju:t]
n.追赶；追求；事务
3128. push[pu6]
vt.推，逼迫 vi.推
3129. put[put]
vt.放，摆；使处于
3130. puzzle['p3zl]
n.难题；谜 vi.使迷惑
3131. qualify['kw0lifai]
vt.使具有资格
3132. quality['kw0liti]
n.质量；品质，特性
3133. quantity['kw0ntiti]
n.量，数量，分量
3134. quarrel['kw0r2l]
n.争吵，吵架，口角
3135. quart['kw0:t]
n.夸脱(=2品脱)
3136. quarter['kw0:t2]
n.四分之一；一刻钟
3137. quarterly['kw0:t2li]
a.季度的 ad.季度地
3138. queen[kwi:n]
n.王后；女王
3139. queer['kwi2]
a.奇怪的，古怪的
3140. question['kwest62n]
n.发问；问题；疑问
3141. queue[kju:]
n.行列 vi.排队等候
3142. quick[kwik]
a.快的；敏捷的
3143. quicken['kwik2n]
vt.加快 vi.加快
3144. quickly['kwikli]
ad.快，迅速
3145. quiet['kwai2t]
a.寂静的；安静的
3146. quilt[kwilt]
n.被(子)
3147. quit[kwit]
vt.离开，退出；停止
3148. quite[kwait]
ad.完全；相当；的确
3149. quiz[kwiz]
n.小型考试，测验
3150. quotation[kw2u'tei62n]
n.引用；引文；报价单
3151. quote[kw2ut]
vt.引用，引证；报价
3152. rabbit['r9bit]
n.兔子，野兔
3153. race[reis]
n.比赛，竞赛，竞争
3154. race[reis]
n.人种，种族，民族
3155. racial['rei62l]
a.种族的，人种的
3156. rack[r9k]
n.搁物架；行李架
3157. rack[r9k]
vt.使苦痛，折磨
3158. racket['r9kit]
n.球拍
3159. radar['reid2]
n.雷达，无线电探测器
3160. radiate['reidieit]
vi.发射光线；辐射
3161. radiation[reidi'ei62n]
n.放射，发射；辐射能
3162. radio['reidi2u]
n.无线电；收音机
3163. radioactive[reidi2u'9ktiv]
a.放射性的
3164. radioactivity[reidi2u9k'tiviti]
n.放射性，放射(现象)
3165. radish['r9di6]
n.小萝卜
3166. radium['reidj2m]
n.镭
3167. radius['reidj2s]
n.半径
3168. rag[r9g]
n.破布，碎布，抹布
3169. rage[reid7]
n.(一阵)狂怒，盛怒
3170. raid[reid]
n.袭击；突然搜查
3171. rail[reil]
n.横条，横杆；铁轨
3172. railroad['reilr2ud]
n.铁路 vi.由铁路运输
3173. railway['reilwei]
n.铁路，铁道
3174. rain[rein]
n.雨，雨水 vi.下雨
3175. rainbow['reinb2u]
n.虹，彩虹
3176. rainy['reini]
a.下雨的，多雨的
3177. raise['reiz]
vt.举起；引起；提高
3178. rake[reik]
n.耙子 vi.耙；搜索
3179. range[reind7]
n.排，行；山脉；范围
3180. rank[r98k]
n.排，横行；社会阶层
3181. rapid['r9pid]
a.快的 n.急流
3182. rapidly['r9pidli]
ad.迅速地
3183. rare[r/2]
a.稀薄的；稀有的
3184. rarely['r/2li]
ad.很少，难得
3185. rat[r9t]
n.老鼠，耗子
3186. rate[reit]
n.比率；速度；价格
3187. rather['ra:52]
ad.宁可，宁愿；相当
3188. ratio['rei6i2u]
n.比，比率
3189. rational['r962nl]
a.理性的；出于理性的
3190. raw[r0:]
a.未煮过的；未加工的
3191. ray[rei]
n.光线，射线，辐射线
3192. razor['reiz2]
n.剃刀
3193. reach[ri:t6]
vt.抵达；伸出vi.达到
3194. react[ri'9kt]
vi.起反应；有影响
3195. reaction[ri'9k62n]
n.反应；反作用
3196. read[ri:d]
vt.读，看懂 vi.读
3197. reader['ri:d2]
n.读者；读物，读本
3198. readily['redili]
ad.乐意地；无困难地
3199. reading['ri:di8]
n.读，阅读；读书
3200. ready['redi]
a.准备好的；愿意的
3201. real[ri2l]
a.真的；现实的
3202. reality[ri'9liti]
n.现实；真实
3203. realize['ri2laiz]
vt.实现；认识到
3204. really['ri2li]
ad.真正地；实在
3205. realm['relm]
n.王国，国土；领域
3206. reap[ri:p]
vt.&vi.收割，收获
3207. rear[ri2]
n.后部，后面；背面
3208. rear[ri2]
vt.抚养，培养；栽种
3209. reason['ri:zn]
n.理由；理性 vi.推理
3210. reasonable['ri:zn2bl]
a.合情合理的；公道的
3211. rebel['reb2l. ri'bel]
vi.造反 n.造反者
3212. rebellion[ri'belj2n]
n.造反；叛乱；反抗
3213. recall[ri'k0:l]
vt.回想；叫回；收回
3214. receipt[ri'si:t]
n.收到；收条，收据
3215. receive[ri'si:v]
vt.收到；得到；接待
3216. receiver[ri'si:v2]
n.收受者，收件人
3217. recent['ri:snt]
a.新近的，最近的
3218. recently['ri:sntli]
ad.最近，新近
3219. reception[ri'sep62n]
a.接待；招待会；接受
3220. recite[ri'sait]
vt.&vi.背诵，朗诵
3221. recognition[rek2g'ni62n]
n.认出，识别；承认
3222. recognize['rek2gnaiz]
vt.认识，认出；承认
3223. recollect['ri:k2'lekt]
vt.回忆，追忆，想起
3224. recommend[rek2'mend]
vt.推荐，介绍；劝告
3225. recommendation[rek2men'dei62n]
n.推荐，介绍；劝告
3226. record['rek0:d. ri'k0:d]
n.记录；履历 vt.记录
3227. recorder[ri'k0:d2]
n.记录者；录音机
3228. recover[ri'k3v2]
vt.重新获得；挽回
3229. recovery[ri'k3v2ri]
n.重获；痊愈，恢复
3230. red[red]
a.红色的 n.红色
3231. reduce[ri'dju:s]
vt.减少，减小；简化
3232. reduction[ri'd3k62n]
n.减少，减小，缩减
3233. reed[ri:d]
n.芦苇，芦杆，芦丛
3234. reel[ri:l]
n.卷轴，卷筒
3235. refer[ri'f2:]
vt.使求助于 vi.谈到
3236. reference['ref2r2ns]
n.参考；出处；提及
3237. refine[ri'fain]
vt.&vi.精炼，提纯
3238. reflect[ri'flekt]
vt.反射；反映；思考
3239. reflection[ri'flek62n]
n.反射；映象；反映
3240. reflexion[ri'flek62n]
n.反射；映象；反映
3241. reform[ri'f0:m]
vt.&n.改革，改良
3242. refresh[ri'fre6]
vt.使清新vi.恢复精神
3243. refreshment[ri'fre6m2nt]
n.茶点，点心，便餐
3244. refrigerator[ri'frid72reit2]
n.冰箱，冷藏库
3245. refuge['refju:d7]
n.避难，庇护；庇护者
3246. refusal[ri'fju:z2l]
n.拒绝
3247. refuse[ri'fju:z]
vt.拒绝 vt.拒绝
3248. refute[ri'fju:t]
vt.驳斥，反驳，驳倒
3249. regard[ri'ga:d]
vt.把…看作；尊敬
3250. regarding[ri'ga:di8]
prep.关于
3251. regardless[ri'ga:dlis]
ad.不顾一切地
3252. region['ri:d72n]
n.地区，地带；领域
3253. register['red7ist2]
n.&vt.登记，注册
3254. regret[ri'gret]
vt.懊悔；抱歉 n.懊悔
3255. regular['regjul2]
a.规则的；整齐的
3256. regularly['regjul2li]
ad.有规律地
3257. regulate['regjuleit]
vt.管理，控制；调整
3258. regulation[regju'lei62n]
n.规则，规章；管理
3259. rehearsal[ri'h2:s2l]
n.排练，排演；练习
3260. reign[rein]
n.君主统治；支配
3261. rein[rein]
n.缰绳 vi.驾驭，控制
3262. reinforce[ri:in'f0:s]
vt.增援，支援；加强
3263. reject[ri'd7ekt]
vt.拒绝；丢掉；驳回
3264. rejoice[ri'd70is]
vi.欣喜，高兴
3265. relate[ri'leit]
vt.叙述；使联系
3266. relation[ri'lei62n]
n.关系，联系；家属
3267. relationship[ri'lei62n6ip]
n.关系，联系
3268. relative['rel2tiv]
a.有关系的；相对的
3269. relatively['rel2tivli]
ad.相对地，比较地
3270. relativity[rel2'tiviti]
n.相关性；相对性
3271. relax[ri'l9ks]
vt.使松弛 vi.松弛
3272. release[ri'li:s]
vt.释放；放松；发表
3273. relevant['reliv2nt]
a.有关的，贴切的
3274. reliability[rilai2'biliti]
n.可靠性
3275. reliable[ri'lai2bl]
a.可靠的，可信赖的
3276. reliance[ri'lai2ns]
n.信任，信赖，信心
3277. relief[ri'li:f]
n.减轻；救济；援救
3278. relieve[ri'li:v]
vt.减轻，解除；救济
3279. religion[ri'lid72n]
n.宗教；宗教信仰
3280. religious[ri'lid72s]
a.宗教的；虔诚的
3281. reluctant[ri'l3kt2nt]
a.不愿的，勉强的
3282. rely[ri'lai]
vi.依赖，依靠；信赖
3283. remain[ri'mein]
vi.剩下，余留；保持
3284. remains[ri'meinz]
n.残余，余额；废墟
3285. remark[ri'ma:k]
vt.&vi.&n.评论，谈论
3286. remarkable[ri'ma:k2bl]
a.异常的，非凡的
3287. remedy['remidi]
n.&vt.治疗；补救
3288. remember[ri'memb2]
vt.记得，想起；记住
3289. remind[ri'maind]
vt.提醒，使想起
3290. remote[ri'm2ut]
a.相隔很远的；冷淡的
3291. removal[ri'mu:v2l]
n.移动；迁移；除掉
3292. remove[ri'mu:v]
vt.移动，搬开；脱掉
3293. render['rend2]
vt.表示，给予；使得
3294. renew[ri'nju:]
vt.使更新 vi.更新
3295. rent[rent]
n.租金，租 vi.出租
3296. repair[ri'p/2]
vt.&n.修理，修补
3297. repeat[ri'pi:t]
vt.重说，重做 n.重复
3298. repeatedly[ri'pi:tidli]
ad.重复地；一再
3299. repent[ri'pent]
vi.悔悟，悔改vt.后悔
3300. repetition[repi'ti62n]
n.重复，反复
3301. replace[ri'pleis]
vt.把…放回；取代
3302. reply[ri'plai]
vi.&n.回答，答复
3303. report[ri'p0:t]
vt.&vi.报告；汇报
3304. reporter[ri'p0:t2]
n.记者，通讯员
3305. represent[repri'zent]
vt.描绘；代表；象征
3306. representative[repri'zent2tiv]
a.代表性的 n.代表
3307. reproach[ri'pr2ut6]
vt.&n.责备，指责
3308. reproduce[ri:pr2'dju:s]
vt.&vi.繁殖，生殖
3309. republic[ri'p3blik]
n.共和国，共和政体
3310. republican[ri'p3blik2n]
a.共和国的
3311. reputation[repju(:)'tei62n]
n.名誉，名声；好名声
3312. request[ri'kwest]
n.&v.请求，要求
3313. require[ri'kwai2]
vt.需要；要求，命令
3314. requirement[ri'kwai2m2nt]
n.需要；要求
3315. rescue['reskju:]
vt.&n.援救，营救
3316. research[ri's2:t6]
n.&vi.调查，探究
3317. researcher[ri's2:t62]
n.调查者；探究者
3318. resemble[ri'zembl]
vt.像，类似
3319. reserve[ri'z2:v]
vt.储备，保留；预定
3320. reservior[]
n.水库；蓄水池
3321. residence['rezid2ns]
n.居住；驻扎；住处
3322. resident['rezid2nt]
a.居住的 n.居民
3323. resign[ri'zain]
vt.放弃 vi.辞职
3324. resignation[rezig'nei62n]
n.放弃，辞职，反抗
3325. resist[ri'zist]
vt.&vi.抵抗，抵制
3326. resistance[ri'zist2ns]
n.抵抗；抵制；抵抗力
3327. resistant[ri'zist2nt]
a.抵抗的，反抗的
3328. resolution[rez2'lju:62n]
n.坚决，坚定；决定
3329. resolve[ri'z0lv]
vt.解决；决心 n.决心
3330. resort[ri'z0:t]
vi.&n.求助，凭借
3331. resource[ri's0:s]
n.资源，物力；办法
3332. respect[ris'pekt]
n.&vt.尊敬，尊重
3333. respectful[ris'pektful]
a.恭敬的，尊重的
3334. respective[ris'pektiv]
各自的，各个的
3335. respectively[ris'pektivli]
ad.各自地，分别地
3336. respond[ris'p0nd]
vi.作答；响应
3337. response[ris'p0ns]
n.作答，回答；响应
3338. responsibility[risp0ns2'biliti]
n.责任，责任心；职责
3339. responsible[ris'p0ns2bl]
a.有责任的；尽责的
3340. rest[rest]
n.休息；安静；静止
3341. rest[rest]
n.剩余部分；其余的人
3342. restaurant['rest2r0nt]
n.餐馆，饭店，菜馆
3343. restless['restlis]
a.不安定的，焦虑的
3344. restore[ris't0:]
vt.恢复；归还；修补
3345. restrain[ris'trein]
vt.抑制，遏制；限制
3346. restraint[ris'treint]
n.抑制；遏制；克制
3347. restrict[ris'trikt]
vt限制，限定，约束
3348. restriction[ris'trik62n]
n.限制，限定，约束
3349. result[ri'z3lt]
n.成果 vi.发生，结果
3350. resume[ri'zju:m]
vt.恢复；重新开始
3351. retain[ri'tein]
vt.保持，保留，保有
3352. retell['ri:'tel]
vt.再讲，重述，复述
3353. retire[ri'tai2]
vi.退下；引退；就寝
3354. retreat[ri'tri:t]
vi.(被迫)退却，后退
3355. return[ri't2:n]
vi.&n.回来，返回
3356. reveal[ri'vi:l]
vt.展现；揭示，揭露
3357. revenge[ri'vend7]
vt.替…报仇 n.报仇
3358. reverse[ri'v2:s]
vt.颠倒，翻转 n.背面
3359. review[ri'vju:]
vt.再检查 n.复习
3360. revise[ri'vaiz]
vt.修订，校订；修改
3361. revolt[ri'v2ult]
vi.&n.反抗，造反
3362. revolution[rev2'lu:62n]
n.革命；旋转，绕转
3363. revolutionary[rev2'lu:62n2ri]
a.革命的 n.革命者
3364. reward[ri'w0:d]
n.报答；报酬 vt.报答
3365. rhythm['ri52m]
n.韵律，格律；节奏
3366. rib[rib]
n.肋，肋骨
3367. ribbon['rib2n]
n.缎带，丝带；带
3368. rice[rais]
n.稻，米，饭
3369. rich[rit6]
a.富的，丰富的
3370. rid[rid]
vt.使摆脱，使去掉
3371. riddle['ridl]
n.谜，谜语
3372. ride[raid]
vi.&n.骑马，乘车
3373. rider['raid2]
n.骑马的人；乘车的人
3374. ridge[rid7]
n.脊；岭，山脉；垄
3375. ridiculous[ri'dikjul2s]
a.荒谬的，可笑的
3376. rifle['raifl]
n.步枪，来复枪
3377. right[rait]
a.正确的 ad.对，正好
3378. rigid['rid7id]
a.刚硬的；僵硬的
3379. ring[ri8]
n.环形物(如圈、环等)
3380. ring[ri8]
vi.鸣；按铃 n.铃声
3381. ripe[raip]
a.熟的；时机成熟的
3382. ripen['raip2n]
vt.使熟 vi.成熟
3383. rise[raiz]
vi.起立；升起；上涨
3384. risk[risk]
n.风险，危险，冒险
3385. rival['raiv2l]
n.竞争者 a.竞争的
3386. river['riv2]
n.江，河，水道
3387. road[r2ud]
n.路，道路，公路
3388. roar[r0:]
vi.吼叫；呼喊 n.吼
3389. roast[r2ust]
vt.&vi.烤，炙，烘
3390. rob[r0b]
vt.&vi.抢劫；劫掠
3391. robber['r0b2]
n.强盗，盗贼
3392. robbery['r0b2ri]
n.抢劫，劫掠，盗取
3393. robe[r2ub]
n.长袍，长衣，浴衣
3394. robot['r2ub0t]
n.机器人；自动机
3395. rock[r0k]
vt.摇，使动摇 vi.摇
3396. rock[r0k]
n.岩，岩石；石头
3397. rocket['r0kit]
n.火箭，火箭发动机
3398. rod[r0d]
n.杆，竿，棒
3399. role[r2ul]
n.角色，作用，任务
3400. roll[r2ul]
vi.&vt.滚动；转动
3401. roller['r2ul2]
n.滚柱，滚筒，滚轴
3402. Roman['r2um2n]
n.古罗马人 a.罗马的
3403. romantic[r2u'm9ntik]
a.浪漫的；传奇的
3404. roof[ru:f]
n.屋顶，车顶；顶
3405. room[ru:m. rum]
n.房间；地位；余地
3406. root[ru:t]
n.根，根子 vi.生根
3407. rope[r2up]
n.绳，索
3408. rose[r2uz]
n.蔷薇花，蔷薇科植物
3409. rot[r0t]
vt.烂，腐坏 n.腐烂
3410. rotary['r2ut2ri]
a.旋转的，转动的
3411. rotate[r2u'teit]
vi.旋转 vt.使旋转
3412. rotation[r2u'tei62n]
n.旋转，转动；循环
3413. rotten['r0tn]
a.腐烂的，发臭的
3414. rough[r3f]
a.表面不平的；粗略的
3415. roughly['r3fli]
ad.粗糙地，粗略地
3416. round[raund]
a.圆的 n.兜圈；一轮
3417. rouse[rauz]
vt.唤醒，唤起；惊起
3418. route[ru:t]
n.路，路线，路程
3419. routine[ru:'ti:n]
n.例行公事 a.日常的
3420. row[r2u]
n.(一)排，(一)行
3421. row[r2u]
vt.划(船等) vi.划船
3422. royal['r0i2l]
a.王的；皇家的
3423. rub[r3b]
vt.摩擦，擦 vi.摩擦
3424. rubber['r3b2]
n.橡皮(擦子)；橡胶
3425. rubbish['r3bi6]
n.垃圾，废物；废话
3426. rude[ru:d]
a.加工粗糙的；粗野的
3427. rug[r3g]
n.小地毯；毛毯
3428. ruin['ruin]
n.毁灭；废墟 vt.毁坏
3429. rule[ru:l]
n.统治；规定；习惯
3430. ruler['ru:l2]
n.统治者；尺，直尺
3431. rumour['ru:m2]
n.谣言，谣传，传闻
3432. run[r3n]
vi.跑，奔；行驶；流
3433. runner['r3n2]
n.赛跑的人
3434. rural['ru2r2l]
a.农村的，田园的
3435. rush[r36]
vi.冲，奔 vt.催促
3436. Russian['r362n]
a.俄罗斯的 n.俄国人
3437. rust[r3st]
n.锈 vi.生锈，氧化
3438. rusty['r3sti]
a.生锈的；变迟钝的
3439. sack[s9k]
n.袋，麻袋；开除
3440. sacred['seikrid]
a.上帝的；神圣的
3441. sacrifice['s9krifais]
n.&vt.牺牲；南祭
3442. sad[s9d]
a.悲哀的，令人悲痛的
3443. saddle['s9dl]
n.鞍子，马鞍
3444. sadly['s9dli]
ad.悲痛地，悲哀地
3445. sadness['s9dnis]
n.悲痛，悲哀
3446. safe[seif]
a.安全的；谨慎的
3447. safe[seif]
n.保险箱
3448. safely['seifli]
ad.安全地；可靠地
3449. safety['seifti]
n.安全，保险
3450. sail[seil]
n.帆；船  vi.航行
3451. sailor['seil2]
n.水手，海员，水兵
3452. saint[seint]
n.圣徒；基督教徒
3453. sake[seik]
n.缘故，理由
3454. salad['s9l2d]
n.色拉；莴苣，生菜
3455. salary['s9l2ri]
n.薪金，薪水
3456. sale[seil]
n.卖；拍卖；销售额
3457. salesman['seilzm2n]
n.售货员，推销员
3458. salt[s0:lt]
n.盐；盐类 vt.加盐于
3459. salute[s2'lju:t]
n.招呼，行礼 vi.行礼
3460. same[seim]
a.同一的，相同的
3461. sample['sa:mpl]
n.样品；实例，标本
3462. sand[s9nd]
n.沙，沙子；沙滩
3463. sandwich['s9nwid7]
n.三明治 vt.夹入
3464. sandy['s9ndi]
n.沙的，含沙的
3465. satellite['s9t2lait]
n.卫星；人造卫星
3466. satisfaction[s9tis'f9k62n]
n.满意；快事；赔偿
3467. satisfactory[s9tis'f9kt2ri]
a.令人满意的，良好的
3468. satisfy['s9tisfai]
vt.满足；使满意
3469. Saturday['s9t2di]
n.星期六
3470. sauce[s0:s]
n.调味汁，酱汁
3471. saucer['s0:s2]
n.茶托，浅碟
3472. sausage['s0sid7]
n.香肠，腊肠
3473. save[seiv]
vt.救；节省；储蓄
3474. saving['seivi8]
n.搭救；节约；存款
3475. saw[s0:]
n.锯子 vt.锯，锯开
3476. say[sei]
vt.说；说明；比如说
3477. scale[skeil]
n.天平，磅秤，秤
3478. scale[skeil]
n.标度；比例；大小
3479. scan[sk9n]
vt.细看；浏览；扫描
3480. scar[ska:]
n.伤疤，伤痕；创伤
3481. scarce[sk/2s]
a.缺乏的；希有的
3482. scarcely['sk/2sli]
ad.仅仅；几乎不
3483. scare[sk/2]
vt.惊吓 vi.受惊
3484. scarf[ska:f]
n.围巾，头巾；领带
3485. scatter['sk9t2]
vt.使消散；撒；散播
3486. scene[si:n]
n.发生地点；道具
3487. scenery['si:n2ri]
n.舞台布景；风景
3488. scent[sent]
n.气味，香味；香水
3489. schedule['6edju:l]
n.时间表；计划表
3490. scheme[ski:m]
n.计划，规划；诡计
3491. scholar['sk0l2]
n.学者(尤指文学方面)
3492. scholarship['sk0l26ip]
n.学业成绩；奖学金
3493. school[sku:l]
n.学校；学院；学派
3494. science['sai2ns]
n.科学，科学研究
3495. scientific[sai2n'tifik]
a.科学(上)的
3496. scientist['sai2ntist]
n.(自然)科学家
3497. scissors['siz2z]
n.剪刀，剪子
3498. scold[sk2uld]
vi.责骂 vt.申斥
3499. scope[sk2up]
n.范围；余地，机会
3500. score[sk0:]
n.得分，比数，成绩
3501. scorn[sk0:n]
n.轻蔑；嘲笑 vt.轻蔑
3502. scout[skaut]
n.侦察员，侦察机
3503. scrape[skreip]
vt.&vi.&n.刮，擦
3504. scratch[skr9t6]
vt.&vi.&n.搔；抓
3505. scream[skri:m]
vi.尖叫；呼啸
3506. screen[skri:n]
n.屏；屏幕 vt.掩蔽
3507. screw[skru:]
n.螺旋，螺丝 vt.拧紧
3508. sea[si:]
n.海，海洋
3509. seal['si:l]
n.封蜡；印记 vt.封
3510. seal['si:l]
n.海豹
3511. seaman['si:m2n]
n.海员，水手；水兵
3512. seaport['si:p0:t]
n.海港，港市
3513. search[s2:t6]
vt.在…中搜寻，搜查
3514. season['si:zn]
n.季，季节，时节
3515. seat[si:t]
n.座；座部 vt.使坐下
3516. second['sek2nd]
num.第二 a.二等的
3517. second['sek2nd]
n.秒
3518. secondary['sek2nd2ri]
a.第二的；次要的
3519. secondly['sek2ndli]
ad.第二(点)；其次
3520. secret['si:krit]
a.秘密的；隐蔽的
3521. secretary['sekr2tri]
n.秘书；书记；大臣
3522. section['sek62n]
n.切片；一段；部门
3523. secure[si'kju2]
a.安心的；安全的
3524. security[si'kju2riti]
n.安全，安全感
3525. see[si:]
vt.看见；遇见；看出
3526. seed[si:d]
n.种(子)，籽，萌芽
3527. seek[si:k]
vt.寻找，探索；试图
3528. seem[si:m]
vi.好像，似乎
3529. seize[si:z]
vt.抓住，逮捕；夺取
3530. seldom['seld2m]
ad.很少，不常，难得
3531. select[si'lekt]
vt.&vi.选择，挑选
3532. selection[si'lek62n]
n.选择，挑选；精选物
3533. self[self]
n.自我，自己
3534. selfish['selfi6]
a.自私的，利己的
3535. sell[sel]
vt.&vi.卖，销售
3536. seller['sel2]
n.卖者；行销货
3537. semester[s2'mest2]
n.半年；学期，半学年
3538. semiconductor[semik2n'd3kt2]
n.半导体
3539. senate[senit]
n.参议院，上院
3540. send[send]
vt.送，寄发；派遣
3541. senior['si:nj2]
a.年少的；地位较高的
3542. sense[sens]
n.感官；感觉；见识
3543. sensible['sens2bl]
a.感觉得到的；明智的
3544. sensitive['sensitiv]
a.敏感的；灵敏的
3545. sentence['sent2ns]
n.判决；句子 vt.宣判
3546. separate['sep2reit. 'sep2rit]
a.分离的；个别的
3547. separately['sep2ritli]
ad.分离地
3548. separation[sep2'rei62n]
n.分离，分开；分居
3549. September[sep'temb2]
n.九月
3550. sequence['si:kw2ns]
n.连续，继续；次序
3551. series['si2ri:z]
n.连续，系列；丛书
3552. serious['si2ri2s]
a.严肃的；认真的
3553. seriously['si2ri2sli]
ad.严肃地，认真地
3554. servant['s2:v2nt]
n.仆人，佣人，雇工
3555. serve[s2:v]
vt.为…服务；招待
3556. service['s2:vis]
n.服务；行政部门
3557. session['se62n]
n.会议，一段时间
3558. set[set]
vt.放；安置 vi.落
3559. setting['seti8]
n.安装，调整；环境
3560. settle['setl]
vt.安排；安放；调停
3561. settlement['setlm2nt]
n.解决；殖民，殖民地
3562. seven['seven]
num.七，七个(人或物)
3563. seventeen['sev2n'ti:n]
num.十七，十七个
3564. seventh['sev2n4]
num.第七；七分之一
3565. seventy[sevnti]
num.七十，七十个
3566. several['sevr2l]
a.几个，数个
3567. severe[si'vi2]
a.严格的；严厉的
3568. severely[si'vi2li]
ad.严厉地，严格地
3569. sew[s2u]
vt.缝制 vi.缝纫
3570. sex[seks]
n.性别，性
3571. shade[6eid]
n.荫；遮光物 vi.荫蔽
3572. shadow['69d2u]
n.阴影，阴，影子
3573. shady['6eidi]
a.成荫的，阴凉的
3574. shake[6eik]
vt.摇，使震动 n.摇动
3575. shall[69l. 62l]
aux.v.将要；必须；应
3576. shallow['69l2u]
a.浅的；浅薄的
3577. shame[6eim]
n.羞耻，羞愧；羞辱
3578. shampoo[69m'pu:]
vt.用洗发剂洗 n.洗头
3579. shape[6eip]
n.形状；情况 vt.形成
3580. share[6/2]
n.份；份额；股份
3581. sharp[6a:p]
a.锋利的；敏锐的
3582. sharpen['6a:p2n]
vt.削尖，使敏锐
3583. sharply['6a:pli]
ad.锐利地，敏锐地
3584. shave[6eiv]
vt.剃，刮 vi.修面
3585. she[6i:. 6i]
pron.(主格)她
3586. shear[6i2]
vt.剪；剥夺 vi.剪
3587. shed[6ed]
vt.流出；散发；脱落
3588. shed[6ed]
n.棚，小屋；贷棚
3589. sheep[6i:p]
n.羊，绵羊
3590. sheet[6i:t]
n.被单；纸张；薄板
3591. shelf[6elf]
n.搁板，架子
3592. shell[6el]
n.壳；贝壳；炮弹
3593. shelter['6elt2]
n.隐蔽处；掩蔽，庇护
3594. shepherd['6ep2d]
n.牧羊人，羊倌
3595. shield[6i:ld]
n.盾；防护物 vt.保护
3596. shift[6ift]
vt.替换，转移 n.转换
3597. shilling['6ili8]
n.先令
3598. shine[6ain]
vi.照耀，发光 n.光
3599. ship[6ip]
n.(大)船，海船，舰
3600. shirt[62:t]
n.(男式)衬衫
3601. shiver['6iv2]
vi.颤抖，哆嗦 n.冷颤
3602. shock[60k]
n.冲击；震惊 vi.震动
3603. shoe[6u:]
n.鞋
3604. shoot[6u:t]
vt.发射；射中 n.发芽
3605. shop[60p]
n.商店，店铺；车间
3606. shopkeeper['60pki:p2]
n.店主
3607. shopping['60pi8]
n.买东西，购物
3608. shore[60:]
n.滨，岸
3609. short[60:t]
a.短的；短期的
3610. shortage['60:tid7]
n.不足，缺少，不足额
3611. shortcoming[60:tk3mi8]
n.短处，缺点
3612. shortly['60:tli]
ad.立刻；简短地
3613. shot[60t]
n.发射；弹丸；射门
3614. should[6ud. 62d]
aux.v.将；万一；就
3615. shoulder['62uld2]
n.肩，肩膀；挑起
3616. shout[6aut]
n.&vi.呼喊，喊叫
3617. show[62u]
vt.给…看；表明
3618. shower['62u2. '6au2]
n.阵雨；(一)阵；淋浴
3619. shriek[6ri:k]
vi.尖声喊叫 n.尖叫声
3620. shrink[6rink]
vi.收缩；缩小；退缩
3621. shut[63t]
vt.关上，闭上，关闭
3622. shy[6ai]
a.易受惊的；害羞的
3623. sick[sik]
a.有病的；恶心的
3624. sickness['siknis]
n.疾病
3625. side[said]
n.边，旁边；一方
3626. sideways['saidweiz]
ad.斜着，斜向一边地
3627. sigh[sai]
n.&vi.叹气，叹息
3628. sight[sait]
n.视力；见；情景
3629. sightseeing['saitsi:i8]
n.观光，游览
3630. sign[sain]
n.符号；招牌 n.签名
3631. signal['sign2l]
n.信号 vi.发信号
3632. signature['signit62]
n.署名，签字，签名
3633. significance[sig'nifik2ns]
n.意义，意味；重要性
3634. significant[sig'nifik2nt]
n.有意义的；重要的
3635. silence['sail2ns]
n.沉默 vt.使沉默
3636. silent['sail2nt]
a.沉默的；寂静无声的
3637. silk[silk]
n.蚕丝，丝，丝织品
3638. silly['sili]
a.傻的，愚蠢的
3639. silver['silv2]
n.银；银子；银器
3640. similar['simil2]
a.相似的，类似的
3641. similarly['simil2li]
ad.类似地，相似地
3642. simple['simpl]
a.简单的；朴素的
3643. simplicity[sim'plisiti]
n.简单，简易；朴素
3644. simplify['simplifai]
vt.简化，使单纯
3645. simply['simpli]
ad.简单地；朴素地
3646. sin[sin]
n.罪，罪孽 vi.犯罪
3647. since[sins]
conj.从…以来；因为
3648. sincere[sin'si2]
a.真诚的；真挚的
3649. sing[si8]
vi.&vt.唱，演唱
3650. singer['si82]
n.歌唱家，歌手
3651. single['si8gl]
a.单一的；独身的
3652. singular['si8gjul2]
a.单一的；非凡的
3653. sink[si8k]
vi.下沉；下垂；降低
3654. sir[s2:]
n.先生，阁下；…爵士
3655. sister[sist2]
n.姐妹，姐，妹
3656. sit[sit]
vi.坐，就坐 vt.使坐
3657. site[sait]
n.地点，地基；场所
3658. situation[sitju'ei62n]
n.位置；处境；形势
3659. six[siks]
num.六，六个
3660. sixteen['siks'ti:n]
num.十六，十六个
3661. sixth[siks4]
num.第六；六分之一
3662. sixty['siksti]
num.六十，六十个
3663. size[saiz]
n.大小；体积；尺码
3664. skate[skeit]
n.冰鞋；滑冰 vi.滑冰
3665. sketch[sket6]
n.略图；速写；概略
3666. ski[ski:]
n.滑橇 vi.滑雪
3667. skill[skil]
n.技能，技巧；熟练
3668. skilled[skild]
a.有技能的，熟练的
3669. skillful['skilful]
a.灵巧的，娴熟的
3670. skim[skim]
vt.掠过，擦过；略读
3671. skin[skin]
n.皮；兽皮；外皮
3672. skirt[sk2:t]
n.女裙；边缘；郊区
3673. sky[skai]
n.天，天空
3674. slam[sl9m]
vt.使劲关，砰地放下
3675. slave[sleiv]
n.奴隶；苦工
3676. slavery['sleiv2ri]
n.奴隶制度；苦役
3677. sleep[sli:p]
n.睡眠 vi.睡 vt.睡
3678. sleepy['sli:pi]
a.想睡的；寂静的
3679. sleeve[sli:v]
n.袖子，袖套
3680. slender['slend2]
a.细长的；微薄的
3681. slice[slais]
n.薄片，切片；部分
3682. slide[slaid]
vi.滑 vt.使滑动 n.滑
3683. slight[slait]
a.细长的；轻微的
3684. slightly['slaitli]
ad.稍微，有点
3685. slip[slip]
vi.滑跤；滑落；溜
3686. slipper['slip2]
n.拖鞋，便鞋
3687. slippery['slip2ri]
a.滑的，使人滑跤的
3688. slit[slit]
n.裂缝 vt.切开，撕开
3689. slogan['sl2ug2n]
n.标语，口号
3690. slope[sl2up]
n.倾斜；斜面 vi.倾斜
3691. slow[sl2u]
a.慢的；迟钝的
3692. slowly['sl2uli]
ad.慢慢地
3693. slum[sl3m]
n.贫民窟，贫民区
3694. sly[slai]
a.狡猾的；躲躲闪闪的
3695. small[sm0:l]
a.小的，少的；小型的
3696. smart[sma:t]
a.巧妙的；洒脱的
3697. smell[smel]
n.嗅觉；气味 vt.嗅
3698. smile[smail]
vi.微笑 n.微笑，笑容
3699. smog[sm0g]
n.烟雾
3700. smoke[sm2uk]
n.烟；抽烟 vi.冒烟
3701. smooth[smu:5]
a.平滑的；平静的
3702. smoothly['smu:5li]
ad.光滑地；平稳地
3703. snake[sneik]
n.蛇
3704. snow[sn2u]
n.雪 vi.下雪
3705. snowstorm['sn2ust0:m]
n.雪暴，暴风雪
3706. snowy['sn2ui]
a.雪的，下雪的
3707. so[s2u]
ad.这样；这么；非常
3708. soak[s2uk]
vt.浸，泡 vi.浸泡
3709. soap[s2up]
n.肥皂
3710. sob[s0b]
vi.&n.啜泣，呜咽
3711. sober['s2ub2]
a.清醒的；适度的
3712. so-called['s2u'k0:ld]
a.所谓的，号称的
3713. soccer['s0k2]
n.英式足球
3714. social['s2u62l]
a.社会的；社交的
3715. socialism['s2u62liz2m]
n.社会主义
3716. socialist['s2u62list]
a.社会主义的
3717. society[s2'sai2ti]
n.社会；团体；社交界
3718. sock[s0k]
n.短袜
3719. soda['s2ud2]
n.碳酸钠，纯碱；汽水
3720. soft[s0ft]
a.软的；柔和的
3721. softly['s0ftli]
ad.柔软地；温柔地
3722. soil[s0il]
n.泥土，土壤，土地
3723. soil[s0il]
vt.弄脏 vi.变脏
3724. solar['s2ul2]
a.太阳的，日光的
3725. soldier['s2uld72]
n.(陆军)士兵，军人
3726. sole[s2ul]
n.脚底，鞋底，袜底
3727. sole[s2ul]
a.单独的，唯一的
3728. solely['s2uli]
ad.单独地，唯一地
3729. solemn['s0l2m]
a.庄严的；隆重的
3730. solid['s0lid]
a.固体的 n.固体
3731. soluble['s0ljubl]
a.可溶的；可以解决的
3732. solution[s2'lju:62n]
n.解决，解答；溶解
3733. solve['s0lv]
vt.解答，解释，解决
3734. some[s3m]
a.&pron.一些，若干
3735. somebody['s3mb2di]
pron.某人，有人
3736. somehow['s3mhau]
ad.由于某种原因
3737. someone['s3mw3n]
pron.某人，有人
3738. something['s3m4i8]
pron.某事，某物
3739. sometime['s3mtaim]
ad.在某一时候；从前
3740. sometimes['s3mtaimz]
ad.不时，有时
3741. somewhat['s3mw0t]
pron.一点儿 ad.有点
3742. somewhere['s3mw/2]
ad.在某处 n.某地
3743. son[s3n]
n.儿子
3744. song[s08]
n.歌唱；歌曲，歌词
3745. soon[su:n]
ad.不久；早，快
3746. sophisticated[s2'fistikeitid]
a.老于世故的；高级的
3747. sore[s0:]
a.痛的；恼火的 n.疮
3748. sorrow['s0r2u]
n.悲痛，悲哀，悲伤
3749. sorry['s0ri]
a.难过的；对不起的
3750. sort[s0:t]
n.种类；类别 vt.整理
3751. soul[s2ul]
n.灵魂；精神；人
3752. sound[saund]
a.健康的；完好的
3753. sound[saund]
n.声音 vi.响，发声
3754. soup[su:p]
n.汤
3755. sour['sau2]
a.酸的；脾气坏的
3756. source[s0:s]
n.河的源头；根源
3757. south[sau4]
n.南，南方 a.南方的
3758. southeast['sau4'i:st]
n.东南 a.位于东南的
3759. southern['s352n]
a.南方的，南部的
3760. southwest['sau4'west]
n.西南 a.西南的
3761. Soviet['s2uviet]
n.苏维埃 a.苏维埃的
3762. sow[s2u]
vt.播(种) vi.播种
3763. space[speis]
n.空间；场地；空白
3764. spacecraft['speiskra:ft]
n.航天器，宇宙飞船
3765. spaceship['speis6ip]
n.航天飞船
3766. spade[speid]
n.铲，铁锹
3767. span[sp9n]
n.跨距；一段时间
3768. Spanish['sp9ni6]
a.西班牙的n.西班牙人
3769. spare[sp/2]
vt.节约 a.多余的
3770. spark[spa:k]
n.火花，火星
3771. sparkle['spa:kl]
vi.发火花 vt.使闪耀
3772. sparrow['sp9r2u]
n.麻雀
3773. speak[spi:k]
vi.说话；发言 vt.说
3774. speaker['spi:k2]
n.说话者；扬声器
3775. spear[spi2]
n.矛，枪
3776. special['spe62l]
a.特殊的；专门的
3777. specialist[spe62list]
n.专家
3778. speciality[spe6i'9liti]
n.专业，特长；特产
3779. specialize['spe62laiz]
vi.成为…专家；专攻
3780. specially['spe62li]
ad.专门地，特别地
3781. specific[spi'sifik]
a.特有的；具体的
3782. specify['spesifai]
vi.指定，详细说明
3783. specimen['spesimin]
n.样本，标本，样品
3784. spectacle['spekt2kl]
n.光景，景象；眼镜
3785. speech[spi:t6]
n.言语；演说；方言
3786. speed[spi:d]
n.快；速率 vi.快行
3787. spell[spel]
vt.拼写 vi.拼字
3788. spelling['speli8]
n.拼字，拼法，拼写法
3789. spend[spend]
vt.用钱，花费；度过
3790. sphere[sfi2]
n.球，圆体；范围
3791. spider['spaid2]
n.蜘蛛
3792. spill[spil]
vt.使溢出 vi.溢出
3793. spin[spin]
vt.纺；使旋转 n.旋转
3794. spirit['spirit]
n.精神；气魄；情绪
3795. spiritual['spiritju2l]
a.精神的，心灵的
3796. spit[spit]
vi.吐 vi.吐唾沫
3797. splash[spl96]
vt.&n.溅，泼，飞溅
3798. splendid['splendid]
a.壮丽的；显著的
3799. split[split]
vt.劈开 vi.被劈开
3800. spoil[sp0il]
vt.损坏，糟蹋；宠坏
3801. sponge[sp3nd7]
n.海绵
3802. sponsor['sp0ns2]
n.发起者 vt.发起
3803. spontaneous[sp0n'teinj2s]
a.自发的；本能的
3804. spoon[spu:n]
n.匙，调羹
3805. sport[sp0:t]
n.运动；运动会
3806. sportsman['sp0:tsm2n]
n.运动员
3807. spot[sp0t]
n.点，斑点；地点
3808. spray[sprei]
n.浪花；喷雾 vt.喷
3809. spread[spred]
vt.伸开；传播 n.传播
3810. spring[spri8]
vi.跳，跃 n.跳跃；泉
3811. spring[spri8]
n.春天，春季
3812. springtime['spri8taim]
n.春季，春天
3813. sprinkle[spri8kl]
n.洒，撒；小雨
3814. spur[sp2:]
n.刺激物 vt.刺激
3815. spy[spai]
n.间谍，特务 vt.侦察
3816. square[skw/2]
n.正方形；广场
3817. squeeze['skwi:z]
vt.&vi.榨，挤；压榨
3818. squirrel['skwir2l]
n.松鼠
3819. stab[st9b]
vt.&vi.&n.刺，戳
3820. stability[st2'biliti]
n.稳定，稳定性，巩固
3821. stable['steibl]
a.稳定的，不变的
3822. stable['steibl]
n.厩，马厩，牛棚
3823. stack[st9k]
n.堆，垛 vt.堆积
3824. stadium['steidj2m]
n.露天大型运动场
3825. staff[sta:f]
n.工作人员；参谋
3826. stage[steid7]
n.舞台；戏剧；阶段
3827. stain[stein]
vt.沾污；给…着色
3828. stair[st/2]
n.楼梯
3829. staircase['st/2keis]
n.楼梯，楼梯间
3830. stake[steik]
n.桩；赌金；奖品
3831. stale[steil]
n.陈腐的；走了气的
3832. stamp[st9mp]
n.戳子；邮票；标志
3833. stand[st9nd]
vi.站；坐落 n.架，台
3834. standard['st9nd2d]
n.标准 a.标准的
3835. standpoint['st9ndp0int]
n.立场，观点
3836. star[sta:]
n.星；恒星；明星
3837. stare[st/2]
vi.盯，凝视
3838. start[sta:t]
vi.跳起；出发；开始
3839. startle['sta:tl]
vt.使大吃一惊 n.吃惊
3840. starve[sta:v]
vi.饿死 vt.使饿死
3841. state[steit]
n.状态；国家；州
3842. state[steit]
vt.陈述，说明，阐明
3843. statement['steitm2nt]
n.陈述，声明
3844. statesman['steitsm2n]
n.政治家，国务活动家
3845. static['st9tikl]
a.静的；静态的
3846. station['stei62n]
n.站，台，所，局
3847. statistical[st2'tistikl]
a.统计的，统计学的
3848. statue['st9tju:]
n.塑像，雕像，铸像
3849. status['steit2s]
n.地位，身分
3850. stay[stei]
vi.停留；住 n.逗留
3851. steadily['stedili]
ad.稳定地，不变地
3852. steady['stedi]
a.稳固的 vt.使稳定
3853. steal[sti:l]
vt.偷，窍取
3854. steam[sti:m]
n.蒸汽 vi.蒸发 vt.蒸
3855. steamer['sti:m2]
n.轮船，汽船
3856. steel['sti:l]
n.钢，钢铁
3857. steep[sti:p]
a.险峻的，陡峭的
3858. steer[sti2]
vt.&vi.驾驶
3859. stem[stem]
n.茎，(树)干 vi.起源
3860. step[step]
n.(脚)步；步骤 vi.走
3861. stern[st2:n]
a.严厉的；坚定的
3862. steward[stju2d]
n.乘务员，服务员
3863. stewardess['stju:2dis]
n.空中小姐，女乘务员
3864. stick[stik]
n.棍，棒 vt.刺；粘贴
3865. sticky['stiki]
a.粘性的；胶粘的
3866. stiff[stif]
a.硬的；僵直的
3867. stiffen['stifn]
vt.使硬；使僵硬
3868. still[stil]
a.静止的 n.寂静
3869. stimulate['stimjuleit]
vt.刺激，激励，激发
3870. sting[sti8]
vt.刺；刺痛 vi.&n.刺
3871. stir[st2:]
vt.动；拨动；激动
3872. stitch[stit6]
n.一针；针脚 vt.缝
3873. stock[st0k]
n.原料；库存品；股本
3874. stocking['st0ki8]
n.长(统)袜
3875. stomach['st3m2k]
n.胃；肚子；食欲
3876. stone[st2un]
n.石，石头；宝石
3877. stony['st2uni]
a.多石的；冷酷的
3878. stool[stu:l]
n.凳子
3879. stoop[stu:p]
vi.俯身；弯身 n.弯腰
3880. stop[st0p]
vt.塞住；阻止；停止
3881. storage['st0:rid7]
n.贮藏；贮藏量
3882. store[st0:]
n.贮藏；贮存品；商店
3883. storey['st0:ri]
n.(层)楼
3884. storm[st0:m]
n.风暴；暴(风)雨
3885. stormy['st0:mi]
a.有暴风雨的；激烈的
3886. story['st0:ri]
n.故事，小说，传说
3887. stove[st2uv]
n.炉，火炉，电炉
3888. straight[streit]
a.直的；正直的 ad.直
3889. strain['strein]
vt.拉紧 vi.尽力
3890. strange[streind7]
a.陌生的；奇怪的
3891. stranger['streind72]
n.陌生人；新来者
3892. strap[str9p]
n.带子 vt.捆扎
3893. strategy['str9tid7i]
n.战略；策略
3894. straw[str0:]
n.稻草，麦杆吸管
3895. strawberry['str0:b2ri]
n.草莓
3896. stream[stri:m]
n.河；流 vi.&vt.流
3897. street['stri:t]
n.街，街道；行车道
3898. strength[stre84]
n.力，力量，力气
3899. strengthen['stre842n]
vt.加强，巩固
3900. stress[stres]
n.压力；重音 vt.着重
3901. stretch[stret6]
vt.伸展 vi.伸 n.伸展
3902. strict[strikt]
a.严格的；严谨的
3903. strictly['striktli]
ad.严格地，严谨地
3904. strike[straik]
vt.&vi.打，击 n.罢工
3905. string[stri8]
n.线，细绳；一串
3906. strip[strip]
vt.剥；夺去 n.条带
3907. stripe[straip]
n.条纹，条子
3908. stroke[str2uk]
n.打，击；鸣声；中风
3909. stroke[str2uk]
vt.&n.抚，摩，捋
3910. strong[str08]
a.强壮的；擅长的
3911. strongly['str08li]
ad.强壮地，强烈地
3912. structural['str3kt62r2l]
a.结构的，构造的
3913. structure['str3kt62]
n.结构；构造 vt.建造
3914. struggle['str3gl]
n.&vi.斗争，奋斗
3915. student['stju:d2nt]
n.学生；研究生，学者
3916. study['st3di]
n.学习，研究 vt.学
3917. stuff[st3f]
n.材料 vt.装，填，塞
3918. stumble['st3mbl]
vi.绊倒；犯错误
3919. stupid['stju:pid]
a.愚蠢的；感觉迟钝的
3920. style[stail]
n.风格；文体；式样
3921. subject['s3bd7ikt. s3b'd7ekt]
n.题目；学科；主语
3922. submarine['s3bm2ri:n]
a.水下的 n.潜水艇
3923. submerge[s3b'm2:d7]
vt.浸没 vi.潜入水中
3924. submit[s3b'mit]
vt.使服从 vi.服从
3925. subsequent['s3bsikw2nt]
a.随后的，后来的
3926. substance['s3bst2ns]
n.物质；实质；本旨
3927. substantial[s2b'st9n62l]
a.物质的；坚固的
3928. substitute['s3bstitju:t]
n.代替人 vt.用…代替
3929. subtract[s2b'tr9kt]
vt.减，减去，去掉
3930. suburb['s3b2:b]
n.郊区，郊外，近郊
3931. subway['s3bwei]
n.地道；地下铁路
3932. succeed[s2k'si:d]
vt.继…之后 vi.成功
3933. success[s2k'ses]
n.成功，成就，胜利
3934. successful[s2k'sesful]
a.成功的，结果良好的
3935. successfully[s2k'sesfuli]
ad.成功地
3936. succession[s2k'se62n]
n.连续；继任，继承
3937. successive[s2k'sesiv]
a.连续的；接连的
3938. such[s3t6]
a.这样的；如此的…
3939. suck[s3k]
vt.吸，吮，啜；吸收
3940. sudden['s3dn]
a.突然的，意外的
3941. suddenly['s3dnli]
ad.突然地
3942. suffer['s3f2]
vt.遭受；忍受；容许
3943. sufficient[s2'fi62nt]
a.足够的，充分的
3944. sufficiently[s2'fi62ntli]
ad.足够地，充分地
3945. sugar['6ug2]
n.糖
3946. suggest[s2'd7est]
vt.建议；暗示，启发
3947. suggestion[s2'd7est62n]
n.建议，意见；暗示
3948. suit[sju:t]
n.起拆，诉讼 vt.适合
3949. suitable['sju:t2bl]
a.合适的；适宜的
3950. sulphur['s3lf2]
n.硫(磺)，硫黄
3951. sum[s3m]
n.总数；金额 vi.共计
3952. summarize['s3m2raiz]
vt.概括，概述，总结
3953. summary['s3m2ri]
n.摘要，概要，一览
3954. summer['s3m2]
n.夏，夏季
3955. sun[s3n]
n.太阳，日
3956. Sunday['s3ndi]
n.星期日，礼拜日
3957. sunlight['s3nlait]
n.日光，阳光
3958. sunny['s3ni]
a.阳光充足的；快活的
3959. sunrise['s3nraiz]
n.日出(时分)
3960. sunset['s3nset]
n.日落(时分)
3961. sunshine['s3n6ain]
n.(直射)日光，阳光
3962. super['sju:p2]
a.极好的，超级的
3963. superficial[sju:p2'fi62l]
a.表面的；肤浅的
3964. superior[sju:'pi2ri2]
a.较高的；优越的
3965. supermarket['sju:p2ma:kit]
n.超级市场
3966. supper['s3p2]
n.晚饭，晚餐
3967. supplement['s3plim2nt]
n.&vt.增补，补充
3968. supply[s2'plai]
vt.&n.供给，供应
3969. support[s2'p0:t]
vt.支撑；支持；供养
3970. suppose[s2'p2uz]
vt.猜想；假定；让
3971. supreme[sju:'pri:m]
a.最高的；最大的
3972. sure[6u2]
a.确信的；确实的
3973. surely['6u2li]
a.确实；稳当地
3974. surface['s2:fis]
n.地面，表面；外表
3975. surgeon['s2:d72n]
n.外科医师；军医
3976. surgery['s2:d72ri]
n.外科，外科手术
3977. surname['s2:neim]
n.姓
3978. surprise[s2'praiz]
vt.使惊奇；突然袭击
3979. surprising[s2'praizi8]
a.惊人的；出人意外的
3980. surprisingly[s2'praizi8li]
ad.惊人地
3981. surrender[s2'rend2]
vt.交出 vi.投降
3982. surround[s2'raund]
vt.围，围绕，圈住
3983. surroundings[s2'raundi8z]
n.周围的事物，环境
3984. survey[s2:'vei]
vt.俯瞰；检查；测量
3985. survive[s2'vaiv]
vt.幸免于 vi.活下来
3986. suspect[s2s'pekt. 's3spekt]
vt.怀疑 vi.疑心
3987. suspend[s2s'pend]
vt.吊，悬；推迟
3988. suspicion[s2s'pi62n]
n.怀疑，疑心，猜疑
3989. sustain[s2s'tein]
vt.支撑；供养；忍受
3990. swallow['sw0l2u]
n.燕子
3991. swallow['sw0l2u]
vt.&vi.吞下，咽下
3992. swamp[sw0mp]
n.沼泽，沼泽地
3993. swan[sw0n]
n.天鹅
3994. swarm[sw0:m]
n.一大群 vi.密集
3995. sway[swei]
vi.摇动 vt.摇；摇动
3996. swear[sw/2]
vt.宣(誓) vi.诅咒
3997. sweat[swet]
n.汗 vi.出汗
3998. sweater['swet2]
n.厚运动衫，毛线衫
3999. sweep[swi:p]
vt.扫；刮起；扫过
4000. sweet[swi:t]
a.甜的；愉快的
4001. swell[swel]
vi.膨胀；隆起；增长
4002. swift[swift]
a.快的；反应快的
4003. swim[swim]
vi.游，游泳；眼花
4004. swing[swi8]
vi.摇摆；回转 n.摇摆
4005. Swiss[swis]
a.瑞士的 n.瑞士人
4006. switch[swit6]
n.开关；转换 vt.转换
4007. sword[s0:d]
n.剑，刀
4008. symbol['simb2l]
n.象征；符号，记号
4009. sympathetic[simp2'4etik]
a.同情的；和谐的
4010. sympathize['simp24aiz]
vi.同情；同感，共鸣
4011. sympathy['simp24i]
n.同情；一致，同感
4012. synthetic[sin'4etik]
a.综合的；合成的
4013. system['sistim]
n.系统，体系；制度
4014. systematic(al)[sisti'm9tik(2l)]
a.有系统的；有计划的
4015. table['teibl]
n.桌子；餐桌；项目表
4016. tablet['t9blit]
n.碑，匾；药片
4017. tag[t9g]
n.附加语；标签
4018. tail[teil]
n.尾巴；末尾部分
4019. tailor['teil2]
n.裁缝 vt.裁制衣服
4020. take[teik]
vt.拿；抓；拿走；吃
4021. tale[teil]
n.故事，传说
4022. talent['t9l2nt]
n.天才；才能；人才
4023. talk[t0:k]
vi.讲话 vt.谈论
4024. tall[t0:l]
n.高的，身材高的
4025. tame[teim]
a.驯服的；顺从的
4026. tan[t9n]
n.棕褐色 a.棕黄色的
4027. tank[t98k]
n.坦克；大容器，槽
4028. tap[t9p]
vt.&vi.&n.轻叩
4029. tap[t9p]
n.塞子；龙头 vt.开发
4030. tape[teip]
n.线带；磁带，录音带
4031. target['ta:git]
n.靶，标的；目标
4032. task[ta:sk]
n.任务，工作，作业
4033. taste[teist]
vt.尝；尝到 n.味觉
4034. tax[t9ks]
n.税，税款；负担
4035. taxi['t9ksi]
n.出租汽车
4036. tea[ti:]
n.茶；茶叶；茶树
4037. teach[ti:t6]
vt.讲；教育 vt.教书
4038. teacher['ti:t62]
n.教师，老师，先生
4039. teaching['ti:t6i8]
n.教学，讲授；教导
4040. team[ti:m]
n.队，组
4041. tear[ti2. t/2]
n.眼泪，泪珠
4042. tear[ti2. t/2]
vt.撕开，撕裂
4043. technical['teknik2l]
a.技术的，工艺的
4044. technician[tek'ni62n]
n.技术员，技师
4045. technique[tek'ni:k]
n.技术，技巧；技能
4046. technology[tek'n0l2d7i]
n.工艺学，工艺，技术
4047. tedious['ti:di2s]
a.冗长乏味的，沉闷的
4048. teenager['ti:neid72]
n.青少年
4049. telegram['teligr9m]
n.电报
4050. telegraph['teligra:f]
n.电报机；电报
4051. telephone['telif2un]
n.电话 vi.打电话
4052. telescope['telisk2up]
n.望远镜
4053. television['telivi72n]
n.电视；电视机
4054. tell[tel]
vt.讲述；吩咐；辨别
4055. temper['temp2]
n.韧度；心情，情绪
4056. temperature['temp2rit62]
n.温度；体温
4057. temple['templ]
n.圣堂，神殿，庙宇
4058. temporary['temp2r2ri]
a.暂时的，临时的
4059. tempt[tempt]
vt.引诱，诱惑；吸引
4060. temptation[temp'tei62n]
n.诱惑，引诱
4061. ten[ten]
num.十，十个
4062. tenant['ten2nt]
n.承担人，房客，佃户
4063. tend[tend]
vt.照管，照料，护理
4064. tend[tend]
vi.走向，趋向；倾向
4065. tendency['tend2nsi]
n.趋向，趋势，倾向
4066. tender['tend2]
a.嫩的；脆弱的
4067. tennis['tenis]
n.网球，网球运动
4068. tense[tens]
n.时态，时
4069. tense[tens]
a.拉紧的，绷紧的
4070. tent[tent]
n.帐篷
4071. tenth[ten4]
num.第十；十分之一
4072. term[t2:m]
n.期；学期；条件；词
4073. terminal['t2:minl]
a.末端的 n.末端
4074. terrible['ter2bl]
a.可怕的；极度的
4075. terrific[t2'rifik]
a.可怕的；极大的
4076. territory['terit2ri]
n.领土，版图；领域
4077. terror['ter2]
n.恐怖，惊骇
4078. test[test]
n.&vt.试验；检验
4079. text[tekst]
n.原文，本文；课文
4080. textbook['tekstbuk]
n.课本，教科书
4081. textile['tekstail]
n.纺织品 a.纺织的
4082. than[59n. 52n]
conj.(比较级)比
4083. thank[498k]
vt.谢谢，感谢 n.感谢
4084. that[59t]
a.那 pron.那 ad.那样
4085. the[52. 5i]
art.(定冠词)这，那
4086. theatre['4i2t2]
n.戏院；戏剧；教室
4087. their[5/2]
pron.他(她、它)们的
4088. theirs[5/2z]
pron.他(她)们的东西
4089. them[5em. 52m]
pron.(宾格)他们
4090. themselves[5/m'selvz]
pron.他们自己
4091. then[5en]
ad.当时；然后；那么
4092. theoretical[4i2'retik2l]
a.理论(上)的
4093. theory['4i2ri]
n.理论；学说；意见
4094. there[5/2]
ad.在那里；在那点上
4095. thereby['5/2'bai]
ad.因此，从而，由此
4096. therefore['5/2f0:]
ad.因此，所以
4097. thermometer[42'm0mit2]
n.温度计，寒暑表
4098. these[5i:z]
a.&pron.这些
4099. they[5ei]
pron.(主格)他(她)们
4100. thick[4ik]
a.厚的；密的；浓
4101. thickness['4iknis]
n.厚(度)；密(度)
4102. thief[4i:f]
n.窃贼，偷窃犯
4103. thin[4in]
a.薄的；淡的 vi.变薄
4104. thing[4i8]
n.物；用品；事；情况
4105. think[4i8k]
vt.想；想要；认为
4106. third[42:d]
num.第三；三分之一
4107. thirdly['42:dli]
ad.第三
4108. thirst[42:st]
n.渴，口渴；渴望
4109. thirsty['42:sti]
a.渴的；渴望的
4110. thirteen['42:'ti:n]
num.十三，十三个
4111. thirty['42:ti]
num.三十，三十个
4112. this[5is]
a.这；今 pron.这
4113. thorn[40:n]
n.刺，棘；荆棘；蒺藜
4114. thorough['43r2]
a.彻底的；详尽的
4115. those[52uz]
pron.那些
4116. though[52u]
conj.虽然 ad.可是
4117. thought[40:t]
n.思想；思维；想法
4118. thoughtful['40:tful]
a.沉思的；体贴的
4119. thousand['4auz2nd]
num.千，千个 n.无数
4120. thread[4red]
n.线；丝；螺纹；头绪
4121. threat[4ret]
n.威胁，恐吓，凶兆
4122. threaten['4retn]
vt.&vi.威胁，恐吓
4123. three[4ri:]
num.三，三个
4124. thrill[4ril]
n.一阵激动
4125. thrive[4raiv]
vi.兴旺，繁荣，旺盛
4126. throat[4r2ut]
n.咽喉，喉咙；嗓音
4127. throne[4r2un]
n.宝座，御座；王位
4128. throng[4r08]
n.群，人群 vt.挤满
4129. through[4ru:]
prep.穿过ad.从头到尾
4130. throughout[4ru:'aut]
prep.遍及 ad.到处
4131. throw[4r2u]
vt.投，掷，抛，扔
4132. thrust[4r3st]
vt.插，刺 n.插；讽刺
4133. thumb[43m]
n.(大)拇指
4134. thunder['43nd2]
n.雷 vi.打雷 vt.吼出
4135. Thursday['42:zdi]
n.星期四
4136. thus[53s]
ad.如此，这样；因而
4137. tick[tik]
n.滴答声；记号
4138. ticket['tikit]
n.票，券；纲领；传票
4139. tide[taid]
n.潮，潮汐；潮流
4140. tidy['taidi]
a.整洁的；整齐的
4141. tie[tai]
n.领带；联系 vt.系
4142. tiger['taig2]
n.虎
4143. tight[tait]
a.紧的；紧身的
4144. till[til]
prep.conj.直到…为止
4145. timber['timb2]
n.木材，木料
4146. time[taim]
n.时间；时机；次，回
4147. timetable['taimteibl]
n.时间表，时刻表
4148. timid['timid]
a.胆怯的；羞怯的
4149. tin[tin]
n.锡；罐头
4150. tiny['taini]
a.微小的，极小的
4151. tip[tip]
n.梢，末端，尖，尖端
4152. tip[tip]
vt.轻击 vi.给小费
4153. tire['tai2]
vi.疲劳，累；厌倦
4154. tired['tai2d]
a.疲劳的；厌倦的
4155. tissue['tisju:]
n.薄绢；薄纸；组织
4156. title['taitl]
n.标题，题目；称号
4157. to[tu:. tu. t2]
prep.到，向，达到
4158. toast[t2ust]
n.烤面包 vt.烘，烤
4159. toast[t2ust]
n.祝酒；祝酒词
4160. tobacco[t2'b9k2u]
n.烟草，烟叶
4161. today[t2'dei]
ad.在今天；现在
4162. toe[t2u]
n.脚趾，足尖
4163. together[t2'ge52]
ad.共同，一起
4164. toilet['t0ilit]
n.厕所，盥洗室，浴室
4165. tolerance['t0l2r2ns]
n.忍受，容忍；公差
4166. tolerate['t0l2reit]
vt.忍受，容忍，宽恕
4167. tomato[t2'ma:t2u]
n.番茄，西红柿
4168. tomb[tu:m]
n.坟，冢
4169. tomorrow[t2'm0r2u]
ad.在明天 n.明天
4170. ton[t3n]
n.吨；大量
4171. tone[t2un]
n.音；腔调；声调
4172. tongue[t38]
n.舌，舌头；语言
4173. tonight[t2'nait]
ad.在今夜 n.今夜
4174. too[tu:]
ad.也，还；太，过分
4175. tool[tu:l]
n.工具，器具，用具
4176. tooth[tu:4]
n.牙齿
4177. top[t0p]
n.顶；首位 a.顶的
4178. topic['t0pik]
n.题目，论题，话题
4179. torch[t0:t6]
n.火炬，火把；手电筒
4180. torrent['t0r2nt]
n.奔流，激流，洪流
4181. tortoise['t0:t2s]
n.龟，乌龟
4182. torture['t0:t62]
n.拷问；折磨 vt.拷打
4183. toss[t0s]
vt.&vi.扔，抛，掷
4184. total['t2utl]
a.总的 vi.合计，总共
4185. touch[t3t6]
vt.触摸；触动 n.触
4186. tough[t3f]
a.坚韧的；健壮的
4187. tour[tu2]
n.&vi.旅行，游历
4188. tourist['tu2rist]
n.旅游者，观光者
4189. toward(s)[t2'w0:d(z)]
prep.向；对于；接近
4190. towel['tau2l]
n.毛巾，手巾
4191. tower['tau2]
n.塔 vi.屹立，高耸
4192. town[taun]
n.镇，市镇，城镇
4193. toy[t0i]
n.玩具，玩物
4194. trace[treis]
n.痕迹；丝毫 vt.跟踪
4195. track[tr9k]
n.行踪；路径；轨道
4196. tractor['tr9kt2]
n.拖拉机；牵引车
4197. trade[treid]
n.贸易；职业 vi.交易
4198. tradition[tr2'di62n]
n.传统，惯例
4199. traditional[tr2'di62nl]
a.传统的，惯例的
4200. traffic['tr9fik]
n.交通，通行；交通量
4201. tragedy['tr9d7idi]
n.悲剧；惨事，惨案
4202. trail[treil]
n.痕迹；小径 vt.跟踪
4203. train[trein]
vt.培养 n.列车；队列
4204. training['treini8]
n.训练，锻炼，培养
4205. traitor['treit2]
n.叛徒，卖国贼
4206. tram[tr9m]
n.(有轨)电车
4207. tramp[tr9mp]
n.流浪者，游民
4208. transfer[tr9ns'f2:]
vt.转移；调动vi.转移
4209. transform[tr9ns'f0:m]
vt.改变；改造；变换
4210. transformation[tr9nsf2'mei62n]
n.变化；改造；转变
4211. transformer[tr9ns'f0:m2]
n.变压器，转换器
4212. transistor[tr9n'sist2]
n.晶体管
4213. translate[tr9ns'leit]
vt.翻译，译 vt.翻译
4214. translation[tr9ns'lei62n]
n.翻译；译文，译本
4215. transmission[tr9nz'mi62n]
n.传送；传动；发射
4216. transmit[tr9nz'mit]
vt.传送，传达；发射
4217. transparent[tr9ns'p/2r2nt]
a.透明的；易识破的
4218. transport[tr9ns'p0:t]
vt.运输 n.运输
4219. transportation[tr9nsp0:'tei62n]
n.运输，运送，客运
4220. trap[tr9p]
n.陷阱；诡计 vt.诱骗
4221. travel['tr9vl]
vi.&vi.&n.旅行
4222. tray[trei]
n.(浅)盘，托盘，碟
4223. treason['tri:zn]
n.谋反，通敌，叛国罪
4224. treasure['tre72]
n.财富；珍宝 vt.珍视
4225. treat[tri:t]
vt.对待；处理 n.款待
4226. treatment['tri:tm2nt]
n.待遇；治疗，疗法
4227. treaty['tri:ti]
n.条约；协议，协定
4228. tree[tri:]
n.树
4229. tremble['trembl]
vi.发抖，哆嗦；摇动
4230. tremendous[tri'mend2s]
a.极大的，非常的
4231. trend[trend]
vi.伸向；倾向 n.倾向
4232. trial['trai2l]
n.试，试验；审判
4233. triangle['trai9ngl]
n.三角(形)
4234. tribe[traib]
n.部落，宗族
4235. trick[trik]
n.诡计；窍门 vt.哄骗
4236. trifle['traifl]
n.小事，琐事；少许
4237. trim[trim]
a.整齐的 vt.使整齐
4238. trip[trip]
vi.绊；失足 vt .绊倒
4239. triumph['trai2mf]
n.凯旋；胜利 vi.成功
4240. troop[tru:p]
n.军队；一群，大量
4241. tropical['tr0pik2l]
a.热带的
4242. trouble['tr3bl]
n.烦恼；困难 vi.烦恼
4243. troublesome['tr3bls2m]
a.令人烦恼的；麻烦的
4244. trousers['trauz2z]
n.裤子，长裤
4245. truck[tr3k]
n.卡车，载重汽车
4246. true[tru:]
a.真的；忠实的
4247. truly['tru:li]
ad.真正地；忠实地
4248. trumpet['tr3mpit]
n.喇叭，小号
4249. trunk[tr38k]
n.树干；大衣箱，皮箱
4250. trust[tr3st]
n.信任 vt.相信；委托
4251. truth[tru:4]
n.真理；真实；真实性
4252. try[trai]
vt.试；审问 vi.尝试
4253. tub[t3b]
n.桶，盆，浴缸，浴盆
4254. tube[tju:b]
n.管；电子管，显像管
4255. tuck[t3k]
vt.折短，卷起；塞
4256. Tuesday['tju:zdi]
n.星期二
4257. tuition[tju:'i62n]
n.教，教诲；学费
4258. tumble['t3mbl]
vi.摔倒，跌倒；打滚
4259. tune[tju:n]
n.调子；和谐 vt.调谐
4260. tunnel['t3nl]
n.隧道，坑道，地道
4261. turbine['t2:bin]
n.叶轮机，汽轮机
4262. turbulent['t2:bjul2nt]
a.骚动的，骚乱的
4263. turkey['t2:ki]
n.火鸡；火鸡肉
4264. turn[t2:n]
vt.转；翻 vi.转动
4265. turning['t2:ni8]
n.旋转；变向；转弯处
4266. turnip['t2:nip]
n.萝卜，芜菁
4267. tutor['tju:t2]
n.家庭教师；导师
4268. twelfth[twelf4]
num.第十二
4269. twelve[twelv]
num.十二，十二个
4270. twentieth['twentii4]
num.第二十
4271. twenty['twenti]
num.二十，二十个
4272. twice[twais]
ad.两次，两倍
4273. twin[twin]
a.孪生的 n.孪生儿
4274. twinkle['twi8kl]
vi.闪烁，闪耀
4275. twist[twist]
vt.捻；拧 vi.&n.扭弯
4276. two[tu:]
num.二，两个
4277. type[taip]
n.型，类型 vi.打字
4278. typewriter['taiprait2]
n.打字机
4279. typhoon[tai'fu:n]
n.台风
4280. typical['tipik2l]
a.典型的，代表性的
4281. typist['taipist]
n.打字员
4282. tyre['tai2]
n.轮胎，车胎
4283. ugly['3gli]
a.丑陋的；可怕的
4284. ultimate['3ltimit]
a.最后的，最终的
4285. ultimately['3ltimitli]
ad.最终，最后
4286. umbrella[3m'brel2]
n.伞，雨伞
4287. unable['3n'eibl]
a.不能的，不会的
4288. unbearable[3n'b/2r2bl]
a.难堪的，忍受不了的
4289. uncertain[3n's2:tn]
a.无常的；不确定的
4290. uncle['38kl]
n.伯父，叔父，舅父
4291. uncomfortable[3n'k3mf2t2bl]
a.不舒服的；不自在的
4292. unconscious[3n'k062s]
a.不省人事的
4293. uncover[3n'k3v2]
vt.揭开…的盖子
4294. under['3nd2]
prep.在…下面；低于.
4295. undergo[3nd2'g2u]
vt.经历，经受，忍受
4296. undergraduate[3nd2'gr9djuit]
n.大学肆业生
4297. underground['3nd2graund]
a.地下的；秘密的
4298. underline[3nd2'lain]
vt.划线于…之下
4299. underneath[3nd2'ni:4]
ad.在下面，在底下
4300. understand[3nd2'st9nd]
vt.懂；获悉 vi.懂得
4301. understanding[3nd2'st9ndi8]
n.理解；理解力；协定
4302. undertake[3nd2'teik]
vt.从事；承担；保证
4303. undertaking[3nd2'teiki8]
n.任务，事业；许诺
4304. undo['3n'du:]
vt.解开，打开；取消
4305. undoubtedly[3n'dautidli]
ad.无容置疑，肯定地
4306. uneasy[3n'i:zi]
a.心神不安的，忧虑的
4307. unexpected['3niks'pektid]
a.想不到的，意外的
4308. unfair['3n'f/2]
a.不公平的，不公正的
4309. unfortunate[3n'f0:t62nit]
a.不幸的；可取的
4310. unfortunately[3n'f0:t62nitli]
ad.不幸地
4311. unhappy[3n'h9pi]
a.不幸福的，不快乐的
4312. uniform['ju:nif0:m]
a.一样的 n.制服
4313. union['ju:nj2n]
n.联合；团结；协会
4314. unique[ju:'ni:k]
a.唯一的，独一无二的
4315. unit['ju:nit]
n.单位；单元；部件
4316. unite[ju'nait]
vi.联合 vt.使联合
4317. unity['ju:niti]
n.单一；统一；团结
4318. universal[ju:ni'v2:s2l]
a.宇宙的；普遍的
4319. universe['ju:niv2:s]
n.宇宙，世界
4320. university[ju:ni'v2:siti]
n.大学，综合性大学
4321. unjust['3n'd73st]
a.非正义的；不公平的
4322. unkind[3n'kaind]
a.不仁慈的，不和善的
4323. unknown['3n'n2un]
a.不知道的；未知的
4324. unless['3n'les]
conj.除非，如果不
4325. unlike['3n'laik]
a.不同的 prep.不象…
4326. unlikely[3n'laikli]
a.未必的，未必可能的
4327. unload[3n'l2ud]
vt.卸(货) vi.卸货
4328. unlucky[3n'l3ki]
a.不幸的；不吉的
4329. unnecessary[3n'nesis2ri]
a.不必要的，多余的
4330. unpleasant[3n'pleznt]
a.令人不快的，讨厌的
4331. unsatisfactory['3ns9tis'f9kt2ri]
a.不能令人满意的
4332. unstable[3n'steibl]
a.不稳固的；不稳定的
4333. unsuitable['3n'sju:t2bl]
a.不合适的，不适宜的
4334. until[2n'til]
prep&conj.直到…为止
4335. unusual[3n'ju:7u2l]
a.不平常的；独特的
4336. unusually[3n'ju:7u2li]
a.不平常地，非常
4337. unwilling['3n'wili8]
a.不愿意的
4338. up[3p]
ad.向上；起床，起来
4339. upon[2'p0n]
prep.在…上；在…旁
4340. upper['3p2]
a.上面的；地位较高的
4341. upright['3prait]
a.垂直的；正直的
4342. upset[3p'set]
vt.弄翻，打翻，倾覆
4343. upside-down['3psaid'daun]
a.颠倒的，乱七八糟的
4344. upstairs[3p'st/2z]
ad.在楼上 a.楼上的
4345. up-to-date['3pt2'deit]
a.直到最近的，现代的
4346. upward['3pw2d]
a.向上的，上升的
4347. upwards['3pw2dz]
ad.趋向上升；以上
4348. urge[2:d7]
vt.推进；催促 n.冲动
4349. urgent['2:d72nt]
a.紧急的；强求的
4350. us[3s. 2s]
pron.(宾格)我们
4351. usage['ju:zid7]
n.使用，对待；惯用法
4352. use[ju:z. ju:s]
vt.用；耗费 n.用
4353. used[ju:zd. ju:st]
vi.过去常常
4354. used[ju:zd. ju:st]
a.旧的；习惯于…的
4355. useful['ju:zful]
a.有用的，有益的
4356. useless['ju:zlis]
a.无用的，无价值的
4357. user['ju:z2]
n.用户，使用者
4358. usual['ju:7u2l]
a.通常的；平常的
4359. usually['ju:7u2li]
ad.通常
4360. utility[ju:'tiliti]
n.效用，有用，实用
4361. utilize['ju:tilaiz]
vt.利用
4362. utmost['3tm2ust]
a.最远的 n.极限
4363. utter['3t2]
a.完全的，彻底的
4364. utter['3t2]
vt.发出，说，讲
4365. vacant['veik2nt]
a.空的；未被占用的
4366. vacation[v2'kei62n]
n.假期，休假
4367. vacuum['v9kju2m]
n.真空；真空吸尘器
4368. vague[veig]
a.模糊的，含糊的
4369. vain[vein]
a.徒劳的；自负的
4370. valid['v9lid]
a.有效的；正当的
4371. valley['v9li]
n.(山)谷，溪谷；流域
4372. valuable['v9lju2bl]
a.值钱的；有价值的
4373. value['v9lju:]
n.价值；价格 vt.评价
4374. van[v9n]
n.大篷车，运货车
4375. vanish['v9ni6]
vi.突然不见，消失
4376. vanity['v9niti]
n.虚荣心，虚夸
4377. vapour['veip2]
n.汽，蒸气
4378. variable['v/2ri2bl]
a.易变的 n.变量
4379. variation[v/2ri'ei62n]
n.变化，变动；变异
4380. variety[v2'rai2ti]
n.多样化；种类；变种
4381. various['v/2ri2s]
a.各种各样的，不同的
4382. vary['v/2ri]
vt.改变；使多样化
4383. vase[va:z]
n.瓶，花瓶
4384. vast[va:st]
a.巨大的；大量的
4385. vegetable['ved7it2bl]
n.植物；蔬菜
4386. vehicle['vi:ikl]
n.车辆，机动车
4387. veil[veil]
n.面纱，面罩；遮蔽物
4388. velocity[vi'l0siti]
n.速度，速率
4389. velvet['velvit]
n.丝绒，天鹅绒
4390. venture['vent62]
n.&vi.冒险 vt.敢于
4391. verb[v2:b]
n.动词
4392. verify['verifai]
vt.证实，查证；证明
4393. version['v2:62n]
n.译文；说法；改写本
4394. vertical['v2:tik2l]
a.垂直的，竖式的
4395. very['veri]
ad.很；完全 a.真的
4396. vessel['vesl]
n.容器；船，飞船；管
4397. vest[vest]
n.汗衫；背心；内衣
4398. veteran['vet2r2n]
n.老兵，老手
4399. vex[veks]
vt.使烦恼，使恼火
4400. via['vai2]
prep.经过；通过
4401. vibrate[vai'breit]
vt.使颤动 vi.颤动
4402. vibration[vai'brei62n]
n.颤动，振动；摆动
4403. vice[vais]
n.罪恶；恶习；缺点
4404. vice[vais]
n.(老)虎钳
4405. victim['viktim]
n.牺牲者，受害者
4406. victorious[vik't0:ri2s]
a.胜利的，得胜的
4407. victory['vikt2ri]
n.胜利，战胜
4408. video['vidi2u]
a.电视的 n.电视
4409. view[vju:]
n.看；视力；风景
4410. viewpoint['vju:p0int]
n.观点，看法，见解
4411. vigorous['vig2r2s]
a.朝气蓬勃的
4412. village['vilid7]
n.乡村，村庄
4413. vine[vain]
n.葡萄树
4414. vinegar['vinig2]
n.醋
4415. violence['vai2l2ns]
n.猛烈，激烈；暴力
4416. violent['vai2l2nt]
a.猛烈的；狂暴的
4417. violet['vai2lit]
n.紫罗兰
4418. violin[vai2'lin]
n.小提琴
4419. virtually['v2:tju2li]
ad.实际上，事实上
4420. virtue['v2:tju:]
n.善；美德；优点
4421. visible['viz2bl]
a.可见的，看得见的
4422. vision['vi72n]
n.视；想象力；梦幻
4423. visit['vizit]
vt.&n.访问，参观
4424. visitor['vizit2]
n.访问者；游客
4425. visual['vizju2l]
a.看的；看得见的
4426. vital['vaitl]
a.生命的；有生命力的
4427. vitamin['vit2min]
n.维生素，维他命
4428. vivid['vivid]
a.鲜艳的；生动的
4429. vocabulary[v2'k9bjul2ri]
n.词汇表；词汇，语汇
4430. voice[v0is]
n.说话声；意见；语态
4431. volcano[v0l'kein2u]
n.火山
4432. volleyball['v0lib0:l]
n.排球，排球运动
4433. volt[v2ult]
n.伏特，伏
4434. voltage['vaultid7]
n.电压
4435. volume['v0ljum]
n.卷，册；容积；音量
4436. voluntary['v0l2nt2ri]
a.自愿的，志愿的
4437. vote[v2ut]
n.选举，投票，表决
4438. voyage[v0id7]
n.&vi.航海，航空
4439. wage[weid7]
n.工资，报酬
4440. wage[weid7]
vt.开展(运动)
4441. waggon['w9g2n]
n.四轮运货马车
4442. waist[weist]
n.腰，腰部
4443. wait[weit]
vi.等，等候 n.等待
4444. waiter['weit2]
n.侍者，服务员
4445. wake[weik]
vi.醒，醒来 vt.唤醒
4446. waken['weik2n]
vi.醒来 vt.弄醒
4447. walk[w0:k]
vi.&n.走，步行
4448. wall[w0:l]
n.墙，壁，围墙，城墙
4449. wallet['w0lit]
n.钱包，皮夹子
4450. wander['w0nd2]
vi.漫游；迷路；离题
4451. want[w0nt]
vt.要 n.需要；缺乏
4452. war[w0:]
n.战争；冲突，斗争
4453. warm[w0:m]
a.温暖的；热烈的
4454. warmth[w0:m4]
n.暖和，温暖；热烈
4455. warn[w0:n]
vt.警告 vi.发生警告
4456. wash[w06]
vt.洗；冲出 vi.洗涤
4457. waste[weist]
n.浪费；废物；垃圾
4458. watch[w0t6]
vt.&vi.观看 n.手表
4459. water['w0:t2]
n.水 vt.使湿，灌溉
4460. waterfall['w0:t2f0:l]
n.瀑布
4461. waterproof['w0:t2pru:f]
a.不透水的，防水的
4462. wave[weiv]
n.波；波涛 vi.波动
4463. wavelength['weivle84]
n.波长
4464. wax[w9ks]
n.蜡，蜂蜡
4465. way[wei]
n.路；路线；方向
4466. we[wi:]
pron.(主格)我们
4467. weak[wi:k]
a.弱的；软弱的
4468. weaken['wi:k2n]
vt.削弱 vi.变弱
4469. weakness['wi:knis]
n.虚弱，软弱；弱点
4470. wealth[wel4]
n.财富，财产；丰富
4471. wealthy['wel4i]
a.富的，富裕的
4472. weapon['wep2n]
n.武器，兵器
4473. wear[w/2]
vt.穿着，戴；磨损
4474. weary['wi2ri]
a.疲倦的 vt.使疲乏
4475. weather['we52]
n.天气
4476. weave['wi:v]
vt.织，编 vi.纺织
4477. wedding['wedi8]
n.婚礼
4478. Wednesday['wenzdi]
n.星期三
4479. weed[wi:d]
n.杂草，野草 vi.除草
4480. week[wi:k]
n.星期，周
4481. weekday['wi:kdei]
n.周日，工作日
4482. weekend['wi:kend]
n.周末，周末假期
4483. weekly['wi:kli]
a.每周的 ad.每周
4484. weep[wi:p]
vi.哭泣，流泪
4485. weigh[wei]
vt.称…的重量；掂量
4486. weight[weit]
n.重；砝码；重担
4487. welcome['welk2m]
int.&n.&vt.欢迎
4488. weld[weld]
vt.&n.焊接，熔接
4489. welfare['welf/2]
n.幸福，福利
4490. well[wel]
n.井
4491. well[wel]
ad.好；完全地 int.嘿
4492. well-known['wel'n2un]
a.众所周知的，出名的
4493. west[west]
n.西；西洋 a.西方的
4494. western['west2n]
a.西方的，西部的
4495. westward['westw2d]
a.向西的 ad.向西
4496. wet[wet]
a.湿的；下雨的
4497. what[w0t]
pron.什么 a.什么
4498. whatever[w0t'ev2]
pron.无论什么
4499. wheat[wi:t]
n.小麦
4500. wheel[wi:l]
n.轮，车轮
4501. when[wen]
ad.什么时候；当…时
4502. whenever[wen'ev2]
conj.无论何时，每当
4503. where[w/2]
ad.在哪里 pron.哪里
4504. wherever[w/2r'ev2]
ad.究竟在哪里
4505. whether['we52]
conj.是否
4506. which['wit6]
pron.哪一个 a.哪一个
4507. whichever[wit6'ev2]
a.无论哪个，无论哪些
4508. while[wail]
conj.当…的时候；而
4509. whilst['wailst]
conj.&n.当…的时候
4510. whip[wip]
vt.鞭笞；搅打 n.鞭子
4511. whirl[w2:l]
vt.使回旋 vi.&n.回旋
4512. whisky['wiski]
n.威士忌酒
4513. whisper['wisp2]
vt.低声地讲 vi.低语
4514. whistle['wisl]
n.口哨 vi.吹口哨
4515. white[wait]
a.白的 n.白色
4516. whitewash['waitw06]
vt.粉刷，涂白
4517. who[hu:]
pron.谁；…的人
4518. whoever[hu:'ev2]
pron.谁；无论谁
4519. whole[h2ul]
a.完整的 n.全部
4520. wholly['h2uli]
ad.完全地，全部
4521. whom[hu:m]
pron.(宾格)谁
4522. whose[hu:z]
pron.谁的；哪个人的
4523. why[wai]
ad.为什么
4524. wicked['wikid]
a.坏的；令人厌恶的
4525. wide[waid]
a.宽阔的 ad.全部地
4526. widely['waidli]
ad.广，广泛
4527. widen['waidn]
vt.加宽 vi.变宽
4528. widespread['waidspred]
a.分布广的，普遍的
4529. widow['wid2u]
n.寡妇
4530. width[wid4]
n.宽阔，广阔；宽度
4531. wife[waif]
n.妻子
4532. wild[waild]
a.野生的；野蛮的
4533. will[wil]
aux.v.将要，会；愿
4534. willing['wili8]
a.愿意的，心甘情愿的
4535. win[win]
vi.获胜，赢 vt.赢得
4536. wind[wind. waind]
n.风；气息，呼吸
4537. wind[wind. waind]
vt.绕，缠绕 vi.卷曲
4538. window['wind2u]
n.窗子，窗户，窗口
4539. wine[wain]
n.葡萄酒，果酒
4540. wing[wi8]
n.翼，翅膀，翅
4541. winner['win2]
n.获胜者，优胜者
4542. winter['wint2]
n.冬天，冬季
4543. wipe[waip]
vt.&n.揩，擦
4544. wire['wai2]
n.金属线；电缆；电信
4545. wireless['wai2lis]
a.不用电线的，无线的
4546. wisdom['wizd2m]
n.智慧，才智；名言
4547. wise[waiz]
a.有智慧的，聪明的
4548. wish[wi6]
vt.祝；想要 n.希望
4549. wit[wit]
n.智力，才智，智能
4550. with[wi5]
prep.和…一起；具有
4551. withdraw[wi5'dr0:]
vt.收回；撤回vi.撤退
4552. within[wi'5in]
prep.在…里面
4553. without[wi5'aut]
prep.无，没有，不
4554. withstand[wi5'st9nd]
vt.抵挡，反抗
4555. witness['witnis]
n.证据；证人 vt.目击
4556. wolf[wulf]
n.狼
4557. woman['wum2n]
n.妇女，女人，女性
4558. wonder['w3nd2]
n.惊异，惊奇；奇迹
4559. wonderful['w3nd2ful]
a.惊人的；极好的
4560. wood[wud]
n.树林，森林；木头
4561. wooden['wudn]
a.木制的；呆板的
4562. wool[wul]
n.羊毛；毛线，绒线
4563. woollen['wul2n]
a.羊毛制的，毛线的
4564. word[w2:d]
n.词；话；消息；语言
4565. work[w2:k]
n.工作；职业 vi.工作
4566. worker['w2:k2]
n.工人；工作者，人员
4567. workman['w2:km2n]
n.工人，劳动者，工匠
4568. workshop['w2:k60p]
n.车间，工场；创作室
4569. world[w2:ld]
n.世界；世人；世间
4570. world-wide['w2:ldwaid]
a.遍及全球的
4571. worm[w2:m]
n.虫，蠕虫
4572. worry['w3ri]
vt.使烦恼 vi.发愁
4573. worse[w2:s]
a.更坏的 ad.更坏
4574. worship['w2:6ip]
n.礼拜；崇拜 vt.崇拜
4575. worst[w2:st]
a.最坏的 ad.最坏地
4576. worth[w2:4]
a.值…的 n.价值
4577. worthless['w2:4lis]
a.无价值的，无用的
4578. worthwhile['w2:4'wail]
a.值得花时间的
4579. worthy['w2:5i]
a.有价值的；值得的
4580. would[wud. w2d]
aux.v.将；愿；总是
4581. wound[wu:nd]
n.创伤，伤 vt.使受伤
4582. wrap[r9p]
vt.裹，包，捆 n.披肩
4583. wreath[ri:4]
n.花环，花圈，花冠
4584. wreck[rek]
n.失事；残骸 vt.破坏
4585. wrist[rist]
n.腕，腕关节
4586. write[rait]
vt.书写；写 vi.写
4587. writer['rait2]
n.作者，作家，文学家
4588. writing['raiti8]
n.书写，写；著作
4589. wrong[r08]
a.错误的 ad.错，不对
4590. X-ray['eks'rei]
n.X射线，X光
4591. yard[ja:d]
n.院子，庭院；场地
4592. yard[ja:d]
n.码
4593. yawn[j0:n]
vi.打呵欠 n.呵欠
4594. year[j2:. ji2]
n.年；年年
4595. yearly['j2:li]
a.每年的 ad.一年一度
4596. yell[jel]
vi.叫喊
4597. yellow['jel2u]
a.黄(色)的 n.黄(色)
4598. yes[jes]
ad.是，是的
4599. yesterday['jest2di]
n.&ad.昨天，昨日
4600. yet[jet]
ad.还；已经 conj.而
4601. yield[ji:ld]
vt.&vi.出产 n.产量
4602. you[ju:. ju]
pron.你，你们
4603. young[j38]
a.年轻的 n.青年们
4604. your[j0:]
pron.你的，你们的
4605. yours[j0:z]
pron.你们的(东西)
4606. yourself[j0:'self]
pron.你自己；你亲自
4607. youth[ju:4]
n.青春；青年们；青年
4608. youthful['ju:4ful]
a.年轻的，青年的
4609. zeal[zi:l]
n.热心，热情，热忱
4610. zealous['zel2s]
a.热心的，热情的
4611. zebra['zi:br2]
n.斑马
4612. zero['zi2r2u]
n.零；零点，零度
4613. zone[z2un]
n.地区，区域，范围
4614. zoo[zu:]
n.动物园

