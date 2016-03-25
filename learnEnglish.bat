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
echo 1,���� 2,�ļ����� 3,�ļ�����
set /p sel=��ѡ��
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
if /i "%input%" == %2 echo Wonderful������������Great������������Wonderful������������Great������������
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











































































































;����228
1. It's up to you.
���������
2. I envy you.
����Ľ�㡣
3. How can I get in touch with you?
����ô��ϵ���㣿
4. Where can I wash my hands?
����ϴ�ּ������
5. What's the weather like today?
����������Σ�
6. Where are you headed?
��Ҫ������ȥ��
7. I wasn't born yesterday.
���ֲ�������С����
8. What do you do for relaxation?
����ʲô��ǲ��
9. It��s a small world.
������С!
10. It��s my treat this time.
�������ͣ�
11. The sooner the better.
Խ��Խ�á�
12. When is the most convenient time for you?
��ʲôʱ����㣿
13. Take your time.
������/���ż���
14. I'm mad about Bruce Lee.
��������С���ˡ�
229. I'm crazy about rock music.
�Ҷ�ҡ���ֺ����ԡ�
15. How do I address you?
����ô�ƺ��㣿
16. What was your name again?
����˵һ�����ֺ���
17. Would you care for a cop of coffee?
Ҫ��������
18. She turns me off.
��ʹ���ᷳ��
19. So far so good.
ĿǰΪֹ��һ�ж��á�
20. It drives me crazy.
�����ձƷ��ˡ�
21. She never showed up.
��һֱû�г��֡�
22. That's not like him.
�ǲ��������ķ��
23. I couldn't get through.
�绰��ͨ��
24. I got sick and tired of hotels.
�������ùݡ�
25. Be my guest.
��㡢�����
26. Can you keep an eye on my bag?
���ҿ�һ�°�����
27. Let's keep in touch.
�����Ǳ�����ϵ��
28. Let's call it a day.
����͵���Ϊֹ�ɡ�
29. I couldn't help it.
��û�취��
30. Something's come up.
�е���/������
31. Let's get to the point.
��������̸Ҫ�㡣
32. Keep that in mind.
��ס�Ǽ��¡�
33. That was a close call.
̫Σ����/ǧ��һ��
34. I'll be looking forward to it.
�ҽ��ڴ���һ�졣
35. Chances are slim.
�����С��
36. Far from it.
һ��Ҳ����
37. I'm behind in my work.
�ҹ�����������ˡ�
38. It's a pain in the neck.
�����Ǽ��鷳�£�
39. We're in the same boat.
���Ǵ�����ͬ��
40. My mouth is watering.
��������ˮ�ˡ�
41. What do you recommend?
���Ƽ�ʲô��
42. I ache all over.
�һ�����ʹ��
43. I have a runny nose.
�������顣
44. It's out of the question.
���ǲ����ܵġ�
45. Do you have any openings?
�����п�ȱ��
46. It doesn't make any difference.
ûʲô���/����ν��
47. I'm fed up with him.
���ܹ����ˡ�
48. You can count on us.
������������ǡ�
49. It doesn't work.
���ˣ������ˡ�
50. It's better than nothing.
�ܱ�ʲô��û�кá�
51. Think nothing of it.
��������ϡ�
52. I'm not myself today.
�ҽ�����������
53. I have a sweet tooth.
��ϲ������ʳ��
54. I can't express myself very well in English.
�Ҳ��ܺܺõ���Ӣ�����Լ���
55. For the time being.
��ʱ�����ң�Ŀǰ
56. This milk has gone bad.
��ţ�̱����ˡ�
57. Don't beat around the bush.
�����Ĩ���ˡ�
58. It's up in the air.
��δȷ����
59. Math is beyond me.
�Ҷ���ѧ����Ϊ����
60. It slipped my mind.
�����ˡ�
61. You can't please everyone.
�㲻�����ֺ�ÿһ���ˡ�
62. I'm working on it.
������Ŭ����
63. You bet!
��Ȼ��
64. Drop me a line.
д���Ÿ���
65. Are you pulling my leg?
���ڿ�����Ц��
66. Sooner or later.
�����ġ�
67. I'll keep my ears open.
�һ�����ġ�
68. It isn't much.
����΢������ġ�
69. Neck and neck.
�������¡�
70. I'm feeling under the weather.
�Ҿ��ò����/���񲻺�/�������䡣
71. Don't get me wrong.
��Ҫ����ҡ�
72. I'm under a lot of pressure.
��ѹ���ܴ�
73. You're the boss.
����ġ�
74. It doesn't make any sense.
�������壡
75. If I were in your shoes.
���������Ļ���
76. What's this regarding?
���ǹ����ķ���ģ�
77. Over my dead body!
���룡
78. Can you give me a hand?
���ܰ��æ��
79. We have thirty minutes to kill.
��������ʮ���ӿ���ʱ�䡣
80. Whatever you say.
����㡣
81. It'll come to me.
�һ��������ġ�
82. You name it.
��˵������
83. Time will tell.
ʱ���֤���ġ�
84. I will play it by ear.
�һ�������µģ���ʱ����˵��
85. You should take advantage of it.
��Ӧ�úú�����������ᡣ
86. Let's talk over coffee.
���Ǳߺȱ�̸��
87. Take it easy.
����һ�㣻����ţ����ɷ��ɣ��ټ���[������������ϲ��˵�Ļ���Ҳ����������]
88. I'm easy to please.
�Һ�����ȡ��/�ദ��
89. Let's give him a big hand.
���������ҹ��ơ�
90. As far as I'm concerned.
���Ҷ��ԡ�
91. I'm all mixed up.
��ȫ����ˡ�
92. Let's get together one of these days.
��һ��۾ۡ�
93. He's behind the times.
��������/������ʱ���ˡ�
94. I'm pressed for time.
��ʱ����ȡ�
95. I'm up to my ears in work.
��æ���ˡ�
96. You can't do this to me.
�㲻����ô���ҡ�
97. Just to be on the safe side.
Ϊ�˰�ȫ�����
98. I hope I didn't offend you.
ϣ��û��ð���㡣
99. It won't take much time.
���Ứ�ܳ�ʱ��ġ�
100. It's been a long time.
�þò����ˡ�
101. It��s nothing.
С���飻����ҳݡ�
102. It's a long story.
˵��������
103. It's about time.
ʱ�����ˡ�
104. It's incredible.
�������ţ�
105. It's hard to say.
��˵��
106. I can't imagine why.
���벻ͨΪʲô��
107. That can't be.
�����ܡ�
108. That's really something.
���˲���
109. Are you sure?
��ȷ����
110. Are you crazy?
�������
111. Excuse me for a moment.
ʧ��һ�����
112. I mean it. I'm serious. I'm no kidding.
��������ġ�
113. I'll consider this matter.
�һῼ������µġ�
114. I'll do something about it.
�һ���취�ġ�
115. What are you talking about?
����˵Щʲô��
116. I'm afraid I can't.
�����Ҳ��С�
117. I'm dying to see you.
��������㡣
118. I'm flattered.
�����ˡ�
119. I'm not in the mood.
��û���顣
120. I'm so scared.
���¼��ˡ�
121. I can't make it.
��ȥ����/�Ҹϲ��ϡ�
122. You can never tell.
��֪��/˭Ҳû���ա�
123. I won't buy you story.
�Ҳ�������һ�ס�
124. It hurts like hell.
��������
125. It can't be helped.
����Ϊ����
126. Sorry to bother you.
��Ǹ�����㡣[��ǰ]
230. Sorry to have bothered you.
��Ǹ�����㡣[�º�]
127. I'm always punctual.
�����Ǻ�׼ʱ��
128. You may leave it to me.
���������졣
129. I wish I could.
���С�[ί���﷨]
130. What's the rush?
ʲô����ô��æ��
131. What's so funny/
��ʲô��Ц�ģ�
132. I couldn't agree more.
����ȫͬ�⡣
133. Stay out of this matter. please.
�������¡�
134. Don't just shake you head.
���ҡͷ������취��
135. Don't jump to conclusions.
��ִ�/�����½��ۡ�
136. That was a lousy movie.
�ǵ�Ӱ��͸�ˣ�
137. Have you thought about staying home?
�Ƿ����ڼҴ��ţ�
138. I'll come. I give you my word.
�һ����ġ������㱣֤��
139. I swear I'll never tell anyone.
�ҷ��Ĳ������κ��ˡ�
140. I'll make it up to you.
�һ��⳥�ġ�
141. I'm very / really / terribly / awfully / extremely sorry.
ʮ�ֱ�Ǹ��
142. Forgive me for breaking my promise.
ԭ����ʳ�ԡ�
143. Let's forgive and forget.
�����Ǳ���ǰ�ӡ�
144. I've heard so much about you.
����������
145. Don't underestimate me.
��С���ҡ�
146. She gives me a headache.
������ͷ�ۡ�
147. It's very annoying.
�淳�ˡ�
148. He often fails to keep his word.
������������ŵ�ԡ�
149. You made me feel ashamed of myself.
�����Ҹе�������
150. I hope it turns out all right.
��ϣ������ܺá�
151. I can't handle this alone.
���޷������������¡�
152. How long will it take to have this radio fixed?
������������Ҫ��ã�
153. Come to me if you're in any difficulty.
�����������ҡ�
154. Who do you think you are?
����Ϊ����˭��
155. You're wasting you breath.
���ڰ׷ѿ��ࡣ
156. It doesn't seem like that.
�ƺ�������������
157. Don't get on my nerves.
��Ҫ�������ķ���
158. Everything will be fine.
һ�ж���ܺá�
159. I'll be ready in a few minutes.
�ٹ������Ӿͺ��ˡ�
160. I wonder what happened to him.
�Ҳ�֪������ʲô���ˡ�
161. You are just trying to save face.
��ֻ����������ӡ�
162. His argument doesn't hold water.
�����۵�վ��ס�š�
163. Your face tells it all.
��ı���͸¶��һ�С�
164. The days are getting longer.
����Խ��Խ���ˡ�
165. You've got to do something.
��һ��Ҫ��취�� 
166. I hope this will teach you a lesson.
ϣ��������һ����ѵ��
167. I feel younger than ever.
�Ҿ��ñ���ǰ���ᡣ
168. It's a hard job. but I hope he can make it.
�ⲻ�Ǽ����׵Ĳ��£�����ϣ������������
169. Don't look wise.
������������
170. I'm afraid all my efforts were in vain.
�ҵ����ҵ�Ŭ��ȫ�׷��ˡ�
171. What happened to you memory?
��ļ�������ô��ģ�
172. You're going too far.
��̫�����ˣ�
173. Don't bury your head in the sand.
��Ҫ�ӱ���ʵ��
174. I have no other choice.
�ұ���ѡ��
175. I don't have the nerve to do it.
��û��/����ȥ����
176. It's a matter of life and death.
�¹�������
177. Nothing works.
ʲô�����Ծ�����
178. Money will come and go.
Ǯ������֮�
179. He's been behind bars for almost 30 years.
�����˽�����ʮ���Ρ�
180. If I had known that. I could have helped you.
��������֪�����Ҿ��ܰ����ˡ�[��ʵ�õ���������]
181. I couldn't care less.
�Ҳ��ں���
182. You have my word.
�ұ�֤��
183. He hit the ceiling at the news.
����������Ϣ��������/��������
184. I don't mind staying up late.
�Ҳ��ں���ҹ��
185. You're too outspoken.
��ֱ̫���ˡ�
186. I can't afford it.
�ҳе�/����
187. I think it's a reasonable price.
�Ҿ������Ǹ�����ļ�Ǯ��
188. I'd like to try on these hats.
����������Щñ�ӡ�
189. He puts me to shame.
��ʹ�����ߡ�
190. Every dog has his day.
���˽��е���ʱ��
191. Don't give me any excuses.
��Ҫ�����κ����ɡ�
192. Are you out of you mind?
�������
193. He's been everywhere.
��������ȥ���ˡ�
194. What's bothering you?
ʲô�������㣿
195. Who is to blame?
�ù�˭��
196. There're a lot of rumors going around.
�ܶ����������š�
197. I don't feel up to that.
�Ҿ��ò���ʤ���ǹ�����
198. I'm mad at myself.
�����Լ�������
199. It's raining cats and dogs.
����������ꡣ
200. The sky is getting very cloudy.
��յ���Խ��Խ���ˡ�
201. You won't get away with this.
���Ӳ����ͷ��ġ�
202. I'm tired of going to school day after day.
�����ÿ����ѧ��
203. Who am I supposed to see?
��Ӧ��ȥ��˭��
204. His idea is childish.
�����뷨�����ɡ�
205. I need small change.
����Ҫ��Ǯ��
206. Don't try to brainwash me.
�������ϴ�ԡ�
207. I don't seem to have any luck today.
�ҽ����������á�
208. That reminds me.
���������ҡ�
209. What the hell are you doing?
�㵽������ʲô��
210. I can't seem to get to sleep.
�Һ���˯���š�
211. You look very serious about something.
���ƺ��к����ص��¡�
212. I hope I'm not in the way.
��ϣ��û����ɷ�����
213. What are you so excited about?
ʲô����������˷ܣ�
214. Tell me about you trouble.
����ķ��ո����ҡ�
215. I feel much better now.
�Ҹо��ö��ˡ�
216. I hope you will get well soon.
ϣ����ܿ��ָ���
217. She is sick in bed.
���Բ��ڴ���
218. I have a slight fever.
����΢���ա�
219. A fool never learns.
ɵ����Զѧ���ᡣ
220. This is the schedule for tomorrow.
����������ճ̰��š�
221. How late are you open?
����Ӫҵ������
222. I'm here on business.
����������
223. What's Hong Kong famous for?
�����ʲô������
224. What brings you to Beijing?
ʲô����㴵���������ģ�
225. She looks blue.
���������ˡ�
226. I just don't know what to say.
�Ҿ��ǲ�֪��˵ʲô��
227. Let's have fun tonight.
������������һ�֡�
228. Thank you for coming to see me off.
лл����Ϊ�����С�
231. Don't trouble trouble until trouble troubles you.
�������鷳�ˣ�˳����Ȼ�ɡ�
232. Some of us like to have our future mapped out. others like to go with the flow.
��Щ��ϲ���滮δ������Щ��ϲ��˳����Ȼ��
233. It's best to take the world as you find it. then you won't be disappointed.
����˳����Ȼ��ã���������Ͳ���ʧ���ˡ�
234. Be that as it may. I'll leave it as it is.
�����������Ҳֻ��������Ȼ��
235. Since there is nothing we can do. why not let nature take its course?
��Ȼ��������Ϊ�����β�˳����Ȼ�أ�
236. Your opposition won't make any difference. just let it be.
�㷴��Ҳ������ʲô���ã�˳����Ȼ�ɡ�
237. We will cross the bridge until we come to it.
��һ����һ���ɣ�˳����Ȼ��
238. Whatever will be. will be.
���²��ؿ���˳����Ȼ��























;�ļ�����
1. be able to do
�ܹ�����
2. be about to do
��Ҫ������
3. above all
���ȣ���Ҫ��������
4. be absorbed in sth.
ר�������ڡ�
5. be absorbed in doing sth.
ר�������ڡ�
6. be abundant in
�����ڣ����ḻ
7. by accident(=by chance)
żȻ������ 
8. in accordance with
���գ����ݣ��롭һ��
9. according toprep.
��/�ա�(��˵����д)���������ӡ�
10. accuse sb. of sth.
�ظ�(ĳ��ĳ��)
11. be accustomed to
ϰ���ڣ��߳���
12. act as
(��ʱ)���Σ��䵱��������
13. act on
���ա��ж������У������ڣ�Ӱ��
14. put sth. into action
����ʵʩ
15. put sth. out of action
ʹ����ֹͣ������
16. take action
��ȡ�ж�����ʼ����
17. adapt to
��Ӧ
18. add up
��������˵��ͨ
19. in additionconj.
���⣬��֮
20. in addition to
��֮���֣�����֮�⣻����
21. admit of
�����У��С����
22. be on the advance
(���)��������
23. in advance
Ԥ�ȣ����ȣ���ǰ��
24. in advance of
�ڡ���ǰ�棻����
25. gain an advantage over
ʤ��������
26. have an advantage over
��...������
27. take advantage of sth.
���ã�ʱ�������˵�����ȣ�
28. afford to
(��)����(ĳ��)
29. agree with
ͬ�⣻�޳ɣ�����ĳ�ˣ����һ��
30. agree to sth.
ͬ��ĳ��
31. ahead of
�ڡ�ǰ�棬���ڣ�ʤ��
32. go ahead
˵�ɣ��߰ɣ�����(����)������ǰ��
33. aim for
��׼���ԡ�ΪĿ��
34. aim at
��׼����ԣ��ڣ�ּ��
35. by air
ͨ������;���������ߵ�
36. in the air
�ڿ��У��������У�����δ��
37. on the air
(�����ߵ磬����)����
38. after all
�Ͼ����վ�����Ȼ����
39. at all
(���ڷ񶨾�)˿��(��)��һ��(��)
40. in all
�ܹ���һ�����ϼ�
41. all out
ȫ���Ը����߾�ȫ��
42. all over
�������鼰��������(��ò)�ǳ���
43. all but
��������һ�㣻����֮�����඼
44. all right
��������ģ�����ģ�(����)���õ�/��/����
45. not at all
(������ǿ not ������)һ��Ҳ����������
46. all along
һֱ��ʼ�գ���һ��ʼ��
47. amount to
�ﵽ���ܼƣ��൱�ڣ�����
48. in large amounts
������
49. and so on(=and so forth)
�ȵ� 
50. and so forth
�ȵȣ���˵ȵ�
51. and the like
�ȵȣ��Լ��������
52. and that
����
53. and then
���ң���Σ����ǣ�Ȼ��
54. and yet
���ǣ�Ȼ��
55. one after another
һ����һ���أ�������
56. one another
�˴�(ָ���߻���������)
57. answer for
�ԡ����𣻳��ܡ�֮���
58. answer back
Ӧ��
59. not any longer
����
60. not any more(=no more)
����
61. nothing but
���ˡ�����û��ʲô��������ֻ����
62. apart from
��...֮��(����)������֮��(����)
63. apologize to sb. for sth.
Ϊĳ����ĳ�˵�Ǹ
64. appeal to sb. to do sth.
���󡭡�������
65. apply for
�������(��Ҫ���)
66. apply...to
�ѡ�Ӧ���ڣ�Ϳ��Ĩ
67. apply oneself to
������
68. approve of
���ͣ�ͬ�⣻��׼��ͨ��
69. arm in arm
�����űۣ�Эͬ
70. under arms
������������װ������
71. all around
�Ĵ�������
72. arrive at
�ó����������ﵽ
73. arrive in
����ִ�
74. as...as
��...һ��
75. not so...as
���硭����
76. such...as
����...֮���
77. so far as
(��ʾ�̶ȡ���Χ)�͡�������
78. as good as
��...����һ����ʵ���ϵ���
79. as if
ͬ����as though���󣬷·�
80. as though
�����ƺ����·�
81. as it is
��ʵ�ϣ���Ȼ���
82. as long as(=so long as)
ֻҪ���������Ȼ������ 
83. as much
Ҳ;ͬ�����
84. as suchin itself or in themselves
ͬ���ģ�ͬ����
85. as toprep.
���ڡ������ڡ�
86. as well
Ҳ���֣��Լ�����...һ������...֮��
87. so as to
�Ա㣻Ϊ��(Ŀ��)
88. as well as
Ҳ���֣��Լ����͡�һ��������֮��
89. aside from
����֮��(����)������֮��(����)
90. ask after
̽�ʣ��ʺ�
91. ask for
������Ҫ��Ѱ��
92. assist in
����(��ĳ��)
93. assist sb. with sth.
����ĳ����ĳ��
94. attach to
ʹ���ڣ�ʹ�μӣ���Ϊ��(���ε�)
95. attach oneself to
�������μӵ���
96. be attached to
(���)ϲ������������...�и���
97. attend to one's work
ר�Ĺ���
98. pay attention to
ע�⣻���ģ�����
99. be available for
��Ч
100. on an average
ƽ��������һ��˵��
101. up to the average
�ﵽһ��ˮƽ
102. be aware of
֪������ʶ������ʶ��
103. right away
���������ϣ�����
104. be at the back of sb.
֧��ĳ��
105. behind sb's back
����
106. put one's back into sth.
ר����־��ĳ��
107. be back
����
108. back and forth
���أ�����������������
109. keep one's balance
����ƽ�⣬�����侲
110. lose one's balance
ʧȥƽ�⣬����
111. base oneself on
���ݣ�����
112. be based on
��...Ϊ��������...Ϊ����
113. bear away
��ã�Ӯ��(��Ʒ��)
114. bear off
Ӯ�ã�ʹ�뿪��ʻ��
115. bear down
�߾�ȫ����(on)ѹ��������
116. bear upon
�ԡ���ʩ��ѹ�����йأ���׼
117. bear up
֧�֣�ӵ����������
118. bear with
���ݣ����ĵȴ�
119. beat about
�Ĵ��й䣬�ۺ�����ӭ��бʻ
120. beat down
(̫����)ǿ�ҵ������������򵹣�ƽϢ
121. beat off
���ˣ�����(����)
122. beat up
ʹ�򣬺���
123. begin at
�ӡ�����ʼ
124. begin with
�ԡ���ʼ���ԡ�Ϊ���
125. to begin with
���ȣ���һ�����������
126. in behalf of
����...һ������Ϊ...�ķ�����
127. on behalf of sb.
����ĳ��
128. believe in
���š��Ĵ��ڣ����š�����ʵ��
129. belong to
�顭�����У����ڣ��ǡ�����һԱ
130. at best
�����ֹ۵�һ���濴��������
131. be at one's best
ȫʢʱ�ڣ����״̬
132. do one's best
�߾�ȫ������ĳ������Ŭ��
133. try one's best
������Ŭ��
134. make the best of
������ã��������ã����ڴ���(���ҵ�)
135. all the better
���������ã���ȴ��
136. had better
Ӧ����ĳ�£������ĳ��
137. get the better of
սʤ����...��ռ�Ϸ�
138. have the better of
սʤ��������������
139. bill of fare
�˵�
140. a bit
(��״����)����һ��
141. do one's bit
���Լ���һ������
142. not a bit
һ��Ҳ��
143. black and blue
(�����)��������
144. black out
��īͿ��������(����)
145. be to blame
�����𱸵ģ�Ӧ�е����ε�
146. blow off
��������(��ˮ��)�ų�
147. blow out
��Ϩ(�ƻ��)
148. blow over
(�Ƶ�)��ɢ�����籩�ȣ�ƽϢ
149. blow up
��ը��(��)ը�ɣ���������Ƣ������ŭ
150. be on board
�ڴ���
151. border on
�ӽ磬���������ƣ��ӽ�
152. both...and
���������ң����͡�(����)��
153. from the bottom of one's heart
���ĵ�
154. at the bottom
�ڵ׶�
155. be bound up in
æ�ڣ���...����Ȥ
156. be bound up with
�����ڣ��롭�й�ϵ
157. break away
ͻȻ�뿪�����ܣ�����
158. break down
��������=go wrong �������/��̸ֹ��
159. break into
��ϣ�ͻȻ��ʼ������
160. break in
���̸��;ѵ��;ʹѱ����ͨ��ʹ��ʹ������
161. break off
��Ȼֹͣ����/�Ͼ�������/��ͣ��������Ϣ
162. break out
(ս����)������ʹ���ѣ�ʹ����
163. break up
���飬���飻ɢ������ɢ����ֹ������
164. catch one's breath
(�򾪿ֻ򼤶�)һʱ��ס������Ъ����
165. hold one's breath
(���ڼ��������µ�)����������ס����
166. lose one's breath
��������������������
167. out of breath
������������������������
168. in brief(in short;to sum up)
 ����֮���Լ�����ʽ
169. bring down
ʹ���£�ʹ�½���ʹ�ܴ���
170. bring forward
�������=put forward/��ǰ
171. brush up
����������ѧϰ����ϰ
172. blow bubbles
�����ݣ�˵�ջ�
173. in bud
��ѿ
174. build up
�𲽽������������𽥻��ۣ�����
175. the bulk of
�����Ĵ󲿷�
176. be a burden to
�ԡ�����һ������
177. burn away
���ţ�ȼ�꣬�յ�
178. burn down
�ٻ�(������)���ѡ��ճ�ƽ��
179. burn out
�չ⣬�ջ١����ڲ���Ϩ��
180. burn up
�յ����ջ٣�����������������(ʹ)��ŭ
181. burst into
ͻȻ��ʼ�����룬�Ƿ�����
182. burst out laughing
ͻȻЦ������
183. burst out
ͻ����ͻȻ������������
184. on business
���£��򹫳���
185. but for
�������⣬��û�У�����
186. cannot but
���ò������᲻
187. by oneself
˳��أ���;�У���·��
188. by the way
������ת���»��⣩˳����һ�£�˳��˵
189. by and by
���ã��Ժ󣻺���
190. call for
ȥȡ(ĳ��)��ȥ��(ĳ��)��Ҫ�󣻺���
191. call on(=call upon)
���ʣ��ݷã����٣����� 
192. call upon
̽�ã�����(ĳ��)��ĳ�£�����
193. cannot help
���ò����̲�ס
194. capable of
�ܡ��ģ��ɡ��ģ��С�����(����)��
195. take care
С�ģ����ϣ�����
196. in the care of
�ɡ�����Ӧ
197. take care of (everything)
�ú�����(һ��)
198. care for
ϲ�����ԡ����⣻�ԡ����ģ��չˣ�����
199. carry away
ʹĳ�˳嶯��ʧȥ�����������...��ͷ��
200. carry off
�ɹ��ش����Ӧ�������ߣ�����
201. carry on
�����������ȥ�����£���Ӫ
202. carry out
���У���չ��ִ��(�ƻ�������)��ʵ��
203. in case
��һ���ڡ�����£� �Է�
204. in case of
���磬�������������
205. in no case
������������β�
206. catch up
���ϣ�����ĳ�˻�ĳ��
207. catch up with
���ϣ�ָ�������˲��
208. stand on ceremony
������������
209. stand upon ceremony
�������
210. by chance
żȻ�����ɣ�������
211. change hands
ת�֣�ת��������
212. in charge of
���ܣ��ƹܣ��չ�
213. take charge of
����(��)�����ӹ�
214. give chase
׷��,׷��(in chase of)
215. check up
У�ԣ����飬��� (check on)
216. check in
(ס����ʱ)����Ǽ���������ס
217. check out
(ס����ʱ)�����˷������������뿪
218. cheer up
ʹ���ˣ�ʹ��ܣ�������������������
219. cheer sb. up
ʹĳ�˸���
220. chew over
��˼��ϸ�룻��ϸ����
221. take one's choice
����ѡ��
222. under the circumstances
����������£�(���)��Ȼ���
223. in the circumstances
����������£�(���)��Ȼ���
224. under no circumstances
�������������κ������¶���
225. in no circumstances
�������������κ������¶�����
226. clean out
�ѡ���ɨ�ɾ�
227. clean up
(�ѡ�)��ʰ�ɾ����������(���������)
228. keep clear of
���Ӵ����ܿ�
229. clear away
�ѡ��������(��)��ʧ
230. clear off
����(��ѩ)���ϰ�����...��������������
231. clear up
������ʰ�����ͣ����(����)�������ž�
232. climb down
���£��ò�������
233. close down
(������)�رգ�����
234. close up
��������գ�ֹͣ����ͣӪҵ
235. catch a cold
�˷磬��ð
236. have a cold
���Ÿ�ð
237. come about
������(���)�ı䷽��
238. come of
�����ڣ��ɡ������ǡ��Ľ��
239. come off
���������У��ɹ������䣻��Ϊ������
240. come on
���(��)����ʼ�����������У��߰ɣ�һ��ȥ
241. come out
(�ա��¡��ǵ�)���֣�(��)���ţ����棻����
242. come round
(����ʽ��)�Ƶ����������ã���������������
243. in common
���ã���ͬ��������
244. in company with
(��...)һ��
245. be composed of
��...���
246. concern oneself with
�о��Ķ����ǡ�
247. concern oneself in
���ģ�æ��
248. concern oneself about
���ģ�æ��
249. in concert with sb.
�롭��һ��
250. in conclusion
���(���ڽ�������)
251. on this condition
�ڴ�������
252. on condition that
��...�����£����...
253. to be in condition
����
254. to be out of condition
������
255. in conflict with
(��...)��ì�ܣ���һ��
256. in connection with
���ڣ��롭�й�
257. come in contact with
�Ӵ�������
258. out of contact
�ƶ���ϵ��û�нӴ�
259. on the contrary
����෴�����෴
260. out of control
ʧȥ����
261. get under control
����������ס
262. turn the corner
����ת������ת������
263. at the cost of
�ԡ�Ϊ���ۣ���...������
264. count on
���������룬ָ��
265. count upon
ָ�������룻����
266. count up
��������������ƣ��ѡ����
267. in course of
���ڡ���
268. in the course of
�ڡ��ڼ䣬�ڡ��Ĺ�����
269. of course
��Ȼ����Ȼ������
270. under cover of
�ڡ���֮�ڻ�֮��
271. cut across
�ƽ�����������ֱͨ������Խ����ס
272. cut off
�жϣ��е���(ͻȻ)�жϣ������������ɾ��
273. cut out
��ȥ��ɾȥ�������ֹͣ����
274. cut up
(���ڵ�)�׺����
275. be in danger of
��Σ��
276. be out of danger
����Σ��
277. keep sth. dark
��������
278. keep sb. in the dark
��ĳ�����ڹ���
279. dash off
Ѹ����ȥ��Ѹ��д(��)
280. out of date
��ʱ�ģ����ڵģ�ʧЧ�ģ��¾ɵ�
281. all the day
�����
282. one day
(��ȥ����)��һ�죻ĳһ��
283. some day
(����)����һ�죬(�պ�)ĳ��
284. at the present day
Ŀǰ�����ִ�
285. in these days
��ǰ
286. in those days
��ʱ��
287. in the daytime
�ڰ��죬�ڰ���
288. a good deal of
����(��)�����(��)
289. a great deal of
���(��Ӳ���������)
290. deal with
�Ը����������ţ��������漰��������
291. in debt
��ծ��Ƿ��
292. out of debt
��Ƿծ
293. declare for
�����޳ɣ�ӵ����
294. declare against
��̬����
295. be in great demand
��Ҫ�ܴ���·�ܺ�
296. deserve well of
Ӧ�ܵ�ĳ�˺õĶԴ�
297. go into details
��ϸ��������һ˵��
298. in detail
��ϸ��
299. die away
����������������ʧ/ͣϢ����ʧ
300. die down
�𽥼���������ʧ��ƽϢ
301. die out (become extinct)
��ʧ���������������
302. never say die
��Ҫ����
303. make a difference
����Դ�����(��Ҫ)���ã���Ӱ��
304. make no difference
û��...���û�Ӱ��
305. be in difficulty
��������
306. dig up
����(�ĵص�)�����������
307. in the distance
��Զ����Զ����
308. do away with
=get rid of �ϳ���ȥ����ȡ��
309. do without
û�С�Ҳ�У��ò��ţ�����
310. have something to do with
�͡���(��)��ϵ
311. have nothing to do with
��...���޹�ϵ
312. out of doors
�ڻ���
313. double up
�������ӣ��ѡ�����
314. in doubt
���ܿ϶��ģ��ɻ��ɵ�
315. without doubt
���ɵأ��ܿ���
316. no doubt (without doubt;certainly)
���ɵأ��ض�
317. up and down
���أ��������£�ǰǰ��󣻵���
318. draw in
(�𳵡�����)�����վ�����գ�������֧
319. draw out
�������ͳ�(������)
320. draw up
�������������(ʹ)ͣס���ƽ�
321. drop in
˳�����ã�����ʽ����
322. drop on
ѵ�⣬�ͷ�
323. drop off
��˯��(�á�)�³����ѡ����£��½�������
324. dry up
(ʹ)�ɺԣ�(ʹ)��͸��(ʹ)�ݽ�
325. due to
��Ϊ���ɡ���������
326. be on duty
ֵ�࣬����
327. be off duty
�°�
328. do one's duty
��ְ��������
329. each other
�˴�(ָ����֮��)
330. take it easy
���Ų�æ������ţ�����
331. come into effect
��ʼ��Ч����ʼʵ��
332. go into effect
ʹ��Ч��������
333. take effect
��Ч��������
334. in effect
ʵ���ϣ�ʵ���ϣ�����ʵ�У���Ч
335. in the employ of
�ܡ����Ĺ�Ӷ
336. pull away
(�ѡ�)���ߣ�(ʹ)�뿪
337. be regarded as
����Ϊ
338. be attributable to
���ڣ��鹦��
339. shut out
��ס���ѡ���������. �ų�
340. by means of
ͨ��...�ֶΣ��������ڣ���
341. set one's sights on sth.
־�ڡ���������
342. make a beeline for
��ֱ����
343. take pride in
�ԡ��Ժ����ԡ��е�����
344. put emphasis on
ǿ�������ص���ڣ�������
345. make up for
�������ֲ�
346. take into account
���ǽ�ȥ�����ǵ�
347. pump up
�������г��ȣ�����
348. in view of
���ڡ������ǵ���������
349. on the verge of
�ӽ��ڣ�������
350. for the sake of
Ϊ�������
351. in the end
���ڣ����
352. enter into
�μӣ���ʼ���£����룻��Ϊ����һ������
353. enter upon
��ʼ������
354. even if(=even though)
��ʹ����Ȼ 
355. even though
��ʹ����Ȼ
356. even so
��Ȼ��ˣ���ʹ������
357. in the event of
�������������һ
358. at all events
�����������������
359. every now and then
ʱ������ʱ�����
360. for example(=for instance)
���磬���磻����˵
361. follow sb's example
��ĳ��Ϊ����
362. set an example to
��������������
363. give an example to
��������������
364. except for
�����⣬��ȥ��Ҫ��������
365. with the exception of
��...֮��
366. without excuse
�޹�
367. come into existence
��ʼ����������
368. to a certain extent
��һ���̶���
369. to a great extent
�ںܴ�̶���
370. catch one's eye
����...��ע��
371. keep an eye on
�տ�����������ע��
372. in the face of
��ԣ��ڡ���ǰ�����ˣ���ʹ
373. lose one's face
����
374. make faces
��������������
375. as a matter of fact
��ʵ�ϣ���ʵ����ʵǡǡ�෴
376. in fact
��ʵ����ʵ�ϣ�ʵ���ϣ�˵��׼ȷЩ
377. in point of fact
ʵ���ϣ���ʵ��
378. keep faith with sb.
�ԡ�������
379. fall back
���ˣ�����
380. fall back on
�����ڣ�ת����������ͷ��˵
381. by far
(�����ݴ���߼�����)����
382. far from
Զ�룬��������ȫ��
383. make one's farewells
���
384. find fault with
���ޣ���(����)���ӣ�����
385. be at fault
�д���֪����
386. for fear offor fear that
Ω�֣�����
387. feel like doing
����������
388. a few
����ʾ�϶�������������
389. a good few
�൱�࣬����
390. quite a few
�����٣����൱��Ŀ��
391. the few
����
392. fill in
��������д��(for)���
393. fill out
��ã���д��ʹ����
394. fill up
���װ��
395. find outv.
�ҳ������֣�����
396. catch fire
�Ż�(����)
397. take fire
�Ż𣬿�ʼȼ�ա�
398. make a fire
����
399. in the first place
�������������һ
400. at first
���(��״���ã�ͨ�����ھ���)
401. from first to last
��ʼ����
402. fit in
���루Ⱥ�壩��װ���
403. fit sth. on
�Դ������µȣ����źã����ӣ�
404. fix up
�޲�������ã����
405. one's own flesh and blood
���ˣ��׹���
406. in flower
���Ż�
407. fold up
ʧ�ܣ�����
408. free from
�ޡ��ģ����ܡ���Ӱ��
409. free of
�ޡ��ģ������ˡ���
410. make free
�ͷ�
411. set free
�ͷţ�ʹ�������
412. make friends with
(�롭)������
413. be friends with
�ԡ��Ѻã��롭��������
414. in front of
�ڡ�ǰ�棬�ڡ���ǰ
415. in the front of
�ڡ�����ǰ��
416. full ofa.
������
417. make fun of
ȡЦ(ĳ��)����������Ц
418. for the future
�ӽ��Ժ��ڽ��
419. in future
�ӽ��Ժ󣬽��
420. in general
�����ϣ�ͨ����һ��˵��
421. get to
���ץס�����Ҫ��������
422. have got
��(���ڵ�һ�����˳Ƶ������͵����˳Ƹ���)
423. get away
�߿������ѣ�(with)���˻��¶�������
424. get in
���룬�μӣ���(��)���ջأ�����(��)
425. get off
(�ӡ�)�������������°ࣻ���ѳͷ�
426. get on
����(�����г���)������(������)���н�չ
427. get out
(ʹ)�뿪����ȥ��(��Ϣ��)й¶��ȡ��
428. get over
�˷�(���ѵ�)����(������ʧ����)�лָ�����
429. get through
��ɣ�ͨ�������꣬����Ⱥ��ͨ������ͨ�绰
430. get up
�𴲣����ϣ��ﵽ
431. give away
�ַ������ͣ��䷢�����ѣ���������¶
432. give out
�ַ������꣬���ľ�������(�⡢������)
433. go about
������������æ�ڣ�(with)���롭����
434. go after (chase;try to get or win)
׷���跨�õ�
435. go ahead
˵�ɣ��߰ɣ�����(����)������ǰ��
436. go along with
�㡭һ���ж�����ͬ��֧��
437. go back on
�����أ������У�����
438. go back upon
Υ��������
439. go down
(��)�³���(̫��������)���£�(�۸�)�½�
440. go into
���룬�μӣ���ʼ���£����飬�о�
441. go on
���������У���ȥ��(��)������ʼ����
442. go out
���������μ��罻���Ϩ��(�·�)��ʱ
443. go over
�ı䣻�˶ԣ����飻�쿴���Ѳ飻�ظ�������
444. go through
��ϸ��飬��ϸ���ۣ�������ͨ��������׼
445. go up
���������ǣ����������ڽ����У���(ը)��
446. go without
û�У�ȱ�������ͣ����裬û�С�Ҳ��
447. on the ground of
�ԡ�Ϊ����
448. grow up
���󣬳��죻�γɣ���չ
449. at first hand
ֱ��
450. hand in hand
�����֣�ͬʱ�����أ����й�����
451. on the one hand
��һ����
452. on the other hand
ͬ���� on the other��һ����
453. hand down
�������������������´�
454. hand in
���ϣ����ϣ�����
455. hand over
�������ƽ����ø�
456. hang about (hang round)
�ǻ����е�
457. hang up
�ѡ����������Ҷ�(�绰)���ӳ٣�����
458. head for
��...����ǰ����ʻ��
459. head off
�Ƶ�ǰ��ȥ����ס
460. hear of
��֪...��Ϣ������...��Ϣ
461. learn by heart
��ס������
462. get by heart
��ס������
463. help oneself
(ʳ���)��������ȡ
464. here and there
������������żȻ
465. hire out
���ȥ���ܹ�
466. catch hold of
ץסĳ���ĳ��
467. get hold of
ץס�����գ���ã��ҵ�
468. lay hold of
��ס������ס��ռ��
469. take hold of
��ס��ץס
470. at home
�ڼ�(��)���ڹ��ڣ����ʣ���ͨ����Ϥ
471. in a hurry
��æ���������ܿ��
472. be taken ill
����
473. fall ill
Ⱦ��������
474. in a minute
һ���������
475. inform against sb.
�淢ĳ��
476. inquire for
ѯ��(�̵ꡢ�ص��)
477. for instance
���磬���磬����˵
478. instead of
���棬�����ǣ����ǡ�(����)
479. out of a job
ʧҵ
480. out of joint
�Ѿʣ��������⣬���ڻ���״̬
481. just now
�Ų��ã����ڣ����£��ղ�
482. just then
������ʱ
483. keep fromKeep you from
��ֹ������(��)
484. keep off
(ʹ)�ÿ���(ʹ)���ӽ�
485. keep on
����(��ĳ��)������
486. keep to
���ĳ��ϰ�ߣ���ѭ����(����)
487. keep up
(ʹ)������ȥ�����֣�ʹ�Ӹ߲���
488. keep up with
����...���ٶȣ�������...֮��
489. knock down
������ײ����ɱ(��)����(��)�����
490. knock out
�ѡ�����ԣ�(������)��̭
491. be known as
��...���֪������������֪��...
492. at last
���ڣ����
493. to the last
ֱ�����
494. later on
�Ժ��´�(��)������
495. sooner or later
���磬������ٻ���
496. laugh at
��Ц��һ���������Ц
497. lay aside
�ѡ�����һ�ߣ��ѡ�����һ�ԣ�����
498. lay down
���£�����(��·)���ⶨ(�ƻ���)
499. lay off
(��ʱ)��ͣ�ͣ�ã���
500. lay out
���ţ����ã���ƣ��ڿ������У�չʾ
501. leave sb. alone
������ĳ��
502. leave off
(ʹ)ֹͣ��ͣ����
503. leave outleave anyone out
���������ų�(ĳ��)
504. at length
�꾡�أ��������
505. let alone
������Ȼ��������ǣ����������������˵
506. let down
ʹʧ��������...������
507. let go(stop holding sth)
�ſ�������
508. let off
�Ź�����ˡ����(ǹ)����(�ڵ�)���ŷ�
509. let out
���ߣ��ͷţ�����(����)��й©
510. bring sb. to life
����������������
511. come to life
���ѹ�������ʼ������
512. look like
����ȥ�񣻺���Ҫ
513. as you like
���
514. in line with
�͡���ֱ�ߣ��롭һ�£�����
515. a little
����(���ڲ���������֮ǰ)
516. little by little
һ��һ��أ��𽥵�
517. before long
�����Ժ󣬺ܿ�
518. long before
�ڡ���ǰ�ܾ�
519. long after
�ܾ��Ժ�
520. no longer
���٣���Ҳ��
521. look after
���ϣ��չˣ��չܣ�ע�⣬����
522. look down on(=look down upon)
���ӣ�������
523. look for
Ѱ�ң�Ѱ������������
524. look forward to
�������ڴ���Ԥ�ڣ�Ԥ��
525. look over
�ѡ���һ�飬�ѡ���Ŀ���쿴���ι�
526. look up
(�Ӵʵ���)�ҳ�������ת�䣬������ǣ�����
527. lose face
������
528. a lot
��������ࣻ�ǳ����൱=a lot of/lots of
529. a lot of
�����ģ����� [=lots of]
530. lots of
�����ģ�����
531. in love with
�롭������
532. fall in love
(�롭)�మ������
533. make away with
Я�����ӣ��ݻ٣��˷�
534. make for
���򣬳���ǰ�����ٳɣ�������
535. make out
���У���д�����������ϳ�����⣬�˽�
536. make up
����(����)���������鹹�����죻��ɣ�����
537. a good many(=a great many)
�ܶ࣬�൱��
538. a great many
�����ģ�����(�ӿ�������)
539. mark down
���£����͡��ļ۸񣬽��͡��ķ���
540. mark up
��ߡ��ļ۸���ߡ��ķ���
541. by some means
��ĳ�ַ���
542. by all means
��һ�а취��һ��Ҫ����Ȼ����
543. by no means
����û�У�һ��Ҳ��
544. in the meantime
��ʱ��ͬʱ���ڴ��ڼ�
545. make up one's mind
��...�¾��ģ��¾�����...
546. mix up
��ϣ����������ң����Ϳ
547. for a moment
Ƭ�̣�һ���
548. in a moment
���ϣ����̣�һ���
549. more and more
Խ��Խ(��)
550. more than
�����...���ϣ���...��
551. at most
��࣬���࣬������
552. make the most of
������ã���������
553. move about
������ȥ�����ǰ��
554. move on
����ǰ����(to)���������ȣ�ʹ�߿�(��ͣ)
555. in nature
�����ϣ�ʵ����
556. in the course of nature
������
557. far and near
Զ��������������˷�
558. near by
�ڸ���
559. neither...nor
(��)����Ҳ����(��)�ǡ�Ҳ��
560. all night long
��ҹ��
561. at night
���ʱ����ҹ��
562. in the night
��ҹ��
563. night and day
���Լ�ҹ��
564. a large number of
����
565. a good number of
������
566. on occasion(=on occasions)
���أ���ʱ
567. once again
(��more��over)��һ��
568. once more
��һ�Σ���һ��
569. once upon a time
��ǰ(���¿�ͷ����)
570. at once
���̣����ϣ�ͬʱ��һ��
571. one by one
һ����һ���أ�һ��һ����
572. not only...but also
���������ҡ�
573. only just
�ող�
574. in the open air
�ڻ��⣻��Ұ��
575. either...or
���ߡ�����(�����е�һ��)�����ۡ����ǡ�
576. whether...or
�ǡ����ǡ������ܡ����ǡ�
577. or so
(��ʾԼ��)���ң�����
578. in order
��˳�����룬��Ȼ���򣬴�������״̬
579. in order to
Ϊ�ˣ��ԡ�ΪĿ��
580. in order that
�Ա㣬�����ڣ����
581. no other than
������û�У�ֻ��
582. out and out
���׵أ����۲��۵�
583. out of
Խ����֮�⣻�ӡ����棻�뿪�����ڣ�û��
584. on one's own
�����أ����Ե�
585. keep pace with
(�롭)�벽ǰ����(�롭)��������
586. hold pace with
���ϣ��롭ͬ��
587. in part
���ֵأ���ĳ�̶ֳ���
588. take part in
�μӡ������롭
589. pass away
��ʧ��ȥ������ֹ
590. pass on
���ݣ�������ȥ��
591. have patience with
�ԡ���������
592. pay out
����(Ǯ)����Ǯ
593. pay off
����ծ�����幤�ʺ�ǲɢ��ʹ�����棻�б���
594. pick on
ѡ��(ĳ�˻�ĳ��)���ܷ�(����)�Ķ���
595. pick out
ѡ�������
596. pick up
���𣻻�ã��ҵ���ѧ��(��ָżȻ�ػ�����)
597. in pieces
����
598. break sth. to pieces
�ҵ÷���
599. have pity on sb.
����ĳ��
600. take pity on sb.
����ĳ��
601. out of place
����Ӧ��(�ʵ�)��λ�ã����ʺϵģ����ʵ���
602. in place of
���棬ȡ��������
603. take place
���������������У�����
604. take the place of
���棬ȡ��
605. in plenty
�ḻ������
606. to the point
�пϣ���Ҫ������Ҫ��
607. point out
ָ����ָ��������
608. in position
���ʵ���λ�ã���ԭλ
609. out of position
�����ʵ���λ��
610. possess oneself of
��ã�ռΪ����
611. prevent...from
��������ֹ��Ԥ��
612. in public
�������ڹ�������
613. pull down
������Ƶ���ʹ����������ʹ�۸񽵵�
614. pull in (arrive;stop;move in)
(��)��վ��(��)����
615. pull off
(�ɹ���)��ɣ����£���ȥ
616. pull out
�γ���ȡ����(��������)ʻ����(����)����
617. on purpose
����أ������
618. put down
д�£��������𣩣���ѹ��ȡ�ޣ�����
619. put in
���ѣ�����(ʱ���)����ʽ���������
620. put off
�Ƴ٣����ڣ��ص�����ֹ������
621. put out
Ϩ�����𣬹�(��)�����棬����������
622. put up
��/������(��)�����죬��/֧������
623. put up with
���ܣ�����(�������)
624. beyond question
�������ʣ�ȷ������
625. out of question
��������
626. at any rate
������Σ����ң�����
627. at this rate
���������Σ���Ȼ����
628. rather...than
��Ը��������
629. be reason of
����
630. as regards
���ڣ�����
631. in this regard
�������
632. in regard to
���ڣ��͡�����
633. with regard to
���ڣ��͡�����
634. with relation to
�йأ��漰���롭���
635. with respect to
�͡����ԣ��ڡ�����
636. pay one's respect to sb.
��ĳ���¾�
637. as a result of
���ڣ���Ϊ���Ľ��
638. in return for
��Ϊ(�ԡ���)����(��ر�������)
639. ring sb. up
��绰��ĳ��
640. ring off
�Ҷϵ绰��ֹͣ����
641. give rise to
������ʹ���������𣬵���
642. take risks
ð��
643. run risks
ð��
644. roll in
��������������ӿ��
645. roll up
(��ָ�����ٵػ���ĳ�ֲ����ķ�ʽ)�ִ�
646. show sb. around
��ĳ�˲ι�
647. by rules
���չ���
648. as a rule
ͨ����һ��(˵��)
649. run outbe finished
,exhausted ���������ȱ��
650. run over
�ڡ���ʻ����������ѡ��ܿ�ع�һ��
651. run through
�ᴩ���Ҵ��Ķ����������ӻ�(��Ǯ)
652. safe and sound
��Ȼ���
653. in safety
��ȫ
654. with safety
��ȫ��
655. at the same time
ͬʱ��Ȼ��������������
656. the same as
�롭һ�£��롭��ͬ��
657. all the same
��һ��������ν��������ˣ���Ȼ
658. just the same
=all the same ��Ȼ������
659. that is to say
���仰˵�������˵
660. scratch one's head
ɦͷ
661. search out
Ѱ�ң��ҵ�
662. search into
����
663. make a search for
�Ѳ飬Ѱ��
664. keep a secret
��������
665. see about
������(ĳ��)���鿴
666. see through
��...�ɵ��ף����ꣻ������ʶ��
667. sell out
���⣬ȫ��������(��ָΪǮ�ƶ�)���ѣ�����
668. send away
���ߣ����������
669. send for
����ȥ�롭������ȥҪ(��ȡ)��
670. send in
�ʱ����͡��μӱ���
671. send off
�ĳ���Ϊ�����У����
672. set aboutbegin to do
(sth). start (doing sth)��ʼ
673. set on
Ϯ������ʹ
674. set out
���У��������̣���ʼ�����֣��ƶ�������
675. set upset up an appointment
����(Լ�������)
676. settle in
���¾Ӱ�����������Ӧ�»���(���¹���)
677. shake down
��թ�������������Ѳ�
678. shake off
���ߣ����ѣ�����
679. in shape
��������(�����)״̬
680. in the shape of
�ʡ�����״
681. shoot down
���䣬���У�����
682. be short of
ȱ�������㣻�ﲻ��
683. in shortin a word
. in summary ��֮���ܶ���֮
684. shoulder to shoulder
�粢��أ�����Э����
685. show off
��ҫ�Լ����������Ƹ����ǻ۵�
686. show up
ʹ���֣�ʹ��Ŀ����ϯ������
687. be shut in
�ؽ���Χס
688. shut off
�ж�(ˮ��)���ص���(ʹ)ֹͣ��ת
689. shut up
ʹס�ڣ�ס�ڣ�ֹͣд
690. side by side
�粢�磻һ���໥֧��
691. lose one's sight
ɥʧ����
692. at first sight
էһ��֮�£���һ�۾�
693. catch a sight
����
694. in sight of
���ü�
695. out of sight of
�ڲ��ܿ��������ĵط�
696. ever since
�˺�һֱ������ʱ��һֱ
697. long since
�ܾ���ǰ���ܾ�����
698. sit up
��˯������ҹ������ֱ��������
699. smell out
�����ƾ������֡�
700. as soon asconj.
һ���͡�����...��
701. as soon as possible
��������أ�����
702. speak for
����������Ϊ���绤��֤��������
703. speak out
�󵨵ؽ�������Լ���ؽ�
704. speak up
����˵��������˵����
705. in spite of
���ܣ����ˣ����ܣ���Ȼ
706. spring back
���أ�����
707. spring from
���ڣ���...��������...���
708. spring up
ӿ�֣�������Ѹ�ٳ���
709. stand by
վ���Աߣ������Թۣ�վ��һ��֧�֡�����
710. stand for
��...����д��������ζ�ţ����ţ�֧��
711. stand up
վ��վ�ţ��������ã�ʹ���ŷ�
712. stand up for
Ϊ���绤��ά�������
713. start in
��ʼ
714. start out
������������ʼʱ���㣬������Ҫ
715. start off
��ʼ/չ��(֮��Ӳ��ӱ������)
716. stay away
���ڼң��뿪
717. stay in
������
718. stay out
���Ų��߿�
719. stay up
��ҹ��������˯��; ��ҹ
720. step by step
�𲽵أ�һ��һ����
721. in step
���ģ�ͬ������(��)һ��
722. out of step
������һ�£���Э��
723. stick to
ճ����..�ϣ����������棻��֣����ڣ�����
724. such as
�������ģ����磬����
725. be suited for
�ʺ��ڣ����ʸ�
726. be suited to(=be suited for)
�ʺ��ڣ����ʸ�
727. in support of
֧Ԯ��֧�֣�ӵ��
728. be sure of oneself
��������
729. feel sure of oneself
���ţ���������
730. make sure
Ūȷʵ��Ū�϶�������
731. to one's surprise
�������ϵأ�ʹĳ�˳Ծ�����
732. take in
���ܣ����գ���������ᣬ��⣻��ƭ
733. take on
���֣����У�װ�������ɣ����ܣ��е�������
734. take up
��ʼ���£��ѡ�������ȥ�����ִ���ռȥ
735. in tears
�����ᣬ�����ᣬ�ڿ���
736. think about
�����뵽�����ǣ�����˼��
737. think of
�뵽���ǵã���һ�룻���ǣ�����
738. through and through
��ȫ������
739. throw away
�ӵ������������(����)���˷�(��Ǯ��)
740. throw off
�ӵ��������������������ϯ����
741. throw up
������Ż�£�ʹ����ע�⣬��ʾ��
742. at a time
ÿ�Σ���ĳ��ʱ��
743. at one time
ͬʱ����������ǰ��
744. at times
��ʱ����� sometimes
745. from time to time
ʱ������ʱ����ʱ
746. in time
����һ��ʱ�䣻���գ���ʱ
747. on time
׼ʱ�����粻��
748. together with
�ͣ���֮����ͬ
749. on top of
�ڡ����棻����֮��
750. try on
�Դ�(�·���Ь)���Դ�(ñ��)
751. try outtry out for sth
��һ�Կ��ܷ�ѡ��(��ĳ��)
752. turn down
�ܾ�(ĳ�˻��������Ҹ��)
753. turn in
���ϣ��Ͻɣ���(��ҵ��д�õ����ֲ���)
754. turn off
����(��ơ�����ˮ��)��ת�䣻��ͣ�����
755. turn on
��(���ӡ����������ơ�ú��������ˮ��)
756. turn out
�ص�(��������)�����������죻���𣻽����
757. turn toask for help or support
�����ڣ�������
758. by turns
������һ��...һ��...
759. in turn
���εأ������ģ�ת����������
760. up to
�����������ڣ�ֱ�����ֵ���ʤ�Σ�����
761. up to date
�ִ����ģ����µģ�ʱ�˵ģ��������·�չ��
762. make use of
���ã�ʹ��as usual������һ������ƽ��һ��
763. take a vote on
���
764. vote through
���ͨ����ͶƱͬ��
765. wait on sb.
�ź�
766. wait upon sb.
�ź�
767. wash up
ϴ��ϴ�;ߣ�ϴ��ϴ�����������ϰ�
768. watch out
���ģ����
769. watch over
���أ��չܣ�����
770. keep watch
������ֵ�ࣻ����
771. be in the way
��סȥ·������
772. by way of
ͨ�����ķ���(����ʽ��)������
773. give way
��·���ò�����λ��(��е�)ʧ��
774. in one way or another
�������
775. in a way
��ĳ�̶ֳ��ϣ��е㣬��ĳһ����
776. wear away
ĥ��ĥȥ����ĥ������
777. wear off
ĥ�𣻽�����������ʧ
778. wear out
�û���������ʹ��ƣ���ߣ��ľ�����ĥ(ʱ��)
779. and...as well...
Ҳ����
780. what about
[�������ʱ�õ�]��ô��
781. wipe away
��ȥ������ȣ�
782. wipe off
��ȥ
783. wipe out
���������������״ݻ٣�����
784. in a word
����֮����֮��һ�仰
785. in other words
���仰˵��Ҳ����˵
786. be at work
�ڹ�����
787. be out of work
ʧҵ
788. go to work
ȥ�������ϰ�
789. work atput effort into
�����ڣ�������
790. work out
��ƣ��ƶ������ţ���������(ĳ��)���Ը�
791. work up
����Ŭ�����ڷܵ��𲽽����������о�������
792. write down
д�£��ѡ���д��
793. write off
ע����������д�żĳ�
794. go wrong
���������󣻷������ϣ���ë��
795. not yet
��û��. ��δ
796. but yet
���ǣ�Ȼ��
797. rush out
ͻȻ����
798. connect with
���ӣ���ͨ���ν�
799. glance at
�����(���Ե�)��һ��
800. know of
��˵��֪��Ϊʲô
801. come by
���Ա��߹������õ������
802. open up
�򿪣����죬���٣�������̹�ϵ�̸��
803. be likely to
Ҫ�����ģ�������ģ����ܵ�
804. look at
��������������ע�ӣ���������Ϊ
805. tend to
������...�����ڡ�����...����
806. remember of
�ǵá��������𡭡�
807. in the midst of
�ڡ����У���������ʱ��
808. break one's heart
�������ģ�ʹ��ʹ��
809. open one's eyes
ʹĳ�����壬�˽⡭��������ʶ
810. open one's eyes to sth.
ʹĳ�����壬�˽⡭��������ʶ
811. in no time
���������̣�����
812. reckon on
������ָ��
813. settle into
������ס��
814. pat sb. on the back
��ĳ�˱�ʾ����
815. cut back on
����
816. regardless of
����ᣬ����...���
817. equal to
���ڣ���...��ȣ��൱��
818. in the case of
�͡���˵������
819. strip...of...
����
820. in contrast
��...�γɶԱȣ���...�෴
821. rather than
�����������ǣ�����˵��...����˵��
822. psych sb. up
ʹĳ����������׼��
823. feel important about oneself
�����Լ�
824. compete with
��...����������
825. be connected with
�롭�й�ϵ
826. depend on
���ţ��������������������ӡ�������ȡ����
827. equip...with
װ����
828. focus on
�ۼ��ڣ�����(ע����)�ڣ����ģ�����Ϊ
829. be capable of
(ָ��)��ĳ�������������










































;�ļ�����
1. abandon[2'b9nd2n]
vt.����������������
2. ability[2'biliti]
n.���������ͣ�����
3. able['eibl]
a.�������ģ���ɫ��
4. abnormal[9b'n0:m2l]
a.�������ģ���̬��
5. aboard[2'b0:d]
ad.�ڴ�(��)�ϣ��ϴ�
6. about[2'baut]
prep.���ڣ��ڡ���Χ
7. above[2'b3v]
prep.�ڡ����棻����
8. abroad[2'br0:d]
ad.(��)���⣻����
9. absence['9bs2ns]
n.ȱϯ�����ڳ���ȱ��
10. absent['9bs2nt. 2b'sent]
a.���ڳ��ģ�ȱ����
11. absolute['9bs2lu:t]
a.���Եģ������
12. absolutely['9bs2lu:tli]
ad.��ȫ�أ����Ե�
13. absorb[2b's0:b]
vt.���գ�ʹר��
14. abstract['9bstr9kt]
a.����� n.ժҪ
15. abundant[2'b3nd2nt]
a.�ḻ�ģ�������
16. abuse[2'bju:z. 2'bju:s]
vt.���ã�Ű�� n.����
17. academic[9k2'demik]
a.ѧԺ�ģ�ѧ����
18. academy[2'k9d2mi]
n.˽����ѧ��ר��ԺУ
19. accelerate[9k'sel2reit]
vt.(ʹ)�ӿ죻�ٽ�
20. acceleration[9ksel2'rei62n]
n.���٣����ٶ�
21. accent['9ks2nt. 9k'sent]
n.������ǻ��������
22. accept[2k'sept]
vt.vi.���ܣ�ͬ��
23. acceptable[2k'sept2bl]
a.�ɽ��ܵģ������
24. acceptance[2k'sept2ns]
n.���ܣ����գ�����
25. access['9kses]
n.�ӽ���ͨ�������
26. accessory[9k'ses2ri]
n.ͬı���ӷ�������
27. accident['9ksid2nt]
n.����ģ��¹�
28. accidental[9ksi'dentl]
a.żȻ�ģ��Ǳ��ʵ�
29. accommodate[2'k0m2deit]
vt.���ɣ���Ӧ������
30. accommodation[2,k0m2'dei62n]
n.�д��豸��Ԥ����λ
31. accompany[2'k3mp2ni]
vt.��飬��ͬ������
32. accomplish[2'k0mpli6]
vt.�ﵽ(Ŀ��)�����
33. accord[2'k0:d]
vt.ʹһ�£�����
34. accordance[2'k0:d2ns]
n.һ�£���г������
35. accordingly[2'k0:di8li]
ad.��ˣ����ԣ�����
36. account[2'kaunt]
n.���������ͣ���Ŀ
37. accumulate[2'kju:mjuleit]
vt.���� vi.�ѻ�
38. accuracy['9kjur2si]
n.׼ȷ(��)��׼ȷ��
39. accurate['9kjurit]
a.׼ȷ�ģ���ȷ�����
40. accuse[2'kju:z]
vt.ָ�𣻹����
41. accustom[2'k3st2m]
vt.ʹϰ��
42. accustomed[2'k3st2md]
a.�߳��ģ�ϰ�ߵ�
43. ache[eik]
vi.ʹ������ n.��ʹ
44. achieve[2't6i:v]
vt.��ɣ�ʵ�֣��ﵽ
45. achievement[2't6i:vm2nt]
n.��ɣ��ɾͣ��ɼ�
46. acid['9sid]
n.�᣻��ģ����Ե�
47. acquaintance[2'kweint2ns]
n.��ʶ���˽⣻����
48. acquire[2'kwai2]
vt.ȡ�ã���ã�ѧ��
49. acre['eik2]
n.ӢĶ(=6.07Ķ)
50. across[2'kr0s]
prep.������ڡ�����
51. act[9kt]
vi.�ж�����Ч n.��Ϊ
52. action['9k62n]
n.�ж������ã�����
53. active['9ktiv]
a.��Ծ�ģ�������
54. activity[9k'tiviti]
n.����������ж�
55. actor['9kt2]
n.����Ա���ݾ����
56. actress['9ktris]
n.Ů��Ա
57. actual['9ktju2l]
a.ʵ�ʵģ����е�
58. actually['9ktju2li]
ad.ʵ���ϣ���Ȼ
59. acute[2'kju:t]
a.��ģ���ģ������
60. ad[9d]
n.���
61. adapt[2'd9pt]
vt.ʹ��Ӧ���ı�
62. add[9d]
vt.��ӣ����ӣ�����
63. addition[2'di62n]
n.�ӣ��ӷ���������
64. additional[2'di62nl]
a.���ӵģ�׷�ӵ�
65. address[2'dres]
n.��ַ����˵��̸��
66. adequate['9dikwit]
a.�㹻�ģ�����ʤ�ε�
67. adjective['9d7iktiv]
n.���ݴ� a.���ݴʵ�
68. adjust[2'd73st]
vt.���������ڣ�У��
69. administration[2dminis'trei62n]
n.����������
70. admire[2d'mai2]
vt.���壬��Ľ������
71. admission[2d'mi62n]
n.������룻����
72. admit[2d'mit]
vt.���ϣ�׼������
73. adopt[2'd0pt]
vt.���������ã���ȡ
74. adult['9d3lt]
n.������ a.�����
75. advance[2d'va:ns]
vi.ǰ������� n.��չ
76. advanced[2d'va:nst]
a.�Ƚ��ģ��߼���
77. advantage[2d'va:ntid7]
n.�ŵ㣬���ƣ��ô�
78. adventure[2d'vent62]
n.ð�գ����ջ
79. adverb['9dv2:b]
n.����
80. advertisement[2d'v2:tism2nt]
n.��棻���棻�ǹ��
81. advice[2d'vais]
n.Ȱ�棻�Ҹ棻���
82. advisable[2d'vaiz2bl]
n.���ǵģ���ȡ��
83. advise[2d'vaiz]
vt.Ȱ�棻���飻֪ͨ
84. aeroplane['/2r2plein]
n.�ɻ�
85. affair[2'f/2]
n.���飬�¼�������
86. affect[2'fekt]
vt.Ӱ�죻�ж�
87. affection[2'fek62n]
n.�Ȱ���������Ľ
88. afford[2'f0:d]
vt.�������𡭣��ṩ
89. afraid[2'freid]
a.���µģ����ĵ�
90. Africa['9frik2]
n.����
91. African['9frik2n]
a.���޵� n.������
92. after['a:ft2]
prep.�ڡ��Ժ󣻴���
93. afternoon['a:ft2'nu:n]
n.���磬���
94. afterward['a:ft2w2d(z)]
ad.�������Ժ�
95. again[2'gein. 2'gen]
ad.��һ�Σ�����
96. against[2'geinst. 2'genst]
prep.���ڣ��棬����
97. age[eid7]
n.���䣻ʱ�� vt.����
98. agency['eid72nsi]
n.���죻��������
99. agent['eid72nt]
n.�����ˣ�������
100. aggressive[2'gresiv]
a.���Եģ��ö���
101. ago[2'g2u]
ad.��ǰ
102. agony['9g2ni]
n.����ʹ��
103. agree[2'gri:]
vi.ͬ�⣻����ͬ���
104. agreement[2'gri:m2nt]
n.Э����Э�飻ͬ��
105. agriculture['9grik3lt62]
n.ũҵ��ũ�գ�ũѧ
106. ahead[2'hed]
ad.��ǰ����ǰ����ǰ
107. aid[eid]
n.�������Ȼ�������
108. aim[eim]
vi.��׼����ԣ�����
109. air[/2]
n.���������У����
110. aircraft['/2kra:ft]
n.�ɻ���������
111. airline['/2lain]
n.���չ�˾������
112. airplane['/2plein]
n.�ɻ�
113. airport['/2p0:t]
n.����������վ
114. alarm[2'la:m]
n.���֣����ǣ�����
115. alcohol['9lk2h0l]
n.�ƾ����Ҵ�
116. alike[2'laik]
a.ͬ���ģ���ͬ��
117. alive[2'laiv]
a.���ŵģ���Ծ��
118. all[0:l]
a.ȫ���� prep.ȫ��
119. allow[2'lau]
vt.����׼����
120. alloy['9l0i. 2'l0i]
n.�Ͻ�(������)��ɫ
121. almost['0:lm2ust]
ad.���������
122. alone[2'l2un]
a.������ ad.������
123. along[2'l08]
prep.���� ad.��ǰ
124. aloud[2'laud]
ad.�����أ�������
125. alphabet['9lf2bit]
n.��ĸ����ĸϵͳ
126. already[0:l'redi]
ad.���ѣ��Ѿ�
127. also['0:ls2u]
ad.�࣬Ҳ�����ң���
128. alter['0:lt2]
vt.�ı䣬���������
129. alternative[0:l't2:n2tiv]
n.�滻�ȡ�ᣬ����
130. although[0:l'52u]
conj.���ܣ���Ȼ
131. altitude['9ltitju:d]
n.�ߣ��߶ȣ��ߴ�
132. altogether[0:lt2'ge52]
ad.��ȫ���ܶ���֮
133. aluminium[9lju'minj2m]
n.��
134. always['0:lweiz. '0:lw2z]
ad.���ǣ�һֱ����Զ
135. a.m[]
(��)���磬��ǰ
136. amaze[2'meiz]
vt.ʹ���棬ʹ���
137. ambition[9m'bi62n]
n.���ģ�������Ұ��
138. ambulance['9mbjul2ns]
n.�Ȼ�����ҰսҽԺ
139. America[2'merik2]
n.���ޣ�����
140. American[2'merik2n]
a.���޵� n.������
141. among[2'm38]
prep.�ڡ�֮��
142. amongst[2'm38st]
prep�ڡ�֮��(=among)
143. amount[2'maunt]
n.��������������
144. ampere['9mp/2]
n.����
145. amplify['9mplifai]
vt.�Ŵ���ǿ������
146. amuse[2'mju:z]
vt.�����֣���������
147. analyse['9n2laiz]
vt.�������ֽ⣬����
148. analysis[2'n9l2sis]
n.�������ֽ⣬����
149. ancestor['9nsist2]
n.���ڣ�����
150. anchor['98k2]
n.ê vi.��ê��ͣ��
151. ancient['ein62nt]
a.�Ŵ��ģ����ϵ�
152. and[9nd. 2nd]
conj.�ͣ��֣�������
153. angel['eind72l]
n.��ʹ����������
154. anger['98g2]
n.ŭ����ŭ vt.ʹ��ŭ
155. angle['98gl]
n.�ǣ��Ƕ�
156. angry['98gri]
a.��ŭ�ģ�������
157. animal['9nim2l]
n.����� a.�����
158. ankle['98kl]
n.�ף��׽ڲ�
159. announce[2'nauns]
vt.���������棬����
160. announcer[2'nauns2]
n.�����ߣ�����Ա
161. annoy[2'n0i]
vt.ʹ��ŭ�����
162. annual['9nju2l]
a.ÿ��� n.�걨
163. another[2'n352]
a.��һ���ģ����
164. answer['a:ns2]
vt.�ش���Ӧ����Ӧ
165. ant[9nt]
n.����
166. anticipate[9n'tisipeit]
vt.Ԥ�ϣ�Ԥ�ڣ�����
167. anxiety[98g'zai2ti]
n.���ǣ����ǣ�����
168. anxious['98k62s]
a.���ǵģ�������
169. any['eni]
a.ʲô��һЩ���κε�
170. anybody['enib0di]
prep.�κ���
171. anyhow['enihau]
ad.�������
172. anyone['eniw3n]
pron.�κ���
173. anything['eni4i8]
pron.�κ����һ��
174. anyway['eniwei]
ad.�������
175. anywhere['eniw/2]
ad.��ʲô�ط�
176. apart[2'pa:t]
ad.������ֿ�����ȥ
177. apartment[2'pa:tm2nt]
n.һ�׹�Ԣ����
178. apologize[2'p0l2d7aiz]
vi.��Ǹ��л��ϴ�
179. apology[2'p0l2d7i]
n.��Ǹ���ϴ�л��
180. apparatus[,9p2'reit2s]
n.��е������������
181. apparent[2'p9r2nt]
a.�����ϵģ����Ե�
182. appeal[2'pi:l]
vi.&n.����������
183. appear[2'pi2]
vi.���֣��������ƺ�
184. appearance[2'pi2r2ns]
n.���֣����������
185. appetite['9pitait]
n.ʳ����θ�ڣ�����
186. apple['9pl]
n.ƻ����ƻ����
187. appliance[2'plai2ns]
n.�þߣ����ߣ���е
188. applicable['9plik2bl]
a.��Ӧ�õģ��ʵ���
189. application[9pli'kei62n]
n.�������룻ʩ��
190. apply[2'plai]
vt.Ӧ�ã�ʵʩ��ʹ��
191. appoint[2'p0int]
vt.������ί�Σ�Լ��
192. appointment[2'p0intm2nt]
n.������Լ����Լ��
193. appreciate[2'pri:6ieit]
vt.���ͣ���᣻��л
194. approach[2'pr2ut6]
vt.�򡭿��� n.����
195. appropriate[2'pr2upriit]
a.�ʵ��ģ�ǡ����
196. approval[2'pru:v2l]
n.�޳ɣ�ͬ�⣻��׼
197. approve[2'pru:v]
vt.�޳ɣ�������׼
198. approximate[2'pr0ksimit]
a.���Ƶ� vt.����
199. approximately[2'pr0ksimitli]
ad.���Ƶأ���Լ
200. April['eipr2l]
n.����
201. Arabian[2'reibj2n]
a.��������
202. arbitrary['a:bitr2ri]
a.���������ģ�ר�ϵ�
203. architecture['a:kitekt62]
n.����ѧ������ʽ��
204. area['/2ri2]
n.���������������
205. argue['a:gju:]
vi.���ۣ����磬����
206. argument['a:gju:m2nt]
n.���ۣ����ۣ�����
207. arise[2'raiz]
vi.���֣��ɡ�����
208. arithmetic[2'ri4m2tik]
n.��������������
209. arm[a:m]
n.�ۣ���״�����
210. army['a:mi]
n.���ӣ�½��
211. around[2'raund]
prep.�ڡ���Χ
212. arouse[2'rauz]
vt.���𣬻��𣻻���
213. arrange[2'reind7]
vt.�ﱸ����������
214. arrangement[2'reind7m2nt]
n.�������У�����
215. arrest[2'rest]
vt.��������������ֹ
216. arrival[2'raiv2l]
n.���������������
217. arrive[2'raiv]
vi.������٣��ﵽ
218. arrow['9r2u]
n.������״��
219. art[a:t]
n.����������������
220. article['a:tikl]
n.���£������Ʒ
221. artificial[a:ti'fi62l]
a.�˹��ģ�����������
222. artist['a:tist]
n.�����ң�������
223. artistic[a:'tistik]
a.�����ģ������ҵ�
224. as[9z. 2z]
conj.������ʱ��
225. ash[96]
n.�ң���ĩ���ǻ�
226. ashamed[2'6eimd]
a.����(��)���߳�(��)
227. Asia['ei62]
n.����
228. Asian['ei62n]
a.���޵� n.������
229. aside[2'said]
ad.���Աߣ����Ա�
230. ask[a:sk]
vt.�ʣ�Ҫ������
231. asleep[2'sli:p]
a.˯�ŵģ�˯���
232. aspect['9spekt]
n.���棻���ӣ����
233. assemble[2'sembl]
vt.���ϣ��ټ���װ��
234. assembly[2'sembli]
n.���ϣ����᣻װ��
235. assess[2'ses]
vt.��(�Ʋ���)����
236. assign[2'sain]
vt.ָ�ɣ����䣻ָ��
237. assignment[2'sainm2nt]
n.����ָ������ҵ
238. assist[2'sist]
vt.Ԯ�������������
239. assistant[2'sist2nt]
n.���֣���������
240. associate[2's2u6ieit]
vi.���� n.��飬ͬ��
241. association[2s2usi'ei62n]
n.Э�ᣬ���壻����
242. assume[2'sju:m]
vt.�ٶ����е�������
243. assure[2'6u2]
vt.ʹȷ�ţ��򡭱�֤
244. astonish[2s't0ni6]
vt.ʹ���ȣ�ʹ�Ծ�
245. astronaut['9st62un0:t]
n.���溽��Ա���Ա
246. at[9t. 2t]
prep.�ڡ���ڡ�ʱ
247. athlete['94li:t]
n.�˶�Ա���ﾶ�˶�Ա
248. Atlantic[2t'l9ntik]
a.������� n.������
249. atmosphere['9tm2sfi2]
n.����������������
250. atmospheric[9tm2s'ferik]
a.�����ģ��������
251. atom['9t2m]
n.ԭ�ӣ�΢����΢��
252. atomic[2't0mik]
a.ԭ�ӵģ�ԭ���ܵ�
253. attach[2't9t6]
vt.����ϵ����������
254. attack[2't9k]
vt.&vi.&n.����������
255. attain[2'tein]
vt.�ﵽ����ã����
256. attempt[2'tempt]
vt.���ԣ���ͼ n.��ͼ
257. attend[2'tend]
vt.��ϯ���չˣ�����
258. attention[2'ten62n]
n.ע�⣬���ģ�ע����
259. attentive[2'tentiv]
a.ע��ģ�����ò��
260. attitude['9titju:d]
n.̬�ȣ�����������
261. attract[2'tr9kt]
vt.�����������ջ�
262. attraction[2'tre9k62n]
n.������������������
263. attractive[2'tr9ktiv]
a.����������
264. attribute['9tribju:t]
vt.�ѡ������� n.����
265. audience['0:dj2ns]
n.���ڣ����ڣ�����
266. August[0:'g3st]
n.����
267. aunt[a:nt]
n.��ĸ����ĸ����ĸ
268. aural['0r2l]
a.���ģ�������
269. Australia[0s'treilj2]
n.�Ĵ�����
270. Australian[0s'treilj2n]
a.�Ĵ����ǵ�
271. author['0:42]
n.���ߣ�����
272. authority[0:'40riti]
n.���֣��ٷ���Ȩ��
273. auto['0:t2u]
n.(����)����
274. automatic[0:t2'm9tik]
a.�Զ��ģ���е��
275. automation[0:t2'mei62n]
n.�Զ����Զ���
276. automobile['0:t2m2bi:l]
n.������������
277. autumn['0:t2m]
n.��＾
278. auxiliary[0:g'zilj2ri]
a.�����ģ�������
279. available[2'veil2bl]
a.�����õģ�ͨ�õ�
280. avenue['9vinju:]
n.���������·�����
281. average['9v2rid7]
n.ƽ���� a.ƽ����
282. aviation[eivi'ei62n]
n.���գ�����ѧ
283. avoid[2'v0id]
vt.���⣬�㿪������
284. await[2'weit]
vt.�Ⱥ��ڴ�
285. awake[2'weik]
a.���ŵ� vt.����
286. award[2'w0:d]
n.������Ʒ���ж�
287. aware[2'w/2]
a.֪���ģ���ʶ����
288. away[2'wei]
ad.�뿪��Զ�룻��ȥ
289. awful['0:ful]
a.���˲�����
290. awfully['0:fuli]
ad.����η��ģ���
291. awkward['0:kw2d]
a.��׾�ģ����ε�
292. ax[9ks]
n.����
293. axis['9ksis]
n.�ᣬ���ߣ�������
294. baby['beibi]
n.Ӥ��������������
295. back[b9k]
ad.�ں󣻻�ԭ������
296. background['b9kgraund]
n.�������󾰣�����
297. backward['b9kw2d]
a.���ģ����� ad.��
298. bacteria[b9k'ti2ri2]
n.ϸ��
299. bad[b9d]
a.���ģ���ģ����ص�
300. badly['b9dli]
ad.��������ص�
301. badminton['b9dmint2n]
n.��ë��
302. bag[b9g]
n.��������Ǯ��������
303. baggage['b9gid7]
n.����
304. bake[beik]
vt.�����棬������Ӳ
305. balance['b9l2ns]
vt.ʹƽ�⣻�� n.��ƽ
306. ball[b0:l]
n.����״����
307. balloon[b2'lu:n]
n.�����������
308. banana[b2'na:n2]
n.�㽶���Ž���ֲ��
309. band[b9nd]
n.�ֶӣ���������
310. bang[b98]
n.���죬ǹ�����ͻ�
311. bank[b98k]
n.���У��⣻�ң���
312. banner['b9n2]
n.�죬���ģ����
313. bar[ba:]
n.�ưɼ䣻�����ˣ�դ
314. barber['ba:b2]
n.��ʦ
315. bare[b/2]
a.����ģ�������
316. bargain['ba:gin]
n.���� vi.��ۣ��ɽ�
317. bark[ba:k]
n.�ͽ��� vi.�ͣ���
318. barn[ba:n]
n.�Ȳ֣�������
319. barrel['b9r2l]
n.Ͱ��ԲͲ��ǹ��
320. barrier['b9ri2]
n.դ�������ϣ��ϰ�
321. base[beis]
n.�������ײ㣻����
322. basic['beisik]
a.�����ģ�������
323. basically['beisik2li]
ad.������
324. basin['beisn]
n.�裬ϴ���裻���
325. basis['beisis]
n.����������
326. basket['ba:skit]
n.����¨����
327. basketball['ba:skitb0:l]
n.���������˶�
328. bat[b9t]
n.���ģ��̹�������
329. bath[ba:4]
n.ԡ��ϴ�裻ԡ��
330. bathe[bei5]
vt.����ϴ�裻Ūʪ
331. bathroom['ba:4rum]
n.ԡ�ң���ϴ��
332. battery['b9t2ri]
n.��أ�һ�ף�һ��
333. battle['b9tl]
n.ս�ۣ����� vi.��ս
334. bay[bei]
n.�壻ɽ���еİ���
335. B.C.['bi: si:]
(��)��Ԫǰ
336. be[bi:]
aux.v.&vi.�ǣ��ڣ���
337. beach[bi:t6]
n.��̲����̲����̲
338. beam[bi:m]
n.����������������
339. bean[bi:n]
n.�����϶�
340. bear[b/2]
n.�ܣ���³����
341. bear[b/2]
vt.���̣�����������
342. beard[bi2d]
n.���룬��������
343. beast[bi:st]
n.�ޣ�Ұ�ޣ�����
344. beat[bi:t]
vt.&vi.���ã����
345. beautiful['bju:tiful]
a.���ģ�������
346. beauty['bju:ti]
n.��������������
347. because[bi'k0z]
conj.���ڣ���Ϊ
348. become[bi'k3m]
vi.��ɣ���Ϊ�����
349. bed[bed]
n.������λ���ԣ��Ӵ�
350. bee[bi:]
n.�䣬�ܷ䣻æµ����
351. beef[bi:f]
n.ţ�⣻��ţ
352. beer[bi2]
n.ơ��
353. before[bi'f0:]
prep.�ڡ���ǰ����
354. beg[beg]
vt.&vi.��������
355. beggar['beg2]
n.��ؤ������
356. begin[bi'gin]
vi.��ʼ vt.��ʼ
357. beginner[bi'gin2]
n.��ѧ�ߣ�����
358. beginning[bi'gini8]
n.��ʼ�����ˣ���Դ
359. behalf[bi'ha:f]
n.���棬ά����֧��
360. behave[bi'heiv]
vi.���֣���ֹ����ת
361. behavior[bi'heivj2]
n.��Ϊ����ֹ��̬��
362. behind[bi'haind]
prep.�ڡ�����
363. being['bi:i8]
n.���ڣ��������
364. belief[bi'li:f]
n.���Σ����ţ�����
365. believe[bi'li:v]
vt.���ţ���Ϊ
366. bell[bel]
n.�ӣ��壬���壻����
367. belong[bi'l08]
vi.���ڣ�����
368. beloved[bi'l3vd]
a.Ϊ���İ��� n.����
369. below[bi'l2u]
prep.�ڡ�����(����)
370. belt[belt]
n.����������Ƥ������
371. bench[bent6]
n.���ʣ����ʣ�����̨
372. bend[bend]
vt.ʹ���� vi.����
373. beneath[bi'ni:4]
prep.�ڡ��·�
374. beneficial[beni'fi62l]
a.�����ģ������
375. benefit['benifit]
n.���棻���ݣ�����
376. berry['beri]
n.����(���ݮ��)
377. beside[bi'said]
prep.�ڡ��Ա�
378. besides[bi'saidz]
ad.����prep.����֮��
379. best[best]
a.��õģ�����
380. bet[bet]
vt.&vi.&n.���
381. betray[bi'trei]
vt.���ѣ�������й©
382. better['bet2]
a.�Ϻõ� ad.���õ�
383. between[bi'twi:n]
prep.�ڡ��м�
384. beyond[bi'j0nd]
prep.�ڡ����Ǳ�
385. Bible['baibl]
n.�����̡�ʥ����
386. bicycle['baisikl]
n.���г�����̤��
387. big[big]
a.��ģ��޴��
388. bike[baik]
n.���г� vi.�����г�
389. bill[bil]
n.�˵���������Ʊ��
390. billion['bilj2n]
num.����(Ӣ)
391. bind[baind]
vt.���󣻰�����װ��
392. biology[bai'0l2d7i]
n.����ѧ����̬ѧ
393. bird[b2:d]
n.����
394. birth[b2:4]
n.���䣬����������
395. birthday['b2:4di]
n.���գ�����������
396. biscuit['biskit]
n.(Ӣ)���ɣ�(��)���
397. bit[bit]
n.һ�㣬һЩ��СƬ
398. bite[bait]
vt.ҧ������󧣻�ݴ�
399. bitter['bit2]
a.ʹ��ģ��Ϻ���
400. bitterly['bit2li]
ad.���أ���ʹ��
401. black[bl9k]
a.��ɫ�ģ��ڰ���
402. blackboard['bl9kb0:d]
n.�ڰ�
403. blade[bleid]
n.���У���Ƭ��ҶƬ
404. blame[bleim]
vt.�𱸣��ѡ������
405. blank[bl98k]
a.�հ׵� n.�հ�
406. blanket['bl98kit]
n.ë̺��̺�ӣ���ë̺
407. blast[bla:st]
n.��ը������� vt.ը
408. blaze[bleiz]
n.������ vi.ȼ��
409. bleed[bli:d]
vi.��Ѫ����Ѫ����֬
410. blend[blend]
vt.&vi.&n.���
411. bless[bles]
vt.Ϊ��ף��
412. blind[blaind]
a.Ϲ�ģ�äĿ��
413. block[bl0k]
n.���� vt.����������
414. blood[bl3d]
n.Ѫ��ѪҺ��Ѫͳ
415. bloom[blu:m]
n.����������������
416. blossom['bl0s2m]
n.�������� vi.����
417. blow[bl2u]
vi.��������������
418. blue[blu:]
a.��ɫ�� n.��ɫ
419. board[b0:d]
n.�� vt.��(��������)
420. boast[b2ust]
vi.�Կ� vt.����
421. boat[b2ut]
n.С����ͧ���洬
422. body['b0di]
n.���壻���壻ʬ��
423. boil[b0il]
vi.���ڣ�����vt.���
424. bold[b2uld]
a.�󵨵ģ�ðʧ��
425. bolt[b2ult]
n.��˨������ vt.����
426. bomb[b0m]
n.ը�� vt.��ը
427. bond[b0nd]
n.���ᣬ��ϵ����ծ
428. bone[b2un]
n.�ǣ�����
429. book[buk]
n.�飬�鼮 vt.Ԥ��
430. boot[bu:t]
n.ѥ�ӣ���ͳѥ
431. booth[bu:5]
n.��̯�����õ绰ͤ
432. border['b0:d2]
n.�ߣ���Ե���߽�
433. bore[b0:]
vt.ʹ�ᷳ���꣬��
434. born[b0:n]
a.�����ģ�������
435. borrow['b0r2u]
vt.�裬���ã�����
436. bosom['buz2m]
n.�أ��ز�������
437. boss[b0s]
n.�ϰ壬��˾ vt.ָ��
438. both[b2u4]
pron.����(��)
439. bother['b052]
vt.���ţ��Ի� n.�鷳
440. bottle['b0tl]
n.ƿ����ƿ��һƿ
441. bottom['b0t2m]
n.�ף��ײ�������
442. bough[bau]
n.��֦
443. bounce[bauns]
vi.��������������
444. bound[baund]
a.һ���ģ��������
445. boundary['baund2ri]
n.�ֽ��ߣ����
446. bow[bau]
n.���������᣻�Ϲ�
447. bowl[b2ul]
n.�룬������״��
448. box[b0ks]
n.�䣬�У�����
449. box[b0ks]
vi.ȭ������ȭ
450. boy[b0i]
n.�к������ꣻ�һ�
451. brain[brein]
n.�ԣ����裻����
452. brake[breik]
n.բ��ɲ�� vi.�ƶ�
453. branch[bra:nt6]
n.��֦���ֲ����ֿ�
454. brand[br9nd]
n.��Ʒ����ӡ vt.����
455. brandy['br9ndi]
n.�����ؾ�
456. brass[bra:s]
n.��ͭ����ͭ��
457. brave[breiv]
a.�¸ҵģ�������
458. bread[bred]
n.�����ʳ���ʳ
459. breadth[bred5]
n.��ȣ����ȣ�����
460. break[breik]
vt.���ƣ��𻵣��ƻ�
461. breakfast['brekf2st]
n.�緹�����
462. breast[brest]
n.�鷿���ظ�������
463. breath[bre4]
n.��Ϣ����������ζ
464. breathe[bri:5]
vi.���� vt.����
465. breed[bri:d]
n.Ʒ�� vt.ʹ��ֳ
466. breeze[bri:z]
n.΢�磬�ͷ�
467. brick[brik]
n.ש��ש�飻ש״��
468. bridge[brid7]
n.�ţ�����������
469. brief[bri:f]
a.��̵ģ����ݵ�
470. bright[brait]
a.�����ģ�������
471. brighten['braitn]
vt.ʹ���⣻ʹ���
472. brilliant['brilj2nt]
a.��Եģ�׿Խ��
473. brim[brim]
n.�ߣ���Ե��ñ��
474. bring[bri8]
vt.��������������ʹ
475. brisk[brisk]
a.���õģ����µ�
476. bristle[brisl]
n.�̶�Ӳ��ë����ë
477. Britain['brit2n]
n.���еߣ�Ӣ��
478. British['briti6]
a.���еߵģ�Ӣ�����
479. brittle['britl]
a.��ģ����𻵵�
480. broad[br0:d]
a.��ģ����ģ��㷺��
481. broadcast['br0:dka:st]
n.�㲥������
482. broken['br2uk2n]
a.������ģ����۵�
483. bronze[br0nz]
n.��ͭ����ͭ��Ʒ
484. brood[bru:d]
n.ͬ������ vt.��(��)
485. brook[bruk]
n.С�ӣ�Ϫ��
486. broom[bru:m]
n.ɨ��
487. brother['br352]
n.�ֵܣ�ͬ�£�ͬ��
488. brow[brau]
n.�ü��üë
489. brown[braun]
n.��ɫ����ɫ
490. bruise[bru:z]
n.���ף��˺ۣ�����
491. brush[br36]
n.ˢ�ӣ�ëˢ������
492. brute[bru:t]
n.���ޣ�����
493. bubble['b3bl]
n.�� vi.ð�ݣ�����
494. bucket['b3kit]
n.ˮͰ����Ͱ������
495. bud[b3d]
n.ѿ����ѿ������
496. build[bild]
vt.����������������
497. building['bildi8]
n.�������¥������
498. bulb[b3lb]
n.����ݣ���״��
499. bulk[b3lk]
n.���壬�ݻ�������
500. bull[bul]
n.��ţ���۵���
501. bullet['bulit]
n.ǹ�����ӵ�������
502. bunch[b3nt6]
n.�����򣬴���һȺ
503. bundle['b3ndl]
n.����������������
504. burden['b2:dn]
n.���ӣ��ص���װ����
505. bureau['bju2r2u]
n.�֣�˾�������磬��
506. burn[b2:n]
vi.�գ�ȼ�� n.����
507. burst[b2:st]
vt.ʹ���� vi.&n.��ը
508. bury['beri]
vt.���ᣬ�᣻���
509. bus[b3s]
n.��������
510. bush[bu6]
n.��ľ����ľ�ԣ�����
511. business['biznis]
n.��ҵ�����⣻����
512. busy['bizi]
a.æ�ģ���æ��
513. but[b3t]
conj.���ǣ�����
514. butcher['but62]
n.������ɱ��
515. butter['b3t2]
n.���ͣ�����
516. butterfly['b3t2flai]
n.����
517. button['b3tn]
n.���ӣ���ť vt.�۽�
518. buy[bai]
vt.�򣬹��� vi.��
519. by[bai]
prep.�ڡ��ԣ�������
520. cabbage['k9bid7]
n.��ײˣ����Ĳ�
521. cabin['k9bin]
n.С�ݣ����գ�����
522. cabinet['k9binit]
n.�������ڸ�
523. cable['keibl]
n.�£��������£��籨
524. cafe['k9fei. k2'fei]
n.���ȹݣ�С����
525. cafeteria[k9fi'ti2ri2]
n.����ʳ��
526. cage[keid7]
n.��������������
527. cake[keik]
n.�����⣬����
528. calculate['k9lkjuleit]
vt.���㣻���ƣ��ƻ�
529. calculation[k9lkju'lei62n]
n.���㣬������
530. calculator['k9lkjuleit2]
n.��������������
531. calendar['k9lind2]
n.���������飻����
532. call[k0:l]
vt.�ѡ��������У���
533. calm[ka:m]
a.���ģ�ƽ����
534. camel['k9m2l]
n.����
535. camera['k9m2r2]
n.���������Ӱ��
536. camp[k9mp]
n.ҰӪ��Ӫ�أ���Ӫ
537. campaign[k9m'pein]
n.ս�ۣ��˶�
538. campus['k9mp2s]
n.У԰��ѧУ����
539. can[k9n]
aux.v.�ܣ��ᣬ����
540. can[k9n]
n.��ͷ����ͷ������
541. Canada['k9n2d2]
n.���ô�
542. Canadian[k2'neidj2n]
a.���ô��
543. canal[k2'n9l]
n.�˺ӣ���������
544. cancel['k9ns2l]
vt.ȡ����������ɾȥ
545. cancer['k9ns2]
n.������֢������
546. candidate['k9ndidit]
n.��ѡ�ˣ�Ͷ����
547. candle['k9ndl]
n.������������
548. candy['k9ndi]
n.�ǹ���ɰ�ǽᾧ
549. cannon['k9n2n]
n.���ڣ����ڣ�����
550. canoe[k2'nu:]
n.��ľ�ۣ�Ƥͧ������
551. canteen[k9n'ti:n]
n.С��������ʱ����
552. canvas['k9nv2s]
n.�ַ�����һ���ͻ���
553. cap[k9p]
n.ñ�ӣ���ñ��ñ״��
554. capable['keip2bl]
a.�������ģ��в��ܵ�
555. capacity[k2'p9siti]
n.����������������
556. capital['k9pitl]
n.�ʱ����ʽ��׶�
557. captain['k9ptin]
n.½����ξ���ӳ�
558. captive['k9ptiv]
n.��²�����������
559. capture['k9pt62]
vt.���񣬷��񣻶��
560. car[ka:]
n.������С�������γ�
561. carbon['ka:b2n]
n.̼
562. card[ka:d]
n.������Ƭ����Ƭ
563. care[k/2]
vi.���ģ����� n.С��
564. career[k2'ri2]
n.���ģ�ְҵ������
565. careful['k/2ful]
a.��ϸ�ģ�ϸ�µ�
566. careless['k/2lis]
a.���ĵģ��������ĵ�
567. cargo['ka:g2u]
n.����������
568. carpenter['ka:pint2]
n.ľ����ľ��
569. carpet['ka:pit]
n.��̺��ձ̺��ë̺
570. carriage['k9rid7]
n.�ͳ��᣻������
571. carrier['k9ri2]
n.���乤�ߣ����ع���
572. carrot['k9r2t]
n.���޲�
573. carry['k9ri]
vt.Я�������أ�����
574. cart[ka:t]
n.�����˻���
575. carve[ka:v]
vt.�̣���̣��п�
576. case[keis]
n.�������ʵ������
577. case[keis]
n.��(��)����(��)����
578. cash[k96]
n.�ֽ��ֿ�
579. cassette[ka:'set]
n.��ʽ¼����������
580. cast[ka:st]
vt.Ͷ���ӣ��ף�����
581. castle['ka:sl]
n.�Ǳ����޴�����
582. casual['k97ju2l]
a.żȻ�ģ�����
583. cat[k9t]
n.è��è�ƣ�èƤ
584. catalog['k9t2l0g]
n.Ŀ¼��Ŀ¼��
585. catch[k9t6]
vt.׽ס�����ϣ����
586. cathedral[k2'4i:dr2l]
n.�ܽ��ã������
587. cattle['k9tl]
n.ţ�����ڣ�����
588. cause[k0:z]
n.ԭ�����ɣ���ҵ
589. cave[keiv]
n.ɽ������Ѩ��Ҥ��
590. cease[si:s]
vi.&vi.&n.ֹͣ��ͣϢ
591. ceiling['si:li8]
n.�컨�壬����
592. celebrate['selibreit]
vt.��ף�����̣�����
593. cell[sel]
n.ϸ����С����
594. cellar['sel2]
n.��Ҥ��������
595. cement[si'ment]
n.ˮ�ࣻ���� vt.ճ��
596. cent[sent]
n.�֣��ֱң���
597. centigrade['sentigreid]
a.�ٷֶȵ�
598. centimetre['sentimi:t2]
n.���֣�����
599. central['sentr2l]
a.���ĵģ���Ҫ��
600. centre['sent2]
n.���ģ����� vt.����
601. century['sent6uri]
n.���ͣ�����
602. ceremony['serim2ni]
n.������ʽ�����
603. certain['s2:t2n]
a.ȷʵ�ģ��϶���
604. certainly['s2:t2nli]
ad.һ�����ض�����Ȼ
605. certainty['s2:tnti]
n.��Ȼ���϶�
606. certificate[s2'tifikit]
n.֤�飬֤����ִ��
607. chain[t6ein]
n.������������Ȧ
608. chair[t6/2]
n.���ӣ���ϯ
609. chairman['t6/2m2n]
n.��ϯ���鳤���᳤
610. chalk[t60:k]
n.���ѣ��۱�
611. challenge['t69l2nd7]
n.��ս��Ҫ����Ҫ
612. chamber['t6eimb2]
n.�����ң����䣻ǻ
613. champion['t69mpj2n]
n.�ھ�����ʤ��
614. chance[t6a:ns]
n.���ᣬ������������
615. change[t6eind7]
n.�ı䣬�仯����Ǯ
616. channel['t69nl]
n.��Ͽ��������Ƶ��
617. chapter['t69pt2]
n.�£��أ�ƪ
618. character['k9rikt2]
n.�Ը����ԣ���ɫ
619. characteristic[k9rikt2'ristik]
a.���е� n.����
620. charge[t6a:d7]
vt.���ۣ��ظ� n.����
621. charity['t69riti]
n.ʩ�᣻������ҵ
622. charming['t6a:mi8]
a.���˵ģ��ɰ���
623. chart[t6a:t]
n.ͼ��ͼ����ͼ
624. chase[t6eis]
n.׷��׷�ϣ�׷��
625. cheap[t6i:p]
a.���۵ģ����ʵ�
626. cheat[t6i:t]
vt.ƭȡ���� vi.��ƭ
627. check[t6ek]
vt.��飻��ֹ n.���
628. cheek[t6i:k]
n.��գ�����
629. cheer[t6i2]
vt.ʹ����������
630. cheerful['t6i2ful]
a.���ֵģ�����
631. cheese[t6i:z]
n.���ң�����
632. chemical['kemikl]
a.��ѧ�� n.��ѧ��Ʒ
633. chemist['kemist]
n.��ѧ�ң�ҩ��ʦ
634. chemistry['kemistri]
n.��ѧ
635. cheque[t6ek]
n.֧Ʊ
636. cherry['t6eri]
n.ӣ�ң�ӣ����
637. chess[t6es]
n.�壻��������
638. chest[t6est]
n.��ǻ�����ţ�����
639. chew[t6u:]
vt.�׽�������
640. chicken['t6ikin]
n.С����С�񣻼���
641. chief[t6i:f]
a.��Ҫ�ģ���ϯ��
642. child[t6aild]
n.С������ͯ������
643. childhood['t6aildhud]
n.ͯ�꣬���ꣻ����
644. childish['t6aildi6]
a.���ӵģ����ɵ�
645. chill[t6il]
vt.ʹ���� n.����
646. chimney['t6imni]
n.�̴ѣ���Ͳ��������
647. chin[t6in]
n.򤣬�°�
648. China['t6ain2]
n.�й�
649. china['t6ain2]
n.����������
650. Chinese['t6ai'ni:z]
a.�й��� n.�й���
651. chocolate['t60k2lit]
n.�ɿ������ɿ�����
652. choice[t60is]
n.ѡ�񣬾���
653. choke[t62uk]
vt.ʹ��Ϣ������
654. choose[t6u:z]
vt.ѡ����ѡ����Ը
655. chop[t60p]
vt.����������ϸvi.��
656. Christian['kristi2n]
n.������ͽ����ͽ
657. Christmas['krism2s]
n.ʥ����
658. church[t62:t6]
n.���ã�����ã��̻�
659. cigarette[sig2'ret]
n.���̣�ֽ�̣�����
660. cinema['sinim2]
n.��ӰԺ����Ӱ��ӰƬ
661. circle['s2:kl]
n.Բ��Բ�ܣ�Ȧ��
662. circuit['s2:kit]
n.��·�����У�Ѳ��
663. circular['s2:kjul2]
a.Բ�ģ�ѭ����
664. circulate['s2:kjuleit]
vt.ʹѭ�� vi.ѭ��
665. circumference[s2'k3mf2r2ns]
n.Բ�ܣ��ܳ���Բ����
666. circumstance['s2:k2mst2ns]
n.���������������
667. citizen['sitizn]
n.�������񣬾���
668. city['siti]
n.���У�����
669. civil['sivl]
a.����ģ���ְ��
670. civilization[sivilai'zei62n]
n.�������Ļ�������
671. civilize['sivilaiz]
vt.ʹ����������
672. claim[kleim]
vt.���ƣ����ţ���ȡ
673. clap[kl9p]
vi.���� vt.�ģ�����
674. clarify['kl9rifai]
vt.���壬����
675. clasp[kla:sp]
n.���ӣ����ӣ�����
676. class[kla:s]
n.�࣬�༶���׼�
677. classical['kl9sik2l]
a.�ŵ�ģ������
678. classification[kl9sifi'kei62n]
n.���ࣻ�ּ������෨
679. classify['kl9sifai]
vt.�ѡ�����
680. classmate['kla:smeit]
n.ͬ��ͬѧ
681. classroom['kla:srum]
n.���ң�����
682. claw[kl0:]
n.צ����צ����
683. clay[klei]
n.ճ��������������
684. clean[kli:n]
a.���ģ������
685. clear[kli2]
a.������ vt.���
686. clearly['kli2li]
ad.���׵أ�������
687. clerk[kla:k. kl2:k]
n.��Ա������Ա��ְԱ
688. clever['klev2]
a.�����ģ�������
689. cliff[klif]
n.���£��ͱ�
690. climate['klaimit]
n.���򣻷������ش�
691. climb[klaim]
vi.�ʵǣ��� vt.��
692. cloak[kl2uk]
n.���񣻸���(��)
693. clock[kl0k]
n.�ӣ��Ǳ�
694. close[kl2uz. kl2us]
vt.�أ��գ�����
695. closely['kl2usli]
ad.���ܵأ��ӽ���
696. cloth[kl0:4]
n.�������ϣ�����
697. clothe[kl2u5]
vt.�������·�
698. clothes[kl2u5z]
n.�·�����װ������
699. clothing['kl2u5i8]
n.�·�������
700. cloud[klaud]
n.�ƣ���״���Ӱ
701. cloudy[klaudi]
a.���Ƶģ���һ���
702. club[kl3b]
n.���ֲ���ҹ�ܻ�
703. clue[klu:]
n.��������ʾ����ʾ
704. clumsy['kl3mzi]
a.��׾�ģ��ޱ���
705. coach[k2ut6]
n.��;��������
706. coal[k2ul]
n.ú��ú��
707. coarse[k0:s]
a.�ֵģ��ֲڵ�
708. coast[k2ust]
n.����������(����)
709. coat[k2ut]
n.���ף����£���Ƥ
710. cock[k0k]
n.���������ݣ�����
711. code[k2ud]
n.׼�򣻷��䣻����
712. coffee['k0fi]
n.���ȣ����Ȳ�
713. coil[k0il]
n.(һ)����Ȧ vt.��
714. coin[k0in]
n.Ӳ�ң�����(Ӳ��)
715. cold[k2uld]
a.��ģ��䵭�� n.��
716. collapse[k2'l9ps]
vi.��̮���������߽�
717. collar['k0l2]
n.���죬��Ȧ
718. colleague['k0li:g]
n.ͬ�£�ͬ��
719. collect[k2'lekt]
vt.�ռ� vi.�տ�
720. collection[k2'lek62n]
n.�Ѽ����ռ����ղ�Ʒ
721. collective[k2'lektiv]
a.����ģ������Ե�
722. college['k0lid7]
n.ѧԺ����ѧ
723. collision[k2'li7(2)n]
n.��ײ����ͻ
724. colonel['k2:nl]
n.½����У����У
725. colony['k0l2ni]
n.ֳ��أ��Ⱦӵ�
726. color['k3l2]
n.��ɫ����ɫ������
727. column['k0l2m]
n.����֧����Բ��
728. comb[k2um]
n.���� vt.����
729. combination[k0mbi'nei62n]
n.��ϣ����ϣ�����
730. combine[k2m'bain]
vt.ʹ��ϣ�����
731. come[k3m]
vi.��������������
732. comfort['k3mf2t]
n.���ʣ���ο vt.��ο
733. comfortable['k3mf2t2bl]
a.���ʵģ���ο��
734. command[k2'ma:nd]
vt.���ָ�ӣ�����
735. commander[k2'ma:nd2]
n.˾��٣�ָ��Ա
736. comment['k0ment]
n.���ۣ������ע��
737. commerce['k0m2(:)s]
n.��ҵ��ó�ף��罻
738. commercial[k2'm2:62l]
a.��ҵ�ģ���Ʒ����
739. commission[k2'mi62n]
n.ί��״��ίԱ��
740. commit[k2'mit]
vt.��(����);��(����)
741. committee[k2'miti]
n.ίԱ�᣻ȫ��ίԱ
742. common['k0m2n]
a.��ͨ�ģ���ͬ��
743. commonly['k0m2nli]
ad.��ͨ�أ�һ���
744. communicate[k2'mju:nikeit]
vi.ͨѶ���������
745. communication[k2'mju:nikei62n]
n.ͨѶ�������ͨ
746. communism['k0mjuniz2m]
n.��������
747. communist['k0mjunist]
n.������Ա
748. community[k2'mju:niti]
n.��������᣻����
749. companion[k2m'p9ni2n]
n.ͬ�飻�����ߣ�����
750. company['k3mp2ni]
n.��˾���̺ţ�ͬ��
751. comparative[k2m'p9r2tiv]
a.�Ƚϵģ���Ե�
752. compare[k2m'p/2]
vt.�Ƚϣ����գ�����
753. comparison[k2m'p9risn]
n.�Ƚϣ����գ�����
754. compass['k3mp2s]
n.���̣�ָ���룻Բ��
755. compel[k2m'pel]
vt.ǿ�ȣ���ʹ����
756. compete[k2m'pi:t]
vi.�������������Կ�
757. competent['k0mpit2nt]
a.�������ģ�Ӧ������
758. competition[k0mp2'ti62n]
n.����������
759. compile[k2m'pail]
vt.�༭�����ƣ��Ѽ�
760. complain[k2m'plein]
vi.��Թ����ࣻ�ظ�
761. complaint[k2m'pleint]
n.��Թ��Թ�ԣ��ظ�
762. complete[k2m'pli:t]
a.�����ģ���ɵ�
763. completely[k2m'pli:tli]
ad.ʮ�֣���ȫ��
764. complex['k0mpleks]
a.��ϵģ����ӵ�
765. complicate['k0mplikeit]
vt.ʹ���ӣ�ʹ����
766. complicated['k0mplikeitid]
a.���ӵģ��Ѷ���
767. component[k2m'p2un2nt]
n.��ɲ��֣��֣����
768. compose[k2m'p2uz]
vt.��ɣ����ɣ�����
769. composition[k0mp2'zi62n]
n.���ɣ���Ʒ��д��
770. compound['k0mpaund. k2m'paund]
n.��������ϴ�
771. comprehension[k0mpri'hen62n]
n.��⣬�����������
772. comprehensive[k0mpri'hensiv]
a.�㷺�ģ�����
773. compress[k2m'pres]
vt.ѹ����ѹ��
774. comprise[k2m'praiz]
vt.����������������
775. compromise['k0mpr2maiz]
n.��Э���ͽ�
776. compute[k2m'pju:t]
vt.���㣬���ƣ�����
777. computer[k2m'pju:t2]
n.�����������
778. comrade['k0mrid]
n.ͬ־�����ܵ�ͬ��
779. conceal[k2n'si:l]
vt.�ѡ���������
780. concentrate['k0ns2ntreit]
vt.���У��ۼ���Ũ��
781. concentration[k0ns2n'trei62n]
n.���У�רע��Ũ��
782. concept['k0nsept]
n.����������
783. concern[k2n's2:n]
n.���ģ������ϵ
784. concerning[k2n's2:ni8]
prep.����
785. concert['k0ns2t]
n.���ֻᣬ�����
786. conclude[k2n'klu:d]
vt.�ƶϳ�������
787. conclusion[k2n'klu:72n]
n.���ۣ����ۣ���β
788. concrete['k0nkri:t]
n.��������������
789. condemn[k2n'dem]
vt.Ǵ��ָ������
790. condense[k2n'dens]
vt.ѹ����ʹ����
791. condition[k2n'di62n]
n.״����״̬������
792. conduct['k0nd2kt. k2n'd3kt]
n.��ֹ����Ϊ��ָ��
793. conductor[k2n'd3kt2]
n.��ƱԱ��(�ֶ�)ָ��
794. conference['k0nf2r2ns]
n.���飬���ۻ�
795. confess[k2n'fes]
vt.���ϣ����ϣ�̹��
796. confidence['k0nfid2ns]
n.���Σ�����������
797. confident['k0nfid2nt]
n.ȷ�ŵģ����ŵ�
798. confine[k2n'fain]
vt.���ƣ�����
799. confirm[k2n'f2:m]
vt.֤ʵ���϶�����׼
800. conflict['k0nflikt. k2n'flikt]
n.���ۣ���ͻ������
801. confuse[k2n'fju:z]
vt.ʹ���ң�����
802. confusion[k2n'fju:72n]
n.���ң�ɧ�ң�����
803. congratulate[k2n'gr9tjuleit]
vt.ף�أ��򡭵�ϲ
804. congratulation[k2ngr9tju'lei62n]
n.ף�أ�ף�ش�
805. congress['k08gres]
n.��᣻���ᣬ���
806. conjunction[k2n'd738k62n]
n.�Ӻϣ����ӣ����Ӵ�
807. connect[k2'nekt]
vt.���ӣ����᣻��ϵ
808. connection[k2'nek62n]
n.���ӣ���ϵ��������
809. conquer['k08k2]
vt.������սʤ���Ƴ�
810. conquest['k08kwest]
n.��ȡ���������˷�
811. conscience['k0n62ns]
n.���ģ�������
812. conscious['k0n62s]
a.��ʶ���ģ������
813. consciousness['k0n62snis]
n.��ʶ������֪��
814. consent[k2n'sent]
n.ͬ�⣬�޳� vi.ͬ��
815. consequence['k0nsikw2ns]
n.��������
816. consequently['k0nsikw2ntli]
ad.��ˣ����������
817. conservation[k0ns2(:)'vei62n]
n.���棬�������غ�
818. conservative[k2n's2:v2tiv]
a.���ص� n.���ص���
819. consider[k2n'sid2]
vt.��Ϊ�����ǣ�����
820. considerable[k2n'sid2r2bl]
a.�൱��ģ���Ҫ��
821. considerate[k2n'sid2rit]
a.�����ܵ��ģ����µ�
822. consideration[k2nsid2'rei62n]
n.���ǣ�˼��������
823. consist[k2n'sist]
vi.�ɡ���ɣ�����
824. consistent[k2n'sist2nt]
a.��ֵģ�һ���
825. constant['k0nst2nt]
a.�����ģ������
826. constitution[k0nsti'tju:62n]
n.�³̣����ʣ�����
827. construct[k2n'str3kt]
vt.���죻���裻����
828. construction[k2n'str3k62n]
n.���죻������������
829. consult[k2n's3lt]
vt.��̣�����
830. consume[k2n'sju:m]
vt.���ģ����ѣ�����
831. consumption[k2n's3mp62n]
n.������������
832. contact['k0nt9kt. k2n't9kt]
vt.ʹ�Ӵ����롭��ϵ
833. contain[k2n'tein]
vt.���������ɣ�����
834. container[k2n'tein2]
n.��������װ��
835. contemporary[k2n'temp2r2ri]
a.�����ģ�ͬʱ����
836. contempt[k2n'tempt]
n.������ӣ�����
837. content['k0ntent. k2n'tent]
n.���ݣ�Ŀ¼������
838. content['k0ntent. k2n'tent]
a.����ģ������
839. contest[k2n'test. 'k0ntest]
vt.���ᣬ��ȡ���粵
840. continent['k0ntin2nt]
n.��½��½�أ���
841. continual[k2n'tinju2l]
a.���ϵģ�������
842. continue[k2n'tinju(:)]
vt.����������������
843. continuous[k2n'tinju2s]
a.�������ϵģ�������
844. contract['k0ntr9kt. k2n'tr9kt]
n.��Լ����ͬ����Լ
845. contradiction[k0ntr2'dik62n]
n.ì�ܣ���һ�£�����
846. contrary['k0ntr2ri]
a.�෴�� n.�෴
847. contrast['k0ntr9st. k2n'tr9st]
n.�Աȣ����գ�����
848. contribute[k2n'tribju(:)t]
vt.���ף�������Ͷ��
849. control[k2n'tr2ul]
vt.���ƣ����� n.����
850. convenience[k2n'vi:nj2ns]
n.���������㣻����
851. convenient[k2n'vi:nj2nt]
a.�����ģ������
852. convention[k2n'ven62n]
n.ϰ�ף���������Լ
853. conventional[k2n'ven62nl]
a.��ͨ�ģ�ϰ�ߵ�
854. conversation[k0nv2'sei62n]
n.�Ự������ʽ��̸
855. conversely['k0nv2:sli]
ad.�෴��
856. conversion[k2n'v2:62n]
n.ת�䣬ת�����ı�
857. convert[k2n'v2:t. 'k0nv2:t]
vt.ʹת�䣻ʹ�ı�
858. convey[k2n'vei]
vt.���ͣ����ͣ�����
859. convince[k2n'vins]
vt.ʹȷ�ţ�ʹ�ŷ�
860. cook[kuk]
vt.������� vt.�ղ�
861. cool[ku:l]
a.���ģ��侲��
862. cooperate[k2u'0p2reit]
vi.������Э�������
863. coordinate[k2u'0dinit]
vt.ʹЭ��������
864. cope[k2up]
vi.�Ը���Ӧ��
865. copper['k0p2]
n.ͭ��ͭ�ң�ͭ����
866. copy['k0pi]
n.���� vt.��д������
867. cord[k0:d]
n.ϸ�������ߣ���
868. cordial['k0:dj2l]
a.��ϵģ��Ͽҵ�
869. core[k0:]
n.��ʵ���ģ�����
870. corn[k0:n]
n.���(Ӣ)С��
871. corner['k0:n2]
n.�ǣ����ǣ���Զ����
872. corporation[k0:p2'rei62n]
n.��˾����ҵ������
873. correct[k2'rekt]
a.��ȷ�� vt.����
874. correction[k2'rek62n]
n.�������������޸�
875. correspond[k0ris'p0nd]
vi.����ϣ��൱
876. correspondent[k0ris'p0nd2nt]
n.ͨ���ߣ�ͨѶԱ
877. corresponding[k0ris'p0ndi8]
a.��Ӧ�ģ����ϵ�
878. corridor['k0rid0:]
n.���ȣ����ȣ�ͨ·
879. cost[k0st]
n.�۸񣬴��ۣ��ɱ�
880. costly['k0stli]
a.����ģ���ֵ�ߵ�
881. cottage['k0tid7]
n.���ᣬС��
882. cotton['k0tn]
n.�ޣ����ߣ��޲�
883. cough[k0f]
vi.�ȣ����� n.����
884. could[kud. k2d]
aux.v.(can�Ĺ�ȥʽ)
885. council['kaunsil]
n.���»ᣬίԱ��
886. count[kaunt]
vt.���� vi.��������
887. counter['kaunt2]
n.��̨��������
888. country['k3ntri]
n.���ң�������ũ��
889. countryside['k3ntrisaid]
n.���£�ũ��
890. county['kaunti]
n.Ӣ���Ŀ�����������
891. couple['k3pl]
n.�򸾣�(һ)�ԣ�����
892. courage['k3rid7]
n.��������������ʶ
893. course[k0:s]
n.�γ̣����̣�һ����
894. court[k0:t]
n.��Ժ����ͥ��ͥԺ
895. cousin['k3zn]
n.��(���)�ֵ�(����)
896. cover['k3v2]
vt.�ǣ����� n.����
897. cow[kau]
n.ĸţ����ţ��ĸ��
898. coward['kau2d]
n.ų�򣻵�����
899. crack[kr9k]
n.�ѷ죬���� vi.����
900. craft[kra:ft]
n.���գ����գ���ҵ
901. crane[krein]
n.���ػ�����Ӱ������
902. crash[kr96]
vi.��ײ��׹�� n.��ײ
903. crawl[kr0:l]
vi.��������
904. crazy['kreizi]
a.���ģ����Ƶ�
905. cream[kri:m]
n.���ͣ���֬������ɫ
906. create[kri(:)'eit]
vt.���죻���𣬲���
907. creative[kri(:)'eitiv]
a.�����Եģ�������
908. creature['kri:t62]
n.����������
909. credit['kredit]
n.���ô������
910. creep[kri:p]
vi.���У��������н�
911. crew[kru:]
n.ȫ�崬Ա
912. cricket['krikit]
n.������
913. crime[kraim]
n.����У�����
914. criminal['kriminl]
n.���ˣ��ﷸ�����·�
915. cripple['kripl]
n.���ӣ��зϵ���
916. crisis['kraisis]
n.Σ��������֮��
917. critic['kritik]
n.�����ң������޵���
918. critical['kritik2l]
a.�����Եģ�������
919. criticism['kritisiz2m]
n.���������У�����
920. criticize['kritisaiz]
vt.���������ۣ�����
921. crop[kr0p]
n.ũ���ׯ�ڣ�һ��
922. cross[kr0s]
vt.������ʹ����
923. crow[kr2u]
n.ѻ����ѻ vi.��
924. crowd[kraud]
n.Ⱥ�����ڣ�һ����
925. crown[kraun]
n.���ڣ��᣻����
926. crude[kru:d]
a.��ª�ģ���Ȼ��
927. cruel['kru2l]
a.���̵ģ��п��
928. crush[kr36]
vt.ѹ�飬���飻��ѹ
929. crust[kr3st]
n.���Ƥ��Ӳ��Ƥ
930. cry[krai]
vi.�ޣ��������к�
931. crystal['kristl]
n.ˮ�����ᾧ�壻����
932. cube[kju:b]
n.�����Σ�����
933. cubic['kju:bik]
a.�����εģ�������
934. cucumber['kju:k3mb2]
n.�ƹ�
935. cultivate['k3ltiveit]
vt.������ֲ������
936. culture['k3lt62]
n.�Ļ�������������
937. cunning['k3ni8]
a.�ƻ��ģ���թ��
938. cup[k3p]
n.���ӣ�(һ)��������
939. cupboard['k3b2d]
n.����������ʳ��
940. cure[kju2]
vt.ҽ�Σ����� n.����
941. curiosity[kju2ri'0siti]
n.���棬�����ģ���Ʒ
942. curious['kju2ri2s]
a.����ģ�ϡ��Źֵ�
943. curl[k2:l]
n.��ë������ vi.����
944. current['k3r2nt]
a.��ǰ�ģ�ͨ�õ�
945. curse[k2:s]
n.���䣬�����Ǵ
946. curtain['k2:tn]
n.����������Ļ(��)
947. curve[k2:v]
n.���ߣ��� vt.Ū��
948. cushion['ku62n]
n.���ӣ����棬����
949. custom['k3st2m]
n.ϰ�ߣ����ף�����
950. customer['k3st2m2]
n.�˿ͣ�����
951. cut[k3t]
vt.�У����������
952. cycle['saikl]
n���г���ѭ��
953. daily['deili]
a.ÿ�յ� n.�ձ�
954. dairy['d/2ri]
n.ţ�̳�������Ʒ
955. dam[d9m]
n.ˮ�ӣ�ˮ�̣��ϰ���
956. damage['d9mid7]
vt.�𺦣��ٻ� n.��
957. damp[d9mp]
a.��ʪ�ģ���ʪ����
958. dance[da:ns]
vi.���裻ҡ�� n.��
959. danger['deind72]
n.Σ�գ�Σ������
960. dangerous['deind7r2s]
a.Σ�յģ�����ȫ��
961. dare[d/2]
vt.&aux.v.�ң�����
962. daring['d/2ri8]
a.�󵨵ģ��¸ҵ�
963. dark[da:k]
a.���ģ���ɫ��
964. darling['da:li8]
n.�װ����ˣ����
965. dash[d96]
vt.ʹ��ײ���� n.�ͳ�
966. data['deit2]
n.����; ����
967. date['deit]
n.���� vt.ע������
968. daughter['d0:t2]
n.Ů��
969. dawn[d0:n]
n.���������� vi.����
970. day[dei]
n.(һ)�죬���磬����
971. daylight['deilait]
n.���磬�չ⣻����
972. dead[ded]
a.���ģ���������
973. deadly['dedli]
a.�����ģ���һ���
974. deaf[def]
a.���ģ���Ը����
975. deal[di:l]
n.���������� vt.����
976. dear[di2]
a.�װ��� int.��
977. death[de4]
n.��������������
978. debate[di'beit]
n.&vi.���ۣ�����
979. debt[det]
n.ծ��ծ��Ƿծ
980. decade['dekeid]
n.ʮ�꣬ʮ����
981. decay[di'kei]
vi.���ã�˥�� n.����
982. deceit[di'si:t]
n.��ƭ����թ
983. deceive[di'si:v]
vt.��ƭ���ɱΣ���ƭ
984. December[di'semb2]
n.ʮ����
985. decent['di:snt]
a.���ɵģ������
986. decide[di'said]
vt.���������ģ����
987. decision[di'si72n]
n.���������ģ�����
988. deck[dek]
n.�װ壻���棻����
989. declare[di'kl/2]
vt.���ԣ�����������
990. decorate['dek2reit]
vt.װ�Σ�װ諣�����
991. decrease[di'kri:s. 'di:kri:s]
vi.&n.���٣�����
992. deduce[di'dju:s]
vt.������ۣ��ƶ�
993. deed[di:d]
n.��Ϊ����������Լ
994. deep[di:p]
a.��ģ������
995. deepen['di:p2n]
vt.���� vi.�
996. deer[di2]
n.¹
997. defeat[di'fi:t]
vt.սʤ�����ܣ����
998. defect[di'fekt]
n.ȱ�㣬ȱ�ݣ�Ƿȱ
999. defence[di'fens]
n.���������񣻱绤
1000. defend[di'fend]
vt.����������
1001. define[di'fain]
vt.�����¶��壻�޶�
1002. definite['definit]
a.��ȷ�ģ��϶���
1003. definitely['definitli]
ad.һ���أ���ȷ��
1004. definition[defi'ni62n]
n.���壬���壻����
1005. degree[di'gri:]
n.�̶ȣ��ȣ�ѧλ
1006. delay[di'lei]
vt.�Ƴ٣����飻����
1007. delete[di'li:t]
vt.ɾ��������
1008. delegation[deli'gei62n]
n.������
1009. delicate['delikit]
a.��ϸ�ģ������
1010. delicious[di'li62s]
a.��ζ�ģ����˵�
1011. delight[di'lait]
n.���� vt.ʹ����
1012. deliver[di'liv2]
vt.Ͷ�ݣ��ͽ�������
1013. delivery[di'liv2ri]
n.Ͷ�ݣ�����������
1014. demand[di'ma:nd]
vt.Ҫ����Ҫ��ѯ��
1015. democracy[di'm0kr2si]
n.������������
1016. democratic[dem2'kr9tik]
a.�����ģ����������
1017. demonstrate['dem2nstreit]
vt.˵������֤����¶
1018. dense[dens]
a.�ܼ��ģ�Ũ���
1019. density['densiti]
n.�ܼ������ܣ��ܶ�
1020. deny[di'nai]
vt.�񶨣��ܾ�����
1021. depart[di'pa:t]
vi.�뿪����̣�����
1022. department[di'pa:tm2nt]
n.����˾���֣�����ϵ
1023. departure[di'pa:t62]
n.�뿪�����������
1024. depend[di'pend]
vi.����������������
1025. dependent[di'pend2nt]
a.�����ģ�������
1026. deposit[di'p0zit]
vt.ʹ�������
1027. depress[di'pres]
vt.ʹ��ɥ������
1028. depth[dep4]
n.��ȣ�����
1029. derive[di'raiv]
vt.ȡ�� vi.��Դ
1030. descend[di'send]
vi.�������½�������
1031. describe[dis'kraib]
vt.���ݣ���д�����
1032. description[dis'krip62n]
n.��д�����ݣ�����
1033. desert['dez2t. di'z2:t]
n.ɳĮ vt.����������
1034. deserve[di'z2:v]
vt.Ӧ�ܣ�ֵ��
1035. design[di'zain]
vt.��� n.��ƣ�ͼ��
1036. desirable[di'zai2r2bl]
a.ֵ�������ģ���ȡ��
1037. desire[di'zai2]
vt.������Ҫ�� n.Ը��
1038. desk[desk]
n.�������칫��
1039. despair[dis'p/2]
n.���� vi.����
1040. desperate['desp2rit]
a.ƴ���ģ�������
1041. despise[dis'paiz]
vt.���ӣ�����
1042. despite[dis'pait]
prep.���ܣ�����
1043. destination[desti'nei62n]
n.Ŀ�ĵأ��յ㣻Ŀ��
1044. destroy[dis'tr0i]
vt.�ƻ������𣻴���
1045. destruction[dis'tr3k62n]
n.�ƻ�����������
1046. detail['di:teil]
n.ϸ�ڣ�֦�ڣ����
1047. detect[di'tekt]
vt.��������������
1048. detection[di'tek62n]
n.��������������
1049. determination[dit2:mi'nei62n]
n.���ģ�������ȷ��
1050. determine[di't2:min]
vt.����������������
1051. develop[di'vel2p]
vt.��չ���γɣ�����
1052. development[di'vel2pm2nt]
n.��չ������������
1053. device[di'vais]
n.��е��װ�ã����
1054. devil['devl]
n.ħ����ħ
1055. devise[di'vaiz]
vt.��ƣ�����
1056. devote[di'v2ut]
vt.�������ף�������
1057. dew[dju:]
n.¶��¶ˮ
1058. diagram['dai2gr9m]
n.ͼ�⣬ͼ����ͼ
1059. dial['dai2l]
n.���棻������ vt.��
1060. dialect['dai2lekt]
n.���ԣ�����ط���
1061. dialog['dai2l0g]
n.�Ի����԰�
1062. diameter[dai'9mit2]
n.ֱ��
1063. diamond['dai2m2nd]
n.���ʯ����ʯ������
1064. diary['dai2ri]
n.�ռǣ��ռǲ�
1065. dictate[dik'teit]
vt.&vi.���ڣ�����
1066. dictation[dik'tei62n]
n.���ڱ�¼����д
1067. dictionary['dik62n2ri]
n.�ʵ䣬�ֵ�
1068. die[dai]
vi.��������������
1069. differ['dif2]
vi.��ͬ������
1070. difference['difr2ns]
n.��𣻲����
1071. different['difr2nt]
a.����ģ����ֵ�
1072. difficult['difik2lt]
a.���ѵģ��ѶԸ���
1073. difficulty['difik2lti]
a.���ѣ����£�����
1074. dig[dig]
vt.���ڣ��ɾ�
1075. digest[di'd7est. 'daid7est]
vt.��������� n.��ժ
1076. digital['did7itl]
a.���ֵģ�������
1077. diligent['dilid72nt]
a.����ģ��ڷܵ�
1078. dim[dim]
a.�谵�ģ����ʵ�
1079. dimension[di'men62n]
n.�ߴ磬�߶ȣ����
1080. dinner['din2]
n.���ͣ����ͣ����
1081. dip[dip]
vt.����պ vi.��һ��
1082. direct[di'rekt]
a.ֱ�ӵģ�ֱ�ʵ�
1083. direction[di'rek62n]
n.���򣬷�λ��ָ��
1084. directly[di'rektli]
ad.ֱ�ӵأ�����
1085. director[di'rekt2]
n.ָ���ߣ����£�����
1086. dirt[d2:t]
n.������������۹�
1087. dirty['d2:ti]
a.��ģ�������
1088. disable[dis'eibl]
vt.ʹ���ܣ�ʹ�˲�
1089. disadvantage[dis2d'va:ntid7]
n.������������λ
1090. disagree[dis2'gri:]
vi.�з��磻��һ��
1091. disappear[dis2'pi2]
vi.������ʧ�٣���ʧ
1092. disappoint[dis2'p0int]
vt.ʹʧ����ʹ�ܴ���
1093. disaster[di'za:st2]
n.���ѣ��ֻ�������
1094. disk[disk]
n.Բ�̣���Ƭ������
1095. discard[dis'ka:d]
vt.����������������
1096. discharge[dis't6a:d7]
vt.�ͷţ��ų� n.�ͷ�
1097. discipline['disiplin]
n.���ɣ�ѵ�� vt.ѵ��
1098. disclose[dis'kl2uz]
vt.�ҿ����ҷ���͸¶
1099. discourage[dis'k3rid7]
vt.ʹй����ʹ����
1100. discover[dis'k3v2]
vt.���֣���¶����ʾ
1101. discovery[dis'k3v2ri]
n.���֣������ֵ�����
1102. discuss[dis'k3s]
vt.���ۣ�̸�ۣ�����
1103. discussion[dis'k362n]
n.���ۣ�̸�ۣ�����
1104. disease[di'zi:z]
n.��������������
1105. disguise[dis'gaiz]
vi.���������� n.��װ
1106. disgust[dis'g3st]
n.�������
1107. dish[di6]
n.�������ӣ�����
1108. dishonour[dis'0n2]
n.����ʣ���������
1109. dislike[dis'laik]
vt.&n.��ϲ�������
1110. dismiss[dis'mis]
vt.���ٿ��ǣ����
1111. disorder[dis'0:d2]
n.���ң����ң�ɧ��
1112. display[dis'plei]
vt.���У�չ������ʾ
1113. disposal[dis'p2uz2l]
n.��������������
1114. dispose[dis'p2uz]
vi.ȥ��������������
1115. displease[dis'pli:z]
vt.ʹ����죬ʹ����
1116. dispute[dis'pju:t]
vi.���ۣ���ִ n.����
1117. dissatisfy[dis's9tisfai]
vi.ʹ������ʹ��ƽ
1118. dissolve[di'z0lv]
vt.ʹ�ܽ⣻��ɢ
1119. distance['dist2ns]
n.���룬��ࣻԶ��
1120. distant['dist2nt]
a.��Զ���ģ���Զ��
1121. distinct[dis'ti8kt]
a.��������ͬ��
1122. distinction[dis'ti8k62n]
n.��𣬲�ͬ������
1123. distinguish[dis'ti8gwi6]
vt.���𣬱���ϱ�
1124. distress[dis'tres]
n.���ǣ����ˣ�����
1125. distribute[dis'tribju:t]
vt.�ַ������ͣ��ֲ�
1126. distribution[distri'bju:62n]
n.�ַ������䣻�ֲ�
1127. district['distrikt]
n.��������������
1128. disturb[dis't2:b]
vt.���ţ����ң�Ū��
1129. ditch[dit6]
n.��������������
1130. dive[daiv]
vi.��ˮ��Ǳˮ������
1131. diverse[dai'v2:s]
a.��һ���ģ������
1132. divide[di'vaid]
vt.�֣����䣻�ֿ�
1133. division[di'vi72n]
n.�֣����䣻����
1134. divorce[di'v0:s]
n.��飬���� vi.���
1135. do[du:. du]
aux.v. vt.�����ɣ���
1136. dock[d0k]
n.���룻��ͷ������
1137. doctor['d0kt2]
n.ҽ����ҽʦ����ʿ
1138. document['d0kjum2nt]
n.���ģ��ļ���֤��
1139. dog[d0g]
n.����Ȯ��Ȯ�ƶ���
1140. dollar['d0l2]
n.Ԫ(���ҵ�λ)
1141. domestic[d2'mestik]
a.�����ģ���ͥ��
1142. donkey['d08ki]
n.¿������
1143. door[d0:]
n.�ţ�ͨ����һ��
1144. dorm[d0:m]
n.����
1145. dormitory['d0:mitri]
n.�������ң�����
1146. dose[d2us]
n.������������һ��
1147. dot[d0t]
n.�㣬Բ�� vt.�����
1148. double['d3bl]
a.�����ģ�˫��
1149. doubt[daut]
n.���ɣ����� vt.����
1150. doubtful['dautful]
a.����Ԥ��ģ����ɵ�
1151. doubtless['dautlis]
ad.���ɵأ��ܿ���
1152. down[daun]
ad.���£�������
1153. downstairs['daun'st/2z]
ad.��¥�� a.¥�µ�
1154. downward['daunw2d]
a.���µ� ad.���µ�
1155. dozen['d3zn]
n.һ��ʮ����
1156. draft[dra:ft]
n.�ݸ壻��Ʊ vt.���
1157. drag[dr9g]
vt.�ϣ�������ҷ
1158. dragon['dr9g2n]
n.�����ױ�����
1159. drain[drein]
vt.��ȥ����ˮ n.�Ľ�
1160. drama['dra:m2]
n.һ��Ϸ�磬�籾
1161. dramatic[dr2'm9tik]
a.����עĿ�ģ�Ϸ���
1162. draw[dr0:]
vt.���������ϣ�����
1163. drawer[dr0:]
n.����
1164. drawing['dr0:i8]
n.ͼ�������裻��ͼ
1165. dread[dred]
n.η�壻�ֲ� vt.����
1166. dream[dri:m]
n.�Σ����� vi.����
1167. dress[dres]
n.Ů����ͯװ����װ
1168. drift[drift]
vi.Ư����Ư�� n.Ư��
1169. drill[dril]
n.��ͷ������ vi.���
1170. drink[dri8k]
vt.�� vi.�� n.����
1171. drip[drip]
vi.���£�©ˮ n.ˮ��
1172. drive[draiv]
vt.��ʻ�����룻��
1173. driver['draiv2]
n.��ʻԱ��˾��
1174. drop[dr0p]
vt.ʹ���£�����
1175. drought[draut]
n.���֣��ɺ�
1176. drown[draun]
vi.����������
1177. drug[dr3g]
n.ҩ��ҩ�ҩ��
1178. drum[dr3m]
n.�ģ���״�ԲͰ
1179. drunk[dr38k]
a.��ģ������
1180. dry[drai]
a.�ɵģ������
1181. duck[d3k]
n.Ѽ����Ѽ��Ѽ��
1182. due[dju:]
a.Ԥ�ڵģ�Ӧ����
1183. dull[d3l]
a.����ģ���������
1184. dumb[d3m]
a.�Ƶģ����Ե�
1185. dump[d3mp]
vt.��ж���㵹������
1186. durable['dju2r2bl]
a.�;õģ����õ�
1187. duration[dju2'rei62n]
n.�������־�
1188. during['dju2ri8]
prep.�ڡ��ڼ�
1189. dusk[d3sk]
n.��ĺ���ƻ裬�İ�
1190. dust[d3st]
n.�������ҳ�
1191. duty['dju:ti]
n.ְ�����Σ�˰
1192. dwelling['dweli8]
n.ס����Ԣ��
1193. dye[dai]
vt.Ⱦ n.Ⱦ�ϣ�Ⱦɫ
1194. dying['daii8]
a.�����ģ����յ�
1195. dynamic[dai'n9mik]
a.�л����ģ�������
1196. each[i:t6]
pron.�������� a.��
1197. eager['i:g2]
a.�����ģ����е�
1198. eagle['i:gl]
n.ӥ
1199. ear[i2]
n.���䣻����������
1200. early['2:li]
ad.�� a.��ģ����ڵ�
1201. earn[2:n]
vt.׬�ã����ã����
1202. earnest['2:nist]
a.����ģ��Ͽҵ�
1203. earth[2:4]
n.����½�أ�����
1204. earthquake['2:4kweik]
n.���𣻴���
1205. ease[i:z]
n.���ף����� vt.����
1206. easily['i:zili]
ad.���׵أ����ʵ�
1207. east[i:st]
n.�������� ad.�ڶ���
1208. eastern['i:st2n]
a.�����ģ�������
1209. easy['i:zi]
a.���׵ģ����ݵ�
1210. eat[i:t]
vt.�ԣ��� vi.�Է�
1211. echo['ek2u]
n.���������� vi.�ظ�
1212. economic[i:k2'n0mik]
a.���õģ�����ѧ��
1213. economical[i:k2'n0mik2l]
a.��Լ�ģ�����ѧ��
1214. economy[i(:)'k0n2mi]
n.���ã���Լ����ʡ
1215. edge[ed7]
n.��Ե���ߣ�����
1216. edition[i'di62n]
n.�棬�汾�����
1217. editor['edit2]
n.�༭�����ߣ�У����
1218. educate['edju(:)keit]
vt.������������ѵ��
1219. education[edju:'kei62n]
n.������ѵ��������ѧ
1220. effect[i'fekt]
n.�����Ч����Ч��
1221. effective[i'fektiv]
a.��Ч�ģ���Ӱ���
1222. efficiency[i'fi62nsi]
n.Ч�ʣ���Ч��Ч��
1223. efficient[i'fi62nt]
a.Ч�ʸߵģ���������
1224. effort['ef2t]
n.Ŭ����Ŭ���ĳɹ�
1225. egg[eg]
n.������������
1226. eight[eit]
num.�ˣ��˸����ڰ�
1227. eighteen['ei'ti:n]
num.ʮ�ˣ�ʮ�˸�
1228. eighth[eit4]
num.�ڰ� n.�˷�֮һ
1229. eighty['eiti]
num.��ʮ����ʮ��
1230. either['ai52. 'i:52]
pron.(����)�κ�һ��
1231. elaborate[i'l9b2rit]
a.���ӵģ�����������
1232. elastic[i'l9stik]
n.�ɽ��� a.�е��Ե�
1233. elbow['elb2u]
n.�⣬�ⲿ�����
1234. elder['eld2]
a.����ϴ�� n.����
1235. elect[i'lekt]
vt.ѡ�٣���ѡ��ѡ��
1236. election[i'lek62n]
n.ѡ�٣�ѡ��Ȩ����ѡ
1237. electric[i'lektrik]
a.��ģ��綯��
1238. electrical[i'lektrik2l]
a.��ģ�������ѧ��
1239. electricity[ilek'trisiti]
n.�磬��ѧ������
1240. electron[i'lektr0n]
n.����
1241. electronic[ilek'tr0nik]
a.���ӵ�
1242. electronics[ilek'tr0niks]
n.����ѧ
1243. element['elim2nt]
n.�ɷ֣�Ҫ�أ�Ԫ��
1244. elementary[eli'ment2ri]
a.�����ģ�������
1245. elephant['elif2nt]
n.��
1246. elevator['eliveit2]
n.���ݣ�������
1247. eleven[i'levn]
num.ʮһ��ʮһ��
1248. eleventh[i'levn4]
num.��ʮһ(��)
1249. eliminate[i'limineit]
vt.�����������ų�
1250. elimination[ilimi'nei62n]
n.�����ų�������
1251. else[els]
ad.���������� a.���
1252. elsewhere[els'w/2]
ad.�ڱ𴦣����
1253. embarrass[im'b9r2s]
vt.ʹ���ȣ�ʹΪ��
1254. embrace[im'breis]
vt.ӵ������������Χ
1255. emerge[i'm2:d7]
vi.���֣�ӿ�֣�ð��
1256. emergency[i'm2:d72nsi]
n.���������ͻȻ�¼�
1257. emit[i'mit]
vt.ɢ�������䣻����
1258. emotion[i'm2u62n]
n.��У����飻����
1259. emotional[i'm2u62nl]
a.����ģ�������
1260. emperor['emp2r2]
n.�ʵ�
1261. emphasis['emf2sis]
n.ǿ�����ص㣬��Ҫ��
1262. emphasize['emf2saiz]
vt.ǿ��������
1263. empire['empai2]
n.�۹�
1264. employ[im'pl0i]
vi.���ã��ã�ʹæ��
1265. employee[empl0i'i:]
n.�ܹ��ߣ���Ա���͹�
1266. employer[im'pl0i2]
n.��Ӷ�ߣ�����
1267. employment[im'pl0im2nt]
n.��ҵ�����ã�ʹ��
1268. empty['empti]
a.�յģ��ն���
1269. enable[i'neibl]
vt.ʹ�ܹ���ʹ����
1270. enclose[in'kl2uz]
vt.Χס��Ȧ�𣻸���
1271. encounter[in'kaunt2]
vt.���������� n.����
1272. encourage[in'k3rid7]
vt.������֧�֣�����
1273. end[end]
n.ĩ�ˣ�Ŀ�� vt.����
1274. ending['endi8]
n.��β����֣�����
1275. endless['endlis]
a.��ֹ����
1276. endure[in'dju2]
vt.���ܣ�����
1277. enemy['enimi]
n.���ˣ���У��б�
1278. energy['en2d7i]
n.��������������
1279. enforce[in'f0:s]
vt.ʵʩ��ִ�У�ǿ��
1280. engage[in'geid7]
vt.ʹ�����ڣ�Ƹ��
1281. engine['end7in]
n.�����������棻����
1282. engineer[end7i'ni2]
n.����ʦ����ʦ
1283. engineering[end7i'ni2ri8]
n.���̣�����ѧ
1284. England['i8gl2nd]
n.Ӣ������Ӣ��
1285. English['i8gli6]
n.Ӣ�� a.Ӣ���˵�
1286. Englishman['i8gli6m2n]
n.Ӣ������
1287. enjoy[in'd70i]
vt.���ܣ����ͣ�ϲ��
1288. enlarge[in'la:d7]
vt.������չ���Ŵ�
1289. enormous[i'n0:m2s]
a.�޴�ģ��Ӵ��
1290. enough[i'n3f]
a.�㹻�� ad.�㹻��
1291. ensure[in'6u2]
vt.��֤������������
1292. enter['ent2]
vt.�߽������룻�μ�
1293. entertain[ent2'tein]
vt.ʹ���֣��д�
1294. enthusiasm[in'4ju:zi9z2m]
n.���飬���ģ��ȳ�
1295. enthusiastic[in4ju:zi'9stik]
a.����ģ����ĵ�
1296. entire[in'tai2]
a.ȫ���ģ�������
1297. entitle[in'taitl]
vt.����Ȩ��(���ʸ�)
1298. entrance['entr2ns]
n.��ڣ��ſڣ�����
1299. entry['entri]
n.��ڴ����Ǽǣ�����
1300. envelope['env2l2up]
n.�ŷ⣻���ף���Ƥ
1301. environment[in'vai2r2nm2nt]
n.��������磻Χ��
1302. envy['envi]
vt.&n.�ʼɣ���Ľ
1303. equal['i:kw2l]
a.��ȵģ�ƽ�ȵ�
1304. equality[i(:)'kw0liti]
n.��ͬ��ƽ�ȣ����
1305. equation[i'kwei62n]
n.����(ʽ)����ʽ
1306. equip[i'kwip]
vt.װ�����䱸
1307. equipment[i'kwipm2nt]
n.װ�����豸���䱸
1308. equivalent[i'kwiv2l2nt]
a.��ȵģ�������
1309. era['i2r2]
n.ʱ�����������Ԫ
1310. erect[i'rekt]
vt.���죻ʹ����
1311. error['er2]
n.�������󣻲��
1312. escape[is'keip]
vi.���ܣ��ݳ� n.����
1313. especially[is'pe62li]
ad.�ر����䣬����
1314. essay['esei]
n.���ģ�ɢ�ģ�СƷ��
1315. essential[i'sen62l]
a.��Ҫ�ģ����ʵ�
1316. establish[is't9bli6]
vt.������������ȷ��
1317. establishment[is't9bli6m2nt]
n.������������ȷ��
1318. estimate['estimit. 'estimeit]
vt.���ƣ����� n.����
1319. Europe['ju2r2p]
n.ŷ��
1320. European[ju2r2'pi:2n]
a.ŷ�޵� n.ŷ����
1321. evaluate[i'v9ljueit]
vt.���ۣ������ļ�
1322. evaporate[i'v9p2reit]
vt.ʹ���� vi.����
1323. eve[i:v]
n.ǰҹ��ǰϦ��ǰһ��
1324. even['i:v2n]
ad.����������������
1325. even['i:v2n]
a.���ȵģ�ƽ��
1326. evening['i:vni8]
n.�����ƻ裬����
1327. event[i'vent]
n.�¼������£��±�
1328. eventually[i'ventju2li]
ad.���ڣ����
1329. ever['ev2]
ad.���κ�ʱ������
1330. every['evri]
a.ÿһ�ģ�ÿ������
1331. everybody['evrib0di]
pron.ÿ�ˣ�����
1332. everyday['evridei]
a.ÿ��ģ��ճ���
1333. everyone['evriw3n]
pron.ÿ�ˣ�����
1334. everything['evri4i8]
pron.ÿ���£�����
1335. everywhere['evriw/2]
ad.����������
1336. evidence['evid2ns]
n.���ݣ�֤�ݣ�֤��
1337. evident['evid2nt]
a.���Եģ����׵�
1338. evil['i:vl]
n.а�񣻻��� a.����
1339. evolution[i:v2'lju:62n]
n.�������ݻ�����չ
1340. evolve[i'v0lv]
vt.ʹ������ʹ��չ
1341. exact[ig'z9kt]
a.ȷ�еģ���ȷ��
1342. exactly[ig'z9ktli]
ad.ȷ�еأ�ǡǡ����
1343. exaggerate[ig'z9d72reit]
vt.&vi.��󣬿���
1344. exam[ig'z9m]
n.���ԣ���飬ϸ��
1345. examination[igz9mi'nei62n]
n.���ԣ���飬ϸ��
1346. examine[ig'z9min]
vt.��飬��ϸ�۲�
1347. example[ig'za:mpl]
n.���ӣ�ʵ����ģ��
1348. exceed[ik'si:d]
vt.������ʤ��������
1349. exceedingly[ik'si:di8li]
ad.���˵أ��ǳ�
1350. excellent['eks2l2nt]
a.����ģ��ܳ���
1351. except[ik'sept]
prep.����֮��
1352. exception[ik'sep62n]
n.���⣬����
1353. excess[ik'ses. 'ekses]
n.��Խ������������
1354. excessive[ik'sesiv]
a.����ģ����ȵ�
1355. exchange[iks't6eind7]
vt.���������� n.����
1356. excite[ik'sait]
vt.ʹ����������
1357. exciting[ik'saiti8]
a.�����˷ܵ�
1358. exclaim[iks'kleim]
vi.����������
1359. exclude[iks'klu:d]
vt.�ѡ��ų�����
1360. exclusively[iks'klu:sivli]
ad.ר�ŵ�
1361. excursion[iks'k2:62n]
n.Զ�㣻��;����
1362. excuse[iks'kju:z. iks'kju:s]
vt.ԭ�£���� n.���
1363. execute['eksikju:t]
vt.����������ʵʩ
1364. executive[ig'zekjutiv]
a.ִ�е� n.ִ����
1365. exercise['eks2saiz]
n.������ѵ�� vi.��ϰ
1366. exert[ig'z2:t]
vt.��(��)������
1367. exhaust[ig'z0:st]
vt.ʹ��ƣ�������þ�
1368. exhibit[ig'zibit]
vt.��ʾ�����У�չ��
1369. exhibition[eksi'bi62n]
n.չ�������У�չ����
1370. exist[ig'zist]
vi.���ڣ����棬����
1371. existence[ig'zist2ns]
n.���ڣ�ʵ�ڣ�����
1372. exit['eksit]
n.���ڣ��˳� vi.�˳�
1373. expand[iks'p9nd]
vt.����ʹ����
1374. expansion[iks'p9n62n]
n.�������䣻����
1375. expect[iks'pekt]
vt.Ԥ�ϣ�Ԥ�ڣ��ȴ�
1376. expectation[ekspek'tei62n]
n.�ڴ���������Ԥ��
1377. expense[iks'pens]
n.���ѣ����ѣ�����
1378. expensive[iks'pensiv]
a.����ģ���Ǯ���
1379. experience[iks'pi2ri2ns]
n.���飬���ܣ�����
1380. experiment[iks'perim2nt]
n.ʵ�飻����
1381. experimental[iksperi'mentl]
a.ʵ��ģ������
1382. expert['eksp2:t]
n.ר�� a.������
1383. explain[iks'plein]
vt.���ͣ�Ϊ�����
1384. explanation[ekspl2'nei62n]
n.���ͣ�˵�������
1385. explode[iks'pl2ud]
vt.ʹ��ը vi.��ը
1386. exploit['ekspl0it. iks'pl0it]
vt.���������ã�����
1387. explore[iks'pl0:]
vt.&vi.̽�գ�̽��
1388. explosion[iks'pl2u72n]
n.��ը��������ը��
1389. explosive[iks'pl2usiv]
n.ըҩ a.��ը��
1390. export[eks'p0:t. 'eksp0:t]
vt.��������ڣ�����
1391. expose[iks'p2uz]
vt.ʹ��¶����¶
1392. exposure[iks'p2u72]
n.��¶����¶���ع�
1393. express[iks'pres]
vt.��ʾ n.�쳵�����
1394. expression[iks'pre62n]
n.�ʾ䣻������
1395. extend[iks'tend]
vt.�ӳ���������
1396. extension[iks'ten62n]
n.�ӳ����֣���չ
1397. extensive[iks'tensiv]
a.�����ģ��㷺��
1398. extent[iks'tent]
n.��ȣ���Χ���̶�
1399. exterior[eks'ti2ri2]
a.�ⲿ�ģ������
1400. external[eks't2:nl]
a.�ⲿ�ģ������
1401. extra['ekstr2]
a.����� ad.�ر��
1402. extraordinary[iks'tr0:din2ri]
a.��ͬѰ���ģ��ر��
1403. extreme[iks'tri:m]
a.���ȵģ���ͷ��
1404. extremely[iks'tri:mli]
ad.���ˣ����䣬�ǳ�
1405. eye[ai]
n.�۾���������������
1406. eyesight['aisait]
n.������Ŀ��
1407. fable['feibl]
n.Ԣ�ԣ��鹹�Ĺ���
1408. fabric['f9brik]
n.֯���֯Ʒ���ṹ
1409. face[feis]
n.�������棻���
1410. facility[f2'siliti]
n.�豸�����ף�����
1411. fact[f9kt]
n.��ʵ��ʵ�ʣ�ʵ��
1412. factor['f9kt2]
n.���أ����ӣ�ϵ��
1413. factory['f9kt2ri]
n.���������쳧
1414. faculty['f9k2lti]
n.���ܣ�������ϵ����
1415. fade[feid]
vi.��ɫ������ʧ
1416. Fahrenheit['f9r2nhait]
n.�����¶ȼ�
1417. fail[feil]
vi.ʧ�ܣ�ʧ�飻����
1418. failure['feilj2]
n.ʧ�ܣ�ʧ�ܵ���
1419. faint[feint]
a.΢���ģ�������
1420. fair[f/2]
a.��ƽ�ģ��൱��
1421. fair[f/2]
n.���ڼ��У�������
1422. fairly['f/2li]
ad.�൱����ƽ��
1423. faith[fei4]
n.���Σ����ģ�����
1424. faithful['fei4ful]
a.�ҳϵģ���ʵ��
1425. fall[f0:l]
vi.���£�����������
1426. false[f0:ls]
a.����ʵ�ģ�α���
1427. fame[feim]
n.����������
1428. familiar[f2'milj2]
a.��Ϥ�ģ�ð����
1429. family['f9mili]
n.�ң���ͥ������
1430. famine['f9min]
n.���ģ����ص�ȱ��
1431. famous['feim2s]
a.�����ģ�������
1432. fan[f9n]
n.(�˶���)���Ȱ�����
1433. fan[f9n]
n.���ӣ����� vt.��
1434. fancy['f9nsi]
n.�����������룻����
1435. far[fa:]
a.Զ�� ad.Զ��ңԶ
1436. fare[f/2]
n.���ѣ����ѣ�Ʊ��
1437. farewell['f/2'wel]
int.�ٻ� n.���
1438. farm[fa:m]
n.ũ����ũׯ��������
1439. farmer['fa:m2]
n.ũ��ũ��ũ����
1440. farther['fa:52]
ad.��Զ�� a.��Զ��
1441. fashion['f962n]
n.���ӣ���ʽ������
1442. fashionable['f962n2bl]
a.���еģ�ʱ�ֵ�
1443. fast[fa:st]
a.��ģ�ƫ��� ad.��
1444. fasten['fa:sn]
vt.���Σ���ס
1445. fatal['feitl]
a.�����ģ����˵�
1446. fate[feit]
n.���ˣ�����
1447. father['fa:52]
n.���ף��񸸣���ʼ��
1448. father-in-law['fa:52inl0:]
n.����������
1449. fatigue[f2'ti:g]
n.ƣ�ͣ�����
1450. fault[f0:lt]
n.ȱ�㣻��ʧ������
1451. faulty['f0:lti]
a.�д���ģ���ȱ���
1452. favour['feiv2]
n.�øУ���ͬ������
1453. favourable['feiv2r2bl]
a.�����ģ��޳ɵ�
1454. favourite['feiv2rit]
a.�ر���ϲ����
1455. fear[fi2]
n.���£����� vt.����
1456. fearful['fi2ful]
a.���µģ����µ�
1457. feasible['fi:z2bl]
a.���еģ����ܵ�
1458. feast[fi:st]
n.ʢ�磬��ϯ������
1459. feather['fe52]
n.��ë����ë����״��
1460. feature['fi:t62]
n.��������ɫ����ò
1461. February['febru2ri]
n.����
1462. federal['fed2r2l]
a.����ģ����˵�
1463. fee[fi:]
n.�ѣ�����ͽ�
1464. feeble['fi:bl]
a.�����ģ�΢����
1465. feed[fi:d]
vt.ι(��) vi.������
1466. feedback['fi:db9k]
n.���ڣ���������Ӧ
1467. feel[fi:l]
vi.��֪�� vt.������
1468. feeling['fi:li8]
n.���飻�о���֪��
1469. fellow['fel2u]
n.�ˣ��һ���
1470. female['fi:meil]
n.���ԵĶ��Ů��
1471. fence[fens]
n.դ��
1472. fertile['f2:tail]
a.���ֵģ������
1473. fertilizer['f2:tilaiz2]
n.����
1474. festival['fest2v2l]
n.���գ����ֽ�
1475. fetch[fet6]
vt.��������������ȥ
1476. fever['fi:v2]
n.���ȣ����գ�����
1477. few[fju:]
a.���ٵģ�������
1478. fibre['faib2]
n.��ά����ά��
1479. fiction['fik62n]
n.С˵���鹹����׫
1480. field[fi:ld]
n.��Ұ����˶���
1481. fierce[fi2s]
a.���͵ģ����ȵ�
1482. fifteen['fif'ti:n]
num.ʮ�壻ʮ���
1483. fifth[fif4]
num.���� n.���֮һ
1484. fifty['fifti]
num.��ʮ����ʮ��
1485. fight[fait]
vi.��(��)������
1486. figure['fig2]
n.���֣����Σ�����
1487. file[fail]
n.���� vt.�ѡ��鵵
1488. fill[fil]
vt.װ����ʢ����ռ��
1489. film[film]
n.ӰƬ����������
1490. filter['filt2]
vt.���� n.��ֽ
1491. final['fainl]
a.���ģ������Ե�
1492. finally['fain2li]
ad.��󣻲��ɸ��ĵ�
1493. finance[fai'n9ns. fi-]
n.���������ڣ���Դ
1494. financial[fai'n9n62l. fi-]
a.�����ģ����ڵ�
1495. find[faind]
vt.�ҵ����������ҳ�
1496. finding[faindi8]
n.���֣�����Ľ��
1497. fine[fain]
a.���õģ���ϸ��
1498. fine[fain]
n.���𣬷���
1499. finger['fi8g2]
n.��ָ��ָ״��
1500. finish['fini6]
vt.��ɣ����� n.����
1501. fire['fai2]
n.�𣻻��� vi.����
1502. fireman['fai2m2n]
n.������Ա��˾¯��
1503. firm[f2:m]
n.���У��̺ţ���˾
1504. first[f2:st]
num.��һ ad.���
1505. fish[fi6]
n.�㣬���� vi.����
1506. fisherman['fi62m2n]
n.������򣬴�����
1507. fist[fist]
n.ȭ(ͷ)
1508. fit[fit]
vt.�ʺϣ���װvi.�ʺ�
1509. five[faiv]
num.�壬���������
1510. fix[fiks]
vt.ʹ�̶�������
1511. flag[fl9g]
n.�죬���ģ��콢��
1512. flame[fleim]
n.���棻��ԣ�����
1513. flare[fl/2]
vi.��ҫ vt.ʹ����
1514. flash[fl96]
n.���� vi.������˸
1515. flat[fl9t]
a.ƽ�ģ���ƽ��
1516. flat[fl9t]
n.һ�׷��䣻��Ԫסլ
1517. flavour['fleiv2]
n.ζ��ζ������ζ
1518. fleet[fli:t]
n.���ӣ����ӣ���Ⱥ
1519. flesh[fle6]
n.�⣬���⣻����
1520. flexible['fleks2bl]
a.�������ģ�����
1521. flight[flait]
n.���ࣻ���У�����
1522. float[fl2ut]
vi.Ư�� vt.ʹƯ��
1523. flock[fl0k]
n.��Ⱥ��Ⱥ������
1524. flood[fl3d]
n.��ˮ vt.��û
1525. floor[fl0:]
n.�ذ壻¥��
1526. flour['flau2]
n.��ۣ��ۣ���״����
1527. flourish['fl3ri6]
vi.���٣�ïʢ������
1528. flow[fl2u]
vi.������Ʈ�����ǳ�
1529. flower['flau2]
n.�������ܣ�����
1530. flu[flu:]
n.�����Ը�ð
1531. fluent['flu(:)2nt]
a.�����ģ�������
1532. fluid['flu(:)id]
n.���壬Һ��
1533. flush[fl36]
vi.������(��)����
1534. fly[flai]
n.Ӭ����Ӭ vi.����
1535. focus['f2uk2s]
vi.�۽���ע�� n.����
1536. fog[f0g]
n.����������
1537. fold[f2uld]
vt.�۵�����£ n.��
1538. folk[f2ulk]
n.���ǣ�����������
1539. follow['f0l2u]
vt.���棻�����
1540. following['f0l2ui8]
a.���ŵģ����е�
1541. fond[f0nd]
a.ϲ���ģ��簮��
1542. food[fu:d]
n.ʳ�ʳƷ������
1543. fool[fu:l]
n.���ˣ�ɵ�� vt.��ƭ
1544. foolish['fu:li6]
a.�޴��ģ�³ç��
1545. foot[fut]
n.�ţ����²���Ӣ��
1546. football['futb0:l]
n.�������������
1547. footstep['futstep]
n.�Ų����Ų������㼣
1548. for[f0:. f2]
prep.Ϊ��������Ϊ
1549. forbid[f2'bid]
vt.��ֹ��������ֹ
1550. force[f0:s]
vt.ǿ�� n.��������
1551. forecast['f0:ka:st]
n.Ԥ�⣬Ԥ�� vt.Ԥʾ
1552. forehead['f0rid. 'f0:hed]
n.��ͷ��ǰ��
1553. foreign['f0rin]
a.����ģ�������
1554. foreigner['f0rin2]
n.�����
1555. foremost['f0:m2ust]
a.����ģ���һ����
1556. forest['f0rist]
n.ɭ�֣�ɭ�ֵش�
1557. forever[f2'rev2]
ad.��Զ�����ǣ�����
1558. forget[f2'get]
vt.���ǣ�����
1559. forgive[f2'giv]
vt.ԭ�£���ˡ����ˡ
1560. fork[f0:k]
n.�Ͳ棻�棻�ֲ�
1561. form[f0:m]
n.��ʽ����״ vt.�γ�
1562. formal['f0:m2l]
a.��ʽ�ģ������ϵ�
1563. formation[f0:'mei62n]
n.�γɣ����ɣ��γ���
1564. former['f0:m2]
a.��ǰ�� n.ǰ��
1565. formula['f0:mjul2]
n.��ʽ��ʽ
1566. forth[f0:4]
ad.��ǰ�����⣬����
1567. fortnight['f0:tnait]
n.�����ڣ�ʮ����
1568. fortunate['f0:t62nit]
a.���˵ģ����ҵ�
1569. fortunately['f0:t62nitli]
ad.���˵أ��ҿ�
1570. fortune['f0:t62n]
n.���ˣ��������Ʋ�
1571. forty['f0:ti]
num.��ʮ������ʮ
1572. forward['f0:w2d]
ad.��ǰ���������
1573. found[faund]
vt.���������죻����
1574. foundation[faun'dei62n]
n.�������ػ�������
1575. fountain['fauntin]
n.Ȫˮ����Ȫ��ԴȪ
1576. four[f0:]
num.�ģ��ĸ�������
1577. fourteen['f0:'ti:n]
num.ʮ�ģ���ʮ��
1578. fourth[f0:4]
num.���ģ��ķ�֮һ
1579. fox[f0ks]
n.���ꣻ�ƻ�����
1580. fraction['fr9k62n]
n.С���֣�Ƭ�ϣ�����
1581. fragment['fr9gm2nt]
n.��Ƭ����Ƭ�����
1582. frame[freim]
n.��ܣ����ӣ�����
1583. framework['freimw2:k]
n.��ܣ����ܣ��ṹ
1584. France['fra:ns]
n.������������
1585. frank[fr98k]
a.̹�׵ģ�ֱ�ʵ�
1586. free[fri:]
a.���ɵģ����е�
1587. freedom['fri:d2m]
n.���ɣ�����
1588. freely['fri:li]
ad.���ɵأ�ֱ�ʵ�
1589. freeze[fri:z]
vi.�����ᶳvt.ʹ���
1590. freight[freit]
n.���ˣ�����˷�
1591. French[frent6]
a.������ n.������
1592. frequency['fri:kw2nsi]
n.�ŴΣ�������Ƶ��
1593. frequent['fri:kw2nt]
a.ʱ�������ģ�������
1594. frequently['fri:kw2ntli]
ad.ʱ��������
1595. fresh[fre6]
a.�µģ����ʵ�
1596. friction['frik62n]
n.Ħ����Ħ����
1597. Friday['fraidi]
n.������
1598. fridge[frid7]
n.�����
1599. friend[frend]
n.���ѣ�����
1600. friendly['frendli]
a.�Ѻõģ������
1601. friendship['frend6ip]
n.���꣬�Ѻ�
1602. frighten['fraitn]
vt.ʹ���֣��Ż�
1603. frog[fr0g]
n.��
1604. from[fr0m. fr2m. frm]
prep.�ӡ������뿪
1605. front[fr3nt]
a.ǰ��� n.ǰ��
1606. frontier['fr3ntj2]
n.�߾����߽���������
1607. frost[fr0st]
n.�������Ϻ���˪
1608. frown[fraun]
vi.��ü������
1609. fruit[fru:t]
n.ˮ������ʵ���ɹ�
1610. fruitful['fru:tful]
a.����ģ����ֵ�
1611. fry[frai]
vt.�ͼ壬��ը���ͳ�
1612. fuel[fju2l]
n.ȼ�� vt.������ȼ��
1613. fulfil[ful'fil]
vt.���У����㣻���
1614. full[ful]
a.���ģ���ȫ��
1615. fun[f3n]
n.��Ȥ�����֣���Ц
1616. function['f38k62n]
n.���ܣ�ְ�񣻺���
1617. fund[f3nd]
n.�ʽ𣻻��𣻴��
1618. fundamental[f3nd2'mentl]
a.�����ģ�������
1619. funeral['fju:n2r2l]
n.����ɥ��ɥ��
1620. funny['f3ni]
a.�Źֵģ�������
1621. fur[f2:]
n.��ë��ëƤ����Ƥ
1622. furious['fju2ri2s]
a.��ŭ�ģ��񱩵�
1623. furnace['f2:nis]
n.¯�ӣ���¯���ķ�¯
1624. furnish['f2:ni6]
vt.��Ӧ���ṩ��װ��
1625. furniture['f2:nit62]
n.�Ҿߣ�װ�ã��豸
1626. further['f2:52]
ad.��Զ�� a.��Զ��
1627. furthermore['f2:52'm0:]
ad.���ң�����
1628. future['fju:t62]
n.������δ����ǰ;
1629. gain[gein]
vt.��ã����� n.����
1630. gallery['g9l2ri]
n.���ȣ����ȣ�����
1631. gallon['g9l2n]
n.����
1632. game[geim]
n.��Ϸ������������
1633. gang[g98]
n.һ�һ��
1634. gap[g9p]
n.ȱ�ڣ���������
1635. garage['g9ra:7]
n.���⣻����վ
1636. garbage['ga:bid7]
n.�������������
1637. garden['ga:dn]
n.��԰����԰����԰
1638. gardener['ga:dn2]
n.԰��������
1639. gas[g9s]
n.ú�������壻����
1640. gaseous['geizj2s]
a.����ģ���̬��
1641. gasoline['g9s2li:n]
n.(��)����
1642. gasp[ga:sp]
vi.��������Ϣ
1643. gate[geit]
n.���ţ������
1644. gather['g952]
vi.�ۼ�������vt.�ռ�
1645. gauge[geid7]
vt.�������� n.����
1646. gay[gei]
a.���ֵģ�������
1647. gaze[geiz]
vi.���ӣ�����ע��
1648. general['d7en2r2l]
a.�ܵģ�һ���n.����
1649. generally['d7en2r2li]
ad.һ��أ�ͨ����
1650. generate['d7en2reit]
vt.������������ֳ
1651. generation[d7en2'rei62n]
n.һ����һ���ˣ�����
1652. generator['d7en2reit2]
n.�������������
1653. generous['d7en2r2s]
a.�����ģ�����
1654. genius['d7i:nj2s]
n.��ţ��츳������
1655. gentle['d7entl]
a.�Ͱ��ģ������
1656. gentleman['d7entlm2n]
n.��ʿ���н�������
1657. gently['d7entli]
ad.����ò�أ���͵�
1658. genuine['d7enjuin]
a.��ģ�������
1659. geography[d7i'0gr2fi]
n.��������ѧ
1660. geometry[d7i'0mitri]
n.���Σ�����ѧ
1661. germ[d72:m]
n.΢���ϸ������ѿ
1662. German['d72:m2n]
a.�¹��� n.�¹���
1663. Germany['d72:m2ni]
n.����־���¹�
1664. gesture['d7est62]
n.���ƣ����ƣ���̬
1665. get[get]
vi.��ã���Ϊ������
1666. ghost[g2ust]
n.����ꣻ���
1667. giant['d7ai2nt]
n.���ˣ�����
1668. gift[gift]
n.�����Ʒ���츳
1669. girl[g2:l]
n.Ů���ӣ����Ů��
1670. give[giv]
vt.���������͸�
1671. glad[gl9d]
a.���˵ģ������
1672. glance[gla:ns]
vi.��һ�� n.һƳ
1673. glare[gl/2]
vi.���� n.����
1674. glass[gla:s]
n.������������
1675. glide[glaid]
vi.���������� n.����
1676. glimpse[glimps]
vt.Ƴ�� n.һƳ��һ��
1677. glitter['glit2]
vi.�������� n.����
1678. globe[gl2ub]
n.�������磻�ؽ���
1679. gloomy['glu:mi]
a.�ڰ��ģ����˾�ɥ��
1680. glorious['gl0:ri2s]
a.���ٵģ�׳����
1681. glory['gl0:ri]
n.���٣���������
1682. glove[gl3v]
n.����
1683. glow[gl2u]
n.���ȹ� vi.�����ȹ�
1684. glue[glu:]
n.������ˮ vt.����
1685. go[g2u]
vi.ȥ���ߣ���Ϊ
1686. goal[g2ul]
n.���ţ��÷֣�Ŀ��
1687. goat[g2ut]
n.ɽ��
1688. God[g0d]
n.�������ϵ�
1689. gold[g2uld]
n.��Ǯ�� a.���Ƶ�
1690. golden['g2uld2n]
a.��ɫ�ģ����õ�
1691. golf[g0lf]
n.�߶�����
1692. good[gud]
a.�õģ��б��µ�
1693. goodbye[]
int.�ټ����ٻ�
1694. goodness['gudnis]
n.���������ԣ��ʴ�
1695. goods[gudz]
n.�����Ʒ
1696. goose[gu:s]
n.�죬�ƶ�
1697. govern['g3v2n]
vt.ͳ�Σ�����֧��
1698. government['g3v2nm2nt]
n.��������������
1699. governor['g3v2n2]
n.�ݳ���������Ա
1700. gown['gaun]
n.���ۣ�������
1701. grace[greis]
n.���������ţ�����
1702. graceful['greisful]
a.�����ģ����ŵ�
1703. gracious['grei62s]
a.����ò�ģ��ʴȵ�
1704. grade[greid]
vt.�����ֵȼ� n.�ȼ�
1705. gradual['gr9dju2l]
a.�𽥵ģ�������
1706. gradually['gr9dju2li]
ad.�𽥵أ��𲽵�
1707. graduate['gr9djueit]
n.��ҵ�� vi.��ѧ��ҵ
1708. grain['grein]
n.�������������
1709. gramme[gr9m]
n.��(������λ)
1710. grammar['gr9m2]
n.�﷨���﷨��
1711. grammatical[gr2'm9tik2l]
a.�﷨�ϵ�
1712. grand[gr9nd]
a.��ΰ�ģ��ش��
1713. granddaughter['gr9ndd0:t2]
n.��Ů������Ů
1714. grandfather['gr9ndfa:52]
n.�游�����游
1715. grandmother['gr9ndm352]
n.��ĸ������ĸ
1716. grandson['gr9nds3n]
n.���ӣ�������
1717. grant[gra:nt]
n.�ڸ��� vt.����
1718. grape[greip]
n.���ѣ�������
1719. graph[gr9f]
n.(����)ͼ��ͼ��
1720. grasp[gra:sp]
vt.ץ�������� n.ץ
1721. grass[gra:s]
n.�ݣ����ݣ��ݵ�
1722. grateful['greitful]
a.�м��ģ���������
1723. gratitude['gr9titju:d]
a.�м�����л���ж�
1724. grave[greiv]
n.��Ĺ a.���ص�
1725. gravity['gr9viti]
n.������������������
1726. gray[grei]
a.��ɫ�� n.��ɫ
1727. great[greit]
a.��ģ�ΰ���
1728. greatly['greitli]
ad.���أ��ǳ�
1729. greedy['gri:di]
a.̰�Եģ�̰����
1730. Greek[gri:k]
a.ϣ���� n.ϣ����
1731. green[gri:n]
a.��ɫ�� n.��ɫ
1732. greenhouse['gri:nhaus]
n.���ң�����ů��
1733. greet[gri:t]
vt.�ʺ��к�����Ӧ
1734. greeting['gri:ti8]
n.�ʺ��к����¾�
1735. grey[grei]
a.��ɫ�� n.��ɫ
1736. grieve[gri:v]
vt.ʹ��ʹ vi.��ʹ
1737. grind[graind]
vt.ĥ(��)��ĥ��
1738. grip[grip]
vt.�ս���ץ�� n.����
1739. groan[gr2un]
vi.�ߣ����� n.����
1740. grocer['gr2us2]
n.ʳƷ�̣��ӻ���
1741. grocery['gr2us2ri]
n.ʳƷ�ӻ���
1742. gross[gr2us]
a.�ܵģ����ص�
1743. ground[graund]
n.�أ����أ�����
1744. group[gru:p]
n.С�飬Ⱥ vi.�ۼ�
1745. grow[gr2u]
vi.��������ã�����
1746. growth[gr2u4]
n.������������������
1747. guarantee[g9r2n'ti:]
n.��֤��������
1748. guard[ga:d]
vt.���������� n.����
1749. guess[ges]
vt.&vi.&n.�²⣬�Ʋ�
1750. guest[gest]
n.���ˣ����ͣ��ÿ�
1751. guidance['gaid2ns]
n.������ָ�����쵼
1752. guide[gaid]
n.������ vt.��������
1753. guilty['gilti]
a.�ھεģ������
1754. gulf[g3lf]
n.����
1755. gum[g3m]
n.�����ǣ�����
1756. gun[g3n]
n.ǹ���ڣ���ǹ
1757. gunpowder['g3npaud2]
n.��ɫ��ҩ�����̻�ҩ
1758. gymnasium[d7im'neizj2m]
n.�����ݣ�����
1759. habit['h9bit]
n.ϰ�ߣ�ϰ��
1760. habitual[h2'bit6u2l]
a.ϰ���Եģ��߳���
1761. hair[h/2]
n.ͷ����ë����ë
1762. haircut['h/2k3t]
n.��
1763. half[ha:f]
n.�룬һ�� a.һ���
1764. hall[h0:l]
n.����������������
1765. halt[h0:lt]
vi.ֹͣ������ n.ͣס
1766. hamburger['h9mb2:g2]
n.��������ţ���
1767. hammer['h9m2]
n.������ͷ vt.����
1768. hand[h9nd]
n.�֣����֣�ָ��
1769. handful[h9ndful]
n.һ�ѣ�������һС��
1770. handkerchief['h98k2t6if]
n.����
1771. handle['h9ndl]
n.�������� vt.�ã���
1772. handsome['h9nds2m]
a.Ӣ���ģ��൱���
1773. handwriting['h9ndraiti8]
n.�ʼ����ּ����鷨
1774. handy['h9ndi]
a.�ֱߵģ�����ʹ�õ�
1775. hang[h98]
vt.�ң���������
1776. happen['h9p2n]
vi.���������ɣ�ǡ��
1777. happiness['h9pinis]
n.�Ҹ������ˣ�����
1778. happy['h9pi]
a.���ֵģ��Ҹ���
1779. harbour['ha:b2]
n.���ۣ��ۿ� vt.�ӻ�
1780. hard['ha:d]
a.Ӳ�ģ����ѵ�
1781. harden['ha:dn]
vt.ʹ��Ӳ vi.��Ӳ
1782. hardly['ha:dli]
ad.����������ֱ��
1783. hardship['ha:d6ip]
n.���ѣ�����
1784. hardware['ha:dw/2]
n.������ߣ�Ӳ��
1785. hare[h/2]
n.Ұ��
1786. harm[ha:m]
n.�˺����� vt.��
1787. harmful['ha:mful]
a.�к���
1788. harmony['ha:m2ni]
n.���ϣ�Э������г
1789. harness['ha:nis]
vt.���� n.��ߣ����
1790. harsh[ha:6]
a.�����ģ��̶���
1791. harvest['ha:vist]
n.�ջ��ճ� vt.�ո�
1792. haste[heist]
n.���٣���æ������
1793. hasten['heisn]
vt.�ߴ� vi.�Ͻ�
1794. hasty['heisti]
a.���ٵģ��ִٵ�
1795. hat[h9t]
n.ñ��(һ��ָ�бߵ�)
1796. hatch[h9t6]
vt.���� vi.(��)����
1797. hate[heit]
vt.�ޣ����ޣ���ϲ��
1798. hateful['heitful]
a.�ɺ޵ģ��ɶ��
1799. hatred['heitrid]
n.�������ޣ����
1800. have[h9v. h2v]
v.aux.�Ѿ� vt.�У���
1801. hawk[h0:k]
n.ӥ����
1802. hay[hei]
n.�ɲ�
1803. hazard['h9z2d]
n.Σ�գ�����
1804. he[hi:]
pron.(����)��
1805. head[hed]
n.ͷ���϶� vt.����
1806. headache['hedeik]
n.ͷʹ��ͷʹ����
1807. heading['hedi8]
n.���⣬��ʣ�����
1808. headline['hedlain]
n.���ֱ��⣻������Ҫ
1809. headmaster['hed'ma:st2]
n.У��
1810. headquarters['hed'kw0:t2z]
n.˾����ܲ�
1811. heal[hi:l]
vt.������ʹ�ͽ�
1812. health[hel4]
n.����������״��
1813. healthy['hel4i]
a.�����ģ����潡����
1814. heap[hi:p]
n.(һ)�ѣ�����
1815. hear[hi2]
vt.��������Ѷ����˵
1816. heart[ha:t]
n.�ģ����ģ�����
1817. heat[hi:t]
n.�ȣ����� vi.����
1818. heating['hi:ti8]
n.���ȣ���ů
1819. heaven['hevn]
n.���ã��죬���
1820. heavily['hevili]
ad.���صأ�������
1821. heavy['hevi]
a.�صģ���ģ�������
1822. hedge[hed7]
n.��ʣ����飻�ϰ���
1823. heel[hi:l]
n.�ź�����࣬���
1824. height[hait]
n.�ߣ��߶ȣ��ߴ�
1825. heir[/2]
n.���ã��̳���
1826. helicopter['helik0pt2]
n.ֱ����
1827. hell[hel]
n.�����������ʹ��
1828. hello['h2'l2u]
int.ι
1829. helmet['helmit]
n.ͷ�����ֿ�
1830. help[help]
vt.������Ԯ�� n.����
1831. helpful['helpful]
a.��������ģ����õ�
1832. helpless['helplis]
a.�����ģ����ܵ�
1833. hen[hen]
n.ĸ��������
1834. hence[hens]
ad.��ˣ����ԣ����
1835. her[h2:. h2]
pron.(����)��������
1836. herd[h2:d]
n.��Ⱥ����Ⱥ vt.����
1837. here[hi2]
ad.���������
1838. hero['hi2r2u]
n.�����ǣ�Ӣ�ۣ���ʿ
1839. heroic[hi'r2uik]
a.Ӣ�۵ģ�Ӣ�µ�
1840. heroine['her2uin]
n.Ů���ǣ�ŮӢ��
1841. hers[h2:z]
pron.����(������)
1842. herself[h2:'self]
pron.���Լ���������
1843. hesitate['heziteit]
vi.��ԥ�����������
1844. hi[hai]
ini.��(��ʾ�ʺ��)
1845. hide[haid]
vt.�ѡ�������������
1846. high[hai]
a.�ߵģ��߼��� ad.��
1847. highly['haili]
ad.�߶ȵأ��ܣ��ǳ�
1848. highway['haiwei]
n.��·����·
1849. hill[hil]
n.Сɽ��ɽ�ڣ�����
1850. hillside['hil'said]
n.(Сɽ)ɽ����ɽ��
1851. him[him]
pron.(����)��
1852. himself[him'self]
pron.���Լ���������
1853. hint[hint]
n.��ʾ��ʾ�⣻����
1854. hire['hai2]
vt.��� n.���ã�����
1855. his[his]
pron.���ģ����Ķ���
1856. historical[his't0rik2l]
a.��ʷ�ģ��й���ʷ��
1857. history['hist2ri]
n.��ʷ�����˾���
1858. hit[hit]
vt.����ײ n.��
1859. hobby['h0bi]
n.ҵ�మ�ã���
1860. hold[h2uld]
vt.��ס�����գ�ӵ��
1861. hole[h2ul]
n.�������ۣ��ѿ���
1862. holiday['h0l2di]
n.���գ����գ�����
1863. hollow['h0l2u]
a.�յģ��ն���
1864. holy['h2uli]
a.��ʥ�ģ�ʥ���
1865. home[h2um]
n.�ң����� a.��ͥ��
1866. honest['0nist]
a.��ʵ�ģ��ɾ���
1867. honesty['0nisti]
n.��ʵ����ֱ
1868. honey['h3ni]
n.�ۣ����ۣ�������
1869. honeymoon['h3nimu:n]
n.����
1870. honour['0n2]
n.���٣��𾴣�����
1871. honourable['0n2r2bl]
a.��ʵ�ģ����ٵ�
1872. hook[huk]
n.�����ҹ� vt.��ס
1873. hope[h2up]
n.&vt.&vi.ϣ��
1874. hopeful['h2upful]
a.��ϣ����
1875. hopeless['h2uplis]
a.û��ϣ���ģ�������
1876. horizon[h2'raizn]
n.��ƽ�ߣ��۽磬��ʶ
1877. horizontal[h0ri'z0ntl]
a.��ƽ�ģ�ˮƽ��
1878. horn[h0:n]
n.�Žǣ�����������
1879. horror['h0r2]
n.�ֲ���ս��������
1880. horse[h0:s]
n.����ƶ���
1881. horsepower['h0:spau2]
n.����
1882. hospital['h0spitl]
n.ҽԺ
1883. host[h2ust]
n.���ˣ�������
1884. hostess['h2ustis]
n.Ů���ˣ��ս�
1885. hostile['h0stail]
a.�з��ģ������Ƶ�
1886. hot[h0t]
a.�ȵģ��̼��ģ�����
1887. hotel[h2u'tel]
n.�ù�
1888. hour['au2]
n.Сʱ��ʱ�䣬ʱ��
1889. house[haus]
n.���ݣ�סլ���̺�
1890. household['haush2uld]
n.��ͥ����������
1891. housewife['hauswaif]
n.��ͥ����
1892. how[hau]
ad.��ô������������
1893. however[hau'ev2]
ad.Ȼ������������
1894. huge[hju:d7]
a.�޴�ģ��Ӵ��
1895. human['hju:m2n]
a.�˵ģ������ n.��
1896. humble['h3mbl]
a.ǫѷ�ģ���λ���µ�
1897. humid['hju:mid]
a.ʪ�ģ�ʪ���ص�
1898. humorous['hju:m2r2s]
a.������Ĭ�ģ�ڶг��
1899. humour['hju:m2]
n.��Ĭ��ڶг����Ĭ��
1900. hundred['h3ndrid]
num.�٣��ٸ� n.���
1901. hunger['h38g2]
n.��������������
1902. hungry['h38gri]
a.�����ģ�������
1903. hunt[h3nt]
n.���ԣ���Ѱ vt.׷��
1904. hurry['h3ri]
vi.�Ͻ� vt.�ߴ�
1905. hurt[h2:t]
vt.ʹ���ˣ�ʹʹ��
1906. husband['h3zb2nd]
n.�ɷ�
1907. hut[h3t]
n.С�ݣ�����
1908. hydrogen['haidrid72n]
n.��
1909. I[ai]
pron.(����)��
1910. ice[ais]
n.�������� vt.����
1911. ice-cream['ais'kri:m]
n.�����
1912. idea[ai'di2]
n.�뷨��˼�룻���
1913. ideal[ai'di2l]
a.����ģ������
1914. identical[ai'dentik2l]
a.��ȫ��ͬ�ģ�ͬһ��
1915. identify[ai'dentifai]
vt.�ϳ���ʶ�𣬼���
1916. idiom['idi2m]
n.ϰ�����
1917. idle['aidl]
a.���еģ���ɢ��
1918. i.e.['ai'i:](=that is)
�Ǿ��ǣ���
1919. if[if]
conj.���磬���
1920. ignorant['ign2r2nt]
a.��֪���ģ���֪��
1921. ignore[ig'n0:]
vt.���ˣ���������
1922. ill[il]
a.�в��ģ����� ad.��
1923. illegal[i'li:g2l]
a.���Ϸ��ģ��Ƿ���
1924. illness['ilnis]
n.��������
1925. illustrate['il2streit]
vt.(��ͼ��)˵��
1926. illustration[il2s'trei62n]
n.˵����ͼ�⣻��֤
1927. image['imid7]
n.������ӳ��
1928. imaginary[i'm9d7in2ri]
a.�����еģ������
1929. imagination[im9d7i'nei62n]
n.����������������
1930. imagine[i'm9d7in]
vt.�������룻����
1931. imitate['imiteit]
vt.ģ�£���Ч������
1932. immediate[i'mi:dj2t]
a.�����ģ�ֱ�ӵ�
1933. immediately[i'mi:dj2tli]
ad.������ֱ�ӵ�
1934. immense[i'mens]
a.�޴�ģ����õ�
1935. immigrant['imigr2nt]
n.���� a.�����
1936. impact['imp9kt]
n.Ӱ�죬���ã����
1937. impatient[im'pei62nt]
a.���ͷ��ģ������
1938. implication[impli'kei62n]
n.���壬��ʾ����ָ
1939. imply[im'plai]
vt.��ʾ����ָ
1940. import[im'p0:t 'imp0:t]
vt.&n.���룬����
1941. importance[im'p0:t2ns]
n.��Ҫ����Ҫ��
1942. important[im'p0:t2nt]
a.��Ҫ�ģ���������
1943. impose[im'p2uz]
vt.�ѡ�ǿ�ӣ���(˰)
1944. impossible[im'p0s2bl]
a.�����ܵģ��첻����
1945. impress[im'pres. 'impres]
vt.�������ӡ��
1946. impression[im'pre62n]
n.ӡ��ӡ��ӡ��
1947. impressive[im'presiv]
a.����ӡ����̵�
1948. imprison[im'prizn]
vt.��Ѻ�����������
1949. improve[im'pru:v]
vt.ʹ���� vi.����
1950. improvement[im'pru:vm2nt]
n.�Ľ������ƣ��Ľ���
1951. in[in]
prep.�ڡ���ad.������
1952. inch[int6]
n.Ӣ��
1953. incident['insid2nt]
n.�������£��¼�
1954. incline[in'klain]
n.б�� vt.ʹ��б
1955. include[in'klu:d]
vt.����������
1956. income['ink3m]
n.���룻���棻����
1957. incorrect[ink2'rekt]
a.����ȷ�ģ������
1958. increase[in'kri:s. 'inkri:s]
vt.&vi.&n.����
1959. increasingly[in'kri:si8li]
ad.���棬Խ��Խ���
1960. indeed[in'di:d]
ad.�����أ�ȷʵ
1961. indefinite[in'definit]
a.����ȷ�ģ�������
1962. independence[indi'pend2ns]
n.����������������
1963. independent[indi'pend2nt]
a.�����ģ�������
1964. index['indeks]
n.������ָ����ָ��
1965. India['indi2]
n.ӡ��
1966. Indian['indi2n]
a.ӡ�ȵ� n.ӡ����
1967. indicate['indikeit]
vt.��ʾ����ʾ������
1968. indication[indi'kei62n]
n.ָʾ����ʾ������
1969. indifferent[in'difr2nt]
a.��Į�ģ���������
1970. indignant[in'dign2nt]
a.�߿��ģ���ߵ�
1971. indirect[indi'rekt]
a.��ӵģ���̹�ʵ�
1972. indispensable[indis'pens2bl]
a.�ز����ٵģ������
1973. individual[indi'vidju2l]
a.����ģ����ص�
1974. indoors[in'd0:z]
ad.�����ڣ�������
1975. industrial[in'd3stri2l]
a.��ҵ�ģ���ҵ��
1976. industrialize[in'd3stri2laiz]
vt.ʹ��ҵ��
1977. industry['ind2stri]
n.��ҵ����ҵ������
1978. inefficient[ini'fi62nt]
a.Ч�ʵ͵ģ����ܵ�
1979. inevitable[in'evit2bl]
a.���ɱ���ģ���Ȼ��
1980. inexpensive[iniks'pensiv]
a.���Ѳ���ģ����۵�
1981. infant['inf2nt]
n.Ӥ�� a.Ӥ����
1982. infect[in'fekt]
vt.��Ⱦ����Ⱦ
1983. infer[in'f2:]
vt.���ۣ��ƶϣ�����
1984. inferior[in'fi2ri2]
a.�µȵģ��ӵȵ�
1985. infinite['infinit]
a.���޵ģ�������
1986. influence['influ2ns]
n.Ӱ�죻���� vt.Ӱ��
1987. influential[influ'en62l]
a.��Ӱ��ģ���Ȩ�Ƶ�
1988. inform[in'f0:m]
vt.֪ͨ���򡭱���
1989. information[inf2'mei62n]
n.��Ϣ����Ϣ��֪ͨ
1990. inhabit[in'h9bit]
vt.��ס�ڣ���Ϣ��
1991. inhabitant[in'h9bit2nt]
n.����ס��
1992. inherit[in'herit]
vt.�̳�(��ͳ��)
1993. initial[i'ni62l]
a.����ģ����׵�
1994. injection[in'd7ek62n]
n.ע�䣬ע�룻����
1995. injure['ind72]
vt.�˺����𺦣�����
1996. injury['ind72ri]
n.�𺦣��˺������˴�
1997. ink[i8k]
n.īˮ����ī
1998. inn[in]
n.С�õꣻС�Ƶ�
1999. inner['in2]
a.�ڲ��ģ����ĵ�
2000. innocent['in2snt]
a.��׵ģ����ɵ�
2001. input['input]
n.���룻Ͷ����ʽ�
2002. inquire[in'kwai2]
vt.������ѯ�ʣ�����
2003. inquiry[in'kwai2ri]
n.ѯ�ʣ�����������
2004. insect['insekt]
n.���棬��
2005. insert[in's2:t. 'ins2:t]
vt.����; Ƕ��; ����
2006. inside[in'said]
prep.�ڡ����� n.�ڲ�
2007. insist[in'sist]
vi.��֣����Ҫ��
2008. inspect[in'spekt]
vt.��飬��飻����
2009. inspection[in'spek62n]
n.��飬��飻����
2010. inspire[in'spai2]
vt.���裻���������
2011. install[in'st0:l]
vt.��װ������
2012. installation[inst2'lei62n]
n.��װ��װ�ã���ʩ
2013. instance['inst2ns]
n.���ӣ�ʵ��������
2014. instant['inst2nt]
n.˲�� a.������
2015. instantly['inst2ntli]
ad.����������
2016. instead[in'sted]
ad.���棬���棻����
2017. instinct['insti8kt]
n.���ܣ�ֱ��������
2018. institute['institju:t]
n.�о�����ѧԺ
2019. institution[insti'tju:62n]
n.Э�᣻�ƶȣ�ϰ��
2020. instruct[in'str3kt]
vt.�̣�ָʾ��֪ͨ
2021. instruction[in'str3k62n]
n.�����ѧ����ѵ
2022. instrument['instrum2nt]
n.���������ߣ�����
2023. insufficient[ins2'fi62nt]
a.����ģ����ʵ���
2024. insult['ins3lt. in's3lt]
vt.&n.���裬����
2025. insurance[in'6u2r2ns]
n.���գ����շ�
2026. insure[in'6u2]
vt.�������գ�ȷ��
2027. intellectual[inti'lektju2l]
n.֪ʶ���� a.������
2028. intelligence[in'telid72ns]
n.��������������鱨
2029. intelligent[in'telid72nt]
a.�����ģ����ǵ�
2030. intend[in'tend]
vt.��Ҫ�����㣻��ָ
2031. intense[in'tens]
a.ǿ�ҵģ����ŵ�
2032. intensity[in'tensiti]
n.ǿ�ң����ң�ǿ��
2033. intensive[in'tensiv]
a.��ǿ�ģ�����ϸ����
2034. intention[in'ten62n]
n.��ͼ������Ŀ��
2035. intentional[in'ten62nl]
a.����ģ�����ʶ��
2036. interaction[int2'r9k62n]
n.�໥���ã�����
2037. interest['intrist]
n.��Ȥ�����棻��Ϣ
2038. interesting['intristi8]
a.��Ȥ�ģ�������ʤ��
2039. interfere[int2'fi2]
vi.���棬��Ԥ������
2040. interference[int2'fi2r2ns]
n.���棬��Ԥ���谭
2041. interior[in'ti2ri2]
a.�ڵģ��ڵص�n.�ڲ�
2042. intermediate[int2'mi:dj2t]
a.�м�ģ��м���
2043. internal[in't2:nl]
a.�ڵģ����ڵ�
2044. international[int2(:)'n962nl]
a.���ʵģ�����(��)��
2045. interpret[in't2:prit]
vt.���ͣ�˵��������
2046. interpretation[int2:pri'tei62n]
n.���ͣ�����
2047. interpreter[in't2:prit2]
n.��Ա��������
2048. interrupt[int2'r3pt]
vt.��ϣ����ţ���ֹ
2049. interruption[int2'r3p62n]
n.�жϣ���ϣ��ϰ���
2050. interval['int2v2l]
n.�������Ϣ�����
2051. interview['int2vju:]
n.�Ӽ����������̸
2052. intimate['intimit]
a.���ܵģ����˵�
2053. into['intu. 'int2]
prep.�����룻���뵽
2054. introduce['intr2'dju:s]
vt.���ܣ�����������
2055. introduction[intr2'd3k62n]
n.���ܣ�����������
2056. invade[in'veid]
vt.���֣����ԣ���Ϯ
2057. invasion[in'vei72n]
n.���֣����ԣ��ַ�
2058. invent[in'vent]
vt.���������죻����
2059. invention[in'ven62n]
n.���������죻����
2060. inventor[in'vent2]
n.�����ߣ�������
2061. invest[in'vest]
vt.Ͷ�ʣ�Ͷ��
2062. investigate[in'vestigeit]
vt.&vi.����
2063. investigation[investi'gei62n]
n.���飬�����о�
2064. investment[in'vestm2nt]
n.Ͷ�ʣ�Ͷ�ʶͶ��
2065. invisible[in'viz2bl]
a.�������ģ����ε�
2066. invitation[invi'tei62n]
n.���룬�д������
2067. invite[in'vait]
vt.���룬Ƹ�룻�д�
2068. involve[in'v0lv]
vt.ʹ���룻ǣ��
2069. inward['inw2d]
a.����� ad.����
2070. iron['ai2n]
n.�������� vt.��(��)
2071. irregular[i'regjul2]
a.������ģ��������
2072. island['ail2nd]
n.��������
2073. isolate['ais2leit]
vt.ʹ���룬ʹ����
2074. issue['i6u:]
n.���⣻���� vt.����
2075. it[it]
pron.�⣬�ǣ���
2076. Italian[i't9lj2n]
a.�������n.�������
2077. item['ait2m]
n.�������һ��
2078. its[its]
pron.����
2079. itself[it'self]
pron.���Լ�������
2080. jacket['d79kit]
n.�����£��ѿ���
2081. jail[d7eil]
n.���� vi.���
2082. jam[d79m]
n.����
2083. jam[d79m]
vt.ʹ������ʹ����
2084. January['d79nju2ri]
n.һ��
2085. Japan[d72'p9n]
n.�ձ����ձ���
2086. Japanese[d79p2'ni:z]
a.�ձ��� n.�ձ���
2087. jar[d7a:]
n.���ӣ�̳�ӣ����ƿ
2088. jaw[d70:]
n.򢣬�
2089. jazz[d79z]
n.��ʿ���֣���ʿ����
2090. jealous['d7el2s]
a.�ʼɵģ����ɵ�
2091. jet[d7et]
n.����ʽ�ɻ�������
2092. jewel['d7u:2l]
n.��ʯ����ʯ����
2093. jewish['d7u(:)i6]
a.��̫�˵�
2094. job[d70b]
n.ְҵ�����������
2095. join[d70in]
vt.�μӣ�����
2096. joint[d70int]
n.��ͷ���ӷ죻�ؽ�
2097. joke[d72uk]
n.Ц�� vi.˵Ц��
2098. jolly['d70li]
a.���ģ����˸��˵�
2099. journal['d72:nl]
n.�ձ�����־����־
2100. journalist['d72:n2list]
n.���ߣ����Ź�����
2101. journey['d72:ni]
n.���У��ó� n.����
2102. joy[d70i]
n.���֣�ϲ�ã�����
2103. joyful['d70iful]
a.ʮ��ϲ�õģ����ֵ�
2104. judge[d73d7]
n.���٣�����Ա
2105. judgement['d73d7m2nt]
n.��������У��ж�
2106. juice[d7u:s]
n.(ˮ����)֭��Һ
2107. July[d7u:'lai]
n.����
2108. jump[d73mp]
vi.�������� vt.����
2109. June[d7u:n]
n.����
2110. jungle['d738gl]
n.���֣����֣�ç��
2111. junior['d7u:nj2]
a.���ٵ� n.��
2112. jury['d7u2ri]
n.�����ţ�������
2113. just[d73st]
ad.�ղţ�ֻ�ǣ�����
2114. justice['d73stis]
n.���壬������˾��
2115. justify['d73stifai]
vt.֤������������
2116. keen[ki:n]
a.���ĵģ����ҵ�
2117. keep[ki:p]
vi.���֣����
2118. keeper['ki:p2]
n.�����ˣ�����Ա
2119. kettle['ketl]
n.ˮ����ˮ��
2120. key[ki:]
n.Կ�ף�������
2121. keyboard['kib0:d]
n.����
2122. kick[kik]
vi.&vt.&n.��
2123. kid[kid]
n.С������ͯ������
2124. kill[kil]
vi.ɱ������ɱ����ĥ
2125. kilogram['kil2gr9m]
n.ǧ�ˣ�����
2126. kilometer['kil2mi:t2]
n.ǧ�ף�����
2127. kind[kaind]
n.����
2128. kind[kaind]
a.�Ѻõģ��Ͱ���
2129. kindness['kaindnis]
n.�ʴȣ�����
2130. king[ki8]
n.����������
2131. kingdom['ki8d2m]
n.���������򣬽�
2132. kiss[kis]
vt.�� vi.���� n.��
2133. kitchen['kit6in]
n.���������
2134. kite[kait]
n.����
2135. knee[ni:]
n.ϥ��ϥ�ǣ�ϥ�ؽ�
2136. kneel[ni:l]
vi.�򣬹��£�����
2137. knife[naif]
n.С���������͵�
2138. knit[nit]
vt.�ѡ���� vi.��֯
2139. knob[n0b]
n.�Űѣ����֣���Ŧ
2140. knock[n0k]
vi.&vt.&n.�ã�������
2141. knot[n0t]
n.(����)�ᣬ(����)��
2142. know[n2u]
vt.֪������ʶ��ͨ��
2143. knowledge['n0lid7]
n.֪ʶ��ѧʶ��֪��
2144. lab[l9b]
n.ʵ���ң��о���
2145. label['leibl]
n.��ǩ����ǣ�����
2146. laboratory[l2'b0r2tri]
n.ʵ���ң��о���
2147. labour['leib2]
n.�Ͷ����������͹�
2148. lace[leis]
n.Ь����ϵ��������
2149. lack[l9k]
vi.&vi.&n.ȱ��������
2150. ladder['l9d2]
n.���ӣ���״��
2151. lady['leidi]
n.Ůʿ�����ˣ�����
2152. lag[l9g]
vi.�ߵ��� n.���
2153. lake[leik]
n.��
2154. lamb[l9m]
n.����С�򣻸�����
2155. lame[leim]
a.�˵ģ�ȳ�ģ��зϵ�
2156. lamp[l9mp]
n.��
2157. land[l9nd]
n.½�أ����� vi.�ϰ�
2158. landing['l9ndi8]
n.�ϰ�����½����½
2159. landlady['l9ndleidi]
n.Ů������Ů����
2160. landlord['l9ndl0:d]
n.����������������
2161. lane[lein]
n.(���)С·���ܵ�
2162. language['l98gwid7]
n.���ԣ����Կγ�
2163. lantern['l9nt2n]
n.��ƣ�����
2164. lap[l9p]
n.ϥ����һȦ
2165. large[la:d7]
a.��ģ��޴��
2166. largely['la:d7li]
ad.�󲿷֣�������
2167. laser['leiz2]
n.����
2168. last[la:st]
a.���� ad.���
2169. last[la:st]
vi.�������־ã��;�
2170. late[leit]
a.�ٵ� ad.�٣���
2171. lately['leitli]
ad.���������ǰ
2172. later['leit2]
ad.��������һ���
2173. Latin['l9tin]
a.������ n.������
2174. latter['l9t2]
a.(������)���ߵ�
2175. laugh[la:f]
vi.Ц����Ц n.Ц
2176. laughter[la:ft2]
n.Ц��Ц��
2177. launch[l0:nt6]
vt.���䣬Ͷ�䣻����
2178. laundry['l0:ndri]
n.ϴ�·���ϴ�µ�
2179. lavatory['l9v2t2ri]
n.��ϴ�ң�����
2180. law[l0:]
n.���ɣ��������
2181. lawn[l0:n]
n.�ݵأ���ƺ���ݳ�
2182. lawyer['l0:j2]
n.��ʦ����ѧ��
2183. lay[lei]
vt.�÷ţ����裻����
2184. layer['lei2]
n.�㣬��Σ�������
2185. layout['leiaut]
n.���֣����ţ����
2186. lazy['leizi]
a.����ģ���ɢ��
2187. lead[li:d]
vt.Ϊ����·���쵼
2188. lead[li:d]
n.Ǧ��Ǧ��Ʒ
2189. leader['li:d2]
n.���䣬�쵼�ˣ�����
2190. leadership['li:d26ip]
n.�쵼
2191. leading['li:di8]
a.ָ���ģ�����Ҫ��
2192. leaf[li:f]
n.Ҷ��Ҷ��
2193. league[li:g]
n.ͬ�ˣ����ˣ����ϻ�
2194. leak[li:k]
vi.©��й¶ n.©��
2195. lean[li:n]
vi.��б��������
2196. leap[li:p]
vi.����Ծ n.��Ծ
2197. learn[l2:n]
vi.&vt.ѧ��ѧϰ
2198. learned['l2:nid]
a.��ѧ�ʵģ�ѧ���ϵ�
2199. learning['l2:ni8]
n.ѧϰ��ѧ�ʣ�֪ʶ
2200. least[li:st]
a.���ٵ� ad.����
2201. leather['le52]
n.Ƥ�Ƥ����Ʒ
2202. leave[li:v]
vi.��ȥ vt.�뿪
2203. lecture['lekt62]
n.&vi.�ݽ�������
2204. left[left]
a.��ߵ� ad.�����
2205. leg[leg]
n.�ȣ��Ȳ�
2206. legal['li:gl]
a.���ɵģ��Ϸ���
2207. legend['led72nd]
n.��˵������
2208. leisure['le72]
n.����ʱ�䣻����
2209. lemon['lem2n]
n.���ʣ�������
2210. lend[lend]
vt.�ѡ��������(��)
2211. length[le84]
n.�������ȣ�һ��
2212. lens[lenz]
n.͸������Ƭ����ͷ
2213. less[les]
a.���ٵ� ad.���ٵ�
2214. lessen['lesn]
vt.���٣����᣻��С
2215. lesson['lesn]
n.���Σ��Σ��γ�
2216. lest[lest]
conj.Ω�֣�����
2217. let[let]
vt.�����ã�ʹ
2218. letter['let2]
n.�ţ�֤�飻��ĸ
2219. level['levl]
n.ˮƽ�� a.ˮƽ��
2220. lever['li:v2]
n.�ˣ��ܸˣ����Ƹ�
2221. liable['lai2bl]
a.���ڡ��ģ����ܵ�
2222. liar['lai2]
n.˵�ѵ���
2223. liberal['lib2r2l]
a.���ؿ��ģ�������
2224. liberate['lib2reit]
vt.��ţ��ͷ�
2225. liberation[lib2'rei62n]
n.���
2226. liberty['lib2ti]
n.���ɣ��ͷţ����
2227. librarian[lai'br/2ri2n]
n.ͼ��ݹݳ�
2228. library['laibr2ri]
n.ͼ��ݣ�����
2229. license['lais2ns]
n.��ɣ�ִ�� vt.׼��
2230. lick[lik]
vt.�����
2231. lid[lid]
n.���ӣ��ǣ��Ҹ�
2232. lie[lai]
vi.�ɣ�ƽ�ţ�λ��
2233. lie[lai]
vi.˵�ѣ���ƭ n.�ѻ�
2234. lieutenant[lef'ten2nt]
n.½����ξ����ְ��Ա
2235. life[laif]
n.������һ��������
2236. lifetime['laiftaim]
n.һ��������
2237. lift[lift]
vt.������� n.����
2238. light[lait]
n.�⣬���ߣ��ƣ���Դ
2239. light[lait]
a.��ģ�������
2240. lighten['laitn]
vt.������ʹ����
2241. lightly['laitli]
ad.����أ����ɵ�
2242. lightning['laitni8]
n.���磬����ŵ�
2243. like[laik]
vt.ϲ����ϲ����ϣ��
2244. like[laik]
prep.���磻��Ҫ
2245. likely['laikli]
a.���ܵ� ad.�ܿ���
2246. likewise['laikwaiz]
ad.ͬ���أ�Ҳ����
2247. limb[lim]
n.֫���ۣ�����֦
2248. lime[laim]
n.ʯ��
2249. limit['limit]
n.�޶ȣ����ƣ���Χ
2250. limitation[limi'tei62n]
n.���ƣ��޶ȣ�����
2251. limited['limitid]
a.���޵�
2252. line[lain]
n.�ߣ��ţ�·�ߣ�����
2253. linen['linin]
n.���鲼������֯��
2254. liner['lain2]
n.�ബ�����
2255. link[li8k]
vt.�л����� n.��
2256. lion['lai2n]
n.ʨ�ӣ����͵���
2257. lip[lip]
n.�촽
2258. liquid['likwid]
n.Һ�� a.Һ���
2259. liquor['lik2]
n.�ƣ���Һ��Һ��
2260. list[list]
n.��Ŀ¼ n.�о�
2261. listen['lisn]
vi.����������������
2262. listener['lisn2]
n.���ߣ�����֮һ
2263. liter['li:t2]
n.��(������λ)
2264. literary['lit2r2ri]
a.��ѧ(��)��
2265. literature['lit2rit62]
n.��ѧ������
2266. little['litl]
a.С�ģ��٣���С��
2267. live[liv laiv]
vi.��ס���� a.���
2268. lively['laivli]
a.���õģ������
2269. liver['liv2]
n.�Σ�����
2270. living['livi8]
a.��� n.�������
2271. living-room['livi8'ru:m]
n.�����
2272. load[l2ud]
vt.װ��װ�� n.����
2273. loaf[l2uf]
n.һ�������һ�����
2274. loan[l2un]
n.����ݽ� vt.���
2275. local['l2uk2l]
a.�ط��ģ��ֲ���
2276. locate[l2u'keit]
vt.̽�����ҳ������
2277. location[l2u'kei62n]
n.λ�ã�����
2278. lock[l0k]
n.�� vt.���ϣ���ס
2279. locomotive['l2uk2m2utiv]
n.��ͷ������
2280. lodge[l0d7]
vi.��ס�����ޣ�Ͷ��
2281. log[l0g]
n.ԭľ��ľ��
2282. logic['l0d7ik]
n.�߼��������߼���
2283. logical['l0d7ik2l]
a.�߼��ģ������߼���
2284. lonely['l2unli]
a.�¶��ģ�������
2285. long[l08]
a.���ģ�Զ�� ad.����
2286. long[l08]
vi.������������
2287. look[luk]
vi.�����Ե� n.��
2288. loop[lu:p]
n.Ȧ����������
2289. loose[lu:s]
a.�ɵģ����ɵ�
2290. loosen['lu:sn]
vt.�⿪��ʹ�ɳ�
2291. lord[l0:d]
n.���壻�ϵۣ�����
2292. lorry['l0ri]
n.�˻�����������
2293. lose[lu:z]
vt.ʧȥ����ʧ�����
2294. loss[l0s]
n.��ʧ����ʧ��ʧ��
2295. lot[l0t]
n.��࣬������ǩ����
2296. loud[laud]
a.�����ģ����ֵ�
2297. loudspeaker['laud'spi:k2]
n.������������
2298. love[l3v]
vt.����ϲ�� n.��
2299. lovely['l3vli]
a.�ɰ��ģ���������
2300. lover[l3v2]
n.�����ߣ����ˣ�����
2301. low[l2u]
a.�͵ģ����ģ����µ�
2302. lower['l2u2]
a.�ϵ͵� vt.����
2303. loyal['l0i2l]
a.�ҳϵģ����ĵ�
2304. loyalty['l0i2lti]
n.�ҳϣ�����
2305. luck[l3k]
n.���������ˣ�����
2306. lucky['l3ki]
a.���˵ģ������
2307. luggage['l3gid7]
n.���Ƥ�䣬Ƥ��
2308. lumber['l3mb2]
n.ľ�ģ�ľ�ϣ��Ʋ�
2309. lump[l3mp]
n.�ţ��飻�׿�
2310. lunch[l3nt6]
n.��ͣ�(��)���
2311. lung[l38]
n.���࣬��
2312. luxury['l3k62ri]
n.�ݳޣ��ݻ����ݳ�Ʒ
2313. machine[m2'6i:n]
n.��������е
2314. mad[m9d]
a.����ģ��ջ��
2315. madam['m9d2m]
n.���ˣ�Ůʿ��̫̫
2316. magazine[m9g2'zi:n]
n.��־���ڿ�
2317. magic['m9d7ik]
n.ħ����������Ϸ��
2318. magnet['m9gnit]
n.��������ʯ������
2319. magnetic[m9g'netik]
a.�ŵģ�����������
2320. magnificent[m9g'nifisnt]
n.׳���ģ�������
2321. maid[meid]
n.ŮӶ��Ů�ͣ���Ů
2322. mail[meil]
n.�ʼ� vt.�ʼ�
2323. main[mein]
a.��Ҫ�ģ�����Ҫ��
2324. mainly['meinli]
ad.��Ҫ�أ�������
2325. mainland['meinl9nd]
n.��½
2326. maintain[mein'tein]
vt.ά�֣�������ά��
2327. maintenance['meintin2ns]
n.ά�֣����֣�ά��
2328. major['meid72]
a.�ϴ�� n.רҵ
2329. majority[m2'd70riti]
n.�����������
2330. make[meik]
vt.ʹ����������
2331. male[meil]
a.�еģ��۵� n.����
2332. man[m9n]
n.���ˣ��ˣ�����
2333. manage['m9nid7]
vt.�����跨���Ը�
2334. management['m9nid7m2nt]
n.������Ӫ������
2335. manager['m9nid72]
n.����������
2336. mankind[m9n'kaind]
n.����
2337. manly['m9nli]
a.�������ŵģ����ϵ�
2338. manner['m9n2]
n.��ʽ��̬�ȣ���ò
2339. manual['m9nju2l]
a.������ n.�ֲ�
2340. manufacture[m9nju'f9kt62]
vt.���� n.���죻��Ʒ
2341. manufacturer[m9nju'f9kt62r2]
n.�����̣����쳧
2342. many['meni]
a.���� pron.�����
2343. map[m9p]
n.��ͼ��ͼ������ͼ
2344. marble['ma:bl]
n.����ʯ
2345. March[ma:t6]
n.����
2346. march[ma:t6]
vi.�о�������ʾ��
2347. margin['ma:d7in]
n.ҳ�ߵĿհף���Ե
2348. marine[m2'ri:n]
a.���ģ����ϵ�
2349. mark[ma:k]
n.�ߵ㣻�Ǻ� vt.����
2350. market['ma:kit]
n.�г������У���·
2351. marriage['m9rid7]
n.��飬����������
2352. married['m9rid]
a.�ѻ�ģ�������
2353. marry['m9ri]
vt.Ȣ���� vi.���
2354. marvelous['ma:vil2s]
a.�漣��ģ��˲����
2355. Marxisim[]
n.���˼����
2356. Marxist['ma:ksist]
a.���˼�����
2357. mask[ma:sk]
n.��ߣ�αװ vt.����
2358. mass[m9s]
n.�ڶࣻ�ţ�Ⱥ��
2359. master['ma:st2]
n.���ˣ����֣�˶ʿ
2360. masterpiece['ma:st2pi:s]
n.����������
2361. mat[m9t]
n.ϯ�ӣ���ϯ������
2362. match[m9t6]
n.����������������
2363. match[m9t6]
n.(һ��)���
2364. mate[meit]
n.��飬ͬ�£���ż
2365. material[m2'ti2ri2l]
n.���ϣ��ز�a.���ʵ�
2366. materialism[m2'ti2ri2liz2m]
n.Ψ������
2367. mathematical[m94i'm9tik2l]
a.��ѧ�ģ���ѧ�ϵ�
2368. mathematics[m94i'm9tiks]
n.��ѧ
2369. maths[m94s]
n.(Ӣ)��ѧ
2370. matter['m9t2]
n.���飻���� vi.Ҫ��
2371. mature[m2'tju2]
a.����� vt.ʹ����
2372. maximum['m9ksim2m]
n.����� a.����
2373. May[mei]
n.����
2374. may[mei]
v.aux.���ܣ����ԣ�ף
2375. maybe['meibi:]
ad.��ţ�����Ҳ��
2376. mayor['m/2]
n.�г�
2377. me[mi:. mi]
pron.(����)��
2378. meadow['med2u]
n.�ݵأ����ݵ�
2379. meal[mi:l]
n.��ʳ��һ��
2380. mean[mi:n]
vt.�������ͣ���ָ
2381. mean[mi:n]
a.��˽�ģ����ĵ�
2382. mean[mi:n]
a.ƽ���� n.ƽ��ֵ
2383. meaning['mi:ni8]
n.���壬��˼����ͼ
2384. means[mi:nz]
n.�������ֶΣ�����
2385. meantime['mi:n'taim]
n.��ʱ����� ad.��ʱ
2386. meanwhile['mi:n'wail]
ad.ͬʱ����ʱ
2387. measurable['me72r2bl]
a.�ɲ�����
2388. measure['me72]
vt.�������� n.����
2389. measurement['me72m2nt]
n.�������������ߴ�
2390. meat[mi:t]
n.��
2391. mechanic[mi'k9nik]
n.��������е�����޹�
2392. mechanical[mi'k9nik2l]
a.��е�ģ���ѧ��
2393. mechanically[mi'k9nik2li]
ad.��е��
2394. mechanics[mi'k9niks]
n.��ѧ��������ϸ��
2395. medal['medl]
n.���£�ѫ�£�������
2396. medical['medik2l]
a.ҽѧ�ģ��ڿƵ�
2397. medicine['medisin]
n.�ڷ�ҩ��ҽѧ
2398. Mediterranean[medit2'reinj2n]
n.���к� a.���к���
2399. medium['mi:dj2m]
n.ý�ʣ��м�a.�еȵ�
2400. meet[mi:t]
vt.���� vi.����
2401. meeting[mi:ti8]
n.�ۼ�����ϣ����
2402. melon['mel2n]
n.�ϣ����
2403. melt[melt]
vi.�ڻ� vt.ʹ�ڻ�
2404. member['memb2]
n.��Ա����Ա
2405. memorial[mi'm0:ri2l]
a.����ģ������
2406. memory['mem2ri]
n.���䣻���䣻�洢
2407. mend[mend]
vt.�����޲����첹
2408. mental['mentl]
a.�����ģ������
2409. mention['men62n]
vt.&n.�ἰ��˵��
2410. menu['menju:]
n.�˵������ˣ�����
2411. merchant['m2:t62nt]
n.���ˣ�������
2412. mercury['m2:kjuri]
n.ˮ������
2413. Mercury['m2:kjuri]
n.ˮ��
2414. mercy['m2:si]
n.�ʴȣ��ȱ�������
2415. mere[mi2]
a.�����ģ������
2416. merely['mi2li]
ad.������ֻ����
2417. merit['merit]
n.�������ŵ㣻����
2418. merry['meri]
a.���ֵģ�����
2419. mess[mes]
n.���ң����ӣ�����
2420. message['mesid7]
n.��Ϣ����Ϣ����ʾ
2421. messenger['mesind72]
n.�����ߣ���ʹ
2422. metal['metl]
n.������������Ʒ
2423. meter['mi:t2]
n.���������ƣ���
2424. method['me42d]
n.�������취����ѧ��
2425. metre['mi:t2]
n.�ף�����
2426. metric['metrik]
a.���Ƶģ����Ƶ�
2427. microcomputer[maikr2uk2m'pju:t2]
n.΢�ͼ������΢��
2428. microphone['maikr2f2un]
n.��Ͳ����˷�
2429. microscope['maikr2sk2up]
n.��΢��
2430. midday['middei]
n.���磬����
2431. middle['midl]
n.�в� a.�в���
2432. midnight['midnait]
n.��ҹ����ҹ��ҹ��
2433. midst['midst]
n.�в����м䣬����
2434. might[mait]
v.aux.���ܣ��ᣬҲ��
2435. might[mait]
n.����������������
2436. mild[maild]
a.�ͻ��ģ������
2437. mile[mail]
n.Ӣ��
2438. military['milit2ri]
a.���µģ����˵�
2439. milk[milk]
n.�飬ţ�� vt.��(��)
2440. mill[mil]
n.ĥ�������쳧
2441. millimetre['milimi:t2]
n.����
2442. million['milj2n]
num.���� n.���
2443. mind[maind]
n.ͷ�ԣ����ǣ�����
2444. mine[main]
pron.�ҵ�
2445. mine[main]
n.�󣬿�ɽ������
2446. miner['main2]
n.��
2447. mineral['min2r2l]
n.���� a.�����
2448. minimum['minim2m]
n.��С�� a.��С��
2449. minister['minist2]
n.�������󳼣���ʹ
2450. ministry['ministri]
n.(������)��
2451. minor['main2]
a.��С�ģ��ϴ�Ҫ��
2452. minority[mai'n0riti]
n.��������������
2453. minus['main2s]
a.���� prep.��(ȥ)
2454. minute['minit. mai'nju:t]
n.�֣����ӣ�һ���
2455. minute['minit. mai'nju:t]
a.΢ϸ�ģ���ϸ��
2456. miracle['mir2kl]
n.�漣�����˾������
2457. mirror['mir2]
n.���� vt.��ӳ������
2458. miserable['miz2r2bl]
a.ʹ��ģ����ҵ�
2459. mislead[mis'li:d]
vt.ʹ�����;
2460. miss[mis]
n.С��
2461. miss[mis]
vt.δ����������
2462. missile['misail]
n.���������
2463. missing['misi8]
a.ȱ���ģ�ʧȥ��
2464. mission['mi62n]
n.ʹ��������ʹ��
2465. mist[mist]
n.����
2466. mistake[mis'teik]
n.���� vi.��⣬Ū��
2467. Mister['mist2]
n.����
2468. mistress['mistris]
n.Ů���ˣ�����
2469. misunderstand[mis3nd2'st9nd]
vt.��⣬��ᣬ����
2470. mix[miks]
vt.ʹ��ϣ�����
2471. mixture['mikst62]
n.��ϣ������
2472. moan[m2un]
n.������ vi.����
2473. mobile['m2ubail]
a.�˶��ģ�������
2474. mode[m2ud]
n.��ʽ����ʽ
2475. model['m0dl]
n.ģ�ͣ�ģʽ��ģ�ض�
2476. moderate['m0d2rit]
a.�º͵ģ��н��Ƶ�
2477. modern['m0d2n]
a.�ִ��ģ�������
2478. modest['m0dist]
a.�н��Ƶģ�ǫ���
2479. modify['m0difai]
vt.���ģ��޸ģ�����
2480. moist[m0ist]
a.ʪ��ģ������
2481. moisture['m0ist62]
n.��ʪ��ʪ�����¶�
2482. molecule['m0likju:l]
n.���ӣ��˷���
2483. moment['m2um2nt]
n.Ƭ�̣�˲�䣬ʱ��
2484. Monday['m3ndi]
n.����һ
2485. money['m3ni]
n.���ң���Ǯ���Ƹ�
2486. monitor['m0nit2]
n.�೤��������
2487. monkey['m38ki]
n.���ӣ�Գ
2488. month[m3n4]
n.�£��·�
2489. monthly['m3n4li]
a.ÿ�µ� ad.ÿ��
2490. monument['m0njum2nt]
n.����������
2491. mood[mu:d]
n.���飬����������
2492. moon[mu:n]
n.��������������
2493. moral['m0r2l]
a.���µģ��Ϻ����µ�
2494. more[m0:]
a.����� ad.��
2495. moreover[m0:'r2uv2]
ad.���ߣ���֮������
2496. morning['m0:ni8]
n.�糿������
2497. mortal['m0:tl]
a.����һ���ģ�������
2498. mosquito[m2s'ki:t2u]
n.����
2499. most[m2ust]
a.���� ad.���
2500. mostly['m2ustli]
ad.��Ҫ�ģ��󲿷�
2501. mother['m352]
n.ĸ�ף�����
2502. motion['m2u62n]
n.�˶������ƣ�����
2503. motivate['m2utiveit]
vt.�ٶ�������������
2504. motive['m2utiv]
n.������Ŀ��
2505. motor['m2ut2]
n.��������������
2506. mould[m2uld]
n.ģ�ӣ�ģ�� vt.����
2507. mount[maunt]
vt.���ϣ����� n.��ɽ
2508. mountain['mauntin]
n.ɽ��ɽ����ɽ��
2509. mourn[m0:n]
vi.��ʹ������
2510. mouse[maus]
n.�󣬺���
2511. mouth[mau4]
n.�죬�ڣ���ǻ
2512. mouthful['mau4ful]
n.���ڣ�һ�ڣ�����
2513. move[mu:v]
vt.�ƶ����ж� n.��
2514. movement['mu:vm2nt]
n.����������ƶ�
2515. movie['mu:vi]
n.��Ӱ����ӰԺ
2516. much[m3t6]
ad.�ǳ����� a.����
2517. mud[m3d]
n.���࣬�ཬ
2518. muddy['m3di]
a.����ģ���Ţ��
2519. mug[m3g]
n.��
2520. multiple['m3ltipl]
a.���ϵģ�������
2521. multiply['m3ltiplai]
vt.ʹ���ӣ���
2522. murder['m2:d2]
n.&vi.ıɱ����ɱ
2523. murderer['m2:d2r2]
n.ɱ�˷�������
2524. muscle['m3sl]
n.���⣬��������
2525. museum[mju:'zi2m]
n.����ݣ�չ����
2526. mushroom['m36rum]
n.Ģ��������ֲ��
2527. music['mju:zik]
n.���֣�����������
2528. musical['mju:zik2l]
a.���ֵģ���г��
2529. musician[mju:'zi62n]
n.���ּң�������
2530. must[m3st]
v.aux.���룻��ȻҪ
2531. mute[mju:t]
a.��Ĭ�� n.�ư�
2532. mutter['m3t2]
vi.���������Թ
2533. mutton['m3tn]
n.����
2534. mutual['mju:tju2l]
a.�໥�ģ���ͬ��
2535. my[mai]
pron.�ҵ�
2536. myself[mai'self]
pron.���Լ���������
2537. mysterious[mis'ti2ri2s]
a.���صģ���������
2538. mystery['mist2ri]
n.���أ����ص�����
2539. nail[neil]
n.����ָ�� vt.��
2540. naked['neikid]
a.����ģ����ڱֵ�
2541. name['neim]
n.���֣����� vt.˵��
2542. namely['neimli]
ad.����Ҳ����
2543. nap[n9p]
n.С˯������˯
2544. narrow['n9r2u]
a.���ģ���խ��
2545. nasty['na:sti]
a.�����ģ���⫵�
2546. nation['nei62n]
n.���壻����
2547. national['n962nl]
a.����ģ����ҵ�
2548. nationality[n962'n9liti]
n.���������壬��
2549. native['neitiv]
a.������ n.������
2550. natural['n9t62r2l]
a.��Ȼ��ģ���Ȼ��
2551. naturally['n9t62r2li]
ad.��Ȼ�أ���Ȼ��
2552. nature['neit62]
n.����Ȼ�����ԣ�����
2553. naughty['n0:ti]
a.��Ƥ�ģ�������
2554. naval['neiv2l]
n.�����ģ�������
2555. navigation[n9vi'gei62n]
n.���У�������������
2556. navy['neivi]
n.����
2557. near[ni2]
ad.�����ӽ� a.����
2558. nearby['ni2bai]
a.������ ad.�ڸ���
2559. nearly['ni2li]
ad.��ࣻ���е�
2560. neat[ni:t]
a.����ģ�������
2561. necessarily['nesis2rili]
ad.��Ȼ���ض�
2562. necessary['nesis2ri]
a.��Ҫ�ģ���Ȼ��
2563. necessity[ni'sesiti]
n.��Ҫ�ԣ���Ȼ��
2564. neck[nek]
n.��������
2565. necklace['neklis]
n.��������Ȧ
2566. need[ni:d]
vt.��Ҫ v.aux.��Ҫ
2567. needle['ni:dl]
n.�룬�첹����֯��
2568. needless['ni:dlis]
a.����Ҫ��
2569. negative['neg2tiv]
a.�񶨵ģ�������
2570. neglect[ni'glekt]
vt.���ӣ����ԣ����
2571. Negro['ni:gr2u]
n.����
2572. neighbour['neib2]
n.�ھӣ��ڹ�������
2573. neighbourhood['neib2hud]
n.�ھӹ�ϵ���ڽ�
2574. neither['nai52. 'ni:52]
a.(����)������
2575. nephew['nevju:]
n.ֶ�ӣ�����
2576. nerve[n2:v]
n.�񾭣��¸ң�����
2577. nervous['n2:v2s]
a.�񾭵ģ��׼�����
2578. nest[nest]
n.�����ѣ�Ѩ
2579. net[net]
n.������״�ͨ����
2580. network['netw2:k]
n.��״�����
2581. neutral['nju:tr2l]
a.�����ģ����Ե�
2582. never['nev2]
ad.��������������
2583. nevertheless[nev252les]
conj.Ȼ�� ad.��Ȼ
2584. new[nju:]
a.�µģ��½����ֵ�
2585. newly['nju:li]
ad.�½������
2586. news[nju:z]
n.���ţ���Ϣ
2587. newspaper['nju:zpeip2]
n.��ֽ����
2588. next[nekst]
a.���ӵģ�������
2589. nice['nais]
a.���õģ���������
2590. niece[ni:s]
n.ֶŮ������Ů
2591. night[nait]
n.ҹ��ҹ��
2592. nine[nain]
num.�ţ��Ÿ�
2593. nineteen['nain'ti:n]
num.ʮ�ţ�ʮ�Ÿ�
2594. ninety['nainti]
num.��ʮ����ʮ��
2595. ninth[nain4]
num.�ھţ��ŷ�֮һ
2596. nitrogen['naitrid72n]
n.��
2597. no[n2u]
ad.�������� a.û��
2598. noble['n2ubl]
a.����ģ����е�
2599. nobody['n2ub2di]
pron.˭Ҳ��������
2600. nod[n0d]
vt.��(ͷ)����ͷ��ʾ
2601. noise[n0iz]
n.������������������
2602. noisy['n0izi]
a.���ӵģ����ֵ�
2603. none[n3n]
pron.û���� ad.����
2604. nonsense['n0ns2ns]
n.��˵���ϻ�
2605. noon[nu:n]
n.���磬����
2606. nor[n0:]
conj.Ҳ������
2607. normal['n0:ml]
a.�����ģ���ͨ��
2608. normally['n0:m2li]
ad.ͨ����������
2609. north[n0:4]
n.�������� a.������
2610. northeast['n0:4'i:st]
n.���� a.λ�ڶ�����
2611. northern['n0:52n]
a.�����ģ�������
2612. northwest['n0:4'west]
n.���� a.λ��������
2613. nose[n2uz]
n.���ӣ�ͻ������
2614. not[n0t]
ad.����û��
2615. note[n2ut]
n.�ʼǣ�������ע��
2616. notebook['n2utbuk]
n.�ʼǱ�����Ʊ��
2617. nothing['n34i8]
n.û�ж��� ad.����
2618. notice['n2utis]
vt.ע�� n.֪ͨ��ע��
2619. noticeable['n2utis2bl]
a.�Զ��׼��ģ���Ҫ��
2620. noun[naun]
n.����
2621. novel['n0v2l]
n.С˵ a.�µ�
2622. November[n2u'vemb2]
n.ʮһ��
2623. now[nau]
ad.���ڣ����̣�����
2624. nowadays['nau2deiz]
ad.�ֽ�����
2625. nowhere['n2uhw/2]
ad.�κεط�����
2626. nuclear['nju:kli2]
a.ԭ�Ӻ˵ģ����ĵ�
2627. nucleus['nju:kli2s]
n.�ˣ����ģ�(ԭ��)��
2628. nuisance['nju:sns]
n.����Ķ���
2629. number['n3mb2]
n.�������֣�����
2630. numerous['nju:m2r2s]
a.Ϊ���ڶ�ģ����
2631. nurse[n2:s]
n.��ķ����ʿ vt.����
2632. nursery['n2:s2ri]
n.�ж���������
2633. nut[n3t]
n.������ɹ�����ĸ
2634. nylon['nail2n]
n.����������
2635. oak[2uk]
n.����ֲ���ľ
2636. oar[0:]
n.������
2637. obey[2'bei]
vt.˳�� vi.����
2638. object['0bd7ikt 2b'd7ekt]
n.����壻Ŀ��
2639. object['0bd7ikt 2b'd7ekt]
vi.���ԣ�������
2640. objection[2b'd7ek62n]
n.���ԣ����飻��ϲ��
2641. objective[0b'd7ektiv]
a.�͹۵ģ���ƫ����
2642. oblige[2'blaid7]
vt.��ʹ��ʩ������
2643. observation[0bz2:'vei62n]
n.ע�⣻�۲죻�۲���
2644. observe[2b'z2:v]
vt.���أ�������˵
2645. observer[2b'z2:v2]
n.�۲�Ա���۲���
2646. obstacle['0bst2kl]
n.�ϰ����ϰ������
2647. obtain[2b'tein]
vt.��ã��õ�����
2648. obvious['0bvi2s]
a.���Եģ��Զ��׼���
2649. obviously['0bvi2sli]
ad.���Եأ���Ȼ��
2650. occasion[2'kei72n]
n.���ϣ�ʱ�̣�ʱ��
2651. occasional[2'kei72n2l]
a.żȻ�ģ���ʱ��
2652. occasionally[2'kei72n2li]
ad.żȻ���Ǿ�����
2653. occupation[0kju'pei62nl]
n.ռ�죬ռ�ݣ�ְҵ
2654. occupy['0kjup2ai]
vt.ռ�죻ռ��ռ��
2655. occur[2'k2:]
vi.���������֣�����
2656. occurrence[2'k3r2ns]
n.���������֣��¼�
2657. ocean['2u62n]
n.������
2658. Oceania[2u6i'einj2]
n.������
2659. o'clock[2'kl0k]
ad.������
2660. October[0k't2ub2]
n.ʮ��
2661. odd[0d]
a.�����ģ���ֻ��
2662. odour['2ud2]
n.��ζ��������ζ��
2663. of[0v. 2v]
prep.���ģ�����
2664. off[0:f]
ad.(��)����(ͣ)ֹ
2665. offend[2'fend]
vt.ð�� vi.������
2666. offer['0f2]
vt.�ṩ����� n.�ṩ
2667. office['0fis]
n.�칫�ң������֣���
2668. officer['0fis2]
n.��Ա�����£�����
2669. official[2'fi62l]
a.��Ա�ģ��ٷ���
2670. often['0:fn]
ad.����������
2671. oh[2u]
int.����Ŷ����ѽ
2672. oil[0il]
n.�ͣ�ʯ�� vt.������
2673. okay['2u'kei]
(����OK)a.&ad.�ԣ���
2674. old[2uld]
a.�ϵģ������
2675. omit[2u'mit]
vt.ʡ�ԣ�ʡȥ����©
2676. on[0n]
prep.�ڡ��ϣ��ڡ���
2677. once[w3ns]
ad.һ�Σ����� n.һ��
2678. one[w3n]
num.һ pron.һ����
2679. oneself[w3n'self]
pron.�Լ�������
2680. onion['3nj2n]
n.��У����ͷ
2681. only['2unli]
ad.ֻ������ a.Ψһ��
2682. onto['0ntu]
prep.������
2683. open['2up2n]
a.���ģ����ŵ� vt.��
2684. opening['2up2ni8]
a.��ʼ�� n.��ʼ
2685. opera['0p2r2]
n.���
2686. operate['0p2reit]
vi.������ʩ������
2687. operation[0p2'rei62n]
n.����������������
2688. operational[0p2'rei62nl]
a.�����ϵģ���ʹ�õ�
2689. operator['0p2reit2]
n.������Ա������Ա
2690. opinion[2'pinj2n]
n.���������������
2691. opponent[2'p2un2nt]
n.���֣����֣��Կ���
2692. opportunity[0p2'tju:niti]
n.���ᣬ����
2693. oppose[2'p2uz]
vt.���ԣ�����
2694. opposite['0p2zit]
a.����� n.������
2695. oppress[2'pres]
vt.ѹ�ȣ�ѹ�ƣ�ѹ��
2696. optical['0ptik2l]
a.�۵ģ���ѧ��
2697. optimistic[0ptimistik]
a.�ֹ۵ģ��ֹ������
2698. option['0p62n]
n.ѡ��ѡ��Ȩ
2699. optional['0p62nl]
a.��������ѡ���
2700. or[0:. 2]
conj.�򣬻��ߣ���
2701. oral['0:r2l]
a.��ͷ�ģ��ڵ�
2702. orange['0rind7]
n.��(��)����(��)
2703. orbit['0:bit]
n.���й�� vt.����
2704. orchestra['0:kistr2]
n.�����ֶ�
2705. order['0:d2]
n.�������� vt.����
2706. orderly['0:d2li]
a.����ģ��������
2707. ordinary['0:din2ri]
a.ƽ���ģ�ƽ����
2708. ore[0:]
n.�󣬿�ʯ����ɰ
2709. organ['0:g2n]
n.���٣��������ܷ���
2710. organic[0:'g9nik]
a.�л���ģ����ٵ�
2711. organism['0:g2niz2m]
n.�����壻�л���
2712. organization[0:g2nai'zei62n]
n.��֯�����壬����
2713. organize['0:g2naiz]
vt.��֯������
2714. oriental[0ri'entl]
a.�����ģ��������ҵ�
2715. origin['0rid7in]
n.��Դ������������
2716. original[2'rid72n2l]
a.����ģ���ӱ��
2717. ornament['0:n2m2nt. '0:n2ment]
n.װ���װ��
2718. orphan['0:f2n]
n.�¶�
2719. other['352]
a.����ģ������
2720. otherwise['352waiz]
ad.���⣻Ҫ��Ȼ
2721. ought[0:t]
v.aux.Ӧ����Ӧ��
2722. ounce[auns]
n.��˾��Ӣ��
2723. our['au2]
pron.���ǵ�
2724. ours['au2z]
pron.���ǵ�
2725. ourselves[au2'selvz]
pron.�����Լ�
2726. out[aut]
ad.�������⣻�ֳ���
2727. outcome['autk2m]
n.�����������ɹ�
2728. outdoor['autd0:]
a.����ģ������
2729. outdoors['aut'd0:z]
ad.�ڻ��⣬��Ұ��
2730. outer['aut2]
a.�ⲿ�ģ������
2731. outlet['aut-let]
n.���ڣ���·����ǲ
2732. outline['aut-lain]
n.��������ͼ�����
2733. outlook['aut-luk]
n.�۵㣬������չ��
2734. output['autput]
n.����������������
2735. outset['aut-set]
n.��ʼ������
2736. outside['aut'said]
n.�ⲿ�����a.�ⲿ��
2737. outskirt['autsk2:t]
n.��ߣ�����
2738. outstanding[aut'st9ndi8]
a.ͻ���ģ��ܳ���
2739. outward['autw2d]
a.����ģ������
2740. outwards['autw2dz]
ad.���⣬������
2741. oven['3vn]
n.¯�������
2742. over['2uv2]
prep.�ڡ��Ϸ�������
2743. overall['2uv2r0:l]
n.��װ�� a.ȫ���
2744. overcoat['2uv2k2ut]
n.���£�����
2745. overcome[2uv2'k3m]
vt.սʤ���˷�
2746. overhead['2uv2'hed. '2uv2hed]
a.��ͷ���ϵģ��ܿյ�
2747. overlook[2uv2'luk]
vt.��������©������
2748. overnight['2uv2nait]
ad.һҹ��ͻȻ
2749. overseas['2uve'si:z]
ad.���� a.�ں����
2750. overtake[2uv2'teik]
vt.׷�ϣ����ϣ�ѹ��
2751. overtime['2uv2taim]
a.��ʱ�ģ��Ӱ��
2752. owe[2u]
vt.Ƿ��Ӧ�ѡ��鹦��
2753. owl[aul]
n.èͷӥ����
2754. own[2un]
a.�Լ��� vt.�У�ӵ��
2755. owner['2un2]
n.������������
2756. ownership['2un26ip]
n.����(Ȩ)��������
2757. ox[0ks]
n.ţ����ţ����ţ
2758. pace[peis]
n.�������� vi.�ⲽ
2759. pacific[p2'sifik]
a.��ƽ�� n.̫ƽ��
2760. pack[p9k]
vt.���������� n.��
2761. package['p9kid7]
n.������������
2762. packet['p9kit]
n.С��(��)��С��
2763. pad[p9d]
n.�棻���� vt.����
2764. page[peid7]
n.ҳ
2765. pail[peil]
n.Ͱ����Ͱ
2766. pain[pein]
n.ʹ����ʹ������
2767. painful['peinful]
a.ʹʹ�ģ�������
2768. paint[peint]
vt.�������� vi.�滭
2769. painter['peint2]
n.�Ṥ�����ң��滭��
2770. painting['peinti8]
n.�ͻ����滭����ɫ
2771. pair[p/2]
n.һ�� vi.�ɶԣ����
2772. palace['p9lis]
n.��������
2773. pale[peil]
a.�԰׵ģ�ǳ��
2774. palm[pa:m]
n.���ƣ����ģ���״��
2775. pan[p9n]
n.ƽ�׹�������
2776. panda['p9nd2]
n.Сè�ܣ�è��
2777. pane[pein]
n.������
2778. panel['p9nl]
n.ר��С�飻�棬��
2779. pant[p9nt]
n.����������
2780. paper['peip2]
n.ֽ���ٷ��ļ�������
2781. parade[p2'reid]
n.���У����� vi.����
2782. paradise['p9r2dais]
n.������԰������
2783. paragraph['p9r2gra:f]
n.(���µ�)�Σ���
2784. parallel['p9r2lel]
a.ƽ�еģ���ͬ��
2785. parcel['pa:sl]
n.������С�����ʰ�
2786. pardon['pa:dn]
n.ԭ�£����� vt.ԭ��
2787. parent['p/2r2nt]
n.���ף�ĸ�ף�˫��
2788. park[pa:k]
n.��԰��ͣ����
2789. parliament['pa:l2m2nt]
n.��ᣬ����
2790. part[pa:t]
n.һ���֣����������
2791. partial['pa:62l]
a.���ֵģ�����ƽ��
2792. partially['pa:62li]
ad.���ֵ�
2793. participate[pa:'tisipeit]
vi.���룬�μӣ�����
2794. particle['pa:tikl]
n.���ӣ�΢��
2795. particular[p2'tikjul2]
a.����ģ��ض���
2796. particularly[p2'tikjul2li]
ad.�ر����䣬����
2797. partly['pa:tli]
ad.���ֵأ�����ȫ��
2798. partner['pa:tn2]
n.��飻�����ż
2799. party['pa:ti]
n.�������ɣ��ۻ�
2800. pass[pa:s]
vt.������ͨ�����ȹ�
2801. passage['p9sid7]
n.ͨ����ͨ·��ͨ��
2802. passenger['p9sind72]
n.�˿ͣ��ÿͣ���·��
2803. passion['p962n]
n.���飬���飻����
2804. passive['p9siv]
a.�����ģ�������
2805. passport['pa:sp0:t]
n.����
2806. past[past]
a.��ȥ�� n.��ȥ
2807. paste[peist]
n.������������
2808. pastime['pa:staim]
n.��ǲ������
2809. pat[p9t]
n.&vt.&n.����
2810. patch[p9t6]
n.��������Ƭ vt.��׺
2811. path[pa:4]
n.·��С������·
2812. patience['pei62ns]
n.���ͣ����̣�����
2813. patient['pei62nt]
a.���͵� n.����
2814. pattern['p9t2n]
n.�ͣ�ʽ����ģ��ģ��
2815. pause[p0:z]
n.&vi.��ֹ����ͣ
2816. pave[peiv]
vt.�̣���(·��)
2817. pavement['peivm2nt]
n.(Ӣ)���е�
2818. paw[p0:]
n.��צ��צ��
2819. pay[pei]
vt.֧��������������
2820. payment['peim2nt]
n.֧����֧���Ŀ���
2821. pea[pi:]
n.�㶹���㶹��ֲ��
2822. peace[pi:s]
n.��ƽ��������ƽ��
2823. peaceful['pi:sful]
a.��ƽ�ģ�������
2824. peach[pi:t6]
n.���ӣ�����
2825. peak[pi:k]
n.ɽ������ a.��ߵ�
2826. pear[p/2]
n.���ӣ�����
2827. pearl[p2:l]
n.���飻����ĸ
2828. peasant['pez2nt]
n.ũ��
2829. pebble['pebl]
n.��ʯ��ϸ��
2830. peculiar[pi'kju:lj2]
a.���еģ��ر��
2831. peel[pi:l]
vt.��(Ƥ)����(Ƥ)
2832. peep[pi:p]
vi.(�ӷ�϶��)͵��
2833. pen[pen]
n.�ֱʣ�����ˮ��
2834. pencil['pensl]
n.Ǧ��
2835. penetrate['penitreit]
vt.���� vi.����
2836. peninsula[pi'ninsjul2]
n.�뵺
2837. penny['peni]
n.(Ӣ)��ʿ��(��)��
2838. pension['pen62n]
n.���������
2839. people['pi:pl]
n.�������壻��
2840. pepper['pep2]
n.������������
2841. per[p2:]
prep.ÿ
2842. perceive[p2'si:v]
vt.��������������
2843. percent[p2'sent]
n.�ٷ�֮��
2844. percentage[p2'sentid7]
n.�ٷֱȣ��ٷ���
2845. perfect['p2:fikt. 'p2:fekt]
a.�����ģ���ȫ��
2846. perfectly['p2:fiktli]
ad.�ܣ���ȫ
2847. perform[p2'f0:m]
vt.���У�ִ�У��ݳ�
2848. performance[p2'f0:m2ns]
n.���У��ݳ�����Ϊ
2849. perfume['p2:fju:m. p2:'fju:m]
n.��ζ�����㣻����
2850. perhaps[p2'h9ps]
ad.Ҳ�����ܣ����
2851. period['pi2ri2d]
n.ʱ�ڣ�ѧʱ�����
2852. permanent['p2:m2n2nt]
a.���õģ��־õ�
2853. permanently['p2:m2n2ntli]
ad.���õأ��־õ�
2854. permission[p2(:)'mi62n]
n.������ɣ�ͬ��
2855. permit[p2:'mit. 'p2:mit]
vt.���� n.ִ��
2856. persist[p2:'sist]
vi.��֣���ִ������
2857. person['p2:sn]
n.�ˣ���������
2858. personal['p2:s2nl]
a.���˵ģ����˵�
2859. personnel[p2:s2'nel]
n.ȫ����Ա��ȫ��ְԱ
2860. perspective[p2:'spektiv]
n.͸�ӣ�Զ�����۵�
2861. persuade[p2:'sweid]
vt.˵�� vi.��˵��
2862. pessimistic[pesi'mistik]
a.���۵ģ�������
2863. pet[pet]
n.���󣻳��a.�谮��
2864. petrol['petr2l]
n.(Ӣ)����
2865. petroleum[pi'tr2ulj2m]
n.ʯ��
2866. phase[feiz]
n.�׶Σ����棻��λ
2867. phenomenon[fi'n0min2n]
n.����
2868. philosopher[fi'l0s2f2]
n.��ѧ��
2869. philosophy[fi'l0s2fi]
n.��ѧ������������
2870. phone[f2un]
n.�绰���绰��������
2871. photograph['f2ut2gra:f]
n.��Ƭ����Ƭ
2872. photographic[f2ut2'gr9fik]
a.��Ӱ�ģ���Ӱ�õ�
2873. phrase[freiz]
n.���ϰ������
2874. physical['fizik2l]
a.���ʵģ������
2875. physician[fi'zi62n]
n.ҽ�����ڿ�ҽ��
2876. physicist['fizisist]
n.����ѧ��
2877. physics['fiziks]
n.����ѧ
2878. piano[pi'9n2u]
n.����
2879. pick[pik]
n.�䣬�����
2880. pick[pik]
vt.ʰ��ժ vi.��ժ
2881. picnic['piknik]
n.���Σ�Ұ�� vi.Ұ��
2882. picture['pikt62]
n.����ͼƬ vt.��
2883. pie[pai]
n.(����)�ڱ�
2884. piece[pi:s]
n.��Ƭ���� vt.ƴ��
2885. pierce[pi2s]
vt.�ݴ� vi.����
2886. pig[pig]
n.��С��Ұ��
2887. pigeon[pid7in]
n.����
2888. pile[pail]
n.�� vt.�ѵ����ۻ�
2889. pill[pil]
n.ҩ�裬���
2890. pillar['pil2]
n.�������ӣ�����
2891. pillow['pil2u]
n.��ͷ
2892. pilot['pail2t]
n.�캽Ա������Ա
2893. pin[pin]
n.�룬���� n.��ס
2894. pinch[pint6]
vt.��š������
2895. pine[pain]
n.��������ľ
2896. pink[pi8k]
n.�ۺ�ɫ a.�ۺ�ɫ��
2897. pint[paint]
n.Ʒ��
2898. pioneer[pai2'ni2]
n.�ػ��ߣ�������
2899. pipe[paip]
n.���ӣ����ܣ��̶�
2900. pipeline['paiplain]
n.�ܵ�������
2901. pistol['pistl]
n.��ǹ
2902. pit[pit]
n.�ӣ��ؿӣ�ú��
2903. pitch[pit6]
n.����
2904. pitch[pit6]
vt.Ͷ���� vi.Ͷ��
2905. pity['piti]
n.�������ź� vt.ͬ��
2906. place[pleis]
n.�ط����ص㣻ס��
2907. plain[plein]
n.ƽԭ a.�����
2908. plan[pl9n]
n.&vt.�ƻ�������
2909. plane[plein]
n.ƽ�棻�ɻ�
2910. planet['pl9nit]
n.����
2911. plant[pla:nt]
n.ֲ����� vt.����
2912. plantation[pl9n'tei62n]
n.��ֲ԰����ֲ
2913. plaster['pla:st2]
n.���ࣻӲ�ࣻ��ʯ��
2914. plastic['pl9stik]
a.���ܵ� n.����
2915. plate[pleit]
n.�壬Ƭ���� vt.���
2916. platform['pl9tf0:m]
n.ƽ̨��վ̨����̨
2917. play[plei]
vi.�棬��Ϸ������
2918. player['plei2]
n.��Ϸ���ˣ�������
2919. playground['pleigraund]
n.�ٳ����˶���
2920. pleasant['pleznt]
a.�������ģ����ʵ�
2921. please[pli:z]
vt.ʹ���ˣ���vi.����
2922. pleasure['ple72]
n.��죬���֣�����
2923. plentiful['plentiful]
a.�ḻ�ģ���ԣ��
2924. plenty['plenti]
n.�ḻ�����㣬����
2925. plot[pl0t]
n.С������ vt.��ı
2926. plough[plau]
n.�� vt.&vi.�磬��
2927. pluck[pl3k]
vt.�ɣ�ժ������ n.��
2928. plug[pl3g]
n.���ӣ���ͷ vt.��
2929. plunge[pl3nd7]
vt.ʹͶ�룻ʹ����
2930. plural['plu2r2l]
a.������ n.����
2931. plus[pl3s]
prep.�ӣ����� a.����
2932. P.M.[pi:'em]
n.���磬���
2933. pocket['p0kit]
n.�´� n.�����
2934. poem['p2uim]
n.ʫ�����ģ�ʫ����
2935. poet[p2uit]
n.ʫ��
2936. poetry['p2uitri]
n.ʫ��ʫ�裬ʫ��
2937. point[p0int]
n.�㣻Ҫ�㣻ϸĿ����
2938. poison['p0izn]
n.������ҩ vt.����
2939. poisonous['p0izn2s]
a.�ж��ģ��к���
2940. pole[p2ul]
n.�ˣ���
2941. pole[p2ul]
n.��(��)���ż����缫
2942. police[p2'li:s]
n.���죻���쵱��
2943. policeman[p2'li:sm2n]
n.����
2944. policy['p0lisi]
n.���ߣ�����
2945. polish['p0li6]
vt.ĥ�⣻ʹ����
2946. polite[p2'lait]
a.����ò�ģ��н�����
2947. political[p2'litik2l]
a.���εģ������ϵ�
2948. politician[p0li'ti62n]
n.���μң�����
2949. politics['p0litiks]
n.���Σ�����ѧ������
2950. pollute[p2'lju:t]
vt.Ū�࣬��Ⱦ��մ��
2951. pollution[p2'lu:62n]
n.��Ⱦ
2952. pond[p0nd]
n.����
2953. pool[pu:l]
n.ˮ������Ӿ�أ�ˮ��
2954. pool[pu:l]
n.������ vt.����
2955. poor[pu2]
a.ƶ��ģ�ƶ����
2956. pop[p0p]
n.�������֣����и���
2957. pop[p0p]
n.���һ����������
2958. popular['p0pjul2]
a.���ڵģ����е�
2959. population[p0pju'lei62n]
n.�˿ڣ�ȫ�����
2960. porch[p0:t6]
n.���ȣ���ڴ�
2961. pork[p0:k]
n.����
2962. porridge['p0rid7]
n.�࣬��Ƭ��
2963. port[p0:t]
n.�ۣ��ۿ�
2964. portable['p0:t2bl]
a.���ģ������
2965. porter['p0:t2]
n.���˹���
2966. portion['p0:62n]
n.һ���֣�һ��
2967. portrait['p0:trit]
n.���񣬻���
2968. Portuguese[p0:tju'gi:z]
n.�������ˣ���������
2969. position[p2'zi62n]
n.λ�ã�ְλ������
2970. positive['p0z2tiv]
a.ȷ���ģ�������
2971. possess['p2'zes]
vt.ռ�ã�ӵ��(�Ʋ�)
2972. possession[p2'ze62n]
n.�У����У�ռ����
2973. possibility[p0s2'biliti]
n.���ܣ����ܵ���
2974. possible['p0s2bl]
a.���ܵģ����ܴ��ڵ�
2975. possibly['p0s2bli]
ad.���ܵأ�Ҳ��
2976. post[p2ust]
n.����׮���� vt.����
2977. post[p2ust]
n.�������ʼģ��ʼ�
2978. post[p2ust]
n.��λ��������ְλ
2979. postage['p2ustid7]
n.�ʷѣ�����
2980. postman['p2ustm2n]
n.�ʵ�Ա
2981. postpone[p2ust'p2un]
vt.�ӳ٣��Ƴ٣��ӻ�
2982. pot[p0t]
n.���������ޣ���
2983. potato[p2u'teit2u]
n.����������
2984. potential[p2'ten62l]
a.Ǳ�ڵ� n.Ǳ��
2985. pound[paund]
n.����Ӣ��
2986. pound[paund]
vt.���飻���ã��ͻ�
2987. pour[p0:]
vt.�࣬�� vi.��к
2988. poverty['p0v2ti]
n.ƶ�ƶ��
2989. powder['paud2]
n.��ĩ��ҩ�ۣ���ҩ
2990. power['pau2]
n.����������Ȩ����
2991. powerful['pau2ful]
a.ǿ�����ģ���Ȩ����
2992. practical['pr9ktik2l]
a.ʵ���ģ�ʵ�õ�
2993. practically['pr9ktik2li]
ad.ʵ���ϣ�����
2994. practice['pr9ktis]
n.ʵ������ϰ��ҵ��
2995. practise['pr9ktis]
vt.��ϰ��ʵϰ��ѵ��
2996. praise[preiz]
n.������� vi.����
2997. pray[prei]
vt.&vi.������
2998. prayer['pr/2]
n.��������
2999. precaution[pri'k0:62n]
n.Ԥ��������
3000. preceding[pri(:)'si:di8]
a.��ǰ�ģ����ȵ�
3001. precious['pre62s]
a.���ģ������
3002. precise[pri'sais]
a.��ȷ�ģ�׼ȷ��
3003. precision[pri'si72n]
n.��ȷ�����ܣ����ܶ�
3004. predict[pri'dikt]
v.Ԥ�ԣ�Ԥ�棬Ԥ��
3005. preface['prefis]
n.���ԣ�ǰ�ԣ�����
3006. prefer[pri'f2:]
vt.���ɣ���Ը
3007. preferable['pref2r2bl]
a.����ȡ�ģ����õ�
3008. preference['pref2r2ns]
n.ƫ�������ȣ�����Ȩ
3009. prejudice['pred7udis]
n.ƫ�����ɼ�
3010. preliminary[pri'limin2ri]
a.Ԥ���ģ�������
3011. premier['premj2]
n.��������
3012. preparation[prep2'rei62n]
n.׼����Ԥ�����Ʊ�
3013. prepare[pri'p/2]
vt.&vi.׼����Ԥ��
3014. preposition[prep2'zi62n]
n.ǰ�ôʣ����
3015. prescribe[pris'kraib]
vt.�����(��)
3016. presence['prezns]
n.��ϯ����������
3017. present['preznt]
a.���ڵ� n.Ŀǰ
3018. present['preznt]
vt.����; ����; ���
3019. present['preznt]
n.���������
3020. presently['prez2ntli]
ad.һ�����Ŀǰ
3021. preserve[pri'z2:v]
vt.���������棻����
3022. president['prezid2nt]
n.��ͳ��У�����᳤
3023. press[pres]
vt.ѹ�������죻�ߴ�
3024. pressure['pre62]
n.ѹ����ѹ����ѹ����
3025. pretend[pri'tend]
vt.���У����vi.��װ
3026. pretty['priti]
a.Ư���ģ����µ�
3027. prevail[pri'veil]
vi.ʤ����ʤ������
3028. prevent[pri'vent]
vt.Ԥ������ֹ����ֹ
3029. previous['pri:vj2s]
a.�ȵģ�ǰ�� ad.��ǰ
3030. previously['pri:vj2sli]
ad.��ǰ��Ԥ��
3031. price[prais]
n.�۸񣬼�Ǯ������
3032. pride[praid]
n.�������Ժ� vt.�Կ�
3033. priest[pri:st]
n.��ʿ����ʦ����
3034. primarily['praim2rili]
ad.���ȣ���Ҫ��
3035. primary['praim2ri]
a.����ģ�������
3036. prime[praim]
a.��Ҫ�� n.�����ഺ
3037. primitive['primitiv]
a.ԭʼ�ģ��ֲڵ�
3038. prince['prins]
n.���ӣ�����
3039. princess[prin'ses]
n.����������
3040. principal['prins2p2l]
a.��Ҫ�� n.������
3041. principle['prins2pl]
n.ԭ��ԭ������
3042. print[print]
vt.ӡˢ n.ӡˢ����Ƭ
3043. prior['prai2]
a.���ȵģ����ȵ�
3044. prison['prizn]
n.���������
3045. prisoner['prizn2]
n.����
3046. private['praivit]
a.˽�˵ģ�˽�µ�
3047. privilege['privilid7]
n.��Ȩ���Ż�
3048. prize[praiz]
n.���ͣ����� vt.����
3049. probability[pr0b2'biliti]
n.�����ԣ�����
3050. probable['pr0b2bl]
a.���еģ���ŵ�
3051. probably['pr0b2bli]
ad.�������
3052. problem['pr0bl2m]
n.���⣻ϰ�⣬����
3053. procedure[pr2'si:d72]
n.��������������
3054. proceed[pr2'si:d]
vi.���У���������
3055. process['pr2uses]
n.���̣����� vt.�ӹ�
3056. procession[pr2'se62n]
n.���飬����
3057. proclaim[pr2'kleim]
vt.���棬����������
3058. produce[pr2'dju:s. 'pr0dju:s]
vt.������������չ��
3059. product['pr0d2kt]
n.��Ʒ�����(��)��
3060. production[pr2'd3k62n]
n.��������Ʒ���ܲ���
3061. productive[pr2'd3ktiv]
a.�����ģ����ĵ�
3062. profession[pr2'fe62n]
n.ְҵ
3063. professional[pr2'fe62nl]
a.ְҵ�� n.רҵ��Ա
3064. professor[pr2'fes2]
n.����
3065. profit['pr0fit]
n.�洦������ vi.����
3066. program['pr2ugr9m]
n.��Ŀ������٣�����
3067. progress['pr2ugres. pr2'gres]
n.ǰ������չ������
3068. progressive[pr2'gresiv]
a.�����ģ���ǰ����
3069. prohibit[pr2'hibit]
vt.��ֹ����ֹ
3070. project[pr2'd7ekt. 'pr0d7ekt]
n.���������� vi.���
3071. prominent['pr0min2nt]
a.ʵ��ģ�ͻ����
3072. promise['pr0mis]
n.ŵ�ԣ�ָ�� vt.��ŵ
3073. promising['pr0misi8]
a.��ϣ���ģ���ǰ;��
3074. promote[pr2'm2ut]
vt.�ٽ����������
3075. prompt[pr0mpt]
a.��ʱ�� vt.�ش�
3076. pronoun['pr2unaun]
n.������
3077. pronounce[pr2'nauns]
vt.��������������
3078. pronunciation[pr2n3nsi'ei62n]
n.������������
3079. proof[pru:f]
n.֤�ݣ�֤����У��
3080. proper['pr0p2]
a.�ʺϵģ��Ϻ���ͳ��
3081. properly['pr0p2li]
ad.�ʵ��أ����׵�
3082. property['pr0p2ti]
n.�Ʋ����ʲ�������
3083. proportion[pr2'p0:62n]
n.�ȣ����ʣ�����
3084. proportional[pr2'p0:62nl]
a.�����ģ���Ƶ�
3085. proposal[pr2'p2uz2l]
n.���飬���飻���
3086. propose[pr2'p2uz]
vt.���� vi.���
3087. prospect['pr0spekt. pr2s'pekt]
n.չ����ǰ����ǰ��
3088. prosperity[pr0s'periti]
n.���٣���ʢ������
3089. prosperous['pr0sp2r2s]
a.���ٵģ���ʢ��
3090. protect[pr2'tekt]
vt.����������������
3091. protection[pr2'tek62n]
n.����������
3092. protective[pr2'tektiv]
a.�����ģ�������
3093. protein['pr2uti:n]
n.�����ʣ���
3094. protest[pr2'test. 'pr2utest]
vt.&vi.&n.����
3095. proud[praud]
a.�����ģ��Ժ���
3096. prove[pru:v]
vt.֤�� vi.�����
3097. provide[pr2'vaid]
vt.�ṩ��װ��������
3098. provided[pr2'vaidid]
conj.�ԡ�Ϊ����
3099. province['pr0vins]
n.ʡ�����򣬲���
3100. provision[pr2'vi72n]
n.��Ӧ��Ԥ��������
3101. psychological[saik2'l0d7ik2l]
a.����ģ�����ѧ��
3102. public['p3blik]
a.���ڵ� n.����
3103. publication[p3bli'kei62n]
n.���������棻������
3104. publish['p3bli6]
vt.��������������
3105. pudding['pudi8]
n.����
3106. puff[p3f]
n.(һ)�磬(һ)��
3107. pull[pul]
vt.�����ϣ���������
3108. pulse[p3ls]
n.���������壬����
3109. pump[p3mp]
n.�� vt.�ó����
3110. punch[p3nt6]
vt.��� n.��ѹ��
3111. punch[p3nt6]
vt.��ȭ�ͻ� n.ȭ��
3112. punctual['p38ktju2l]
a.����ʱ�̵ģ�׼ʱ��
3113. punish['p3ni6]
vt.�����ͷ�������
3114. punishment['p3ni6m2nt]
n.�����ͷ�������
3115. pupil['pju:pl]
n.ѧ����Сѧ��
3116. pupil['pju:pl]
n.ͫ��
3117. puppet['p3pit]
n.ľż����ż������
3118. purchase['p2:t62s]
n.�򣬹��� vt.��
3119. pure[pju2]
a.����ģ������
3120. purely['pju2li]
ad.����أ���ȫ��
3121. purify['pju2rifai]
vt.ʹ������ʹ�ྻ
3122. purity['pju2riti]
n.���������ࣻ����
3123. purple['p2:pl]
n.��ɫ a.�ϵ�
3124. purpose['p2:p2s]
n.Ŀ�ģ���ͼ��Ч��
3125. purse[p2:s]
n.Ǯ����СǮ�����ִ�
3126. pursue[p2'sju:]
vt.׷�ϣ�׷�٣�����
3127. pursuit[p2'sju:t]
n.׷�ϣ�׷������
3128. push[pu6]
vt.�ƣ����� vi.��
3129. put[put]
vt.�ţ��ڣ�ʹ����
3130. puzzle['p3zl]
n.���⣻�� vi.ʹ�Ի�
3131. qualify['kw0lifai]
vt.ʹ�����ʸ�
3132. quality['kw0liti]
n.������Ʒ�ʣ�����
3133. quantity['kw0ntiti]
n.��������������
3134. quarrel['kw0r2l]
n.���������ܣ��ڽ�
3135. quart['kw0:t]
n.����(=2Ʒ��)
3136. quarter['kw0:t2]
n.�ķ�֮һ��һ����
3137. quarterly['kw0:t2li]
a.���ȵ� ad.���ȵ�
3138. queen[kwi:n]
n.����Ů��
3139. queer['kwi2]
a.��ֵģ��Źֵ�
3140. question['kwest62n]
n.���ʣ����⣻����
3141. queue[kju:]
n.���� vi.�ŶӵȺ�
3142. quick[kwik]
a.��ģ����ݵ�
3143. quicken['kwik2n]
vt.�ӿ� vi.�ӿ�
3144. quickly['kwikli]
ad.�죬Ѹ��
3145. quiet['kwai2t]
a.�ž��ģ�������
3146. quilt[kwilt]
n.��(��)
3147. quit[kwit]
vt.�뿪���˳���ֹͣ
3148. quite[kwait]
ad.��ȫ���൱����ȷ
3149. quiz[kwiz]
n.С�Ϳ��ԣ�����
3150. quotation[kw2u'tei62n]
n.���ã����ģ����۵�
3151. quote[kw2ut]
vt.���ã���֤������
3152. rabbit['r9bit]
n.���ӣ�Ұ��
3153. race[reis]
n.����������������
3154. race[reis]
n.���֣����壬����
3155. racial['rei62l]
a.����ģ����ֵ�
3156. rack[r9k]
n.����ܣ������
3157. rack[r9k]
vt.ʹ��ʹ����ĥ
3158. racket['r9kit]
n.����
3159. radar['reid2]
n.�״���ߵ�̽����
3160. radiate['reidieit]
vi.������ߣ�����
3161. radiation[reidi'ei62n]
n.���䣬���䣻������
3162. radio['reidi2u]
n.���ߵ磻������
3163. radioactive[reidi2u'9ktiv]
a.�����Ե�
3164. radioactivity[reidi2u9k'tiviti]
n.�����ԣ�����(����)
3165. radish['r9di6]
n.С�ܲ�
3166. radium['reidj2m]
n.��
3167. radius['reidj2s]
n.�뾶
3168. rag[r9g]
n.�Ʋ����鲼��Ĩ��
3169. rage[reid7]
n.(һ��)��ŭ��ʢŭ
3170. raid[reid]
n.Ϯ����ͻȻ�Ѳ�
3171. rail[reil]
n.��������ˣ�����
3172. railroad['reilr2ud]
n.��· vi.����·����
3173. railway['reilwei]
n.��·������
3174. rain[rein]
n.�꣬��ˮ vi.����
3175. rainbow['reinb2u]
n.�磬�ʺ�
3176. rainy['reini]
a.����ģ������
3177. raise['reiz]
vt.�����������
3178. rake[reik]
n.���� vi.�ң�����
3179. range[reind7]
n.�ţ��У�ɽ������Χ
3180. rank[r98k]
n.�ţ����У����ײ�
3181. rapid['r9pid]
a.��� n.����
3182. rapidly['r9pidli]
ad.Ѹ�ٵ�
3183. rare[r/2]
a.ϡ���ģ�ϡ�е�
3184. rarely['r/2li]
ad.���٣��ѵ�
3185. rat[r9t]
n.���󣬺���
3186. rate[reit]
n.���ʣ��ٶȣ��۸�
3187. rather['ra:52]
ad.���ɣ���Ը���൱
3188. ratio['rei6i2u]
n.�ȣ�����
3189. rational['r962nl]
a.���Եģ��������Ե�
3190. raw[r0:]
a.δ����ģ�δ�ӹ���
3191. ray[rei]
n.���ߣ����ߣ�������
3192. razor['reiz2]
n.�굶
3193. reach[ri:t6]
vt.�ִ���vi.�ﵽ
3194. react[ri'9kt]
vi.��Ӧ����Ӱ��
3195. reaction[ri'9k62n]
n.��Ӧ��������
3196. read[ri:d]
vt.�������� vi.��
3197. reader['ri:d2]
n.���ߣ��������
3198. readily['redili]
ad.����أ������ѵ�
3199. reading['ri:di8]
n.�����Ķ�������
3200. ready['redi]
a.׼���õģ�Ը���
3201. real[ri2l]
a.��ģ���ʵ��
3202. reality[ri'9liti]
n.��ʵ����ʵ
3203. realize['ri2laiz]
vt.ʵ�֣���ʶ��
3204. really['ri2li]
ad.�����أ�ʵ��
3205. realm['relm]
n.����������������
3206. reap[ri:p]
vt.&vi.�ո�ջ�
3207. rear[ri2]
n.�󲿣����棻����
3208. rear[ri2]
vt.����������������
3209. reason['ri:zn]
n.���ɣ����� vi.����
3210. reasonable['ri:zn2bl]
a.�������ģ�������
3211. rebel['reb2l. ri'bel]
vi.�췴 n.�췴��
3212. rebellion[ri'belj2n]
n.�췴�����ң�����
3213. recall[ri'k0:l]
vt.���룻�лأ��ջ�
3214. receipt[ri'si:t]
n.�յ����������վ�
3215. receive[ri'si:v]
vt.�յ����õ����Ӵ�
3216. receiver[ri'si:v2]
n.�����ߣ��ռ���
3217. recent['ri:snt]
a.�½��ģ������
3218. recently['ri:sntli]
ad.������½�
3219. reception[ri'sep62n]
a.�Ӵ����д��᣻����
3220. recite[ri'sait]
vt.&vi.���У�����
3221. recognition[rek2g'ni62n]
n.�ϳ���ʶ�𣻳���
3222. recognize['rek2gnaiz]
vt.��ʶ���ϳ�������
3223. recollect['ri:k2'lekt]
vt.���䣬׷�䣬����
3224. recommend[rek2'mend]
vt.�Ƽ������ܣ�Ȱ��
3225. recommendation[rek2men'dei62n]
n.�Ƽ������ܣ�Ȱ��
3226. record['rek0:d. ri'k0:d]
n.��¼������ vt.��¼
3227. recorder[ri'k0:d2]
n.��¼�ߣ�¼����
3228. recover[ri'k3v2]
vt.���»�ã����
3229. recovery[ri'k3v2ri]
n.�ػ�Ȭ�����ָ�
3230. red[red]
a.��ɫ�� n.��ɫ
3231. reduce[ri'dju:s]
vt.���٣���С����
3232. reduction[ri'd3k62n]
n.���٣���С������
3233. reed[ri:d]
n.«έ��«�ˣ�«��
3234. reel[ri:l]
n.���ᣬ��Ͳ
3235. refer[ri'f2:]
vt.ʹ������ vi.̸��
3236. reference['ref2r2ns]
n.�ο����������ἰ
3237. refine[ri'fain]
vt.&vi.�������ᴿ
3238. reflect[ri'flekt]
vt.���䣻��ӳ��˼��
3239. reflection[ri'flek62n]
n.���䣻ӳ�󣻷�ӳ
3240. reflexion[ri'flek62n]
n.���䣻ӳ�󣻷�ӳ
3241. reform[ri'f0:m]
vt.&n.�ĸ����
3242. refresh[ri'fre6]
vt.ʹ����vi.�ָ�����
3243. refreshment[ri'fre6m2nt]
n.��㣬���ģ����
3244. refrigerator[ri'frid72reit2]
n.���䣬��ؿ�
3245. refuge['refju:d7]
n.���ѣ��ӻ����ӻ���
3246. refusal[ri'fju:z2l]
n.�ܾ�
3247. refuse[ri'fju:z]
vt.�ܾ� vt.�ܾ�
3248. refute[ri'fju:t]
vt.���⣬����������
3249. regard[ri'ga:d]
vt.�ѡ���������
3250. regarding[ri'ga:di8]
prep.����
3251. regardless[ri'ga:dlis]
ad.����һ�е�
3252. region['ri:d72n]
n.�������ش�������
3253. register['red7ist2]
n.&vt.�Ǽǣ�ע��
3254. regret[ri'gret]
vt.�ûڣ���Ǹ n.�û�
3255. regular['regjul2]
a.����ģ������
3256. regularly['regjul2li]
ad.�й��ɵ�
3257. regulate['regjuleit]
vt.�������ƣ�����
3258. regulation[regju'lei62n]
n.���򣬹��£�����
3259. rehearsal[ri'h2:s2l]
n.���������ݣ���ϰ
3260. reign[rein]
n.����ͳ�Σ�֧��
3261. rein[rein]
n.���� vi.��Ԧ������
3262. reinforce[ri:in'f0:s]
vt.��Ԯ��֧Ԯ����ǿ
3263. reject[ri'd7ekt]
vt.�ܾ�������������
3264. rejoice[ri'd70is]
vi.��ϲ������
3265. relate[ri'leit]
vt.������ʹ��ϵ
3266. relation[ri'lei62n]
n.��ϵ����ϵ������
3267. relationship[ri'lei62n6ip]
n.��ϵ����ϵ
3268. relative['rel2tiv]
a.�й�ϵ�ģ���Ե�
3269. relatively['rel2tivli]
ad.��Եأ��Ƚϵ�
3270. relativity[rel2'tiviti]
n.����ԣ������
3271. relax[ri'l9ks]
vt.ʹ�ɳ� vi.�ɳ�
3272. release[ri'li:s]
vt.�ͷţ����ɣ�����
3273. relevant['reliv2nt]
a.�йصģ����е�
3274. reliability[rilai2'biliti]
n.�ɿ���
3275. reliable[ri'lai2bl]
a.�ɿ��ģ���������
3276. reliance[ri'lai2ns]
n.���Σ�����������
3277. relief[ri'li:f]
n.���᣻�ȼã�Ԯ��
3278. relieve[ri'li:v]
vt.���ᣬ������ȼ�
3279. religion[ri'lid72n]
n.�ڽ̣��ڽ�����
3280. religious[ri'lid72s]
a.�ڽ̵ģ��ϵ�
3281. reluctant[ri'l3kt2nt]
a.��Ը�ģ���ǿ��
3282. rely[ri'lai]
vi.����������������
3283. remain[ri'mein]
vi.ʣ�£�����������
3284. remains[ri'meinz]
n.���࣬������
3285. remark[ri'ma:k]
vt.&vi.&n.���ۣ�̸��
3286. remarkable[ri'ma:k2bl]
a.�쳣�ģ��Ƿ���
3287. remedy['remidi]
n.&vt.���ƣ�����
3288. remember[ri'memb2]
vt.�ǵã����𣻼�ס
3289. remind[ri'maind]
vt.���ѣ�ʹ����
3290. remote[ri'm2ut]
a.�����Զ�ģ��䵭��
3291. removal[ri'mu:v2l]
n.�ƶ���Ǩ�ƣ�����
3292. remove[ri'mu:v]
vt.�ƶ����Ὺ���ѵ�
3293. render['rend2]
vt.��ʾ�����裻ʹ��
3294. renew[ri'nju:]
vt.ʹ���� vi.����
3295. rent[rent]
n.����� vi.����
3296. repair[ri'p/2]
vt.&n.�����޲�
3297. repeat[ri'pi:t]
vt.��˵������ n.�ظ�
3298. repeatedly[ri'pi:tidli]
ad.�ظ��أ�һ��
3299. repent[ri'pent]
vi.���򣬻ڸ�vt.���
3300. repetition[repi'ti62n]
n.�ظ�������
3301. replace[ri'pleis]
vt.�ѡ��Żأ�ȡ��
3302. reply[ri'plai]
vi.&n.�ش𣬴�
3303. report[ri'p0:t]
vt.&vi.���棻�㱨
3304. reporter[ri'p0:t2]
n.���ߣ�ͨѶԱ
3305. represent[repri'zent]
vt.��棻��������
3306. representative[repri'zent2tiv]
a.�����Ե� n.����
3307. reproach[ri'pr2ut6]
vt.&n.�𱸣�ָ��
3308. reproduce[ri:pr2'dju:s]
vt.&vi.��ֳ����ֳ
3309. republic[ri'p3blik]
n.���͹�����������
3310. republican[ri'p3blik2n]
a.���͹���
3311. reputation[repju(:)'tei62n]
n.������������������
3312. request[ri'kwest]
n.&v.����Ҫ��
3313. require[ri'kwai2]
vt.��Ҫ��Ҫ������
3314. requirement[ri'kwai2m2nt]
n.��Ҫ��Ҫ��
3315. rescue['reskju:]
vt.&n.Ԯ�ȣ�Ӫ��
3316. research[ri's2:t6]
n.&vi.���飬̽��
3317. researcher[ri's2:t62]
n.�����ߣ�̽����
3318. resemble[ri'zembl]
vt.������
3319. reserve[ri'z2:v]
vt.������������Ԥ��
3320. reservior[]
n.ˮ�⣻��ˮ��
3321. residence['rezid2ns]
n.��ס��פ����ס��
3322. resident['rezid2nt]
a.��ס�� n.����
3323. resign[ri'zain]
vt.���� vi.��ְ
3324. resignation[rezig'nei62n]
n.��������ְ������
3325. resist[ri'zist]
vt.&vi.�ֿ�������
3326. resistance[ri'zist2ns]
n.�ֿ������ƣ��ֿ���
3327. resistant[ri'zist2nt]
a.�ֿ��ģ�������
3328. resolution[rez2'lju:62n]
n.������ᶨ������
3329. resolve[ri'z0lv]
vt.��������� n.����
3330. resort[ri'z0:t]
vi.&n.������ƾ��
3331. resource[ri's0:s]
n.��Դ���������취
3332. respect[ris'pekt]
n.&vt.�𾴣�����
3333. respectful[ris'pektful]
a.�����ģ����ص�
3334. respective[ris'pektiv]
���Եģ�������
3335. respectively[ris'pektivli]
ad.���Եأ��ֱ��
3336. respond[ris'p0nd]
vi.������Ӧ
3337. response[ris'p0ns]
n.���𣬻ش���Ӧ
3338. responsibility[risp0ns2'biliti]
n.���Σ������ģ�ְ��
3339. responsible[ris'p0ns2bl]
a.�����εģ������
3340. rest[rest]
n.��Ϣ����������ֹ
3341. rest[rest]
n.ʣ�ಿ�֣��������
3342. restaurant['rest2r0nt]
n.�͹ݣ����꣬�˹�
3343. restless['restlis]
a.�������ģ����ǵ�
3344. restore[ris't0:]
vt.�ָ����黹���޲�
3345. restrain[ris'trein]
vt.���ƣ����ƣ�����
3346. restraint[ris'treint]
n.���ƣ����ƣ�����
3347. restrict[ris'trikt]
vt���ƣ��޶���Լ��
3348. restriction[ris'trik62n]
n.���ƣ��޶���Լ��
3349. result[ri'z3lt]
n.�ɹ� vi.���������
3350. resume[ri'zju:m]
vt.�ָ������¿�ʼ
3351. retain[ri'tein]
vt.���֣�����������
3352. retell['ri:'tel]
vt.�ٽ�������������
3353. retire[ri'tai2]
vi.���£����ˣ�����
3354. retreat[ri'tri:t]
vi.(����)��ȴ������
3355. return[ri't2:n]
vi.&n.����������
3356. reveal[ri'vi:l]
vt.չ�֣���ʾ����¶
3357. revenge[ri'vend7]
vt.�桭���� n.����
3358. reverse[ri'v2:s]
vt.�ߵ�����ת n.����
3359. review[ri'vju:]
vt.�ټ�� n.��ϰ
3360. revise[ri'vaiz]
vt.�޶���У�����޸�
3361. revolt[ri'v2ult]
vi.&n.�������췴
3362. revolution[rev2'lu:62n]
n.��������ת����ת
3363. revolutionary[rev2'lu:62n2ri]
a.������ n.������
3364. reward[ri'w0:d]
n.���𣻱��� vt.����
3365. rhythm['ri52m]
n.���ɣ����ɣ�����
3366. rib[rib]
n.�ߣ��߹�
3367. ribbon['rib2n]
n.�д���˿������
3368. rice[rais]
n.�����ף���
3369. rich[rit6]
a.���ģ��ḻ��
3370. rid[rid]
vt.ʹ���ѣ�ʹȥ��
3371. riddle['ridl]
n.�գ�����
3372. ride[raid]
vi.&n.�����˳�
3373. rider['raid2]
n.������ˣ��˳�����
3374. ridge[rid7]
n.�����룬ɽ����¢
3375. ridiculous[ri'dikjul2s]
a.�����ģ���Ц��
3376. rifle['raifl]
n.��ǹ������ǹ
3377. right[rait]
a.��ȷ�� ad.�ԣ�����
3378. rigid['rid7id]
a.��Ӳ�ģ���Ӳ��
3379. ring[ri8]
n.������(��Ȧ������)
3380. ring[ri8]
vi.�������� n.����
3381. ripe[raip]
a.��ģ�ʱ�������
3382. ripen['raip2n]
vt.ʹ�� vi.����
3383. rise[raiz]
vi.��������������
3384. risk[risk]
n.���գ�Σ�գ�ð��
3385. rival['raiv2l]
n.������ a.������
3386. river['riv2]
n.�����ӣ�ˮ��
3387. road[r2ud]
n.·����·����·
3388. roar[r0:]
vi.��У����� n.��
3389. roast[r2ust]
vt.&vi.�����ˣ���
3390. rob[r0b]
vt.&vi.���٣�����
3391. robber['r0b2]
n.ǿ��������
3392. robbery['r0b2ri]
n.���٣����ӣ���ȡ
3393. robe[r2ub]
n.���ۣ����£�ԡ��
3394. robot['r2ub0t]
n.�����ˣ��Զ���
3395. rock[r0k]
vt.ҡ��ʹ��ҡ vi.ҡ
3396. rock[r0k]
n.�ң���ʯ��ʯͷ
3397. rocket['r0kit]
n.��������������
3398. rod[r0d]
n.�ˣ��ͣ���
3399. role[r2ul]
n.��ɫ�����ã�����
3400. roll[r2ul]
vi.&vt.������ת��
3401. roller['r2ul2]
n.��������Ͳ������
3402. Roman['r2um2n]
n.�������� a.�����
3403. romantic[r2u'm9ntik]
a.�����ģ������
3404. roof[ru:f]
n.�ݶ�����������
3405. room[ru:m. rum]
n.���䣻��λ�����
3406. root[ru:t]
n.�������� vi.����
3407. rope[r2up]
n.������
3408. rose[r2uz]
n.Ǿޱ����Ǿޱ��ֲ��
3409. rot[r0t]
vt.�ã����� n.����
3410. rotary['r2ut2ri]
a.��ת�ģ�ת����
3411. rotate[r2u'teit]
vi.��ת vt.ʹ��ת
3412. rotation[r2u'tei62n]
n.��ת��ת����ѭ��
3413. rotten['r0tn]
a.���õģ�������
3414. rough[r3f]
a.���治ƽ�ģ����Ե�
3415. roughly['r3fli]
ad.�ֲڵأ����Ե�
3416. round[raund]
a.Բ�� n.��Ȧ��һ��
3417. rouse[rauz]
vt.���ѣ����𣻾���
3418. route[ru:t]
n.·��·�ߣ�·��
3419. routine[ru:'ti:n]
n.���й��� a.�ճ���
3420. row[r2u]
n.(һ)�ţ�(һ)��
3421. row[r2u]
vt.��(����) vi.����
3422. royal['r0i2l]
a.���ģ��ʼҵ�
3423. rub[r3b]
vt.Ħ������ vi.Ħ��
3424. rubber['r3b2]
n.��Ƥ(����)����
3425. rubbish['r3bi6]
n.����������ϻ�
3426. rude[ru:d]
a.�ӹ��ֲڵģ���Ұ��
3427. rug[r3g]
n.С��̺��ë̺
3428. ruin['ruin]
n.���𣻷��� vt.�ٻ�
3429. rule[ru:l]
n.ͳ�Σ��涨��ϰ��
3430. ruler['ru:l2]
n.ͳ���ߣ��ߣ�ֱ��
3431. rumour['ru:m2]
n.ҥ�ԣ�ҥ��������
3432. run[r3n]
vi.�ܣ�������ʻ����
3433. runner['r3n2]
n.���ܵ���
3434. rural['ru2r2l]
a.ũ��ģ���԰��
3435. rush[r36]
vi.�壬�� vt.�ߴ�
3436. Russian['r362n]
a.����˹�� n.�����
3437. rust[r3st]
n.�� vi.���⣬����
3438. rusty['r3sti]
a.����ģ���ٶ۵�
3439. sack[s9k]
n.�������������
3440. sacred['seikrid]
a.�ϵ۵ģ���ʥ��
3441. sacrifice['s9krifais]
n.&vt.�������ϼ�
3442. sad[s9d]
a.�����ģ����˱�ʹ��
3443. saddle['s9dl]
n.���ӣ���
3444. sadly['s9dli]
ad.��ʹ�أ�������
3445. sadness['s9dnis]
n.��ʹ������
3446. safe[seif]
a.��ȫ�ģ�������
3447. safe[seif]
n.������
3448. safely['seifli]
ad.��ȫ�أ��ɿ���
3449. safety['seifti]
n.��ȫ������
3450. sail[seil]
n.������  vi.����
3451. sailor['seil2]
n.ˮ�֣���Ա��ˮ��
3452. saint[seint]
n.ʥͽ��������ͽ
3453. sake[seik]
n.Ե�ʣ�����
3454. salad['s9l2d]
n.ɫ����ݫ�ģ�����
3455. salary['s9l2ri]
n.н��нˮ
3456. sale[seil]
n.�������������۶�
3457. salesman['seilzm2n]
n.�ۻ�Ա������Ա
3458. salt[s0:lt]
n.�Σ����� vt.������
3459. salute[s2'lju:t]
n.�к������� vi.����
3460. same[seim]
a.ͬһ�ģ���ͬ��
3461. sample['sa:mpl]
n.��Ʒ��ʵ�����걾
3462. sand[s9nd]
n.ɳ��ɳ�ӣ�ɳ̲
3463. sandwich['s9nwid7]
n.������ vt.����
3464. sandy['s9ndi]
n.ɳ�ģ���ɳ��
3465. satellite['s9t2lait]
n.���ǣ���������
3466. satisfaction[s9tis'f9k62n]
n.���⣻���£��⳥
3467. satisfactory[s9tis'f9kt2ri]
a.��������ģ����õ�
3468. satisfy['s9tisfai]
vt.���㣻ʹ����
3469. Saturday['s9t2di]
n.������
3470. sauce[s0:s]
n.��ζ֭����֭
3471. saucer['s0:s2]
n.���У�ǳ��
3472. sausage['s0sid7]
n.�㳦������
3473. save[seiv]
vt.�ȣ���ʡ������
3474. saving['seivi8]
n.��ȣ���Լ�����
3475. saw[s0:]
n.���� vt.�⣬�⿪
3476. say[sei]
vt.˵��˵��������˵
3477. scale[skeil]
n.��ƽ�����ӣ���
3478. scale[skeil]
n.��ȣ���������С
3479. scan[sk9n]
vt.ϸ���������ɨ��
3480. scar[ska:]
n.�˰̣��˺ۣ�����
3481. scarce[sk/2s]
a.ȱ���ģ�ϣ�е�
3482. scarcely['sk/2sli]
ad.������������
3483. scare[sk/2]
vt.���� vi.�ܾ�
3484. scarf[ska:f]
n.Χ��ͷ�����
3485. scatter['sk9t2]
vt.ʹ��ɢ������ɢ��
3486. scene[si:n]
n.�����ص㣻����
3487. scenery['si:n2ri]
n.��̨�������羰
3488. scent[sent]
n.��ζ����ζ����ˮ
3489. schedule['6edju:l]
n.ʱ����ƻ���
3490. scheme[ski:m]
n.�ƻ����滮�����
3491. scholar['sk0l2]
n.ѧ��(��ָ��ѧ����)
3492. scholarship['sk0l26ip]
n.ѧҵ�ɼ�����ѧ��
3493. school[sku:l]
n.ѧУ��ѧԺ��ѧ��
3494. science['sai2ns]
n.��ѧ����ѧ�о�
3495. scientific[sai2n'tifik]
a.��ѧ(��)��
3496. scientist['sai2ntist]
n.(��Ȼ)��ѧ��
3497. scissors['siz2z]
n.����������
3498. scold[sk2uld]
vi.���� vt.���
3499. scope[sk2up]
n.��Χ����أ�����
3500. score[sk0:]
n.�÷֣��������ɼ�
3501. scorn[sk0:n]
n.�����Ц vt.����
3502. scout[skaut]
n.���Ա������
3503. scrape[skreip]
vt.&vi.&n.�Σ���
3504. scratch[skr9t6]
vt.&vi.&n.ɦ��ץ
3505. scream[skri:m]
vi.��У���Х
3506. screen[skri:n]
n.������Ļ vt.�ڱ�
3507. screw[skru:]
n.��������˿ vt.š��
3508. sea[si:]
n.��������
3509. seal['si:l]
n.������ӡ�� vt.��
3510. seal['si:l]
n.����
3511. seaman['si:m2n]
n.��Ա��ˮ�֣�ˮ��
3512. seaport['si:p0:t]
n.���ۣ�����
3513. search[s2:t6]
vt.�ڡ�����Ѱ���Ѳ�
3514. season['si:zn]
n.�������ڣ�ʱ��
3515. seat[si:t]
n.�������� vt.ʹ����
3516. second['sek2nd]
num.�ڶ� a.���ȵ�
3517. second['sek2nd]
n.��
3518. secondary['sek2nd2ri]
a.�ڶ��ģ���Ҫ��
3519. secondly['sek2ndli]
ad.�ڶ�(��)�����
3520. secret['si:krit]
a.���ܵģ����ε�
3521. secretary['sekr2tri]
n.���飻��ǣ���
3522. section['sek62n]
n.��Ƭ��һ�Σ�����
3523. secure[si'kju2]
a.���ĵģ���ȫ��
3524. security[si'kju2riti]
n.��ȫ����ȫ��
3525. see[si:]
vt.����������������
3526. seed[si:d]
n.��(��)���ѣ���ѿ
3527. seek[si:k]
vt.Ѱ�ң�̽������ͼ
3528. seem[si:m]
vi.�����ƺ�
3529. seize[si:z]
vt.ץס����������ȡ
3530. seldom['seld2m]
ad.���٣��������ѵ�
3531. select[si'lekt]
vt.&vi.ѡ����ѡ
3532. selection[si'lek62n]
n.ѡ����ѡ����ѡ��
3533. self[self]
n.���ң��Լ�
3534. selfish['selfi6]
a.��˽�ģ�������
3535. sell[sel]
vt.&vi.��������
3536. seller['sel2]
n.���ߣ�������
3537. semester[s2'mest2]
n.���ꣻѧ�ڣ���ѧ��
3538. semiconductor[semik2n'd3kt2]
n.�뵼��
3539. senate[senit]
n.����Ժ����Ժ
3540. send[send]
vt.�ͣ��ķ�����ǲ
3541. senior['si:nj2]
a.���ٵģ���λ�ϸߵ�
3542. sense[sens]
n.�й٣��о�����ʶ
3543. sensible['sens2bl]
a.�о��õ��ģ����ǵ�
3544. sensitive['sensitiv]
a.���еģ�������
3545. sentence['sent2ns]
n.�о������� vt.����
3546. separate['sep2reit. 'sep2rit]
a.����ģ������
3547. separately['sep2ritli]
ad.�����
3548. separation[sep2'rei62n]
n.���룬�ֿ����־�
3549. September[sep'temb2]
n.����
3550. sequence['si:kw2ns]
n.����������������
3551. series['si2ri:z]
n.������ϵ�У�����
3552. serious['si2ri2s]
a.����ģ������
3553. seriously['si2ri2sli]
ad.����أ������
3554. servant['s2:v2nt]
n.���ˣ�Ӷ�ˣ��͹�
3555. serve[s2:v]
vt.Ϊ�������д�
3556. service['s2:vis]
n.������������
3557. session['se62n]
n.���飬һ��ʱ��
3558. set[set]
vt.�ţ����� vi.��
3559. setting['seti8]
n.��װ������������
3560. settle['setl]
vt.���ţ����ţ���ͣ
3561. settlement['setlm2nt]
n.�����ֳ��ֳ���
3562. seven['seven]
num.�ߣ��߸�(�˻���)
3563. seventeen['sev2n'ti:n]
num.ʮ�ߣ�ʮ�߸�
3564. seventh['sev2n4]
num.���ߣ��߷�֮һ
3565. seventy[sevnti]
num.��ʮ����ʮ��
3566. several['sevr2l]
a.����������
3567. severe[si'vi2]
a.�ϸ�ģ�������
3568. severely[si'vi2li]
ad.�����أ��ϸ��
3569. sew[s2u]
vt.���� vi.����
3570. sex[seks]
n.�Ա���
3571. shade[6eid]
n.���ڹ��� vi.���
3572. shadow['69d2u]
n.��Ӱ������Ӱ��
3573. shady['6eidi]
a.����ģ�������
3574. shake[6eik]
vt.ҡ��ʹ�� n.ҡ��
3575. shall[69l. 62l]
aux.v.��Ҫ�����룻Ӧ
3576. shallow['69l2u]
a.ǳ�ģ�ǳ����
3577. shame[6eim]
n.�߳ܣ�����������
3578. shampoo[69m'pu:]
vt.��ϴ����ϴ n.ϴͷ
3579. shape[6eip]
n.��״����� vt.�γ�
3580. share[6/2]
n.�ݣ��ݶ�ɷ�
3581. sharp[6a:p]
a.�����ģ������
3582. sharpen['6a:p2n]
vt.���⣬ʹ����
3583. sharply['6a:pli]
ad.�����أ������
3584. shave[6eiv]
vt.�꣬�� vi.����
3585. she[6i:. 6i]
pron.(����)��
3586. shear[6i2]
vt.�������� vi.��
3587. shed[6ed]
vt.������ɢ��������
3588. shed[6ed]
n.�С�ݣ�����
3589. sheep[6i:p]
n.������
3590. sheet[6i:t]
n.������ֽ�ţ�����
3591. shelf[6elf]
n.��壬����
3592. shell[6el]
n.�ǣ����ǣ��ڵ�
3593. shelter['6elt2]
n.���δ����ڱΣ��ӻ�
3594. shepherd['6ep2d]
n.�����ˣ�����
3595. shield[6i:ld]
n.�ܣ������� vt.����
3596. shift[6ift]
vt.�滻��ת�� n.ת��
3597. shilling['6ili8]
n.����
3598. shine[6ain]
vi.��ҫ������ n.��
3599. ship[6ip]
n.(��)������������
3600. shirt[62:t]
n.(��ʽ)����
3601. shiver['6iv2]
vi.���������� n.���
3602. shock[60k]
n.������� vi.��
3603. shoe[6u:]
n.Ь
3604. shoot[6u:t]
vt.���䣻���� n.��ѿ
3605. shop[60p]
n.�̵꣬���̣�����
3606. shopkeeper['60pki:p2]
n.����
3607. shopping['60pi8]
n.����������
3608. shore[60:]
n.������
3609. short[60:t]
a.�̵ģ����ڵ�
3610. shortage['60:tid7]
n.���㣬ȱ�٣������
3611. shortcoming[60:tk3mi8]
n.�̴���ȱ��
3612. shortly['60:tli]
ad.���̣���̵�
3613. shot[60t]
n.���䣻���裻����
3614. should[6ud. 62d]
aux.v.������һ����
3615. shoulder['62uld2]
n.�磬�������
3616. shout[6aut]
n.&vi.����������
3617. show[62u]
vt.������������
3618. shower['62u2. '6au2]
n.���ꣻ(һ)����ԡ
3619. shriek[6ri:k]
vi.�������� n.�����
3620. shrink[6rink]
vi.��������С������
3621. shut[63t]
vt.���ϣ����ϣ��ر�
3622. shy[6ai]
a.���ܾ��ģ����ߵ�
3623. sick[sik]
a.�в��ģ����ĵ�
3624. sickness['siknis]
n.����
3625. side[said]
n.�ߣ��Աߣ�һ��
3626. sideways['saidweiz]
ad.б�ţ�б��һ�ߵ�
3627. sigh[sai]
n.&vi.̾����̾Ϣ
3628. sight[sait]
n.�����������龰
3629. sightseeing['saitsi:i8]
n.�۹⣬����
3630. sign[sain]
n.���ţ����� n.ǩ��
3631. signal['sign2l]
n.�ź� vi.���ź�
3632. signature['signit62]
n.������ǩ�֣�ǩ��
3633. significance[sig'nifik2ns]
n.���壬��ζ����Ҫ��
3634. significant[sig'nifik2nt]
n.������ģ���Ҫ��
3635. silence['sail2ns]
n.��Ĭ vt.ʹ��Ĭ
3636. silent['sail2nt]
a.��Ĭ�ģ��ž�������
3637. silk[silk]
n.��˿��˿��˿֯Ʒ
3638. silly['sili]
a.ɵ�ģ��޴���
3639. silver['silv2]
n.�������ӣ�����
3640. similar['simil2]
a.���Ƶģ����Ƶ�
3641. similarly['simil2li]
ad.���Ƶأ����Ƶ�
3642. simple['simpl]
a.�򵥵ģ����ص�
3643. simplicity[sim'plisiti]
n.�򵥣����ף�����
3644. simplify['simplifai]
vt.�򻯣�ʹ����
3645. simply['simpli]
ad.�򵥵أ����ص�
3646. sin[sin]
n.����� vi.����
3647. since[sins]
conj.�ӡ���������Ϊ
3648. sincere[sin'si2]
a.��ϵģ���ֿ��
3649. sing[si8]
vi.&vt.�����ݳ�
3650. singer['si82]
n.�質�ң�����
3651. single['si8gl]
a.��һ�ģ������
3652. singular['si8gjul2]
a.��һ�ģ��Ƿ���
3653. sink[si8k]
vi.�³����´�������
3654. sir[s2:]
n.���������£�����ʿ
3655. sister[sist2]
n.���ã��㣬��
3656. sit[sit]
vi.�������� vt.ʹ��
3657. site[sait]
n.�ص㣬�ػ�������
3658. situation[sitju'ei62n]
n.λ�ã�����������
3659. six[siks]
num.��������
3660. sixteen['siks'ti:n]
num.ʮ����ʮ����
3661. sixth[siks4]
num.����������֮һ
3662. sixty['siksti]
num.��ʮ����ʮ��
3663. size[saiz]
n.��С�����������
3664. skate[skeit]
n.��Ь������ vi.����
3665. sketch[sket6]
n.��ͼ����д������
3666. ski[ski:]
n.���� vi.��ѩ
3667. skill[skil]
n.���ܣ����ɣ�����
3668. skilled[skild]
a.�м��ܵģ�������
3669. skillful['skilful]
a.���ɵģ�����
3670. skim[skim]
vt.�ӹ����������Զ�
3671. skin[skin]
n.Ƥ����Ƥ����Ƥ
3672. skirt[sk2:t]
n.Ůȹ����Ե������
3673. sky[skai]
n.�죬���
3674. slam[sl9m]
vt.ʹ���أ���ط���
3675. slave[sleiv]
n.ū�����๤
3676. slavery['sleiv2ri]
n.ū���ƶȣ�����
3677. sleep[sli:p]
n.˯�� vi.˯ vt.˯
3678. sleepy['sli:pi]
a.��˯�ģ��ž���
3679. sleeve[sli:v]
n.���ӣ�����
3680. slender['slend2]
a.ϸ���ģ�΢����
3681. slice[slais]
n.��Ƭ����Ƭ������
3682. slide[slaid]
vi.�� vt.ʹ���� n.��
3683. slight[slait]
a.ϸ���ģ���΢��
3684. slightly['slaitli]
ad.��΢���е�
3685. slip[slip]
vi.���ӣ����䣻��
3686. slipper['slip2]
n.��Ь����Ь
3687. slippery['slip2ri]
a.���ģ�ʹ�˻��ӵ�
3688. slit[slit]
n.�ѷ� vt.�п���˺��
3689. slogan['sl2ug2n]
n.����ں�
3690. slope[sl2up]
n.��б��б�� vi.��б
3691. slow[sl2u]
a.���ģ��ٶ۵�
3692. slowly['sl2uli]
ad.������
3693. slum[sl3m]
n.ƶ��ߣ�ƶ����
3694. sly[slai]
a.�ƻ��ģ����������
3695. small[sm0:l]
a.С�ģ��ٵģ�С�͵�
3696. smart[sma:t]
a.����ģ����ѵ�
3697. smell[smel]
n.�������ζ vt.��
3698. smile[smail]
vi.΢Ц n.΢Ц��Ц��
3699. smog[sm0g]
n.����
3700. smoke[sm2uk]
n.�̣����� vi.ð��
3701. smooth[smu:5]
a.ƽ���ģ�ƽ����
3702. smoothly['smu:5li]
ad.�⻬�أ�ƽ�ȵ�
3703. snake[sneik]
n.��
3704. snow[sn2u]
n.ѩ vi.��ѩ
3705. snowstorm['sn2ust0:m]
n.ѩ��������ѩ
3706. snowy['sn2ui]
a.ѩ�ģ���ѩ��
3707. so[s2u]
ad.��������ô���ǳ�
3708. soak[s2uk]
vt.������ vi.����
3709. soap[s2up]
n.����
3710. sob[s0b]
vi.&n.���������
3711. sober['s2ub2]
a.���ѵģ��ʶȵ�
3712. so-called['s2u'k0:ld]
a.��ν�ģ��ųƵ�
3713. soccer['s0k2]
n.Ӣʽ����
3714. social['s2u62l]
a.���ģ��罻��
3715. socialism['s2u62liz2m]
n.�������
3716. socialist['s2u62list]
a.��������
3717. society[s2'sai2ti]
n.��᣻���壻�罻��
3718. sock[s0k]
n.����
3719. soda['s2ud2]
n.̼���ƣ������ˮ
3720. soft[s0ft]
a.��ģ���͵�
3721. softly['s0ftli]
ad.����أ������
3722. soil[s0il]
n.����������������
3723. soil[s0il]
vt.Ū�� vi.����
3724. solar['s2ul2]
a.̫���ģ��չ��
3725. soldier['s2uld72]
n.(½��)ʿ��������
3726. sole[s2ul]
n.�ŵף�Ь�ף����
3727. sole[s2ul]
a.�����ģ�Ψһ��
3728. solely['s2uli]
ad.�����أ�Ψһ��
3729. solemn['s0l2m]
a.ׯ�ϵģ�¡�ص�
3730. solid['s0lid]
a.����� n.����
3731. soluble['s0ljubl]
a.���ܵģ����Խ����
3732. solution[s2'lju:62n]
n.���������ܽ�
3733. solve['s0lv]
vt.��𣬽��ͣ����
3734. some[s3m]
a.&pron.һЩ������
3735. somebody['s3mb2di]
pron.ĳ�ˣ�����
3736. somehow['s3mhau]
ad.����ĳ��ԭ��
3737. someone['s3mw3n]
pron.ĳ�ˣ�����
3738. something['s3m4i8]
pron.ĳ�£�ĳ��
3739. sometime['s3mtaim]
ad.��ĳһʱ�򣻴�ǰ
3740. sometimes['s3mtaimz]
ad.��ʱ����ʱ
3741. somewhat['s3mw0t]
pron.һ��� ad.�е�
3742. somewhere['s3mw/2]
ad.��ĳ�� n.ĳ��
3743. son[s3n]
n.����
3744. song[s08]
n.�質�����������
3745. soon[su:n]
ad.���ã��磬��
3746. sophisticated[s2'fistikeitid]
a.�������ʵģ��߼���
3747. sore[s0:]
a.ʹ�ģ��ջ�� n.��
3748. sorrow['s0r2u]
n.��ʹ������������
3749. sorry['s0ri]
a.�ѹ��ģ��Բ����
3750. sort[s0:t]
n.���ࣻ��� vt.����
3751. soul[s2ul]
n.��ꣻ������
3752. sound[saund]
a.�����ģ���õ�
3753. sound[saund]
n.���� vi.�죬����
3754. soup[su:p]
n.��
3755. sour['sau2]
a.��ģ�Ƣ������
3756. source[s0:s]
n.�ӵ�Դͷ����Դ
3757. south[sau4]
n.�ϣ��Ϸ� a.�Ϸ���
3758. southeast['sau4'i:st]
n.���� a.λ�ڶ��ϵ�
3759. southern['s352n]
a.�Ϸ��ģ��ϲ���
3760. southwest['sau4'west]
n.���� a.���ϵ�
3761. Soviet['s2uviet]
n.��ά�� a.��ά����
3762. sow[s2u]
vt.��(��) vi.����
3763. space[speis]
n.�ռ䣻���أ��հ�
3764. spacecraft['speiskra:ft]
n.������������ɴ�
3765. spaceship['speis6ip]
n.����ɴ�
3766. spade[speid]
n.��������
3767. span[sp9n]
n.��ࣻһ��ʱ��
3768. Spanish['sp9ni6]
a.��������n.��������
3769. spare[sp/2]
vt.��Լ a.�����
3770. spark[spa:k]
n.�𻨣�����
3771. sparkle['spa:kl]
vi.���� vt.ʹ��ҫ
3772. sparrow['sp9r2u]
n.��ȸ
3773. speak[spi:k]
vi.˵�������� vt.˵
3774. speaker['spi:k2]
n.˵���ߣ�������
3775. spear[spi2]
n.ì��ǹ
3776. special['spe62l]
a.����ģ�ר�ŵ�
3777. specialist[spe62list]
n.ר��
3778. speciality[spe6i'9liti]
n.רҵ���س����ز�
3779. specialize['spe62laiz]
vi.��Ϊ��ר�ң�ר��
3780. specially['spe62li]
ad.ר�ŵأ��ر��
3781. specific[spi'sifik]
a.���еģ������
3782. specify['spesifai]
vi.ָ������ϸ˵��
3783. specimen['spesimin]
n.�������걾����Ʒ
3784. spectacle['spekt2kl]
n.�⾰�������۾�
3785. speech[spi:t6]
n.�����˵������
3786. speed[spi:d]
n.�죻���� vi.����
3787. spell[spel]
vt.ƴд vi.ƴ��
3788. spelling['speli8]
n.ƴ�֣�ƴ����ƴд��
3789. spend[spend]
vt.��Ǯ�����ѣ��ȹ�
3790. sphere[sfi2]
n.��Բ�壻��Χ
3791. spider['spaid2]
n.֩��
3792. spill[spil]
vt.ʹ��� vi.���
3793. spin[spin]
vt.�ģ�ʹ��ת n.��ת
3794. spirit['spirit]
n.�������ǣ�����
3795. spiritual['spiritju2l]
a.����ģ������
3796. spit[spit]
vi.�� vi.����ĭ
3797. splash[spl96]
vt.&n.�����ã��ɽ�
3798. splendid['splendid]
a.׳���ģ�������
3799. split[split]
vt.���� vi.������
3800. spoil[sp0il]
vt.�𻵣���̣���軵
3801. sponge[sp3nd7]
n.����
3802. sponsor['sp0ns2]
n.������ vt.����
3803. spontaneous[sp0n'teinj2s]
a.�Է��ģ����ܵ�
3804. spoon[spu:n]
n.�ף�����
3805. sport[sp0:t]
n.�˶����˶���
3806. sportsman['sp0:tsm2n]
n.�˶�Ա
3807. spot[sp0t]
n.�㣬�ߵ㣻�ص�
3808. spray[sprei]
n.�˻������� vt.��
3809. spread[spred]
vt.�쿪������ n.����
3810. spring[spri8]
vi.����Ծ n.��Ծ��Ȫ
3811. spring[spri8]
n.���죬����
3812. springtime['spri8taim]
n.����������
3813. sprinkle[spri8kl]
n.��������С��
3814. spur[sp2:]
n.�̼��� vt.�̼�
3815. spy[spai]
n.��������� vt.���
3816. square[skw/2]
n.�����Σ��㳡
3817. squeeze['skwi:z]
vt.&vi.ե������ѹե
3818. squirrel['skwir2l]
n.����
3819. stab[st9b]
vt.&vi.&n.�̣���
3820. stability[st2'biliti]
n.�ȶ����ȶ��ԣ�����
3821. stable['steibl]
a.�ȶ��ģ������
3822. stable['steibl]
n.�ǣ���ǣ�ţ��
3823. stack[st9k]
n.�ѣ��� vt.�ѻ�
3824. stadium['steidj2m]
n.¶������˶���
3825. staff[sta:f]
n.������Ա����ı
3826. stage[steid7]
n.��̨��Ϸ�磻�׶�
3827. stain[stein]
vt.մ�ۣ�������ɫ
3828. stair[st/2]
n.¥��
3829. staircase['st/2keis]
n.¥�ݣ�¥�ݼ�
3830. stake[steik]
n.׮���Ľ𣻽�Ʒ
3831. stale[steil]
n.�¸��ģ���������
3832. stamp[st9mp]
n.���ӣ���Ʊ����־
3833. stand[st9nd]
vi.վ������ n.�ܣ�̨
3834. standard['st9nd2d]
n.��׼ a.��׼��
3835. standpoint['st9ndp0int]
n.�������۵�
3836. star[sta:]
n.�ǣ����ǣ�����
3837. stare[st/2]
vi.��������
3838. start[sta:t]
vi.���𣻳�������ʼ
3839. startle['sta:tl]
vt.ʹ���һ�� n.�Ծ�
3840. starve[sta:v]
vi.���� vt.ʹ����
3841. state[steit]
n.״̬�����ң���
3842. state[steit]
vt.������˵��������
3843. statement['steitm2nt]
n.����������
3844. statesman['steitsm2n]
n.���μң�������
3845. static['st9tikl]
a.���ģ���̬��
3846. station['stei62n]
n.վ��̨��������
3847. statistical[st2'tistikl]
a.ͳ�Ƶģ�ͳ��ѧ��
3848. statue['st9tju:]
n.���񣬵�������
3849. status['steit2s]
n.��λ�����
3850. stay[stei]
vi.ͣ����ס n.����
3851. steadily['stedili]
ad.�ȶ��أ������
3852. steady['stedi]
a.�ȹ̵� vt.ʹ�ȶ�
3853. steal[sti:l]
vt.͵����ȡ
3854. steam[sti:m]
n.���� vi.���� vt.��
3855. steamer['sti:m2]
n.�ִ�������
3856. steel['sti:l]
n.�֣�����
3857. steep[sti:p]
a.�վ��ģ����͵�
3858. steer[sti2]
vt.&vi.��ʻ
3859. stem[stem]
n.����(��)�� vi.��Դ
3860. step[step]
n.(��)�������� vi.��
3861. stern[st2:n]
a.�����ģ��ᶨ��
3862. steward[stju2d]
n.����Ա������Ա
3863. stewardess['stju:2dis]
n.����С�㣬Ů����Ա
3864. stick[stik]
n.������ vt.�̣�ճ��
3865. sticky['stiki]
a.ճ�Եģ���ճ��
3866. stiff[stif]
a.Ӳ�ģ���ֱ��
3867. stiffen['stifn]
vt.ʹӲ��ʹ��Ӳ
3868. still[stil]
a.��ֹ�� n.�ž�
3869. stimulate['stimjuleit]
vt.�̼�������������
3870. sting[sti8]
vt.�̣���ʹ vi.&n.��
3871. stir[st2:]
vt.��������������
3872. stitch[stit6]
n.һ�룻��� vt.��
3873. stock[st0k]
n.ԭ�ϣ����Ʒ���ɱ�
3874. stocking['st0ki8]
n.��(ͳ)��
3875. stomach['st3m2k]
n.θ�����ӣ�ʳ��
3876. stone[st2un]
n.ʯ��ʯͷ����ʯ
3877. stony['st2uni]
a.��ʯ�ģ�����
3878. stool[stu:l]
n.����
3879. stoop[stu:p]
vi.�������� n.����
3880. stop[st0p]
vt.��ס����ֹ��ֹͣ
3881. storage['st0:rid7]
n.���أ�������
3882. store[st0:]
n.���أ�����Ʒ���̵�
3883. storey['st0:ri]
n.(��)¥
3884. storm[st0:m]
n.�籩����(��)��
3885. stormy['st0:mi]
a.�б�����ģ����ҵ�
3886. story['st0:ri]
n.���£�С˵����˵
3887. stove[st2uv]
n.¯����¯����¯
3888. straight[streit]
a.ֱ�ģ���ֱ�� ad.ֱ
3889. strain['strein]
vt.���� vi.����
3890. strange[streind7]
a.İ���ģ���ֵ�
3891. stranger['streind72]
n.İ���ˣ�������
3892. strap[str9p]
n.���� vt.����
3893. strategy['str9tid7i]
n.ս�ԣ�����
3894. straw[str0:]
n.���ݣ��������
3895. strawberry['str0:b2ri]
n.��ݮ
3896. stream[stri:m]
n.�ӣ��� vi.&vt.��
3897. street['stri:t]
n.�֣��ֵ����г���
3898. strength[stre84]
n.��������������
3899. strengthen['stre842n]
vt.��ǿ������
3900. stress[stres]
n.ѹ�������� vt.����
3901. stretch[stret6]
vt.��չ vi.�� n.��չ
3902. strict[strikt]
a.�ϸ�ģ��Ͻ���
3903. strictly['striktli]
ad.�ϸ�أ��Ͻ���
3904. strike[straik]
vt.&vi.�򣬻� n.�չ�
3905. string[stri8]
n.�ߣ�ϸ����һ��
3906. strip[strip]
vt.������ȥ n.����
3907. stripe[straip]
n.���ƣ�����
3908. stroke[str2uk]
n.�򣬻����������з�
3909. stroke[str2uk]
vt.&n.����Ħ����
3910. strong[str08]
a.ǿ׳�ģ��ó���
3911. strongly['str08li]
ad.ǿ׳�أ�ǿ�ҵ�
3912. structural['str3kt62r2l]
a.�ṹ�ģ������
3913. structure['str3kt62]
n.�ṹ������ vt.����
3914. struggle['str3gl]
n.&vi.�������ܶ�
3915. student['stju:d2nt]
n.ѧ�����о�����ѧ��
3916. study['st3di]
n.ѧϰ���о� vt.ѧ
3917. stuff[st3f]
n.���� vt.װ�����
3918. stumble['st3mbl]
vi.����������
3919. stupid['stju:pid]
a.�޴��ģ��о��ٶ۵�
3920. style[stail]
n.������壻ʽ��
3921. subject['s3bd7ikt. s3b'd7ekt]
n.��Ŀ��ѧ�ƣ�����
3922. submarine['s3bm2ri:n]
a.ˮ�µ� n.Ǳˮͧ
3923. submerge[s3b'm2:d7]
vt.��û vi.Ǳ��ˮ��
3924. submit[s3b'mit]
vt.ʹ���� vi.����
3925. subsequent['s3bsikw2nt]
a.���ģ�������
3926. substance['s3bst2ns]
n.���ʣ�ʵ�ʣ���ּ
3927. substantial[s2b'st9n62l]
a.���ʵģ���̵�
3928. substitute['s3bstitju:t]
n.������ vt.�á�����
3929. subtract[s2b'tr9kt]
vt.������ȥ��ȥ��
3930. suburb['s3b2:b]
n.���������⣬����
3931. subway['s3bwei]
n.�ص���������·
3932. succeed[s2k'si:d]
vt.�̡�֮�� vi.�ɹ�
3933. success[s2k'ses]
n.�ɹ����ɾͣ�ʤ��
3934. successful[s2k'sesful]
a.�ɹ��ģ�������õ�
3935. successfully[s2k'sesfuli]
ad.�ɹ���
3936. succession[s2k'se62n]
n.���������Σ��̳�
3937. successive[s2k'sesiv]
a.�����ģ�������
3938. such[s3t6]
a.�����ģ���˵ġ�
3939. suck[s3k]
vt.����˱��ਣ�����
3940. sudden['s3dn]
a.ͻȻ�ģ������
3941. suddenly['s3dnli]
ad.ͻȻ��
3942. suffer['s3f2]
vt.���ܣ����ܣ�����
3943. sufficient[s2'fi62nt]
a.�㹻�ģ���ֵ�
3944. sufficiently[s2'fi62ntli]
ad.�㹻�أ���ֵ�
3945. sugar['6ug2]
n.��
3946. suggest[s2'd7est]
vt.���飻��ʾ������
3947. suggestion[s2'd7est62n]
n.���飬�������ʾ
3948. suit[sju:t]
n.������� vt.�ʺ�
3949. suitable['sju:t2bl]
a.���ʵģ����˵�
3950. sulphur['s3lf2]
n.��(��)�����
3951. sum[s3m]
n.��������� vi.����
3952. summarize['s3m2raiz]
vt.�������������ܽ�
3953. summary['s3m2ri]
n.ժҪ����Ҫ��һ��
3954. summer['s3m2]
n.�ģ��ļ�
3955. sun[s3n]
n.̫������
3956. Sunday['s3ndi]
n.�����գ������
3957. sunlight['s3nlait]
n.�չ⣬����
3958. sunny['s3ni]
a.�������ģ�����
3959. sunrise['s3nraiz]
n.�ճ�(ʱ��)
3960. sunset['s3nset]
n.����(ʱ��)
3961. sunshine['s3n6ain]
n.(ֱ��)�չ⣬����
3962. super['sju:p2]
a.���õģ�������
3963. superficial[sju:p2'fi62l]
a.����ģ���ǳ��
3964. superior[sju:'pi2ri2]
a.�ϸߵģ���Խ��
3965. supermarket['sju:p2ma:kit]
n.�����г�
3966. supper['s3p2]
n.�������
3967. supplement['s3plim2nt]
n.&vt.����������
3968. supply[s2'plai]
vt.&n.��������Ӧ
3969. support[s2'p0:t]
vt.֧�ţ�֧�֣�����
3970. suppose[s2'p2uz]
vt.���룻�ٶ�����
3971. supreme[sju:'pri:m]
a.��ߵģ�����
3972. sure[6u2]
a.ȷ�ŵģ�ȷʵ��
3973. surely['6u2li]
a.ȷʵ���ȵ���
3974. surface['s2:fis]
n.���棬���棻���
3975. surgeon['s2:d72n]
n.���ҽʦ����ҽ
3976. surgery['s2:d72ri]
n.��ƣ��������
3977. surname['s2:neim]
n.��
3978. surprise[s2'praiz]
vt.ʹ���棻ͻȻϮ��
3979. surprising[s2'praizi8]
a.���˵ģ����������
3980. surprisingly[s2'praizi8li]
ad.���˵�
3981. surrender[s2'rend2]
vt.���� vi.Ͷ��
3982. surround[s2'raund]
vt.Χ��Χ�ƣ�Ȧס
3983. surroundings[s2'raundi8z]
n.��Χ���������
3984. survey[s2:'vei]
vt.�����飻����
3985. survive[s2'vaiv]
vt.������ vi.������
3986. suspect[s2s'pekt. 's3spekt]
vt.���� vi.����
3987. suspend[s2s'pend]
vt.���������Ƴ�
3988. suspicion[s2s'pi62n]
n.���ɣ����ģ�����
3989. sustain[s2s'tein]
vt.֧�ţ�����������
3990. swallow['sw0l2u]
n.����
3991. swallow['sw0l2u]
vt.&vi.���£�����
3992. swamp[sw0mp]
n.���������
3993. swan[sw0n]
n.���
3994. swarm[sw0:m]
n.һ��Ⱥ vi.�ܼ�
3995. sway[swei]
vi.ҡ�� vt.ҡ��ҡ��
3996. swear[sw/2]
vt.��(��) vi.����
3997. sweat[swet]
n.�� vi.����
3998. sweater['swet2]
n.���˶�����ë����
3999. sweep[swi:p]
vt.ɨ������ɨ��
4000. sweet[swi:t]
a.��ģ�����
4001. swell[swel]
vi.���ͣ�¡������
4002. swift[swift]
a.��ģ���Ӧ���
4003. swim[swim]
vi.�Σ���Ӿ���ۻ�
4004. swing[swi8]
vi.ҡ�ڣ���ת n.ҡ��
4005. Swiss[swis]
a.��ʿ�� n.��ʿ��
4006. switch[swit6]
n.���أ�ת�� vt.ת��
4007. sword[s0:d]
n.������
4008. symbol['simb2l]
n.���������ţ��Ǻ�
4009. sympathetic[simp2'4etik]
a.ͬ��ģ���г��
4010. sympathize['simp24aiz]
vi.ͬ�飻ͬ�У�����
4011. sympathy['simp24i]
n.ͬ�飻һ�£�ͬ��
4012. synthetic[sin'4etik]
a.�ۺϵģ��ϳɵ�
4013. system['sistim]
n.ϵͳ����ϵ���ƶ�
4014. systematic(al)[sisti'm9tik(2l)]
a.��ϵͳ�ģ��мƻ���
4015. table['teibl]
n.���ӣ���������Ŀ��
4016. tablet['t9blit]
n.�����ң�ҩƬ
4017. tag[t9g]
n.�������ǩ
4018. tail[teil]
n.β�ͣ�ĩβ����
4019. tailor['teil2]
n.�÷� vt.�����·�
4020. take[teik]
vt.�ã�ץ�����ߣ���
4021. tale[teil]
n.���£���˵
4022. talent['t9l2nt]
n.��ţ����ܣ��˲�
4023. talk[t0:k]
vi.���� vt.̸��
4024. tall[t0:l]
n.�ߵģ���ĸߵ�
4025. tame[teim]
a.ѱ���ģ�˳�ӵ�
4026. tan[t9n]
n.�غ�ɫ a.�ػ�ɫ��
4027. tank[t98k]
n.̹�ˣ�����������
4028. tap[t9p]
vt.&vi.&n.��ߵ
4029. tap[t9p]
n.���ӣ���ͷ vt.����
4030. tape[teip]
n.�ߴ����Ŵ���¼����
4031. target['ta:git]
n.�У���ģ�Ŀ��
4032. task[ta:sk]
n.���񣬹�������ҵ
4033. taste[teist]
vt.�������� n.ζ��
4034. tax[t9ks]
n.˰��˰�����
4035. taxi['t9ksi]
n.��������
4036. tea[ti:]
n.�裻��Ҷ������
4037. teach[ti:t6]
vt.�������� vt.����
4038. teacher['ti:t62]
n.��ʦ����ʦ������
4039. teaching['ti:t6i8]
n.��ѧ�����ڣ��̵�
4040. team[ti:m]
n.�ӣ���
4041. tear[ti2. t/2]
n.���ᣬ����
4042. tear[ti2. t/2]
vt.˺����˺��
4043. technical['teknik2l]
a.�����ģ����յ�
4044. technician[tek'ni62n]
n.����Ա����ʦ
4045. technique[tek'ni:k]
n.���������ɣ�����
4046. technology[tek'n0l2d7i]
n.����ѧ�����գ�����
4047. tedious['ti:di2s]
a.�߳���ζ�ģ����Ƶ�
4048. teenager['ti:neid72]
n.������
4049. telegram['teligr9m]
n.�籨
4050. telegraph['teligra:f]
n.�籨�����籨
4051. telephone['telif2un]
n.�绰 vi.��绰
4052. telescope['telisk2up]
n.��Զ��
4053. television['telivi72n]
n.���ӣ����ӻ�
4054. tell[tel]
vt.�������Ը������
4055. temper['temp2]
n.�Ͷȣ����飬����
4056. temperature['temp2rit62]
n.�¶ȣ�����
4057. temple['templ]
n.ʥ�ã�������
4058. temporary['temp2r2ri]
a.��ʱ�ģ���ʱ��
4059. tempt[tempt]
vt.���գ��ջ�����
4060. temptation[temp'tei62n]
n.�ջ�����
4061. ten[ten]
num.ʮ��ʮ��
4062. tenant['ten2nt]
n.�е��ˣ����ͣ��軧
4063. tend[tend]
vt.�չܣ����ϣ�����
4064. tend[tend]
vi.������������
4065. tendency['tend2nsi]
n.�������ƣ�����
4066. tender['tend2]
a.�۵ģ�������
4067. tennis['tenis]
n.���������˶�
4068. tense[tens]
n.ʱ̬��ʱ
4069. tense[tens]
a.�����ģ�������
4070. tent[tent]
n.����
4071. tenth[ten4]
num.��ʮ��ʮ��֮һ
4072. term[t2:m]
n.�ڣ�ѧ�ڣ���������
4073. terminal['t2:minl]
a.ĩ�˵� n.ĩ��
4074. terrible['ter2bl]
a.���µģ����ȵ�
4075. terrific[t2'rifik]
a.���µģ������
4076. territory['terit2ri]
n.��������ͼ������
4077. terror['ter2]
n.�ֲ�������
4078. test[test]
n.&vt.���飻����
4079. text[tekst]
n.ԭ�ģ����ģ�����
4080. textbook['tekstbuk]
n.�α����̿���
4081. textile['tekstail]
n.��֯Ʒ a.��֯��
4082. than[59n. 52n]
conj.(�Ƚϼ�)��
4083. thank[498k]
vt.лл����л n.��л
4084. that[59t]
a.�� pron.�� ad.����
4085. the[52. 5i]
art.(���ڴ�)�⣬��
4086. theatre['4i2t2]
n.ϷԺ��Ϸ�磻����
4087. their[5/2]
pron.��(������)�ǵ�
4088. theirs[5/2z]
pron.��(��)�ǵĶ���
4089. them[5em. 52m]
pron.(����)����
4090. themselves[5/m'selvz]
pron.�����Լ�
4091. then[5en]
ad.��ʱ��Ȼ����ô
4092. theoretical[4i2'retik2l]
a.����(��)��
4093. theory['4i2ri]
n.���ۣ�ѧ˵�����
4094. there[5/2]
ad.��������ǵ���
4095. thereby['5/2'bai]
ad.��ˣ��Ӷ����ɴ�
4096. therefore['5/2f0:]
ad.��ˣ�����
4097. thermometer[42'm0mit2]
n.�¶ȼƣ������
4098. these[5i:z]
a.&pron.��Щ
4099. they[5ei]
pron.(����)��(��)��
4100. thick[4ik]
a.��ģ��ܵģ�Ũ
4101. thickness['4iknis]
n.��(��)����(��)
4102. thief[4i:f]
n.������͵�Է�
4103. thin[4in]
a.���ģ����� vi.�䱡
4104. thing[4i8]
n.���Ʒ���£����
4105. think[4i8k]
vt.�룻��Ҫ����Ϊ
4106. third[42:d]
num.����������֮һ
4107. thirdly['42:dli]
ad.����
4108. thirst[42:st]
n.�ʣ��ڿʣ�����
4109. thirsty['42:sti]
a.�ʵģ�������
4110. thirteen['42:'ti:n]
num.ʮ����ʮ����
4111. thirty['42:ti]
num.��ʮ����ʮ��
4112. this[5is]
a.�⣻�� pron.��
4113. thorn[40:n]
n.�̣�������������޼
4114. thorough['43r2]
a.���׵ģ��꾡��
4115. those[52uz]
pron.��Щ
4116. though[52u]
conj.��Ȼ ad.����
4117. thought[40:t]
n.˼�룻˼ά���뷨
4118. thoughtful['40:tful]
a.��˼�ģ�������
4119. thousand['4auz2nd]
num.ǧ��ǧ�� n.����
4120. thread[4red]
n.�ߣ�˿�����ƣ�ͷ��
4121. threat[4ret]
n.��в�����ţ�����
4122. threaten['4retn]
vt.&vi.��в������
4123. three[4ri:]
num.��������
4124. thrill[4ril]
n.һ�󼤶�
4125. thrive[4raiv]
vi.���������٣���ʢ
4126. throat[4r2ut]
n.�ʺ�������ɤ��
4127. throne[4r2un]
n.��������������λ
4128. throng[4r08]
n.Ⱥ����Ⱥ vt.����
4129. through[4ru:]
prep.����ad.��ͷ��β
4130. throughout[4ru:'aut]
prep.�鼰 ad.����
4131. throw[4r2u]
vt.Ͷ�������ף���
4132. thrust[4r3st]
vt.�壬�� n.�壻���
4133. thumb[43m]
n.(��)Ĵָ
4134. thunder['43nd2]
n.�� vi.���� vt.���
4135. Thursday['42:zdi]
n.������
4136. thus[53s]
ad.��ˣ����������
4137. tick[tik]
n.�δ������Ǻ�
4138. ticket['tikit]
n.Ʊ��ȯ�����죻��Ʊ
4139. tide[taid]
n.������ϫ������
4140. tidy['taidi]
a.����ģ������
4141. tie[tai]
n.�������ϵ vt.ϵ
4142. tiger['taig2]
n.��
4143. tight[tait]
a.���ģ������
4144. till[til]
prep.conj.ֱ����Ϊֹ
4145. timber['timb2]
n.ľ�ģ�ľ��
4146. time[taim]
n.ʱ�䣻ʱ�����Σ���
4147. timetable['taimteibl]
n.ʱ���ʱ�̱�
4148. timid['timid]
a.���ӵģ����ӵ�
4149. tin[tin]
n.������ͷ
4150. tiny['taini]
a.΢С�ģ���С��
4151. tip[tip]
n.�ң�ĩ�ˣ��⣬���
4152. tip[tip]
vt.��� vi.��С��
4153. tire['tai2]
vi.ƣ�ͣ��ۣ����
4154. tired['tai2d]
a.ƣ�͵ģ�����
4155. tissue['tisju:]
n.�����ֽ����֯
4156. title['taitl]
n.���⣬��Ŀ���ƺ�
4157. to[tu:. tu. t2]
prep.�����򣬴ﵽ
4158. toast[t2ust]
n.����� vt.�棬��
4159. toast[t2ust]
n.ף�ƣ�ף�ƴ�
4160. tobacco[t2'b9k2u]
n.�̲ݣ���Ҷ
4161. today[t2'dei]
ad.�ڽ��죻����
4162. toe[t2u]
n.��ֺ�����
4163. together[t2'ge52]
ad.��ͬ��һ��
4164. toilet['t0ilit]
n.��������ϴ�ң�ԡ��
4165. tolerance['t0l2r2ns]
n.���ܣ����̣�����
4166. tolerate['t0l2reit]
vt.���ܣ����̣���ˡ
4167. tomato[t2'ma:t2u]
n.���ѣ�������
4168. tomb[tu:m]
n.�أ�ڣ
4169. tomorrow[t2'm0r2u]
ad.������ n.����
4170. ton[t3n]
n.�֣�����
4171. tone[t2un]
n.����ǻ��������
4172. tongue[t38]
n.�࣬��ͷ������
4173. tonight[t2'nait]
ad.�ڽ�ҹ n.��ҹ
4174. too[tu:]
ad.Ҳ������̫������
4175. tool[tu:l]
n.���ߣ����ߣ��þ�
4176. tooth[tu:4]
n.����
4177. top[t0p]
n.������λ a.����
4178. topic['t0pik]
n.��Ŀ�����⣬����
4179. torch[t0:t6]
n.��棬��ѣ��ֵ�Ͳ
4180. torrent['t0r2nt]
n.����������������
4181. tortoise['t0:t2s]
n.�꣬�ڹ�
4182. torture['t0:t62]
n.���ʣ���ĥ vt.����
4183. toss[t0s]
vt.&vi.�ӣ��ף���
4184. total['t2utl]
a.�ܵ� vi.�ϼƣ��ܹ�
4185. touch[t3t6]
vt.���������� n.��
4186. tough[t3f]
a.���͵ģ���׳��
4187. tour[tu2]
n.&vi.���У�����
4188. tourist['tu2rist]
n.�����ߣ��۹���
4189. toward(s)[t2'w0:d(z)]
prep.�򣻶��ڣ��ӽ�
4190. towel['tau2l]
n.ë���ֽ�
4191. tower['tau2]
n.�� vi.����������
4192. town[taun]
n.�����򣬳���
4193. toy[t0i]
n.��ߣ�����
4194. trace[treis]
n.�ۼ���˿�� vt.����
4195. track[tr9k]
n.���٣�·�������
4196. tractor['tr9kt2]
n.��������ǣ����
4197. trade[treid]
n.ó�ף�ְҵ vi.����
4198. tradition[tr2'di62n]
n.��ͳ������
4199. traditional[tr2'di62nl]
a.��ͳ�ģ�������
4200. traffic['tr9fik]
n.��ͨ��ͨ�У���ͨ��
4201. tragedy['tr9d7idi]
n.���磻���£��Ұ�
4202. trail[treil]
n.�ۼ���С�� vt.����
4203. train[trein]
vt.���� n.�г�������
4204. training['treini8]
n.ѵ��������������
4205. traitor['treit2]
n.��ͽ��������
4206. tram[tr9m]
n.(�й�)�糵
4207. tramp[tr9mp]
n.�����ߣ�����
4208. transfer[tr9ns'f2:]
vt.ת�ƣ�����vi.ת��
4209. transform[tr9ns'f0:m]
vt.�ı䣻���죻�任
4210. transformation[tr9nsf2'mei62n]
n.�仯�����죻ת��
4211. transformer[tr9ns'f0:m2]
n.��ѹ����ת����
4212. transistor[tr9n'sist2]
n.�����
4213. translate[tr9ns'leit]
vt.���룬�� vt.����
4214. translation[tr9ns'lei62n]
n.���룻���ģ��뱾
4215. transmission[tr9nz'mi62n]
n.���ͣ�����������
4216. transmit[tr9nz'mit]
vt.���ͣ��������
4217. transparent[tr9ns'p/2r2nt]
a.͸���ģ���ʶ�Ƶ�
4218. transport[tr9ns'p0:t]
vt.���� n.����
4219. transportation[tr9nsp0:'tei62n]
n.���䣬���ͣ�����
4220. trap[tr9p]
n.���壻��� vt.��ƭ
4221. travel['tr9vl]
vi.&vi.&n.����
4222. tray[trei]
n.(ǳ)�̣����̣���
4223. treason['tri:zn]
n.ı����ͨ�У��ѹ���
4224. treasure['tre72]
n.�Ƹ����䱦 vt.����
4225. treat[tri:t]
vt.�Դ������� n.���
4226. treatment['tri:tm2nt]
n.���������ƣ��Ʒ�
4227. treaty['tri:ti]
n.��Լ��Э�飬Э��
4228. tree[tri:]
n.��
4229. tremble['trembl]
vi.���������£�ҡ��
4230. tremendous[tri'mend2s]
a.����ģ��ǳ���
4231. trend[trend]
vi.�������� n.����
4232. trial['trai2l]
n.�ԣ����飻����
4233. triangle['trai9ngl]
n.����(��)
4234. tribe[traib]
n.���䣬����
4235. trick[trik]
n.��ƣ����� vt.��ƭ
4236. trifle['traifl]
n.С�£����£�����
4237. trim[trim]
a.����� vt.ʹ����
4238. trip[trip]
vi.��ʧ�� vt .��
4239. triumph['trai2mf]
n.������ʤ�� vi.�ɹ�
4240. troop[tru:p]
n.���ӣ�һȺ������
4241. tropical['tr0pik2l]
a.�ȴ���
4242. trouble['tr3bl]
n.���գ����� vi.����
4243. troublesome['tr3bls2m]
a.���˷��յģ��鷳��
4244. trousers['trauz2z]
n.���ӣ�����
4245. truck[tr3k]
n.��������������
4246. true[tru:]
a.��ģ���ʵ��
4247. truly['tru:li]
ad.�����أ���ʵ��
4248. trumpet['tr3mpit]
n.���ȣ�С��
4249. trunk[tr38k]
n.���ɣ������䣬Ƥ��
4250. trust[tr3st]
n.���� vt.���ţ�ί��
4251. truth[tru:4]
n.������ʵ����ʵ��
4252. try[trai]
vt.�ԣ����� vi.����
4253. tub[t3b]
n.Ͱ���裬ԡ�ף�ԡ��
4254. tube[tju:b]
n.�ܣ����ӹܣ������
4255. tuck[t3k]
vt.�۶̣�������
4256. Tuesday['tju:zdi]
n.���ڶ�
4257. tuition[tju:'i62n]
n.�̣��̻壻ѧ��
4258. tumble['t3mbl]
vi.ˤ�������������
4259. tune[tju:n]
n.���ӣ���г vt.��г
4260. tunnel['t3nl]
n.������ӵ����ص�
4261. turbine['t2:bin]
n.Ҷ�ֻ������ֻ�
4262. turbulent['t2:bjul2nt]
a.ɧ���ģ�ɧ�ҵ�
4263. turkey['t2:ki]
n.�𼦣�����
4264. turn[t2:n]
vt.ת���� vi.ת��
4265. turning['t2:ni8]
n.��ת������ת�䴦
4266. turnip['t2:nip]
n.�ܲ�����ݼ
4267. tutor['tju:t2]
n.��ͥ��ʦ����ʦ
4268. twelfth[twelf4]
num.��ʮ��
4269. twelve[twelv]
num.ʮ����ʮ����
4270. twentieth['twentii4]
num.�ڶ�ʮ
4271. twenty['twenti]
num.��ʮ����ʮ��
4272. twice[twais]
ad.���Σ�����
4273. twin[twin]
a.������ n.������
4274. twinkle['twi8kl]
vi.��˸����ҫ
4275. twist[twist]
vt.��š vi.&n.Ť��
4276. two[tu:]
num.��������
4277. type[taip]
n.�ͣ����� vi.����
4278. typewriter['taiprait2]
n.���ֻ�
4279. typhoon[tai'fu:n]
n.̨��
4280. typical['tipik2l]
a.���͵ģ������Ե�
4281. typist['taipist]
n.����Ա
4282. tyre['tai2]
n.��̥����̥
4283. ugly['3gli]
a.��ª�ģ����µ�
4284. ultimate['3ltimit]
a.���ģ����յ�
4285. ultimately['3ltimitli]
ad.���գ����
4286. umbrella[3m'brel2]
n.ɡ����ɡ
4287. unable['3n'eibl]
a.���ܵģ������
4288. unbearable[3n'b/2r2bl]
a.�ѿ��ģ����ܲ��˵�
4289. uncertain[3n's2:tn]
a.�޳��ģ���ȷ����
4290. uncle['38kl]
n.�������常���˸�
4291. uncomfortable[3n'k3mf2t2bl]
a.������ģ������ڵ�
4292. unconscious[3n'k062s]
a.��ʡ���µ�
4293. uncover[3n'k3v2]
vt.�ҿ����ĸ���
4294. under['3nd2]
prep.�ڡ����棻����.
4295. undergo[3nd2'g2u]
vt.���������ܣ�����
4296. undergraduate[3nd2'gr9djuit]
n.��ѧ��ҵ��
4297. underground['3nd2graund]
a.���µģ����ܵ�
4298. underline[3nd2'lain]
vt.�����ڡ�֮��
4299. underneath[3nd2'ni:4]
ad.�����棬�ڵ���
4300. understand[3nd2'st9nd]
vt.������Ϥ vi.����
4301. understanding[3nd2'st9ndi8]
n.��⣻�������Э��
4302. undertake[3nd2'teik]
vt.���£��е�����֤
4303. undertaking[3nd2'teiki8]
n.������ҵ����ŵ
4304. undo['3n'du:]
vt.�⿪���򿪣�ȡ��
4305. undoubtedly[3n'dautidli]
ad.�������ɣ��϶���
4306. uneasy[3n'i:zi]
a.���񲻰��ģ����ǵ�
4307. unexpected['3niks'pektid]
a.�벻���ģ������
4308. unfair['3n'f/2]
a.����ƽ�ģ���������
4309. unfortunate[3n'f0:t62nit]
a.���ҵģ���ȡ��
4310. unfortunately[3n'f0:t62nitli]
ad.���ҵ�
4311. unhappy[3n'h9pi]
a.���Ҹ��ģ������ֵ�
4312. uniform['ju:nif0:m]
a.һ���� n.�Ʒ�
4313. union['ju:nj2n]
n.���ϣ��Ž᣻Э��
4314. unique[ju:'ni:k]
a.Ψһ�ģ���һ�޶���
4315. unit['ju:nit]
n.��λ����Ԫ������
4316. unite[ju'nait]
vi.���� vt.ʹ����
4317. unity['ju:niti]
n.��һ��ͳһ���Ž�
4318. universal[ju:ni'v2:s2l]
a.����ģ��ձ��
4319. universe['ju:niv2:s]
n.���棬����
4320. university[ju:ni'v2:siti]
n.��ѧ���ۺ��Դ�ѧ
4321. unjust['3n'd73st]
a.������ģ�����ƽ��
4322. unkind[3n'kaind]
a.���ʴȵģ������Ƶ�
4323. unknown['3n'n2un]
a.��֪���ģ�δ֪��
4324. unless['3n'les]
conj.���ǣ������
4325. unlike['3n'laik]
a.��ͬ�� prep.����
4326. unlikely[3n'laikli]
a.δ�صģ�δ�ؿ��ܵ�
4327. unload[3n'l2ud]
vt.ж(��) vi.ж��
4328. unlucky[3n'l3ki]
a.���ҵģ�������
4329. unnecessary[3n'nesis2ri]
a.����Ҫ�ģ������
4330. unpleasant[3n'pleznt]
a.���˲���ģ������
4331. unsatisfactory['3ns9tis'f9kt2ri]
a.�������������
4332. unstable[3n'steibl]
a.���ȹ̵ģ����ȶ���
4333. unsuitable['3n'sju:t2bl]
a.�����ʵģ������˵�
4334. until[2n'til]
prep&conj.ֱ����Ϊֹ
4335. unusual[3n'ju:7u2l]
a.��ƽ���ģ����ص�
4336. unusually[3n'ju:7u2li]
a.��ƽ���أ��ǳ�
4337. unwilling['3n'wili8]
a.��Ը���
4338. up[3p]
ad.���ϣ��𴲣�����
4339. upon[2'p0n]
prep.�ڡ��ϣ��ڡ���
4340. upper['3p2]
a.����ģ���λ�ϸߵ�
4341. upright['3prait]
a.��ֱ�ģ���ֱ��
4342. upset[3p'set]
vt.Ū�����򷭣��㸲
4343. upside-down['3psaid'daun]
a.�ߵ��ģ����߰����
4344. upstairs[3p'st/2z]
ad.��¥�� a.¥�ϵ�
4345. up-to-date['3pt2'deit]
a.ֱ������ģ��ִ���
4346. upward['3pw2d]
a.���ϵģ�������
4347. upwards['3pw2dz]
ad.��������������
4348. urge[2:d7]
vt.�ƽ����ߴ� n.�嶯
4349. urgent['2:d72nt]
a.�����ģ�ǿ���
4350. us[3s. 2s]
pron.(����)����
4351. usage['ju:zid7]
n.ʹ�ã��Դ������÷�
4352. use[ju:z. ju:s]
vt.�ã��ķ� n.��
4353. used[ju:zd. ju:st]
vi.��ȥ����
4354. used[ju:zd. ju:st]
a.�ɵģ�ϰ���ڡ���
4355. useful['ju:zful]
a.���õģ������
4356. useless['ju:zlis]
a.���õģ��޼�ֵ��
4357. user['ju:z2]
n.�û���ʹ����
4358. usual['ju:7u2l]
a.ͨ���ģ�ƽ����
4359. usually['ju:7u2li]
ad.ͨ��
4360. utility[ju:'tiliti]
n.Ч�ã����ã�ʵ��
4361. utilize['ju:tilaiz]
vt.����
4362. utmost['3tm2ust]
a.��Զ�� n.����
4363. utter['3t2]
a.��ȫ�ģ����׵�
4364. utter['3t2]
vt.������˵����
4365. vacant['veik2nt]
a.�յģ�δ��ռ�õ�
4366. vacation[v2'kei62n]
n.���ڣ��ݼ�
4367. vacuum['v9kju2m]
n.��գ����������
4368. vague[veig]
a.ģ���ģ�������
4369. vain[vein]
a.ͽ�͵ģ��Ը���
4370. valid['v9lid]
a.��Ч�ģ�������
4371. valley['v9li]
n.(ɽ)�ȣ�Ϫ�ȣ�����
4372. valuable['v9lju2bl]
a.ֵǮ�ģ��м�ֵ��
4373. value['v9lju:]
n.��ֵ���۸� vt.����
4374. van[v9n]
n.���񳵣��˻���
4375. vanish['v9ni6]
vi.ͻȻ��������ʧ
4376. vanity['v9niti]
n.�����ģ����
4377. vapour['veip2]
n.��������
4378. variable['v/2ri2bl]
a.�ױ�� n.����
4379. variation[v/2ri'ei62n]
n.�仯���䶯������
4380. variety[v2'rai2ti]
n.�����������ࣻ����
4381. various['v/2ri2s]
a.���ָ����ģ���ͬ��
4382. vary['v/2ri]
vt.�ı䣻ʹ������
4383. vase[va:z]
n.ƿ����ƿ
4384. vast[va:st]
a.�޴�ģ�������
4385. vegetable['ved7it2bl]
n.ֲ��߲�
4386. vehicle['vi:ikl]
n.������������
4387. veil[veil]
n.��ɴ�����֣��ڱ���
4388. velocity[vi'l0siti]
n.�ٶȣ�����
4389. velvet['velvit]
n.˿�ޣ������
4390. venture['vent62]
n.&vi.ð�� vt.����
4391. verb[v2:b]
n.����
4392. verify['verifai]
vt.֤ʵ����֤��֤��
4393. version['v2:62n]
n.���ģ�˵������д��
4394. vertical['v2:tik2l]
a.��ֱ�ģ���ʽ��
4395. very['veri]
ad.�ܣ���ȫ a.���
4396. vessel['vesl]
n.�����������ɴ�����
4397. vest[vest]
n.���������ģ�����
4398. veteran['vet2r2n]
n.�ϱ�������
4399. vex[veks]
vt.ʹ���գ�ʹ�ջ�
4400. via['vai2]
prep.������ͨ��
4401. vibrate[vai'breit]
vt.ʹ���� vi.����
4402. vibration[vai'brei62n]
n.�������񶯣��ڶ�
4403. vice[vais]
n.��񣻶�ϰ��ȱ��
4404. vice[vais]
n.(��)��ǯ
4405. victim['viktim]
n.�����ߣ��ܺ���
4406. victorious[vik't0:ri2s]
a.ʤ���ģ���ʤ��
4407. victory['vikt2ri]
n.ʤ����սʤ
4408. video['vidi2u]
a.���ӵ� n.����
4409. view[vju:]
n.�����������羰
4410. viewpoint['vju:p0int]
n.�۵㣬����������
4411. vigorous['vig2r2s]
a.�������
4412. village['vilid7]
n.��壬��ׯ
4413. vine[vain]
n.������
4414. vinegar['vinig2]
n.��
4415. violence['vai2l2ns]
n.���ң����ң�����
4416. violent['vai2l2nt]
a.���ҵģ��񱩵�
4417. violet['vai2lit]
n.������
4418. violin[vai2'lin]
n.С����
4419. virtually['v2:tju2li]
ad.ʵ���ϣ���ʵ��
4420. virtue['v2:tju:]
n.�ƣ����£��ŵ�
4421. visible['viz2bl]
a.�ɼ��ģ����ü���
4422. vision['vi72n]
n.�ӣ����������λ�
4423. visit['vizit]
vt.&n.���ʣ��ι�
4424. visitor['vizit2]
n.�����ߣ��ο�
4425. visual['vizju2l]
a.���ģ����ü���
4426. vital['vaitl]
a.�����ģ�����������
4427. vitamin['vit2min]
n.ά���أ�ά����
4428. vivid['vivid]
a.���޵ģ�������
4429. vocabulary[v2'k9bjul2ri]
n.�ʻ���ʻ㣬���
4430. voice[v0is]
n.˵�������������̬
4431. volcano[v0l'kein2u]
n.��ɽ
4432. volleyball['v0lib0:l]
n.���������˶�
4433. volt[v2ult]
n.���أ���
4434. voltage['vaultid7]
n.��ѹ
4435. volume['v0ljum]
n.���᣻�ݻ�������
4436. voluntary['v0l2nt2ri]
a.��Ը�ģ�־Ը��
4437. vote[v2ut]
n.ѡ�٣�ͶƱ�����
4438. voyage[v0id7]
n.&vi.����������
4439. wage[weid7]
n.���ʣ�����
4440. wage[weid7]
vt.��չ(�˶�)
4441. waggon['w9g2n]
n.�����˻���
4442. waist[weist]
n.��������
4443. wait[weit]
vi.�ȣ��Ⱥ� n.�ȴ�
4444. waiter['weit2]
n.���ߣ�����Ա
4445. wake[weik]
vi.�ѣ����� vt.����
4446. waken['weik2n]
vi.���� vt.Ū��
4447. walk[w0:k]
vi.&n.�ߣ�����
4448. wall[w0:l]
n.ǽ���ڣ�Χǽ����ǽ
4449. wallet['w0lit]
n.Ǯ����Ƥ����
4450. wander['w0nd2]
vi.���Σ���·������
4451. want[w0nt]
vt.Ҫ n.��Ҫ��ȱ��
4452. war[w0:]
n.ս������ͻ������
4453. warm[w0:m]
a.��ů�ģ����ҵ�
4454. warmth[w0:m4]
n.ů�ͣ���ů������
4455. warn[w0:n]
vt.���� vi.��������
4456. wash[w06]
vt.ϴ����� vi.ϴ��
4457. waste[weist]
n.�˷ѣ��������
4458. watch[w0t6]
vt.&vi.�ۿ� n.�ֱ�
4459. water['w0:t2]
n.ˮ vt.ʹʪ�����
4460. waterfall['w0:t2f0:l]
n.�ٲ�
4461. waterproof['w0:t2pru:f]
a.��͸ˮ�ģ���ˮ��
4462. wave[weiv]
n.�������� vi.����
4463. wavelength['weivle84]
n.����
4464. wax[w9ks]
n.��������
4465. way[wei]
n.·��·�ߣ�����
4466. we[wi:]
pron.(����)����
4467. weak[wi:k]
a.���ģ�������
4468. weaken['wi:k2n]
vt.���� vi.����
4469. weakness['wi:knis]
n.����������������
4470. wealth[wel4]
n.�Ƹ����Ʋ����ḻ
4471. wealthy['wel4i]
a.���ģ���ԣ��
4472. weapon['wep2n]
n.����������
4473. wear[w/2]
vt.���ţ�����ĥ��
4474. weary['wi2ri]
a.ƣ��� vt.ʹƣ��
4475. weather['we52]
n.����
4476. weave['wi:v]
vt.֯���� vi.��֯
4477. wedding['wedi8]
n.����
4478. Wednesday['wenzdi]
n.������
4479. weed[wi:d]
n.�Ӳݣ�Ұ�� vi.����
4480. week[wi:k]
n.���ڣ���
4481. weekday['wi:kdei]
n.���գ�������
4482. weekend['wi:kend]
n.��ĩ����ĩ����
4483. weekly['wi:kli]
a.ÿ�ܵ� ad.ÿ��
4484. weep[wi:p]
vi.����������
4485. weigh[wei]
vt.�ơ�������������
4486. weight[weit]
n.�أ����룻�ص�
4487. welcome['welk2m]
int.&n.&vt.��ӭ
4488. weld[weld]
vt.&n.���ӣ��۽�
4489. welfare['welf/2]
n.�Ҹ�������
4490. well[wel]
n.��
4491. well[wel]
ad.�ã���ȫ�� int.��
4492. well-known['wel'n2un]
a.������֪�ģ�������
4493. west[west]
n.�������� a.������
4494. western['west2n]
a.�����ģ�������
4495. westward['westw2d]
a.������ ad.����
4496. wet[wet]
a.ʪ�ģ������
4497. what[w0t]
pron.ʲô a.ʲô
4498. whatever[w0t'ev2]
pron.����ʲô
4499. wheat[wi:t]
n.С��
4500. wheel[wi:l]
n.�֣�����
4501. when[wen]
ad.ʲôʱ�򣻵���ʱ
4502. whenever[wen'ev2]
conj.���ۺ�ʱ��ÿ��
4503. where[w/2]
ad.������ pron.����
4504. wherever[w/2r'ev2]
ad.����������
4505. whether['we52]
conj.�Ƿ�
4506. which['wit6]
pron.��һ�� a.��һ��
4507. whichever[wit6'ev2]
a.�����ĸ���������Щ
4508. while[wail]
conj.������ʱ�򣻶�
4509. whilst['wailst]
conj.&n.������ʱ��
4510. whip[wip]
vt.���ף����� n.����
4511. whirl[w2:l]
vt.ʹ���� vi.&n.����
4512. whisky['wiski]
n.��ʿ�ɾ�
4513. whisper['wisp2]
vt.�����ؽ� vi.����
4514. whistle['wisl]
n.���� vi.������
4515. white[wait]
a.�׵� n.��ɫ
4516. whitewash['waitw06]
vt.��ˢ��Ϳ��
4517. who[hu:]
pron.˭��������
4518. whoever[hu:'ev2]
pron.˭������˭
4519. whole[h2ul]
a.������ n.ȫ��
4520. wholly['h2uli]
ad.��ȫ�أ�ȫ��
4521. whom[hu:m]
pron.(����)˭
4522. whose[hu:z]
pron.˭�ģ��ĸ��˵�
4523. why[wai]
ad.Ϊʲô
4524. wicked['wikid]
a.���ģ���������
4525. wide[waid]
a.������ ad.ȫ����
4526. widely['waidli]
ad.�㣬�㷺
4527. widen['waidn]
vt.�ӿ� vi.���
4528. widespread['waidspred]
a.�ֲ���ģ��ձ��
4529. widow['wid2u]
n.�Ѹ�
4530. width[wid4]
n.���������������
4531. wife[waif]
n.����
4532. wild[waild]
a.Ұ���ģ�Ұ����
4533. will[wil]
aux.v.��Ҫ���᣻Ը
4534. willing['wili8]
a.Ը��ģ��ĸ���Ը��
4535. win[win]
vi.��ʤ��Ӯ vt.Ӯ��
4536. wind[wind. waind]
n.�磻��Ϣ������
4537. wind[wind. waind]
vt.�ƣ����� vi.����
4538. window['wind2u]
n.���ӣ�����������
4539. wine[wain]
n.���Ѿƣ�����
4540. wing[wi8]
n.����򣬳�
4541. winner['win2]
n.��ʤ�ߣ���ʤ��
4542. winter['wint2]
n.���죬����
4543. wipe[waip]
vt.&n.������
4544. wire['wai2]
n.�����ߣ����£�����
4545. wireless['wai2lis]
a.���õ��ߵģ����ߵ�
4546. wisdom['wizd2m]
n.�ǻۣ����ǣ�����
4547. wise[waiz]
a.���ǻ۵ģ�������
4548. wish[wi6]
vt.ף����Ҫ n.ϣ��
4549. wit[wit]
n.���������ǣ�����
4550. with[wi5]
prep.�͡�һ�𣻾���
4551. withdraw[wi5'dr0:]
vt.�ջأ�����vi.����
4552. within[wi'5in]
prep.�ڡ�����
4553. without[wi5'aut]
prep.�ޣ�û�У���
4554. withstand[wi5'st9nd]
vt.�ֵ�������
4555. witness['witnis]
n.֤�ݣ�֤�� vt.Ŀ��
4556. wolf[wulf]
n.��
4557. woman['wum2n]
n.��Ů��Ů�ˣ�Ů��
4558. wonder['w3nd2]
n.���죬���棻�漣
4559. wonderful['w3nd2ful]
a.���˵ģ����õ�
4560. wood[wud]
n.���֣�ɭ�֣�ľͷ
4561. wooden['wudn]
a.ľ�Ƶģ������
4562. wool[wul]
n.��ë��ë�ߣ�����
4563. woollen['wul2n]
a.��ë�Ƶģ�ë�ߵ�
4564. word[w2:d]
n.�ʣ�������Ϣ������
4565. work[w2:k]
n.������ְҵ vi.����
4566. worker['w2:k2]
n.���ˣ������ߣ���Ա
4567. workman['w2:km2n]
n.���ˣ��Ͷ��ߣ�����
4568. workshop['w2:k60p]
n.���䣬������������
4569. world[w2:ld]
n.���磻���ˣ�����
4570. world-wide['w2:ldwaid]
a.�鼰ȫ���
4571. worm[w2:m]
n.�棬���
4572. worry['w3ri]
vt.ʹ���� vi.����
4573. worse[w2:s]
a.������ ad.����
4574. worship['w2:6ip]
n.��ݣ���� vt.���
4575. worst[w2:st]
a.��� ad.���
4576. worth[w2:4]
a.ֵ���� n.��ֵ
4577. worthless['w2:4lis]
a.�޼�ֵ�ģ����õ�
4578. worthwhile['w2:4'wail]
a.ֵ�û�ʱ���
4579. worthy['w2:5i]
a.�м�ֵ�ģ�ֵ�õ�
4580. would[wud. w2d]
aux.v.����Ը������
4581. wound[wu:nd]
n.���ˣ��� vt.ʹ����
4582. wrap[r9p]
vt.���������� n.����
4583. wreath[ri:4]
n.��������Ȧ������
4584. wreck[rek]
n.ʧ�£��к� vt.�ƻ�
4585. wrist[rist]
n.����ؽ�
4586. write[rait]
vt.��д��д vi.д
4587. writer['rait2]
n.���ߣ����ң���ѧ��
4588. writing['raiti8]
n.��д��д������
4589. wrong[r08]
a.����� ad.������
4590. X-ray['eks'rei]
n.X���ߣ�X��
4591. yard[ja:d]
n.Ժ�ӣ�ͥԺ������
4592. yard[ja:d]
n.��
4593. yawn[j0:n]
vi.���Ƿ n.��Ƿ
4594. year[j2:. ji2]
n.�ꣻ����
4595. yearly['j2:li]
a.ÿ��� ad.һ��һ��
4596. yell[jel]
vi.�к�
4597. yellow['jel2u]
a.��(ɫ)�� n.��(ɫ)
4598. yes[jes]
ad.�ǣ��ǵ�
4599. yesterday['jest2di]
n.&ad.���죬����
4600. yet[jet]
ad.�����Ѿ� conj.��
4601. yield[ji:ld]
vt.&vi.���� n.����
4602. you[ju:. ju]
pron.�㣬����
4603. young[j38]
a.����� n.������
4604. your[j0:]
pron.��ģ����ǵ�
4605. yours[j0:z]
pron.���ǵ�(����)
4606. yourself[j0:'self]
pron.���Լ���������
4607. youth[ju:4]
n.�ഺ�������ǣ�����
4608. youthful['ju:4ful]
a.����ģ������
4609. zeal[zi:l]
n.���ģ����飬�ȳ�
4610. zealous['zel2s]
a.���ĵģ������
4611. zebra['zi:br2]
n.����
4612. zero['zi2r2u]
n.�㣻��㣬���
4613. zone[z2un]
n.���������򣬷�Χ
4614. zoo[zu:]
n.����԰

